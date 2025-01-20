@interface DSKeychainPersistence
- (BOOL)loadListenerState:(id *)a3 withError:(id *)a4;
- (BOOL)removeListenerState:(id)a3 withError:(id *)a4;
- (BOOL)saveListenerState:(id)a3 withError:(id *)a4;
- (DSKeychainPersistence)initWithQueue:(id)a3;
@end

@implementation DSKeychainPersistence

- (DSKeychainPersistence)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DSKeychainPersistence;
  v6 = [(DSKeychainPersistence *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_clientQueue, a3);
  }

  return v7;
}

- (BOOL)saveListenerState:(id)a3 withError:(id *)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = [v5 identifier];

    if (v7)
    {
      id v8 = objc_alloc_init(MEMORY[0x263F38550]);
      [v8 setInvisible:1];
      [v8 setSyncType:1];
      [v8 setAccessibleType:6];
      [v8 setAccessGroup:@"com.apple.distributedsensing"];
      objc_super v9 = NSString;
      v10 = [v6 inOptions];
      int v11 = [v10 dataSubType];
      v12 = "?";
      if (v11 == 1) {
        v12 = "motionState";
      }
      if (v11) {
        v13 = v12;
      }
      else {
        v13 = "Unknown";
      }
      v14 = [v9 stringWithUTF8String:v13];
      [v8 setType:v14];

      [v8 setIdentifier:@"com.apple.distributedsensing.listenerState"];
      v15 = +[DSLogging sharedInstance];
      v16 = [v15 dsLogger];

      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_223BD6000, v16, OS_LOG_TYPE_DEFAULT, "[DSKeychainPersistence] creating a new metadata dictionary\n", buf, 2u);
      }

      id v17 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      v18 = [v6 identifier];
      [v17 setObject:v18 forKeyedSubscript:@"dsDeviceIDKey"];

      v19 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v6, "version"));
      [v17 setObject:v19 forKeyedSubscript:@"dsVersionKey"];

      v20 = NSNumber;
      v21 = [v6 inOptions];
      v22 = objc_msgSend(v20, "numberWithUnsignedInt:", objc_msgSend(v21, "dataSubType"));
      [v17 setObject:v22 forKeyedSubscript:@"dsOptionDataSubTypeKey"];

      v23 = NSNumber;
      v24 = [v6 inOptions];
      v25 = objc_msgSend(v23, "numberWithUnsignedInt:", objc_msgSend(v24, "deviceType"));
      [v17 setObject:v25 forKeyedSubscript:@"dsOptionDeviceTypeKey"];

      [v8 setMetadata:v17];
      id v26 = objc_alloc_init(MEMORY[0x263F38558]);
      id v44 = 0;
      char v27 = [v26 addItem:v8 error:&v44];
      id v28 = v44;
      if ([v28 code] == -25299)
      {
        v29 = +[DSLogging sharedInstance];
        v30 = [v29 dsLogger];

        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_223BD6000, v30, OS_LOG_TYPE_DEFAULT, "[DSKeychainPersistence] Keychain item already exists, updating item \n", buf, 2u);
        }

        id v31 = objc_alloc_init(MEMORY[0x263F38550]);
        [v31 setInvisible:1];
        [v31 setSyncType:1];
        [v31 setAccessibleType:6];
        [v31 setAccessGroup:@"com.apple.distributedsensing"];
        [v31 setIdentifier:@"com.apple.distributedsensing.listenerState"];
        id v43 = v28;
        char v32 = [v26 updateItem:v8 matchingItem:v31 error:&v43];
        id v33 = v43;

        id v28 = v33;
        if ((v32 & 1) == 0) {
          goto LABEL_14;
        }
      }
      else if ((v27 & 1) == 0)
      {
LABEL_14:
        v34 = +[DSLogging sharedInstance];
        v35 = [v34 dsLogger];

        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v46 = v28;
          _os_log_impl(&dword_223BD6000, v35, OS_LOG_TYPE_DEFAULT, "[DSKeychainPersistence] Failed to add keychain item with error %@", buf, 0xCu);
        }

        if (a4)
        {
          id v28 = v28;
          BOOL v36 = 0;
          *a4 = v28;
        }
        else
        {
          BOOL v36 = 0;
        }
LABEL_28:

        goto LABEL_29;
      }
      v39 = +[DSLogging sharedInstance];
      v40 = [v39 dsLogger];

      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = [v6 identifier];
        *(_DWORD *)buf = 138412290;
        id v46 = v41;
        _os_log_impl(&dword_223BD6000, v40, OS_LOG_TYPE_DEFAULT, "[DSKeychainPersistence] saved keychain item for device %@\n", buf, 0xCu);
      }
      BOOL v36 = 1;
      goto LABEL_28;
    }
  }
  v37 = +[DSLogging sharedInstance];
  v38 = [v37 dsLogger];

  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_223BD6000, v38, OS_LOG_TYPE_DEFAULT, "[DSKeychainPersistence] trying to store invalid listener ID to keychain\n", buf, 2u);
  }

  BOOL v36 = 0;
  if (a4) {
    *a4 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"DSErrorDomain" code:2 userInfo:0];
  }
LABEL_29:

  return v36;
}

- (BOOL)removeListenerState:(id)a3 withError:(id *)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = [v5 identifier];

    if (v7)
    {
      id v8 = +[DSLogging sharedInstance];
      objc_super v9 = [v8 dsLogger];

      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = [v6 identifier];
        *(_DWORD *)buf = 138412290;
        v29 = v10;
        _os_log_impl(&dword_223BD6000, v9, OS_LOG_TYPE_DEFAULT, "Removing keychain item for device %@\n", buf, 0xCu);
      }
      id v11 = objc_alloc_init(MEMORY[0x263F38550]);
      [v11 setInvisible:1];
      [v11 setSyncType:1];
      [v11 setAccessibleType:6];
      [v11 setAccessGroup:@"com.apple.distributedsensing"];
      [v11 setIdentifier:@"com.apple.distributedsensing.listenerState"];
      v12 = [NSString stringWithUTF8String:"motionState"];
      [v11 setType:v12];

      id v13 = objc_alloc_init(MEMORY[0x263F38558]);
      id v27 = 0;
      char v14 = [v13 removeItemMatchingItem:v11 error:&v27];
      id v15 = v27;
      v16 = v15;
      if (v15 && [v15 code] == -25300)
      {
        id v17 = +[DSLogging sharedInstance];
        v18 = [v17 dsLogger];

        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v29 = v16;
          _os_log_impl(&dword_223BD6000, v18, OS_LOG_TYPE_DEFAULT, "[DSKeychainPersistence] Keychain item not found with error %@\n", buf, 0xCu);
        }
      }
      else
      {
        v22 = +[DSLogging sharedInstance];
        v23 = [v22 dsLogger];

        BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
        if ((v14 & 1) == 0)
        {
          if (v24)
          {
            *(_DWORD *)buf = 138412290;
            v29 = v16;
            _os_log_impl(&dword_223BD6000, v23, OS_LOG_TYPE_DEFAULT, "[DSKeychainPersistence] Failed to remove keychain item with error %@\n", buf, 0xCu);
          }

          BOOL v21 = 0;
          if (a4) {
            *a4 = v16;
          }
          goto LABEL_24;
        }
        if (v24)
        {
          v25 = [v6 identifier];
          *(_DWORD *)buf = 138412290;
          v29 = v25;
          _os_log_impl(&dword_223BD6000, v23, OS_LOG_TYPE_DEFAULT, "[DSKeychainPersistence] Removed keychain item for device %@\n", buf, 0xCu);
        }
      }
      BOOL v21 = 1;
LABEL_24:

      goto LABEL_25;
    }
  }
  v19 = +[DSLogging sharedInstance];
  v20 = [v19 dsLogger];

  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_223BD6000, v20, OS_LOG_TYPE_DEFAULT, "[DSKeychainPersistence] trying to remove invalid listener device from keychain\n", buf, 2u);
  }

  BOOL v21 = 0;
  if (a4) {
    *a4 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"DSErrorDomain" code:2 userInfo:0];
  }
LABEL_25:

  return v21;
}

- (BOOL)loadListenerState:(id *)a3 withError:(id *)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v7 = objc_alloc_init(MEMORY[0x263F38550]);
  [v7 setAccessGroup:@"com.apple.distributedsensing"];
  [v7 setSyncType:1];
  [v7 setIdentifier:@"com.apple.distributedsensing.listenerState"];
  id v8 = objc_alloc_init(MEMORY[0x263F38558]);
  id v36 = 0;
  objc_super v9 = (void *)[v8 copyItemMatchingItem:v7 flags:1 error:&v36];
  id v10 = v36;
  if (v9)
  {
    id v11 = [MEMORY[0x263EFF910] date];
    v12 = [v9 dateModified];

    if (v12) {
      [v9 dateModified];
    }
    else {
    v35 = [v9 dateCreated];
    }
    [v11 timeIntervalSinceDate:v35];
    if ((unint64_t)v16 < 0x1C21)
    {
      id v34 = v10;
      v19 = [v9 metadata];
      CFStringGetTypeID();
      v20 = CFDictionaryGetTypedValue();
      if (v20)
      {
        id v33 = v11;
        uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();
        uint64_t v21 = CFDictionaryGetInt64Ranged();
        uint64_t v22 = CFDictionaryGetInt64Ranged();
        v23 = objc_alloc_init(DSClientMotionDataOptions);
        [(DSClientMotionDataOptions *)v23 setDataSubType:v21];
        [(DSClientMotionDataOptions *)v23 setDeviceType:v22];
        id v24 = objc_alloc_init(MEMORY[0x263F62B80]);
        [v24 setIdentifier:v20];
        v25 = [[DSListenerDevice alloc] initWithRapportDevice:v24 queue:self->_clientQueue];
        [(DSListenerDevice *)v25 setVersion:Int64Ranged];
        [(DSListenerDevice *)v25 setInOptions:v23];
        if (a3) {
          *a3 = v25;
        }
        id v26 = +[DSLogging sharedInstance];
        id v27 = [v26 dsLogger];

        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          id v28 = [(DSRapportDevice *)v25 identifier];
          *(_DWORD *)buf = 138412290;
          id v38 = v28;
          _os_log_impl(&dword_223BD6000, v27, OS_LOG_TYPE_DEFAULT, "[DSKeychainPersistence] keychain item loaded for device %@\n", buf, 0xCu);
        }
        char v15 = [v8 removeItemMatchingItem:v9 error:0];

        id v11 = v33;
      }
      else
      {
        v29 = +[DSLogging sharedInstance];
        uint64_t v30 = [v29 dsLogger];

        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_223BD6000, v30, OS_LOG_TYPE_DEFAULT, "[DSKeychainPersistence] invalid device ID\n", buf, 2u);
        }

        char v15 = 0;
        if (a4) {
          *a4 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"DSErrorDomain" code:1 userInfo:0];
        }
      }

      id v10 = v34;
    }
    else
    {
      id v17 = +[DSLogging sharedInstance];
      v18 = [v17 dsLogger];

      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_223BD6000, v18, OS_LOG_TYPE_DEFAULT, "[DSKeychainPersistence] found keychain item too old\n", buf, 2u);
      }

      [v8 removeItemMatchingItem:v9 error:0];
      char v15 = 0;
      if (a4) {
        *a4 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"DSErrorDomain" code:1 userInfo:0];
      }
    }
  }
  else
  {
    id v13 = +[DSLogging sharedInstance];
    char v14 = [v13 dsLogger];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v10;
      _os_log_impl(&dword_223BD6000, v14, OS_LOG_TYPE_DEFAULT, "[DSKeychainPersistence] Unable to find keychain item with error: %@", buf, 0xCu);
    }

    char v15 = 0;
    if (a4) {
      *a4 = v10;
    }
  }

  return v15;
}

- (void).cxx_destruct
{
}

@end