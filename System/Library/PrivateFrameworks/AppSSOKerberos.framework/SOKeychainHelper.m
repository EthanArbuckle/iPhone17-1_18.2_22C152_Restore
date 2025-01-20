@interface SOKeychainHelper
- (BOOL)hasCredentialsInKeychainWithService:(id)a3;
- (__SecIdentity)identityForPersistientRef:(id)a3;
- (__SecIdentity)identityForUUIDString:(id)a3;
- (int)addCredentialsToKeychainWithService:(id)a3 withUsername:(id)a4 withPassword:(id)a5 requireUserPresence:(BOOL)a6;
- (int)removeCredentialsFromKeychainWithService:(id)a3;
- (int)retrieveCredentialsFromKeychainWithContext:(id)a3 service:(id)a4 returnedUsername:(id *)a5 returnedPassword:(id *)a6;
@end

@implementation SOKeychainHelper

- (__SecIdentity)identityForPersistientRef:(id)a3
{
  id v3 = a3;
  v4 = SO_LOG_SOKeychainHelper();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[SOKeychainHelper identityForPersistientRef:]((uint64_t)v3, v4);
  }

  return 0;
}

- (__SecIdentity)identityForUUIDString:(id)a3
{
  v16[4] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x263F171D0];
  uint64_t v5 = *MEMORY[0x263F17000];
  v15[0] = *MEMORY[0x263F171B8];
  v15[1] = v5;
  v16[0] = v4;
  v16[1] = v3;
  uint64_t v6 = *MEMORY[0x263F17400];
  v15[2] = *MEMORY[0x263F17530];
  v15[3] = v6;
  uint64_t v7 = *MEMORY[0x263F17410];
  v16[2] = *MEMORY[0x263EFFB40];
  v16[3] = v7;
  CFDictionaryRef v8 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:4];
  v14 = 0;
  OSStatus v9 = SecItemCopyMatching(v8, (CFTypeRef *)&v14);
  if (v9)
  {
    int v10 = v9;
    v11 = SO_LOG_SOKeychainHelper();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      [(SOKeychainHelper *)(uint64_t)v3 identityForUUIDString:v11];
    }

    v12 = 0;
  }
  else
  {
    v12 = v14;
  }

  return v12;
}

- (int)addCredentialsToKeychainWithService:(id)a3 withUsername:(id)a4 withPassword:(id)a5 requireUserPresence:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v41 = *MEMORY[0x263EF8340];
  int v10 = (SOKeychainHelper *)a3;
  id v11 = a4;
  id v12 = a5;
  v13 = SO_LOG_SOKeychainHelper();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v36 = "-[SOKeychainHelper addCredentialsToKeychainWithService:withUsername:withPassword:requireUserPresence:]";
    __int16 v37 = 2112;
    v38 = v10;
    __int16 v39 = 2112;
    v40 = self;
    _os_log_impl(&dword_221304000, v13, OS_LOG_TYPE_DEFAULT, "%s service %@ on %@", buf, 0x20u);
  }

  v14 = [v12 dataUsingEncoding:4];

  v15 = SO_LOG_SOKeychainHelper();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v16)
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[SOKeychainHelper addCredentialsToKeychainWithService:withUsername:withPassword:requireUserPresence:]";
      __int16 v37 = 2112;
      v38 = self;
      _os_log_impl(&dword_221304000, v15, OS_LOG_TYPE_DEFAULT, "%s requireUserPresence is enabled on %@", buf, 0x16u);
    }
    SecAccessControlCreateFlags v17 = 1;
  }
  else
  {
    if (v16)
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[SOKeychainHelper addCredentialsToKeychainWithService:withUsername:withPassword:requireUserPresence:]";
      __int16 v37 = 2112;
      v38 = self;
      _os_log_impl(&dword_221304000, v15, OS_LOG_TYPE_DEFAULT, "%s requireUserPresence is disabled on %@", buf, 0x16u);
    }
    SecAccessControlCreateFlags v17 = 0;
  }

  SecAccessControlRef v18 = SecAccessControlCreateWithFlags(0, (CFTypeRef)*MEMORY[0x263F16EA0], v17, 0);
  if (!v18)
  {
    v27 = SO_LOG_SOKeychainHelper();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[SOKeychainHelper addCredentialsToKeychainWithService:withUsername:withPassword:requireUserPresence:](v27);
    }
    OSStatus v30 = -67702;
    goto LABEL_20;
  }
  SecAccessControlRef v19 = v18;
  if (v10 && v11 && v14)
  {
    uint64_t v20 = *MEMORY[0x263F175A8];
    v34[0] = v14;
    v21 = objc_msgSend(v11, "lowercaseString", v20, *MEMORY[0x263F16ED8]);
    uint64_t v22 = *MEMORY[0x263F17090];
    v34[1] = v21;
    v34[2] = v10;
    uint64_t v23 = *MEMORY[0x263F171B8];
    v33[2] = v22;
    v33[3] = v23;
    uint64_t v24 = *MEMORY[0x263F17580];
    uint64_t v25 = *MEMORY[0x263EFFB40];
    v34[3] = *MEMORY[0x263F171C8];
    v34[4] = v25;
    uint64_t v26 = *MEMORY[0x263F16E70];
    v33[4] = v24;
    v33[5] = v26;
    v34[5] = v19;
    v27 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:6];

    OSStatus v28 = SecItemDelete((CFDictionaryRef)v27);
    v29 = SO_LOG_SOKeychainHelper();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v36) = v28;
      _os_log_impl(&dword_221304000, v29, OS_LOG_TYPE_DEFAULT, "Removing keychain entry returned %d", buf, 8u);
    }

    OSStatus v30 = SecItemAdd((CFDictionaryRef)v27, 0);
    CFRelease(v19);
LABEL_20:

    goto LABEL_24;
  }
  v31 = SO_LOG_SOKeychainHelper();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v36 = "-[SOKeychainHelper addCredentialsToKeychainWithService:withUsername:withPassword:requireUserPresence:]";
    __int16 v37 = 2112;
    v38 = self;
    _os_log_impl(&dword_221304000, v31, OS_LOG_TYPE_DEFAULT, "%s Could not add credentials to keychain. Invalid parameters on %@", buf, 0x16u);
  }

  CFRelease(v19);
  OSStatus v30 = -67693;
LABEL_24:

  return v30;
}

- (int)retrieveCredentialsFromKeychainWithContext:(id)a3 service:(id)a4 returnedUsername:(id *)a5 returnedPassword:(id *)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = (char *)a4;
  CFTypeRef result = 0;
  id v12 = SO_LOG_SOKeychainHelper();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    OSStatus v30 = v11;
    _os_log_impl(&dword_221304000, v12, OS_LOG_TYPE_DEFAULT, "Finding keychain entry for service %@", buf, 0xCu);
  }

  if (v11)
  {
    uint64_t v13 = *MEMORY[0x263EFFB40];
    uint64_t v14 = *MEMORY[0x263F17520];
    v27[0] = *MEMORY[0x263F17518];
    v27[1] = v14;
    uint64_t v15 = *MEMORY[0x263F171B8];
    v27[2] = *MEMORY[0x263F17090];
    v27[3] = v15;
    uint64_t v16 = *MEMORY[0x263F171C8];
    v28[2] = v11;
    v28[3] = v16;
    v28[0] = v13;
    v28[1] = v13;
    v27[4] = *MEMORY[0x263F17580];
    v28[4] = v13;
    SecAccessControlCreateFlags v17 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:5];
    SecAccessControlRef v18 = [v17 mutableCopy];

    if (v10) {
      [v18 setObject:v10 forKeyedSubscript:*MEMORY[0x263F17558]];
    }
    OSStatus v19 = SecItemCopyMatching((CFDictionaryRef)v18, &result);
    if (v19)
    {
      uint64_t v20 = SO_LOG_SOKeychainHelper();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v30) = v19;
        _os_log_impl(&dword_221304000, v20, OS_LOG_TYPE_DEFAULT, "Finding keychain entry failed with %d", buf, 8u);
      }
    }
    else
    {
      uint64_t v20 = (id)result;
      v21 = [v20 objectForKey:*MEMORY[0x263F16ED8]];
      uint64_t v22 = [v20 objectForKey:*MEMORY[0x263F175A8]];
      id v23 = (id) [[NSString alloc] initWithData:v22 encoding:4];
      *a6 = v23;
      id v24 = v21;
      *a5 = v24;
      if (result)
      {
        CFRelease(result);
        CFTypeRef result = 0;
      }
    }
  }
  else
  {
    OSStatus v19 = -67693;
    SecAccessControlRef v18 = SO_LOG_SOKeychainHelper();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      OSStatus v30 = "-[SOKeychainHelper retrieveCredentialsFromKeychainWithContext:service:returnedUsername:returnedPassword:]";
      __int16 v31 = 2112;
      v32 = self;
      _os_log_impl(&dword_221304000, v18, OS_LOG_TYPE_DEFAULT, "%s Could not find credentials in keychain. Invalid parameters on %@", buf, 0x16u);
    }
  }

  return v19;
}

- (BOOL)hasCredentialsInKeychainWithService:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v4 = (char *)a3;
  CFTypeRef result = 0;
  uint64_t v5 = SO_LOG_SOKeychainHelper();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v4;
    _os_log_impl(&dword_221304000, v5, OS_LOG_TYPE_DEFAULT, "Checking if keychain entry existis for service %@", buf, 0xCu);
  }

  if (v4)
  {
    BOOL v6 = objc_alloc_init(MEMORY[0x263F10468]);
    [v6 setInteractionNotAllowed:1];
    uint64_t v7 = *MEMORY[0x263EFFB40];
    uint64_t v8 = *MEMORY[0x263F17520];
    v20[0] = *MEMORY[0x263F17518];
    v20[1] = v8;
    uint64_t v9 = *MEMORY[0x263EFFB38];
    v21[0] = v7;
    v21[1] = v9;
    uint64_t v10 = *MEMORY[0x263F171B8];
    v20[2] = *MEMORY[0x263F17090];
    v20[3] = v10;
    uint64_t v11 = *MEMORY[0x263F171C8];
    v21[2] = v4;
    v21[3] = v11;
    uint64_t v12 = *MEMORY[0x263F17558];
    v20[4] = *MEMORY[0x263F17580];
    v20[5] = v12;
    v21[4] = v7;
    v21[5] = v6;
    CFDictionaryRef v13 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:6];
    OSStatus v14 = SecItemCopyMatching(v13, &result);
    BOOL v15 = v14 == -25308 || v14 == 0;
    if (v14 != -25308 && (OSStatus v16 = v14) != 0)
    {
      SecAccessControlCreateFlags v17 = SO_LOG_SOKeychainHelper();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v23) = v16;
        _os_log_impl(&dword_221304000, v17, OS_LOG_TYPE_DEFAULT, "Finding keychain entry failed with %d", buf, 8u);
      }
    }
    else if (result)
    {
      CFRelease(result);
      CFTypeRef result = 0;
    }
  }
  else
  {
    BOOL v6 = SO_LOG_SOKeychainHelper();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v23 = "-[SOKeychainHelper hasCredentialsInKeychainWithService:]";
      __int16 v24 = 2112;
      uint64_t v25 = self;
      _os_log_impl(&dword_221304000, v6, OS_LOG_TYPE_DEFAULT, "%s Could not find credentials in keychain. Invalid parameters on %@", buf, 0x16u);
    }
    BOOL v15 = 0;
  }

  return v15;
}

- (int)removeCredentialsFromKeychainWithService:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v4 = (char *)a3;
  uint64_t v5 = SO_LOG_SOKeychainHelper();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    SecAccessControlCreateFlags v17 = v4;
    _os_log_impl(&dword_221304000, v5, OS_LOG_TYPE_DEFAULT, "Deleting keychain entry for service %@", buf, 0xCu);
  }

  if (v4)
  {
    uint64_t v6 = *MEMORY[0x263EFFB40];
    uint64_t v7 = *MEMORY[0x263F17520];
    v14[0] = *MEMORY[0x263F17518];
    v14[1] = v7;
    uint64_t v8 = *MEMORY[0x263F171B8];
    v14[2] = *MEMORY[0x263F17090];
    v14[3] = v8;
    uint64_t v9 = *MEMORY[0x263F171C8];
    v15[2] = v4;
    v15[3] = v9;
    v15[0] = v6;
    v15[1] = v6;
    v14[4] = *MEMORY[0x263F17580];
    void v15[4] = v6;
    CFDictionaryRef v10 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:5];
    OSStatus v11 = SecItemDelete(v10);
    if (v11)
    {
      uint64_t v12 = SO_LOG_SOKeychainHelper();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v17) = v11;
        _os_log_impl(&dword_221304000, v12, OS_LOG_TYPE_DEFAULT, "Deleting keychain entry failed with %d", buf, 8u);
      }
    }
  }
  else
  {
    OSStatus v11 = -67693;
    SO_LOG_SOKeychainHelper();
    CFDictionaryRef v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      SecAccessControlCreateFlags v17 = "-[SOKeychainHelper removeCredentialsFromKeychainWithService:]";
      __int16 v18 = 2112;
      OSStatus v19 = self;
      _os_log_impl(&dword_221304000, (os_log_t)v10, OS_LOG_TYPE_DEFAULT, "%s Could not delete credentials from keychain. Invalid parameters on %@", buf, 0x16u);
    }
  }

  return v11;
}

- (void)identityForPersistientRef:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_221304000, a2, OS_LOG_TYPE_ERROR, "Unable to resolve persistient reference %@", (uint8_t *)&v2, 0xCu);
}

- (void)identityForUUIDString:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_221304000, log, OS_LOG_TYPE_ERROR, "SecItemCopyMatching returned: %d for uuid: %@", (uint8_t *)v3, 0x12u);
}

- (void)addCredentialsToKeychainWithService:(os_log_t)log withUsername:withPassword:requireUserPresence:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_221304000, log, OS_LOG_TYPE_ERROR, "Could not create ACL for adding credentials to keychain.", v1, 2u);
}

@end