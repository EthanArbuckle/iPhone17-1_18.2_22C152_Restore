@interface ATKeychainStore
+ (id)_keychainQuery:(id)a3;
+ (id)_readDataFromKeychain:(id)a3 error:(id *)a4;
+ (id)objectForKey:(id)a3 error:(id *)a4;
+ (void)_removeObjectForKey:(id)a3;
+ (void)_writeDataToKeychain:(id)a3 andData:(id)a4;
+ (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation ATKeychainStore

+ (id)objectForKey:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!a4)
  {
    v25 = +[NSAssertionHandler currentHandler];
    [v25 handleFailureInMethod:a2, a1, @"ATKeychainStore.m", 23, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];
  }
  id v27 = 0;
  v8 = [a1 _readDataFromKeychain:v7 error:&v27];
  id v9 = v27;
  BOOL v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      v11 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v29 = v11;
      __int16 v30 = 2112;
      id v31 = v7;
      id v12 = v11;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%@]: Successfully read key: %@", buf, 0x16u);
    }
    id v13 = objc_alloc((Class)NSSet);
    uint64_t v14 = objc_opt_class();
    id v15 = objc_msgSend(v13, "initWithObjects:", v14, objc_opt_class(), 0);
    id v26 = 0;
    v16 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v15 fromData:v8 error:&v26];
    id v17 = v26;
    v18 = v17;
    if (!v16 || v17)
    {
      uint64_t v22 = objc_opt_class();
      v23 = [v18 description];
      NSLog(@"[%@]: Error unarchiving data: %@. Error: %@", v22, v8, v23);

      id v19 = 0;
      if (a4) {
        *a4 = v18;
      }
    }
    else
    {
      id v19 = v16;
    }
  }
  else
  {
    if (v10)
    {
      v20 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v29 = v20;
      __int16 v30 = 2112;
      id v31 = v7;
      id v21 = v20;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%@]: Unable to find key: %@", buf, 0x16u);
    }
    id v19 = 0;
    if (a4) {
      *a4 = v9;
    }
  }

  return v19;
}

+ (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v14 = 0;
    v8 = +[NSKeyedArchiver archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v14];
    id v9 = v14;
    if (v9)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v10 = objc_opt_class();
        id v11 = v10;
        id v12 = [v9 description];
        *(_DWORD *)buf = 138413058;
        v16 = v10;
        __int16 v17 = 2112;
        id v18 = v7;
        __int16 v19 = 2112;
        id v20 = v6;
        __int16 v21 = 2112;
        uint64_t v22 = v12;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%@]: Error archiving data for key: %@ and value: %@. Error: %@", buf, 0x2Au);
      }
    }
    else
    {
      id v13 = a1;
      objc_sync_enter(v13);
      +[ATKeychainStore _writeDataToKeychain:v7 andData:v8];
      objc_sync_exit(v13);
    }
  }
  else
  {
    +[ATKeychainStore _removeObjectForKey:v7];
  }
}

+ (void)_removeObjectForKey:(id)a3
{
  CFDictionaryRef query = [a1 _keychainQuery:a3];
  [(__CFDictionary *)query removeObjectForKey:kSecAttrAccessible];
  SecItemDelete(query);
}

+ (id)_readDataFromKeychain:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [a1 _keychainQuery:v6];
  [v7 setObject:kCFBooleanTrue forKeyedSubscript:kSecReturnData];
  CFTypeRef result = 0;
  OSStatus v8 = SecItemCopyMatching((CFDictionaryRef)v7, &result);
  if (v8 || (id v9 = (void *)result) == 0)
  {
    BOOL v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v8 == -25300)
    {
      if (!v10) {
        goto LABEL_9;
      }
      *(_DWORD *)buf = 138412290;
      id v16 = v6;
      id v11 = "No previous keychain records found for key %@.";
      uint32_t v12 = 12;
    }
    else
    {
      if (!v10) {
        goto LABEL_9;
      }
      *(_DWORD *)buf = 134218242;
      id v16 = (id)v8;
      __int16 v17 = 2112;
      id v18 = v6;
      id v11 = "Error %ld retrieving secure data for key %@";
      uint32_t v12 = 22;
    }
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v11, buf, v12);
LABEL_9:
    if (a4)
    {
      +[NSError errorWithDomain:@"ATKeychainStoreErrorDomain" code:v8 userInfo:0];
      id v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v9 = 0;
    }
  }

  return v9;
}

+ (void)_writeDataToKeychain:(id)a3 andData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  OSStatus v8 = [a1 _keychainQuery:v6];
  [v8 removeObjectForKey:kSecAttrAccessible];
  SecItemDelete((CFDictionaryRef)v8);
  if (v7)
  {
    id v9 = [a1 _keychainQuery:v6];
    [v9 setObject:v7 forKeyedSubscript:kSecValueData];
    OSStatus v10 = SecItemAdd((CFDictionaryRef)v9, 0);
    if (v10)
    {
      OSStatus v11 = v10;
      if (v10 == -25299)
      {
        uint32_t v12 = [a1 _keychainQuery:v6];
        [v12 removeObjectForKey:kSecClass];
        [v12 setObject:v7 forKeyedSubscript:kSecValueData];
        CFDictionaryRef v13 = [a1 _keychainQuery:v6];

        OSStatus v14 = SecItemUpdate(v13, (CFDictionaryRef)v12);
        if (v14)
        {
          OSStatus v15 = v14;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            int v16 = 138412546;
            *(void *)__int16 v17 = v6;
            *(_WORD *)&v17[8] = 1024;
            *(_DWORD *)&v17[10] = v15;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to update keychain item %@. Error %d", (uint8_t *)&v16, 0x12u);
          }
        }

        OSStatus v8 = v13;
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 67109378;
        *(_DWORD *)__int16 v17 = v11;
        *(_WORD *)&v17[4] = 2112;
        *(void *)&v17[6] = v6;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error %d checking for existence of keychain item %@", (uint8_t *)&v16, 0x12u);
      }
    }
  }
}

+ (id)_keychainQuery:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  [v4 setObject:@"apple" forKeyedSubscript:kSecAttrAccessGroup];
  [v4 setObject:kSecClassGenericPassword forKeyedSubscript:kSecClass];
  [v4 setObject:@"com.apple.AppTrackingTransparencyService" forKeyedSubscript:kSecAttrService];
  [v4 setObject:kSecAttrAccessibleAfterFirstUnlock forKeyedSubscript:kSecAttrAccessible];
  v5 = [v3 dataUsingEncoding:4];

  [v4 setObject:v5 forKeyedSubscript:kSecAttrGeneric];
  [v4 setObject:v5 forKeyedSubscript:kSecAttrAccount];

  return v4;
}

@end