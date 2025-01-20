@interface AppleIDTokenMigrator
- (__CFDictionary)_newKeychainQueryForAllItemsMatchingAccountName:(id)a3 serviceName:(id)a4;
- (id)_mostRecentTokenWithServiceName:(id)a3 matchingAccountNames:(id)a4;
- (id)_potentialServiceNamesForTokenOfAccount:(id)a3;
- (id)migrateAppleIDBasedCredentialForAccount:(id)a3;
- (void)_removeKeychainItemForUsernames:(id)a3 services:(id)a4;
@end

@implementation AppleIDTokenMigrator

- (id)migrateAppleIDBasedCredentialForAccount:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(AppleIDTokenMigrator *)self _potentialServiceNamesForTokenOfAccount:v4];
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = [v4 username];

    if (v7)
    {
      v8 = [v4 username];
      [v6 addObject:v8];
    }
    v9 = [v4 accountPropertyForKey:*MEMORY[0x263F25C08]];
    if (v9)
    {
      [v6 addObject:v9];
    }
    else
    {
      v12 = _AALogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2404DE000, v12, OS_LOG_TYPE_DEFAULT, "ERROR, we've got a nil migratedAccountIdentifier - something went horribly wrong", buf, 2u);
      }
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v13 = v5;
    id v11 = (id)[v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v11)
    {
      v23 = v9;
      v14 = 0;
      uint64_t v15 = *(void *)v26;
      do
      {
        v16 = 0;
        v17 = v14;
        do
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v13);
          }
          v14 = -[AppleIDTokenMigrator _mostRecentTokenWithServiceName:matchingAccountNames:](self, "_mostRecentTokenWithServiceName:matchingAccountNames:", *(void *)(*((void *)&v25 + 1) + 8 * (void)v16), v6, v23);

          v16 = (char *)v16 + 1;
          v17 = v14;
        }
        while (v11 != v16);
        id v11 = (id)[v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v11);

      if (!v14)
      {
        id v11 = 0;
        v9 = v23;
LABEL_31:

        goto LABEL_32;
      }
      id v11 = objc_alloc_init(MEMORY[0x263EFB200]);
      [v11 setToken:v14];
      [v4 setCredential:v11];
      id v24 = 0;
      [MEMORY[0x263F230F0] setCredentialForAccount:v4 error:&v24];
      id v18 = v24;
      v19 = _AALogSystem();
      BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
      if (v18)
      {
        if (v20)
        {
          v21 = [v4 shortDebugName];
          *(_DWORD *)buf = 138412290;
          id v31 = v21;
          _os_log_impl(&dword_2404DE000, v19, OS_LOG_TYPE_DEFAULT, "AppleIDTokenMigrator failed to save the new credential for account %@.", buf, 0xCu);
        }
      }
      else
      {
        if (v20)
        {
          *(_DWORD *)buf = 138412290;
          id v31 = v13;
          _os_log_impl(&dword_2404DE000, v19, OS_LOG_TYPE_DEFAULT, "Remove old Apple ID credential items: %@", buf, 0xCu);
        }

        [(AppleIDTokenMigrator *)self _removeKeychainItemForUsernames:v6 services:v13];
      }
      v9 = v23;
    }
    else
    {
      v14 = 0;
      id v18 = v13;
    }

    goto LABEL_31;
  }
  v6 = _AALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [v4 shortDebugName];
    *(_DWORD *)buf = 138412290;
    id v31 = v10;
    _os_log_impl(&dword_2404DE000, v6, OS_LOG_TYPE_DEFAULT, "AppleIDTokenMigrator could not figure out a service name for this account's token: %@", buf, 0xCu);
  }
  id v11 = 0;
LABEL_32:

  return v11;
}

- (id)_potentialServiceNamesForTokenOfAccount:(id)a3
{
  v3 = [a3 accountType];
  id v4 = [v3 identifier];

  if ([v4 isEqualToString:*MEMORY[0x263EFAEE0]])
  {
    v5 = &unk_26F499EC8;
  }
  else if ([v4 isEqualToString:*MEMORY[0x263EFAF20]])
  {
    v5 = &unk_26F499EE0;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_mostRecentTokenWithServiceName:(id)a3 matchingAccountNames:(id)a4
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v45 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v50 objects:v62 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v51;
    uint64_t v12 = *MEMORY[0x263F175A8];
    uint64_t v13 = *MEMORY[0x263F17008];
    *(void *)&long long v9 = 67109120;
    long long v37 = v9;
    v39 = self;
    id v40 = v6;
    uint64_t v38 = *(void *)v51;
    do
    {
      uint64_t v14 = 0;
      uint64_t v41 = v10;
      do
      {
        if (*(void *)v51 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = -[AppleIDTokenMigrator _newKeychainQueryForAllItemsMatchingAccountName:serviceName:](self, "_newKeychainQueryForAllItemsMatchingAccountName:serviceName:", *(void *)(*((void *)&v50 + 1) + 8 * v14), v6, v37);
        *(void *)result = 0;
        OSStatus v16 = SecItemCopyMatching(v15, (CFTypeRef *)result);
        v17 = _AALogSystem();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v37;
          OSStatus v61 = v16;
          _os_log_impl(&dword_2404DE000, v17, OS_LOG_TYPE_DEFAULT, "AppleIDTokenMigrator: SecItemCopyMatching returned %d", buf, 8u);
        }

        if (v16) {
          BOOL v18 = 1;
        }
        else {
          BOOL v18 = *(void *)result == 0;
        }
        if (!v18)
        {
          v43 = v15;
          uint64_t v44 = v14;
          id v19 = *(id *)result;
          long long v46 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          uint64_t v20 = [v19 countByEnumeratingWithState:&v46 objects:v59 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v47;
            do
            {
              for (uint64_t i = 0; i != v21; ++i)
              {
                if (*(void *)v47 != v22) {
                  objc_enumerationMutation(v19);
                }
                id v24 = *(void **)(*((void *)&v46 + 1) + 8 * i);
                long long v25 = [v24 objectForKey:v12];
                long long v26 = [v24 objectForKey:v13];
                uint64_t v27 = [[NSString alloc] initWithData:v25 encoding:4];
                long long v28 = (void *)v27;
                if (v27) {
                  BOOL v29 = v26 == 0;
                }
                else {
                  BOOL v29 = 1;
                }
                if (!v29)
                {
                  v57[0] = @"token";
                  v57[1] = @"date-last-modified";
                  v58[0] = v27;
                  v58[1] = v26;
                  v30 = [NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:2];
                  [v45 addObject:v30];
                }
              }
              uint64_t v21 = [v19 countByEnumeratingWithState:&v46 objects:v59 count:16];
            }
            while (v21);
          }

          self = v39;
          id v6 = v40;
          uint64_t v11 = v38;
          uint64_t v10 = v41;
          uint64_t v15 = v43;
          uint64_t v14 = v44;
        }
        CFRelease(v15);
        if (*(void *)result) {
          CFRelease(*(CFTypeRef *)result);
        }
        ++v14;
      }
      while (v14 != v10);
      uint64_t v10 = [obj countByEnumeratingWithState:&v50 objects:v62 count:16];
    }
    while (v10);
  }

  id v31 = _AALogSystem();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v32 = [v45 count];
    *(_DWORD *)result = 134218242;
    *(void *)&result[4] = v32;
    __int16 v55 = 2112;
    id v56 = v6;
    _os_log_impl(&dword_2404DE000, v31, OS_LOG_TYPE_DEFAULT, "AppleIDtokenMigrator found %ld tokens in the keychain with service name %@.", result, 0x16u);
  }

  if ([v45 count])
  {
    id v33 = (id)[v45 sortedArrayUsingComparator:&unk_26F4990F0];
    v34 = [v45 lastObject];
    v35 = [v34 objectForKeyedSubscript:@"token"];
  }
  else
  {
    v35 = 0;
  }

  return v35;
}

- (__CFDictionary)_newKeychainQueryForAllItemsMatchingAccountName:(id)a3 serviceName:(id)a4
{
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  id v6 = a4;
  id v7 = a3;
  Mutable = CFDictionaryCreateMutable(v5, 0, 0, 0);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F171B8], (const void *)*MEMORY[0x263F171C8]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F16ED8], v7);

  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F17090], v6);
  long long v9 = (const void *)*MEMORY[0x263EFFB40];
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F17520], (const void *)*MEMORY[0x263EFFB40]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F17518], v9);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F17400], (const void *)*MEMORY[0x263F17408]);
  return Mutable;
}

- (void)_removeKeychainItemForUsernames:(id)a3 services:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v21 = a4;
  if ([v21 count] && objc_msgSend(v5, "count"))
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v18 = v5;
    id obj = v5;
    uint64_t v22 = [obj countByEnumeratingWithState:&v31 objects:v40 count:16];
    if (v22)
    {
      uint64_t v20 = *(void *)v32;
      key = (void *)*MEMORY[0x263F171B8];
      CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      id v6 = (const void *)*MEMORY[0x263F171C8];
      id v7 = (const void *)*MEMORY[0x263F16ED8];
      uint64_t v8 = (const void *)*MEMORY[0x263F17090];
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v32 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = v9;
          uint64_t v10 = *(const void **)(*((void *)&v31 + 1) + 8 * v9);
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          id v24 = v21;
          uint64_t v11 = [v24 countByEnumeratingWithState:&v27 objects:v39 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v28;
            do
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v28 != v13) {
                  objc_enumerationMutation(v24);
                }
                uint64_t v15 = *(const void **)(*((void *)&v27 + 1) + 8 * i);
                Mutable = CFDictionaryCreateMutable(allocator, 0, 0, 0);
                CFDictionaryAddValue(Mutable, key, v6);
                CFDictionaryAddValue(Mutable, v7, v10);
                CFDictionaryAddValue(Mutable, v8, v15);
                if (SecItemDelete(Mutable))
                {
                  v17 = _AALogSystem();
                  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    v36 = v15;
                    __int16 v37 = 2112;
                    uint64_t v38 = v10;
                    _os_log_impl(&dword_2404DE000, v17, OS_LOG_TYPE_DEFAULT, "We couldn't remove %@ for %@ from the keychain", buf, 0x16u);
                  }
                }
                CFRelease(Mutable);
              }
              uint64_t v12 = [v24 countByEnumeratingWithState:&v27 objects:v39 count:16];
            }
            while (v12);
          }

          uint64_t v9 = v23 + 1;
        }
        while (v23 + 1 != v22);
        uint64_t v22 = [obj countByEnumeratingWithState:&v31 objects:v40 count:16];
      }
      while (v22);
    }

    id v5 = v18;
  }
}

@end