@interface ServerAuthUICredentialStore
- (void)dropCredentialsForServerURL:(id)a3;
- (void)getUsername:(id *)a3 password:(id *)a4 forServerURL:(id)a5;
- (void)storeCredentialsFromServerURL:(id)a3;
@end

@implementation ServerAuthUICredentialStore

- (void)getUsername:(id *)a3 password:(id *)a4 forServerURL:(id)a5
{
  v33[0] = kSecClassInternetPassword;
  v32[0] = kSecClass;
  v32[1] = kSecAttrServer;
  id v7 = a5;
  v8 = [v7 host];
  v33[1] = v8;
  v32[2] = kSecAttrProtocol;
  v9 = objc_msgSend(v7, "serverAuthUI_protocolFromScheme");
  v33[2] = v9;
  v32[3] = kSecAttrPort;
  v10 = [v7 port];

  v11 = &off_100008650;
  if (v10) {
    v11 = v10;
  }
  v33[3] = v11;
  v33[4] = kSecMatchLimitOne;
  v32[4] = kSecMatchLimit;
  v32[5] = kSecAttrSynchronizable;
  v33[5] = kCFBooleanTrue;
  v33[6] = &__kCFBooleanTrue;
  v32[6] = kSecReturnAttributes;
  v32[7] = kSecUseOperationPrompt;
  v32[8] = kSecReturnData;
  v33[7] = @"Access your password on the keychain";
  v33[8] = &__kCFBooleanTrue;
  CFDictionaryRef v12 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:9];

  CFTypeRef result = 0;
  OSStatus v13 = SecItemCopyMatching(v12, &result);
  if (v13)
  {
    OSStatus v14 = v13;
    if (v13 == -25300)
    {
      v15 = serverAuthUILogHandle;
      if (!serverAuthUILogHandle)
      {
        ServerAuthUIInitLogging();
        v15 = serverAuthUILogHandle;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v16 = "No password found";
        v17 = v15;
        uint32_t v18 = 2;
LABEL_22:
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, v16, buf, v18);
      }
    }
    else
    {
      v24 = serverAuthUILogHandle;
      if (!serverAuthUILogHandle)
      {
        ServerAuthUIInitLogging();
        v24 = serverAuthUILogHandle;
      }
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        OSStatus v31 = v14;
        v16 = "Error retrieving username and password from keychain (status: %d)";
        v17 = v24;
        uint32_t v18 = 8;
        goto LABEL_22;
      }
    }
  }
  else
  {
    v19 = (id)result;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = [v19 objectForKeyedSubscript:kSecAttrAccount];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v21 = [v19 objectForKeyedSubscript:kSecValueData];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v22 = [objc_alloc((Class)NSString) initWithData:v21 encoding:4];
          v23 = v22;
          if (v20 && v22)
          {
            if (a3) {
              *a3 = v20;
            }
            if (a4) {
              *a4 = v23;
            }
          }
          else
          {
            v28 = serverAuthUILogHandle;
            if (!serverAuthUILogHandle)
            {
              ServerAuthUIInitLogging();
              v28 = serverAuthUILogHandle;
            }
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
              sub_100005524(v28);
            }
          }
        }
        else
        {
          v27 = serverAuthUILogHandle;
          if (!serverAuthUILogHandle)
          {
            ServerAuthUIInitLogging();
            v27 = serverAuthUILogHandle;
          }
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            sub_100005568(v27);
          }
        }
      }
      else
      {
        v26 = serverAuthUILogHandle;
        if (!serverAuthUILogHandle)
        {
          ServerAuthUIInitLogging();
          v26 = serverAuthUILogHandle;
        }
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          sub_1000055F4(v26);
        }
      }
    }
    else
    {
      v25 = serverAuthUILogHandle;
      if (!serverAuthUILogHandle)
      {
        ServerAuthUIInitLogging();
        v25 = serverAuthUILogHandle;
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_100005680(v25);
      }
    }
  }
}

- (void)storeCredentialsFromServerURL:(id)a3
{
  id v3 = a3;
  v4 = +[NSURLComponents componentsWithURL:v3 resolvingAgainstBaseURL:0];
  v5 = [v4 user];
  v6 = [v4 password];
  [v4 setPassword:&stru_1000085C8];
  id v7 = serverAuthUILogHandle;
  if (!serverAuthUILogHandle)
  {
    ServerAuthUIInitLogging();
    id v7 = serverAuthUILogHandle;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    v9 = [v4 URL];
    *(_DWORD *)buf = 138412290;
    v50 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Updating keychain with user input credentials for server URL %@", buf, 0xCu);
  }
  if (v5) {
    BOOL v10 = v6 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    v47[0] = kSecClass;
    v47[1] = kSecAttrAccount;
    v48[0] = kSecClassInternetPassword;
    v48[1] = v5;
    v44 = v5;
    v47[2] = kSecValueData;
    v43 = v6;
    v11 = [v6 dataUsingEncoding:4];
    v48[2] = v11;
    v47[3] = kSecAttrServer;
    CFDictionaryRef v12 = [v3 host];
    v48[3] = v12;
    v47[4] = kSecAttrProtocol;
    OSStatus v13 = objc_msgSend(v3, "serverAuthUI_protocolFromScheme");
    v48[4] = v13;
    v47[5] = kSecAttrPort;
    uint64_t v14 = [v3 port];
    v15 = (void *)v14;
    v16 = &off_100008650;
    if (v14) {
      v16 = (_UNKNOWN **)v14;
    }
    v48[5] = v16;
    v48[6] = kSecAttrAccessibleWhenUnlocked;
    v47[6] = kSecAttrAccessible;
    v47[7] = kSecAttrSynchronizable;
    v48[7] = kCFBooleanTrue;
    CFDictionaryRef v17 = +[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:8];

    uint64_t v18 = SecItemAdd(v17, 0);
    if (v18 == -25299)
    {
      v20 = serverAuthUILogHandle;
      if (!serverAuthUILogHandle)
      {
        ServerAuthUIInitLogging();
        v20 = serverAuthUILogHandle;
      }
      v5 = v44;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Updating existing keychain entry", buf, 2u);
      }
      id v21 = objc_alloc((Class)NSMutableDictionary);
      v46[0] = kSecClass;
      v46[1] = kSecAttrServer;
      v46[2] = kSecAttrProtocol;
      v46[3] = kSecAttrPort;
      id v22 = +[NSArray arrayWithObjects:v46 count:4];
      [(__CFDictionary *)v17 dictionaryWithValuesForKeys:v22];
      v24 = CFDictionaryRef v23 = v17;
      id v25 = [v21 initWithDictionary:v24];

      [v25 setObject:kSecAttrSynchronizableAny forKeyedSubscript:kSecAttrSynchronizable];
      v45[0] = kSecAttrAccount;
      v45[1] = kSecValueData;
      v45[2] = kSecAttrAccessible;
      v45[3] = kSecAttrSynchronizable;
      v26 = +[NSArray arrayWithObjects:v45 count:4];
      CFDictionaryRef v17 = [(__CFDictionary *)v23 dictionaryWithValuesForKeys:v26];

      uint64_t v27 = SecItemUpdate((CFDictionaryRef)v25, v17);
      if (v27)
      {
        uint64_t v28 = v27;
        v29 = serverAuthUILogHandle;
        if (!serverAuthUILogHandle)
        {
          ServerAuthUIInitLogging();
          v29 = serverAuthUILogHandle;
        }
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          sub_100005778(v28, v29, v30, v31, v32, v33, v34, v35);
        }
      }

      v6 = v43;
    }
    else
    {
      uint64_t v19 = v18;
      if (v18)
      {
        v36 = serverAuthUILogHandle;
        v5 = v44;
        if (!serverAuthUILogHandle)
        {
          ServerAuthUIInitLogging();
          v36 = serverAuthUILogHandle;
        }
        v6 = v43;
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          sub_10000570C(v19, v36, v37, v38, v39, v40, v41, v42);
        }
      }
      else
      {
        v6 = v43;
        v5 = v44;
      }
    }
  }
}

- (void)dropCredentialsForServerURL:(id)a3
{
  id v3 = a3;
  v4 = serverAuthUILogHandle;
  if (!serverAuthUILogHandle)
  {
    ServerAuthUIInitLogging();
    v4 = serverAuthUILogHandle;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Dropping credentials for server URL %@", buf, 0xCu);
  }
  v21[0] = kSecClassInternetPassword;
  v5 = objc_msgSend(v3, "host", kSecClass, kSecAttrServer);
  v21[1] = v5;
  v20[2] = kSecAttrProtocol;
  v6 = objc_msgSend(v3, "serverAuthUI_protocolFromScheme");
  v21[2] = v6;
  v20[3] = kSecAttrPort;
  uint64_t v7 = [v3 port];
  v8 = (void *)v7;
  v9 = &off_100008650;
  if (v7) {
    v9 = (_UNKNOWN **)v7;
  }
  v20[4] = kSecAttrSynchronizable;
  v21[3] = v9;
  v21[4] = kCFBooleanTrue;
  CFDictionaryRef v10 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:5];

  uint64_t v11 = SecItemDelete(v10);
  if (v11)
  {
    uint64_t v12 = v11;
    OSStatus v13 = serverAuthUILogHandle;
    if (!serverAuthUILogHandle)
    {
      ServerAuthUIInitLogging();
      OSStatus v13 = serverAuthUILogHandle;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000057E4(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

@end