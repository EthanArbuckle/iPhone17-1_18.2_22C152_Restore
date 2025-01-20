@interface BiometricsStore
+ (__CFDictionary)_copyKeychainQuery;
+ (id)retreiveTokenWithAction:(int64_t)a3 error:(id *)a4;
+ (void)removeToken;
+ (void)storeToken:(id)a3;
@end

@implementation BiometricsStore

+ (void)removeToken
{
  CFDictionaryRef v2 = (const __CFDictionary *)[a1 _copyKeychainQuery];
  uint64_t v3 = SecItemDelete(v2);
  if (v3 == -25303 || v3 == -25300 || v3 == 0)
  {
    v6 = +[APLogConfig sharedDaemonConfig];
    if (!v6)
    {
      v6 = +[APLogConfig sharedConfig];
    }
    v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543362;
      id v15 = (id)objc_opt_class();
      id v8 = v15;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Removed biometrics token data from keychain", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    uint64_t v9 = v3;
    uint64_t v10 = +[APLogConfig sharedDaemonConfig];
    v6 = (void *)v10;
    if (!v10)
    {
      v6 = +[APLogConfig sharedConfig];
    }
    v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_opt_class();
      id v12 = v11;
      v13 = +[NSNumber numberWithInt:v9];
      int v14 = 138543618;
      id v15 = v11;
      __int16 v16 = 2114;
      v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}@: Failed to remove biometrics token data from keychain. Status: %{public}@", (uint8_t *)&v14, 0x16u);
    }
  }

  CFRelease(v2);
}

+ (id)retreiveTokenWithAction:(int64_t)a3 error:(id *)a4
{
  v5 = (__CFDictionary *)objc_msgSend(a1, "_copyKeychainQuery", a3);
  CFDictionaryAddValue(v5, kSecReturnData, kCFBooleanTrue);
  CFTypeRef result = 0;
  uint64_t v6 = SecItemCopyMatching(v5, &result);
  v7 = (void *)result;
  if (result) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    id v19 = [objc_alloc((Class)NSString) initWithData:result encoding:134217984];

    CFRelease(v5);
    if (v19)
    {
      v20 = +[APLogConfig sharedDaemonConfig];
      if (!v20)
      {
        v20 = +[APLogConfig sharedConfig];
      }
      v21 = [v20 OSLogObject];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v27 = v22;
        id v23 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: Retrieved biometrics token data from keychain", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v9 = v6;
    uint64_t v10 = (__CFString *)SecCopyErrorMessageString(v6, 0);
    uint64_t v30 = APKeychainErrorCodeUserInfoKey;
    v11 = +[NSNumber numberWithInt:v9];
    v31 = v11;
    id v12 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    v13 = APCustomError();

    int v14 = +[APLogConfig sharedDaemonConfig];
    if (!v14)
    {
      int v14 = +[APLogConfig sharedConfig];
    }
    id v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = objc_opt_class();
      id v17 = v16;
      v18 = +[NSNumber numberWithInt:v9];
      *(_DWORD *)buf = 138543618;
      v27 = v16;
      __int16 v28 = 2114;
      v29 = v18;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieve biometrics token data from keychain. Status: %{public}@", buf, 0x16u);
    }
    if (a4) {
      *a4 = v13;
    }

    CFRelease(v5);
    id v19 = 0;
  }
  return v19;
}

+ (void)storeToken:(id)a3
{
  id v4 = a3;
  [a1 removeToken];
  v5 = [v4 dataUsingEncoding:4];

  uint64_t v6 = (__CFDictionary *)[a1 _copyKeychainQuery];
  CFDictionaryAddValue(v6, kSecValueData, v5);
  uint64_t v7 = SecItemAdd(v6, 0);
  uint64_t v8 = +[APLogConfig sharedDaemonConfig];
  uint64_t v9 = (void *)v8;
  if (v7)
  {
    if (!v8)
    {
      uint64_t v9 = +[APLogConfig sharedConfig];
    }
    uint64_t v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_opt_class();
      id v12 = v11;
      v13 = +[NSNumber numberWithInt:v7];
      int v15 = 138543618;
      id v16 = v11;
      __int16 v17 = 2114;
      v18 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to save biometrics token data to keychain. Status: %{public}@", (uint8_t *)&v15, 0x16u);
    }
  }
  else
  {
    if (!v8)
    {
      uint64_t v9 = +[APLogConfig sharedConfig];
    }
    uint64_t v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543362;
      id v16 = (id)objc_opt_class();
      id v14 = v16;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Saved biometrics token data to keychain", (uint8_t *)&v15, 0xCu);
    }
  }

  CFRelease(v6);
}

+ (__CFDictionary)_copyKeychainQuery
{
  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, kSecAttrService, @"com.apple.AskPermission.biometricsToken");
  CFDictionaryAddValue(Mutable, kSecClass, kSecClassGenericPassword);
  SecAccessControlRef v3 = SecAccessControlCreateWithFlags(0, kSecAttrAccessibleWhenUnlockedThisDeviceOnly, 2uLL, 0);
  CFDictionaryAddValue(Mutable, kSecAttrAccessControl, v3);
  CFRelease(v3);
  return Mutable;
}

@end