@interface DAKeychain
+ (id)sharedKeychain;
- (BOOL)canAccessCredentialsWithAccessibility:(int)a3;
- (BOOL)removePasswordForAccount:(id)a3 withPersistentUUID:(id)a4;
- (BOOL)saveKeychainInformationsForURL:(id)a3 andPassword:(id)a4 withAccessibility:(int)a5;
- (BOOL)setPassword:(id)a3 forAccount:(id)a4 withPersistentUUID:(id)a5 withAccessibility:(int)a6;
- (__CFDictionary)_DACopyMutableAttributesForAccountWithPersistentUUID:(id)a3 accessibility:(int)a4;
- (__CFDictionary)_DACopyMutableQueryForAccountWithPersistentUUID:(id)a3;
- (id)guessPasswordForURL:(id)a3;
- (id)loadKeychainInformationsForURL:(id)a3;
- (id)passwordForAccountWithPersistentUUID:(id)a3 expectedAccessibility:(int)a4 shouldSetAccessibility:(BOOL)a5 passwordExpected:(BOOL)a6;
- (int)_daKeychainAccessibilityForSecAccessibility:(void *)a3;
- (void)_secAccessibilityForDAKeychainAccessibility:(int)a3;
- (void)migratePasswordForAccount:(id)a3;
- (void)removeKeychainInformationsForURL:(id)a3;
@end

@implementation DAKeychain

+ (id)sharedKeychain
{
  v2 = (void *)_sharedDAKeychain;
  if (!_sharedDAKeychain)
  {
    uint64_t v3 = objc_opt_new();
    v4 = (void *)_sharedDAKeychain;
    _sharedDAKeychain = v3;

    v2 = (void *)_sharedDAKeychain;
  }
  return v2;
}

- (BOOL)canAccessCredentialsWithAccessibility:(int)a3
{
  if (a3 == 1) {
    return MKBGetDeviceLockState() != 0;
  }
  if (a3 == 2) {
    return MKBDeviceUnlockedSinceBoot() == 1;
  }
  return 1;
}

- (void)_secAccessibilityForDAKeychainAccessibility:(int)a3
{
  switch(a3)
  {
    case 3:
      uint64_t v3 = (void **)MEMORY[0x1E4F3B580];
      return *v3;
    case 2:
      uint64_t v3 = (void **)MEMORY[0x1E4F3B570];
      return *v3;
    case 1:
      uint64_t v3 = (void **)MEMORY[0x1E4F3B5B0];
      return *v3;
  }
  return 0;
}

- (int)_daKeychainAccessibilityForSecAccessibility:(void *)a3
{
  if (!a3) {
    return 2;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F3B580])) {
    return 3;
  }
  if (!CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F3B570]) && CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F3B5B0])) {
    return 1;
  }
  else {
    return 2;
  }
}

- (__CFDictionary)_DACopyMutableQueryForAccountWithPersistentUUID:(id)a3
{
  id v3 = a3;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  v5 = (const void *)*MEMORY[0x1E4F3B5C0];
  v6 = [@"DataAccess-" stringByAppendingString:v3];

  CFDictionaryAddValue(Mutable, v5, v6);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B978], (const void *)*MEMORY[0x1E4F3B998]);
  return Mutable;
}

- (__CFDictionary)_DACopyMutableAttributesForAccountWithPersistentUUID:(id)a3 accessibility:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v6 = [(DAKeychain *)self _DACopyMutableQueryForAccountWithPersistentUUID:a3];
  CFDictionarySetValue(v6, (const void *)*MEMORY[0x1E4F3B558], [(DAKeychain *)self _secAccessibilityForDAKeychainAccessibility:v4]);
  return v6;
}

- (id)passwordForAccountWithPersistentUUID:(id)a3 expectedAccessibility:(int)a4 shouldSetAccessibility:(BOOL)a5 passwordExpected:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v8 = *(void *)&a4;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v11 = DALoggingwithCategory();
  uint64_t v12 = MEMORY[0x1E4F50E48];
  os_log_type_t v13 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 7);
  if (os_log_type_enabled(v11, v13))
  {
    *(_DWORD *)buf = 138412290;
    id v38 = v10;
    _os_log_impl(&dword_1C86FF000, v11, v13, "Loading password for %@", buf, 0xCu);
  }

  if (([v10 isEqualToString:@"unit-test"] & 1) != 0 || !objc_msgSend(v10, "length"))
  {
    v22 = 0;
  }
  else
  {
    v14 = [(DAKeychain *)self _DACopyMutableQueryForAccountWithPersistentUUID:v10];
    v15 = (const void *)*MEMORY[0x1E4F1CFD0];
    CFDictionaryAddValue(v14, (const void *)*MEMORY[0x1E4F3BC70], (const void *)*MEMORY[0x1E4F1CFD0]);
    CFDictionaryAddValue(v14, (const void *)*MEMORY[0x1E4F3BC68], v15);
    CFTypeRef result = 0;
    OSStatus v16 = SecItemCopyMatching(v14, &result);
    if (v16)
    {
      OSStatus v17 = v16;
      v18 = DALoggingwithCategory();
      v19 = v18;
      uint64_t v20 = 6;
      if (v6) {
        uint64_t v20 = 4;
      }
      os_log_type_t v21 = *(unsigned char *)(v12 + v20);
      if (os_log_type_enabled(v18, v21))
      {
        *(_DWORD *)buf = 138412546;
        id v38 = v10;
        __int16 v39 = 1024;
        OSStatus v40 = v17;
        _os_log_impl(&dword_1C86FF000, v19, v21, "Could not find a password in the keychain for %@, error %d", buf, 0x12u);
      }
      v22 = 0;
      v23 = 0;
    }
    else
    {
      v23 = (void *)result;
      key = (void *)*MEMORY[0x1E4F3BD38];
      v19 = objc_msgSend((id)result, "objectForKeyedSubscript:");
      v22 = (void *)[[NSString alloc] initWithData:v19 encoding:4];
      v34 = (void *)*MEMORY[0x1E4F3B558];
      v25 = objc_msgSend(v23, "objectForKeyedSubscript:");
      uint64_t v26 = [(DAKeychain *)self _daKeychainAccessibilityForSecAccessibility:v25];

      if (v26 != v8 && v7)
      {
        v27 = DALoggingwithCategory();
        os_log_type_t v28 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 6);
        if (os_log_type_enabled(v27, v28))
        {
          *(_DWORD *)buf = 138412546;
          id v38 = v10;
          __int16 v39 = 1024;
          OSStatus v40 = v8;
          _os_log_impl(&dword_1C86FF000, v27, v28, "Securing ur sekretz: moving credential for account %@ to accessibility %d", buf, 0x12u);
        }

        Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        CFDictionarySetValue(Mutable, key, v19);
        CFDictionarySetValue(Mutable, v34, [(DAKeychain *)self _secAccessibilityForDAKeychainAccessibility:v8]);
        v30 = [(DAKeychain *)self _DACopyMutableAttributesForAccountWithPersistentUUID:v10 accessibility:v26];
        OSStatus v31 = SecItemUpdate(v30, Mutable);
        CFRelease(v30);
        if (v31)
        {
          v32 = DALoggingwithCategory();
          os_log_type_t v33 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 3);
          if (os_log_type_enabled(v32, v33))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v38) = v31;
            _os_log_impl(&dword_1C86FF000, v32, v33, "Couldn't change password accessibility, error %d", buf, 8u);
          }
        }
        if (Mutable) {
          CFRelease(Mutable);
        }
      }
    }

    if (v14) {
      CFRelease(v14);
    }
  }
  return v22;
}

- (BOOL)setPassword:(id)a3 forAccount:(id)a4 withPersistentUUID:(id)a5 withAccessibility:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  *(void *)&v30[5] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 length])
  {
    os_log_type_t v13 = DALoggingwithCategory();
    uint64_t v14 = MEMORY[0x1E4F50E48];
    os_log_type_t v15 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 6);
    if (os_log_type_enabled(v13, v15))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v30 = v12;
      _os_log_impl(&dword_1C86FF000, v13, v15, "Setting password for account with UUID %@", buf, 0xCu);
    }

    OSStatus v16 = [(DAKeychain *)self _DACopyMutableAttributesForAccountWithPersistentUUID:v12 accessibility:v6];
    OSStatus v17 = (const void *)*MEMORY[0x1E4F3BD38];
    CFDictionarySetValue(v16, (const void *)*MEMORY[0x1E4F3BD38], (const void *)[v10 dataUsingEncoding:4]);
    CFTypeRef result = 0;
    OSStatus v18 = SecItemAdd(v16, &result);
    if (v18 == -25299)
    {
      Mutable = CFDictionaryCreateMutable(0, 2, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      Value = CFDictionaryGetValue(v16, v17);
      CFDictionaryAddValue(Mutable, v17, Value);
      os_log_type_t v21 = (const void *)*MEMORY[0x1E4F3B558];
      v22 = CFDictionaryGetValue(v16, (const void *)*MEMORY[0x1E4F3B558]);
      CFDictionaryAddValue(Mutable, v21, v22);
      OSStatus v18 = SecItemUpdate(v16, Mutable);
      if (Mutable) {
        CFRelease(Mutable);
      }
    }
    if (result)
    {
      CFRelease(result);
      CFTypeRef result = 0;
    }
    if (v16) {
      CFRelease(v16);
    }
    BOOL v23 = v18 == 0;
    if (v18)
    {
      v24 = DALoggingwithCategory();
      os_log_type_t v25 = *(unsigned char *)(v14 + 3);
      if (os_log_type_enabled(v24, v25))
      {
        *(_DWORD *)buf = 67109378;
        v30[0] = v18;
        LOWORD(v30[1]) = 2112;
        *(void *)((char *)&v30[1] + 2) = v12;
        _os_log_impl(&dword_1C86FF000, v24, v25, "Error %d, Can't update password for account %@", buf, 0x12u);
      }
    }
  }
  else
  {
    uint64_t v26 = [v11 persistentUUID];
    BOOL v23 = [(DAKeychain *)self removePasswordForAccount:v11 withPersistentUUID:v26];
  }
  return v23;
}

- (BOOL)removePasswordForAccount:(id)a3 withPersistentUUID:(id)a4
{
  *(void *)&v18[5] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [(DAKeychain *)self _DACopyMutableQueryForAccountWithPersistentUUID:v5];
  BOOL v7 = DALoggingwithCategory();
  uint64_t v8 = MEMORY[0x1E4F50E48];
  os_log_type_t v9 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 6);
  if (os_log_type_enabled(v7, v9))
  {
    int v17 = 138412290;
    *(void *)OSStatus v18 = v5;
    _os_log_impl(&dword_1C86FF000, v7, v9, "Removing password for account with UUID %@", (uint8_t *)&v17, 0xCu);
  }

  OSStatus v10 = SecItemDelete(v6);
  OSStatus v11 = v10;
  if (v10 != -25300 && v10)
  {
    id v12 = DALoggingwithCategory();
    os_log_type_t v13 = *(unsigned char *)(v8 + 3);
    if (os_log_type_enabled(v12, v13))
    {
      int v17 = 67109378;
      v18[0] = v11;
      LOWORD(v18[1]) = 2112;
      *(void *)((char *)&v18[1] + 2) = v5;
      _os_log_impl(&dword_1C86FF000, v12, v13, "Error %d, Couldn't delete password from keychain for account %@", (uint8_t *)&v17, 0x12u);
    }
  }
  if (v6) {
    CFRelease(v6);
  }
  if (v11) {
    BOOL v14 = v11 == -25300;
  }
  else {
    BOOL v14 = 1;
  }
  BOOL v15 = v14;

  return v15;
}

- (void)migratePasswordForAccount:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(v3, "objectForKeyedSubscript:");
  id v5 = [(DAKeychain *)self passwordForAccountWithPersistentUUID:v4 expectedAccessibility:3 shouldSetAccessibility:0 passwordExpected:0];

  if (![v5 length])
  {
    uint64_t v6 = [v3 persistentUUID];
    uint64_t v7 = [(DAKeychain *)self passwordForAccountWithPersistentUUID:v6 expectedAccessibility:3 shouldSetAccessibility:0 passwordExpected:0];

    id v5 = (void *)v7;
  }
  uint64_t v8 = objc_msgSend(v3, "objectForKeyedSubscript:");

  if (v8)
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    os_log_type_t v9 = [v3 objectForKeyedSubscript:@"DAOldKeychainURLs"];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v41 != v11) {
            objc_enumerationMutation(v9);
          }
          os_log_type_t v13 = [MEMORY[0x1E4F1CB10] URLWithString:*(void *)(*((void *)&v40 + 1) + 8 * i)];
          if (!v5)
          {
            BOOL v14 = +[DAKeychain sharedKeychain];
            id v5 = [v14 guessPasswordForURL:v13];
          }
          BOOL v15 = +[DAKeychain sharedKeychain];
          [v15 removeKeychainInformationsForURL:v13];
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v40 objects:v48 count:16];
      }
      while (v10);
    }
  }
  if (v5)
  {
    OSStatus v16 = (void *)[objc_alloc(MEMORY[0x1E4F179C0]) initWithPassword:v5];
    int v17 = [v3 backingAccountInfo];
    [v17 setCredential:v16];

    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x2020000000;
    char v39 = 0;
    dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
    v19 = DALoggingwithCategory();
    os_log_type_t v20 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 4);
    if (os_log_type_enabled(v19, v20))
    {
      os_log_type_t v21 = v16;
      v22 = [v3 backingAccountInfo];
      BOOL v23 = [v22 identifier];
      v24 = [v3 backingAccountInfo];
      os_log_type_t v25 = [v24 username];
      *(_DWORD *)buf = 138412546;
      v45 = v23;
      __int16 v46 = 2112;
      v47 = v25;
      _os_log_impl(&dword_1C86FF000, v19, v20, "During Migration, password present. Setting _backingAccountInfo.authenticated = YES for Account identifier %@ and username %@", buf, 0x16u);

      OSStatus v16 = v21;
    }

    uint64_t v26 = [v3 backingAccountInfo];
    [v26 setAuthenticated:1];

    [v3 setObject:0 forKeyedSubscript:@"DAOldKeychainURLs"];
    v27 = sharedDAAccountStore();
    os_log_type_t v28 = [v3 backingAccountInfo];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __40__DAKeychain_migratePasswordForAccount___block_invoke;
    v33[3] = &unk_1E6571198;
    v35 = &v36;
    v29 = v18;
    v34 = v29;
    [v27 saveVerifiedAccount:v28 withCompletionHandler:v33];

    dispatch_semaphore_wait(v29, 0xFFFFFFFFFFFFFFFFLL);
    if (*((unsigned char *)v37 + 24))
    {
      v30 = [v3 objectForKeyedSubscript:@"DAAccountPersistentUUID"];
      [(DAKeychain *)self removePasswordForAccount:v3 withPersistentUUID:v30];

      OSStatus v31 = [v3 persistentUUID];
      [(DAKeychain *)self removePasswordForAccount:v3 withPersistentUUID:v31];
    }
    _Block_object_dispose(&v36, 8);
  }
}

intptr_t __40__DAKeychain_migratePasswordForAccount___block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)saveKeychainInformationsForURL:(id)a3 andPassword:(id)a4 withAccessibility:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = DALoggingwithCategory();
  uint64_t v11 = MEMORY[0x1E4F50E48];
  os_log_type_t v12 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 6);
  if (os_log_type_enabled(v10, v12))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v8;
    _os_log_impl(&dword_1C86FF000, v10, v12, "Saving password for %@", buf, 0xCu);
  }

  os_log_type_t v13 = [v8 user];
  BOOL v14 = [v8 host];
  BOOL v15 = [v8 scheme];
  if (v9
    && ([v9 isEqualToString:&stru_1F231BAB0] & 1) == 0
    && v13
    && ([v13 isEqualToString:&stru_1F231BAB0] & 1) == 0
    && v14
    && ([v14 isEqualToString:&stru_1F231BAB0] & 1) == 0
    && v15
    && ![v15 isEqualToString:&stru_1F231BAB0])
  {
    if ([v13 isEqualToString:@"unit-test"])
    {
      BOOL v25 = 0;
      goto LABEL_29;
    }
    loga = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    if ([v15 isEqualToString:@"ftp"])
    {
      os_log_type_t v28 = (const void **)MEMORY[0x1E4F3B7D0];
    }
    else
    {
      if (![v15 isEqualToString:@"http"])
      {
        if ([v15 isEqualToString:@"https"]) {
          v29 = (const void *)*MEMORY[0x1E4F3B7F8];
        }
        else {
          v29 = 0;
        }
LABEL_40:
        valuea = [(DAKeychain *)self _secAccessibilityForDAKeychainAccessibility:v5];
        v30 = loga;
        CFDictionaryAddValue(loga, (const void *)*MEMORY[0x1E4F3B5C0], v13);
        OSStatus v31 = (const void *)*MEMORY[0x1E4F3B978];
        if (v29)
        {
          CFDictionaryAddValue(loga, v31, (const void *)*MEMORY[0x1E4F3B998]);
          CFDictionaryAddValue(loga, (const void *)*MEMORY[0x1E4F3B848], v14);
          v32 = [v8 port];

          os_log_type_t v33 = (const void *)*MEMORY[0x1E4F3B7C0];
          if (v32) {
            v34 = (const void *)[v8 port];
          }
          else {
            v34 = (const void *)objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(MEMORY[0x1E4F1CB10], "da_classicPortForScheme:", v15));
          }
          v30 = loga;
          CFDictionaryAddValue(loga, v33, v34);
          CFDictionaryAddValue(loga, (const void *)*MEMORY[0x1E4F3B7C8], v29);
          CFDictionaryAddValue(loga, (const void *)*MEMORY[0x1E4F3B7B8], (const void *)[v8 uri]);
          CFDictionaryAddValue(loga, (const void *)*MEMORY[0x1E4F3B5E8], (const void *)*MEMORY[0x1E4F3B5F0]);
        }
        else
        {
          CFDictionaryAddValue(loga, v31, (const void *)*MEMORY[0x1E4F3B988]);
          v35 = (const void *)*MEMORY[0x1E4F3B850];
          uint64_t v36 = [v8 URLWithoutUsername];
          CFDictionaryAddValue(loga, v35, (const void *)[v36 absoluteString]);
        }
        if (valuea) {
          CFDictionaryAddValue(v30, (const void *)*MEMORY[0x1E4F3B558], valuea);
        }
        v37 = objc_msgSend(v9, "dataUsingEncoding:", 4, valuea);
        uint64_t v38 = (const void *)*MEMORY[0x1E4F3BD38];
        os_log_t logb = v37;
        CFDictionaryAddValue(v30, (const void *)*MEMORY[0x1E4F3BD38], v37);
        char v39 = DALoggingwithCategory();
        if (os_log_type_enabled(v39, v12))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C86FF000, v39, v12, "Setting password for account", buf, 2u);
        }

        *(void *)buf = 0;
        OSStatus v40 = SecItemAdd(v30, (CFTypeRef *)buf);
        if (v40 == -25299)
        {
          Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
          long long v43 = v38;
          OSStatus v16 = logb;
          CFDictionaryAddValue(Mutable, v43, logb);
          v44 = (const void *)*MEMORY[0x1E4F3B558];
          v45 = CFDictionaryGetValue(v30, (const void *)*MEMORY[0x1E4F3B558]);
          if (v45) {
            CFDictionaryAddValue(Mutable, v44, v45);
          }
          CFDictionaryRemoveValue(v30, v44);
          OSStatus v41 = SecItemUpdate(v30, Mutable);
          if (v41)
          {
            __int16 v46 = DALoggingwithCategory();
            os_log_type_t valueb = *(unsigned char *)(v11 + 3);
            if (os_log_type_enabled(v46, valueb))
            {
              *(_DWORD *)v62 = 67109120;
              OSStatus v63 = v41;
              _os_log_impl(&dword_1C86FF000, v46, valueb, "Couldn't set password, error %d", v62, 8u);
            }

            OSStatus v16 = logb;
          }
          if (Mutable) {
            CFRelease(Mutable);
          }
        }
        else
        {
          OSStatus v41 = v40;
          if (!v40)
          {
            BOOL v25 = 1;
            goto LABEL_68;
          }
          v47 = DALoggingwithCategory();
          os_log_type_t v48 = *(unsigned char *)(v11 + 3);
          if (os_log_type_enabled(v47, v48))
          {
            *(_DWORD *)v62 = 67109120;
            OSStatus v63 = v41;
            _os_log_impl(&dword_1C86FF000, v47, v48, "Couldn't add password, error %d", v62, 8u);
          }

          OSStatus v16 = logb;
        }
        if (!v41)
        {
          BOOL v25 = 1;
LABEL_70:
          if (v30) {
            CFRelease(v30);
          }
          goto LABEL_28;
        }
        uint64_t v49 = DALoggingwithCategory();
        os_log_type_t v50 = *(unsigned char *)(v11 + 3);
        if (os_log_type_enabled(v49, v50))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&uint8_t buf[4] = v41;
          *(_WORD *)&buf[8] = 2112;
          *(void *)&buf[10] = v30;
          _os_log_impl(&dword_1C86FF000, v49, v50, "Error %d while trying to add a password: %@", buf, 0x12u);
        }

        BOOL v25 = 0;
LABEL_68:
        OSStatus v16 = logb;
        goto LABEL_70;
      }
      os_log_type_t v28 = (const void **)MEMORY[0x1E4F3B7E8];
    }
    v29 = *v28;
    goto LABEL_40;
  }
  OSStatus v16 = DALoggingwithCategory();
  os_log_type_t v17 = *(unsigned char *)(v11 + 3);
  if (os_log_type_enabled(v16, v17))
  {
    dispatch_semaphore_t v18 = @"Password ";
    log = v16;
    if (v9 && ![v9 isEqualToString:&stru_1F231BAB0]) {
      dispatch_semaphore_t v18 = &stru_1F231BAB0;
    }
    value = v8;
    v19 = @"Login ";
    os_log_type_t v20 = v15;
    id v21 = v9;
    if (v13 && ![v13 isEqualToString:&stru_1F231BAB0]) {
      v19 = &stru_1F231BAB0;
    }
    v22 = v13;
    BOOL v23 = @"Host ";
    if (v14)
    {
      v24 = v14;
      if (![v14 isEqualToString:&stru_1F231BAB0]) {
        BOOL v23 = &stru_1F231BAB0;
      }
    }
    else
    {
      v24 = 0;
    }
    uint64_t v26 = @"Scheme ";
    if (v20 && ![v20 isEqualToString:&stru_1F231BAB0]) {
      uint64_t v26 = &stru_1F231BAB0;
    }
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v18;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v19;
    __int16 v58 = 2112;
    v59 = v23;
    __int16 v60 = 2112;
    v61 = v26;
    OSStatus v16 = log;
    _os_log_impl(&dword_1C86FF000, log, v17, "Refusing to save password in keychain because one or more of the necessary fields are null: %@%@%@%@", buf, 0x2Au);
    BOOL v25 = 0;
    BOOL v14 = v24;
    os_log_type_t v13 = v22;
    id v9 = v21;
    id v8 = value;
    BOOL v15 = v20;
  }
  else
  {
    BOOL v25 = 0;
  }
LABEL_28:

LABEL_29:
  return v25;
}

- (id)loadKeychainInformationsForURL:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = (__CFString *)a3;
  uint64_t v4 = DALoggingwithCategory();
  uint64_t v5 = MEMORY[0x1E4F50E48];
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 7);
  if (os_log_type_enabled(v4, v6))
  {
    *(_DWORD *)buf = 138412290;
    OSStatus v31 = v3;
    _os_log_impl(&dword_1C86FF000, v4, v6, "Loading password for %@", buf, 0xCu);
  }

  uint64_t v7 = [(__CFString *)v3 user];
  id v8 = [(__CFString *)v3 host];
  id v9 = [(__CFString *)v3 scheme];
  if (!v7
    || ([v7 isEqualToString:&stru_1F231BAB0] & 1) != 0
    || !v8
    || ([v8 isEqualToString:&stru_1F231BAB0] & 1) != 0
    || !v9
    || [v9 isEqualToString:&stru_1F231BAB0])
  {
    uint64_t v10 = DALoggingwithCategory();
    os_log_type_t v11 = *(unsigned char *)(v5 + 3);
    if (os_log_type_enabled(v10, v11))
    {
      os_log_type_t v12 = @"Login ";
      if (v7 && ![v7 isEqualToString:&stru_1F231BAB0]) {
        os_log_type_t v12 = &stru_1F231BAB0;
      }
      os_log_type_t v13 = @"Host ";
      if (v8 && ![v8 isEqualToString:&stru_1F231BAB0]) {
        os_log_type_t v13 = &stru_1F231BAB0;
      }
      BOOL v14 = @"Scheme ";
      if (v9 && ![v9 isEqualToString:&stru_1F231BAB0]) {
        BOOL v14 = &stru_1F231BAB0;
      }
      *(_DWORD *)buf = 138412802;
      OSStatus v31 = v12;
      __int16 v32 = 2112;
      os_log_type_t v33 = v13;
      __int16 v34 = 2112;
      v35 = v14;
      _os_log_impl(&dword_1C86FF000, v10, v11, "Refusing to retreive password from keychain because one or more of the necessary fields are null: %@%@%@", buf, 0x20u);
    }

    goto LABEL_21;
  }
  if ([v7 isEqualToString:@"unit-test"])
  {
LABEL_21:
    BOOL v15 = 0;
    goto LABEL_22;
  }
  CFTypeRef result = 0;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if ([v9 isEqualToString:@"ftp"])
  {
    dispatch_semaphore_t v18 = (const void **)MEMORY[0x1E4F3B7D0];
  }
  else
  {
    if (![v9 isEqualToString:@"http"])
    {
      if ([v9 isEqualToString:@"https"]) {
        v19 = (const void *)*MEMORY[0x1E4F3B7F8];
      }
      else {
        v19 = 0;
      }
      goto LABEL_34;
    }
    dispatch_semaphore_t v18 = (const void **)MEMORY[0x1E4F3B7E8];
  }
  v19 = *v18;
LABEL_34:
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B5C0], v7);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BC70], (const void *)*MEMORY[0x1E4F1CFD0]);
  os_log_type_t v20 = (const void *)*MEMORY[0x1E4F3B978];
  if (v19)
  {
    CFDictionaryAddValue(Mutable, v20, (const void *)*MEMORY[0x1E4F3B998]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B7C8], v19);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B848], v8);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B5E8], (const void *)*MEMORY[0x1E4F3B5F0]);
    id v21 = [(__CFString *)v3 port];

    v22 = (const void *)*MEMORY[0x1E4F3B7C0];
    if (v21) {
      BOOL v23 = (const void *)[(__CFString *)v3 port];
    }
    else {
      BOOL v23 = (const void *)objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(MEMORY[0x1E4F1CB10], "da_classicPortForScheme:", v9));
    }
    CFDictionaryAddValue(Mutable, v22, v23);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B7B8], (const void *)[(__CFString *)v3 uri]);
  }
  else
  {
    CFDictionaryAddValue(Mutable, v20, (const void *)*MEMORY[0x1E4F3B988]);
    v24 = (const void *)*MEMORY[0x1E4F3B850];
    BOOL v25 = [(__CFString *)v3 URLWithoutUsername];
    CFDictionaryAddValue(Mutable, v24, (const void *)[v25 absoluteString]);
  }
  if (SecItemCopyMatching(Mutable, &result))
  {
    uint64_t v26 = DALoggingwithCategory();
    os_log_type_t v27 = *(unsigned char *)(v5 + 6);
    if (os_log_type_enabled(v26, v27))
    {
      *(_DWORD *)buf = 138412290;
      OSStatus v31 = v3;
      _os_log_impl(&dword_1C86FF000, v26, v27, "Could not find a password in the keychain for %@", buf, 0xCu);
    }

    BOOL v15 = 0;
  }
  else
  {
    id v28 = [NSString alloc];
    BOOL v15 = (void *)[v28 initWithData:result encoding:4];
  }
  if (result)
  {
    CFRelease(result);
    CFTypeRef result = 0;
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
LABEL_22:

  return v15;
}

- (void)removeKeychainInformationsForURL:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = DALoggingwithCategory();
  uint64_t v5 = MEMORY[0x1E4F50E48];
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x1E4F50E48] + 6);
  if (os_log_type_enabled(v4, v6))
  {
    int v28 = 138412290;
    *(void *)v29 = v3;
    _os_log_impl(&dword_1C86FF000, v4, v6, "Removing password for %@", (uint8_t *)&v28, 0xCu);
  }

  uint64_t v7 = [v3 user];
  id v8 = [v3 host];
  id v9 = [v3 scheme];
  if (!v7
    || ([v7 isEqualToString:&stru_1F231BAB0] & 1) != 0
    || !v8
    || ([v8 isEqualToString:&stru_1F231BAB0] & 1) != 0
    || !v9
    || [v9 isEqualToString:&stru_1F231BAB0])
  {
    uint64_t v10 = DALoggingwithCategory();
    os_log_type_t v11 = *(unsigned char *)(v5 + 3);
    if (os_log_type_enabled(v10, v11))
    {
      os_log_type_t v12 = @"Login ";
      if (v7 && ![v7 isEqualToString:&stru_1F231BAB0]) {
        os_log_type_t v12 = &stru_1F231BAB0;
      }
      os_log_type_t v13 = @"Host ";
      if (v8 && ![v8 isEqualToString:&stru_1F231BAB0]) {
        os_log_type_t v13 = &stru_1F231BAB0;
      }
      BOOL v14 = @"Scheme ";
      if (v9 && ![v9 isEqualToString:&stru_1F231BAB0]) {
        BOOL v14 = &stru_1F231BAB0;
      }
      int v28 = 138412802;
      *(void *)v29 = v12;
      *(_WORD *)&v29[8] = 2112;
      *(void *)&v29[10] = v13;
      __int16 v30 = 2112;
      OSStatus v31 = v14;
      _os_log_impl(&dword_1C86FF000, v10, v11, "Refusing to delete password from keychain because one or more of the necessary fields are null: %@%@%@", (uint8_t *)&v28, 0x20u);
    }

    goto LABEL_21;
  }
  if ([v7 isEqualToString:@"unit-test"]) {
    goto LABEL_21;
  }
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if ([v9 isEqualToString:@"ftp"])
  {
    OSStatus v16 = (const void **)MEMORY[0x1E4F3B7D0];
  }
  else
  {
    if (![v9 isEqualToString:@"http"])
    {
      if ([v9 isEqualToString:@"https"]) {
        os_log_type_t v17 = (const void *)*MEMORY[0x1E4F3B7F8];
      }
      else {
        os_log_type_t v17 = 0;
      }
      goto LABEL_31;
    }
    OSStatus v16 = (const void **)MEMORY[0x1E4F3B7E8];
  }
  os_log_type_t v17 = *v16;
LABEL_31:
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B5C0], v7);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BC70], (const void *)*MEMORY[0x1E4F1CFD0]);
  dispatch_semaphore_t v18 = (const void *)*MEMORY[0x1E4F3B978];
  if (v17)
  {
    CFDictionaryAddValue(Mutable, v18, (const void *)*MEMORY[0x1E4F3B998]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B7C8], v17);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B848], v8);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B5E8], (const void *)*MEMORY[0x1E4F3B5F0]);
    v19 = [v3 port];

    os_log_type_t v20 = (const void *)*MEMORY[0x1E4F3B7C0];
    if (v19) {
      id v21 = (const void *)[v3 port];
    }
    else {
      id v21 = (const void *)objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(MEMORY[0x1E4F1CB10], "da_classicPortForScheme:", v9));
    }
    CFDictionaryAddValue(Mutable, v20, v21);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B7B8], (const void *)[v3 uri]);
  }
  else
  {
    CFDictionaryAddValue(Mutable, v18, (const void *)*MEMORY[0x1E4F3B988]);
    v22 = (const void *)*MEMORY[0x1E4F3B850];
    BOOL v23 = [v3 URLWithoutUsername];
    CFDictionaryAddValue(Mutable, v22, (const void *)[v23 absoluteString]);
  }
  OSStatus v24 = SecItemDelete(Mutable);
  if (v24)
  {
    OSStatus v25 = v24;
    uint64_t v26 = DALoggingwithCategory();
    os_log_type_t v27 = *(unsigned char *)(v5 + 3);
    if (os_log_type_enabled(v26, v27))
    {
      int v28 = 67109378;
      *(_DWORD *)v29 = v25;
      *(_WORD *)&v29[4] = 2112;
      *(void *)&v29[6] = v3;
      _os_log_impl(&dword_1C86FF000, v26, v27, "error %d: Could not delete password for %@", (uint8_t *)&v28, 0x12u);
    }
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
LABEL_21:
}

- (id)guessPasswordForURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DAKeychain *)self loadKeychainInformationsForURL:v4];
  if (v5)
  {
    os_log_type_t v6 = (void *)v5;
    uint64_t v7 = 0;
    id v8 = v4;
  }
  else
  {
    uint64_t v10 = [v4 port];
    int v11 = [v10 intValue];

    id v8 = v4;
    if (!v11) {
      goto LABEL_9;
    }
    os_log_type_t v12 = (void *)MEMORY[0x1E4F1CB10];
    os_log_type_t v13 = [v4 scheme];
    BOOL v14 = [v4 host];
    BOOL v15 = [v4 path];
    OSStatus v16 = objc_msgSend(v12, "da_URLWithScheme:host:port:uri:", v13, v14, 0, v15);

    os_log_type_t v17 = [v4 user];
    dispatch_semaphore_t v18 = [v4 password];
    id v8 = [v16 URLWithUsername:v17 withPassword:v18];

    os_log_type_t v6 = [(DAKeychain *)self loadKeychainInformationsForURL:v8];

    if (v6)
    {
      uint64_t v7 = 0;
    }
    else
    {
LABEL_9:
      uint64_t v7 = 0;
      if (v8)
      {
        while (1)
        {
          os_log_type_t v6 = [v7 absoluteString];
          if (!v6) {
            break;
          }
          v19 = [v8 absoluteString];
          os_log_type_t v20 = [v7 absoluteString];
          char v21 = [v19 isEqualToString:v20];

          if (v21) {
            goto LABEL_15;
          }
          uint64_t v22 = [(DAKeychain *)self loadKeychainInformationsForURL:v8];
          if (v22)
          {
            os_log_type_t v6 = (void *)v22;
            break;
          }
          id v23 = v8;

          id v8 = [v23 URLByRemovingLastPathComponent];

          uint64_t v7 = v23;
          if (!v8)
          {
            os_log_type_t v6 = 0;
            uint64_t v7 = v23;
            break;
          }
        }
      }
      else
      {
LABEL_15:
        os_log_type_t v6 = 0;
      }
    }
  }

  return v6;
}

@end