@interface ACDKeychainMigrator
+ (id)sharedInstance;
- (ACDKeychainMigrator)init;
- (BOOL)migrateKeychainItem:(id)a3 toKeybag:(BOOL)a4;
- (id)_keychainItemFromAttributes:(id)a3;
- (id)_keychainItemFromAttributesArray:(id)a3;
- (id)_keychainItemsForAccount:(id)a3 accountTypeIdentifiers:(id)a4;
- (id)allKeychainItems;
- (id)keychainItemsForAccounts:(id)a3;
- (void)_migrateUUIDKeychainItems:(id)a3;
- (void)_validateKeychainItemClass:(id)a3;
- (void)migrateAllKeychainItems;
@end

@implementation ACDKeychainMigrator

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__ACDKeychainMigrator_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return v2;
}

uint64_t __37__ACDKeychainMigrator_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

- (ACDKeychainMigrator)init
{
  v6.receiver = self;
  v6.super_class = (Class)ACDKeychainMigrator;
  v2 = [(ACDKeychainMigrator *)&v6 init];
  if (v2)
  {
    v3 = (ACAccountStore *)objc_alloc_init(MEMORY[0x263EFB210]);
    accountStore = v2->_accountStore;
    v2->_accountStore = v3;
  }
  return v2;
}

- (void)migrateAllKeychainItems
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [(ACDKeychainMigrator *)self allKeychainItems];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v13;
    *(void *)&long long v5 = 138412290;
    long long v11 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "hasCustomAccessControl", v11))
        {
          v10 = _ACDKeychainLogSystem();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v11;
            v17 = v9;
            _os_log_debug_impl(&dword_2183AD000, v10, OS_LOG_TYPE_DEBUG, "Keychain item (%@) has custom access control, skipping...", buf, 0xCu);
          }
        }
        else
        {
          [(ACDKeychainMigrator *)self migrateKeychainItem:v9 toKeybag:1];
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v6);
  }
}

- (BOOL)migrateKeychainItem:(id)a3 toKeybag:(BOOL)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 version];
  if (v6 > 6)
  {
    char v9 = 1;
    goto LABEL_22;
  }
  uint64_t v7 = v6;
  v8 = _ACDKeychainLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[ACDKeychainMigrator migrateKeychainItem:toKeybag:]((uint64_t)v5, v7, v8);
  }

  if (v7 <= 0)
  {
    [(ACDKeychainMigrator *)self _validateKeychainItemClass:v5];
    goto LABEL_12;
  }
  if (v7 == 1)
  {
LABEL_12:
    [(ACDKeychainMigrator *)self _validateKeychainItemClass:v5];
    goto LABEL_13;
  }
  if ((unint64_t)v7 <= 2)
  {
LABEL_13:
    [(ACDKeychainMigrator *)self _migrateUUIDKeychainItems:v5];
    goto LABEL_14;
  }
  if ((unint64_t)v7 > 4)
  {
    if (v7 != 5) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_14:
  [(ACDKeychainMigrator *)self _validateKeychainItemClass:v5];
LABEL_15:
  [(ACDKeychainMigrator *)self _validateKeychainItemClass:v5];
LABEL_16:
  [(ACDKeychainMigrator *)self _validateKeychainItemClass:v5];
  [v5 setVersion:7];
  id v14 = 0;
  char v9 = [v5 save:&v14];
  id v10 = v14;
  long long v11 = _ACDKeychainLogSystem();
  long long v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ACDKeychainMigrator migrateKeychainItem:toKeybag:]();
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    -[ACDKeychainMigrator migrateKeychainItem:toKeybag:]();
  }

LABEL_22:
  return v9;
}

- (void)_validateKeychainItemClass:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 service];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__ACDKeychainMigrator__validateKeychainItemClass___block_invoke;
  v6[3] = &unk_264321590;
  id v7 = v3;
  id v5 = v3;
  +[ACDKeychainManager componentsFromKeychainServiceName:v4 handler:v6];
}

void __50__ACDKeychainMigrator__validateKeychainItemClass___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v8)
  {
    if (v9)
    {
      long long v11 = [MEMORY[0x263EFB220] allIdentifiers];
      char v12 = [v11 containsObject:v8];

      if (v12)
      {
        long long v13 = [MEMORY[0x263EFB200] credentialPolicyForAccountTypeIdentifier:v8 key:v10 clientID:v7];
        if (v13)
        {
          id v14 = [*(id *)(a1 + 32) accessibility];
          char v15 = [v14 isEqualToString:v13];

          if ((v15 & 1) == 0)
          {
            v16 = _ACDKeychainLogSystem();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v17 = *(void *)(a1 + 32);
              int v28 = 138412546;
              uint64_t v29 = v17;
              __int16 v30 = 2112;
              v31 = v13;
              _os_log_impl(&dword_2183AD000, v16, OS_LOG_TYPE_DEFAULT, "Found mismatched keychain item accessibility: %@ :: expected: %@", (uint8_t *)&v28, 0x16u);
            }

            [*(id *)(a1 + 32) setAccessibility:v13];
          }
          v18 = [*(id *)(a1 + 32) accessibility];
          if ([v18 isEqualToString:*MEMORY[0x263F16EA0]])
          {
            int v19 = [*(id *)(a1 + 32) synchronizable];

            if (v19)
            {
              v20 = _ACDKeychainLogSystem();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v21 = *(void *)(a1 + 32);
                int v28 = 138412290;
                uint64_t v29 = v21;
                _os_log_impl(&dword_2183AD000, v20, OS_LOG_TYPE_DEFAULT, "Found keychain item with accessibility kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly marked as syncable: %@", (uint8_t *)&v28, 0xCu);
              }

              [*(id *)(a1 + 32) setSynchronizable:0];
            }
            goto LABEL_23;
          }
        }
        else
        {
          v18 = _ACDKeychainLogSystem();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
            __50__ACDKeychainMigrator__validateKeychainItemClass___block_invoke_cold_3(a1, v18, v22, v23, v24, v25, v26, v27);
          }
        }

        goto LABEL_23;
      }
      long long v13 = _ACDKeychainLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __50__ACDKeychainMigrator__validateKeychainItemClass___block_invoke_cold_4();
      }
    }
    else
    {
      long long v13 = _ACDKeychainLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __50__ACDKeychainMigrator__validateKeychainItemClass___block_invoke_cold_2(a1);
      }
    }
  }
  else
  {
    long long v13 = _ACDKeychainLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __50__ACDKeychainMigrator__validateKeychainItemClass___block_invoke_cold_1(a1);
    }
  }
LABEL_23:
}

- (void)_migrateUUIDKeychainItems:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 account];
  uint64_t v6 = [v5 length];

  if (v6 == 36)
  {
    accountStore = self->_accountStore;
    id v8 = [v4 account];
    id v9 = [(ACAccountStore *)accountStore accountWithIdentifier:v8];

    if (v9)
    {
      id v10 = [v9 username];
      uint64_t v11 = [v10 length];

      char v12 = _ACDKeychainLogSystem();
      long long v13 = v12;
      if (v11)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          id v14 = [v9 username];
          char v15 = [v4 account];
          int v16 = 138412546;
          uint64_t v17 = v14;
          __int16 v18 = 2112;
          int v19 = v15;
          _os_log_impl(&dword_2183AD000, v13, OS_LOG_TYPE_DEFAULT, "Updating keychain item acct: %@ old: %@", (uint8_t *)&v16, 0x16u);
        }
        long long v13 = [v9 username];
        [v4 setAccount:v13];
      }
      else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        -[ACDKeychainMigrator _migrateUUIDKeychainItems:]();
      }
    }
    else
    {
      long long v13 = _ACDKeychainLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[ACDKeychainMigrator _migrateUUIDKeychainItems:](v4);
      }
    }
  }
  else
  {
    id v9 = _ACDKeychainLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[ACDKeychainMigrator _migrateUUIDKeychainItems:](v9);
    }
  }
}

- (id)allKeychainItems
{
  id v3 = [(ACAccountStore *)self->_accountStore accounts];
  id v4 = [(ACDKeychainMigrator *)self keychainItemsForAccounts:v3];

  return v4;
}

- (id)keychainItemsForAccounts:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v10 = [v9 accountType];
        uint64_t v11 = [v10 identifier];

        if ([v11 length])
        {
          char v12 = [v9 qualifiedUsername];
          if ([v12 length])
          {
            long long v13 = [v4 objectForKeyedSubscript:v12];
            id v14 = v13;
            if (v13)
            {
              [v13 addObject:v11];
            }
            else
            {
              char v15 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithObjects:", v11, 0);
              [v4 setObject:v15 forKeyedSubscript:v12];
            }
          }
          int v16 = [v9 identifier];
          if ([v16 length])
          {
            uint64_t v17 = [v4 objectForKeyedSubscript:v16];
            __int16 v18 = v17;
            if (v17)
            {
              [v17 addObject:v11];
            }
            else
            {
              int v19 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithObjects:", v11, 0);
              [v4 setObject:v19 forKeyedSubscript:v16];
            }
          }
        }
        else
        {
          char v12 = _ACDKeychainLogSystem();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v9;
            _os_log_error_impl(&dword_2183AD000, v12, OS_LOG_TYPE_ERROR, "Account (%@) has and empty accountType identifier!", (uint8_t *)&buf, 0xCu);
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v6);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v29 = 0x3032000000;
  __int16 v30 = __Block_byref_object_copy__4;
  v31 = __Block_byref_object_dispose__4;
  id v32 = objc_alloc_init(MEMORY[0x263EFF980]);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __48__ACDKeychainMigrator_keychainItemsForAccounts___block_invoke;
  v23[3] = &unk_2643215B8;
  v23[4] = self;
  v23[5] = &buf;
  [v4 enumerateKeysAndObjectsUsingBlock:v23];
  uint64_t v20 = (void *)[*(id *)(*((void *)&buf + 1) + 40) copy];
  _Block_object_dispose(&buf, 8);

  return v20;
}

uint64_t __48__ACDKeychainMigrator_keychainItemsForAccounts___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = [*(id *)(a1 + 32) _keychainItemsForAccount:a2 accountTypeIdentifiers:a3];
  if (v4) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObjectsFromArray:v4];
  }

  return MEMORY[0x270F9A758]();
}

- (id)_keychainItemsForAccount:(id)a3 accountTypeIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0, 0);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F16ED8], v6);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F16E80], @"apple");
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F170B0], (const void *)*MEMORY[0x263F170B8]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F171B8], (const void *)*MEMORY[0x263F171C8]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F17400], (const void *)*MEMORY[0x263F17408]);
  id v9 = (const void *)*MEMORY[0x263EFFB40];
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F17518], (const void *)*MEMORY[0x263EFFB40]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F17528], v9);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F17560], (const void *)*MEMORY[0x263F17570]);
  CFTypeRef result = 0;
  uint64_t v10 = SecItemCopyMatching(Mutable, &result);
  if (v10)
  {
    uint64_t v11 = v10;
    char v12 = _ACDKeychainLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ACDKeychainMigrator _keychainItemsForAccount:accountTypeIdentifiers:]((uint64_t)v6, v11, v12);
    }

    long long v13 = 0;
  }
  else
  {
    long long v13 = [(ACDKeychainMigrator *)self _keychainItemFromAttributesArray:result];
  }
  if (result) {
    CFRelease(result);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __71__ACDKeychainMigrator__keychainItemsForAccount_accountTypeIdentifiers___block_invoke;
  uint64_t v21 = &unk_264321608;
  id v22 = v7;
  id v14 = v7;
  char v15 = [v13 indexesOfObjectsPassingTest:&v18];
  int v16 = objc_msgSend(v13, "objectsAtIndexes:", v15, v18, v19, v20, v21);

  return v16;
}

uint64_t __71__ACDKeychainMigrator__keychainItemsForAccount_accountTypeIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  uint64_t v4 = [v3 service];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__ACDKeychainMigrator__keychainItemsForAccount_accountTypeIdentifiers___block_invoke_2;
  v7[3] = &unk_2643215E0;
  id v8 = *(id *)(a1 + 32);
  id v9 = &v10;
  +[ACDKeychainManager componentsFromKeychainServiceName:v4 handler:v7];

  uint64_t v5 = *((unsigned __int8 *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __71__ACDKeychainMigrator__keychainItemsForAccount_accountTypeIdentifiers___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v8 = a4;
  if ([*(id *)(a1 + 32) containsObject:a3])
  {
    id v6 = [MEMORY[0x263EFB200] allSupportedKeys];
    int v7 = [v6 containsObject:v8];

    if (v7) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
}

- (id)_keychainItemFromAttributes:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F175B0]];

  if (v4) {
    uint64_t v4 = [[ACDKeychainItem alloc] initWithPersistentRef:v4 properties:v3];
  }

  return v4;
}

- (id)_keychainItemFromAttributesArray:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = -[ACDKeychainMigrator _keychainItemFromAttributes:](self, "_keychainItemFromAttributes:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  uint64_t v12 = (void *)[v5 copy];

  return v12;
}

- (void).cxx_destruct
{
}

- (void)migrateKeychainItem:toKeybag:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "Successfully migrated keychain item %@.", v2, v3, v4, v5, v6);
}

- (void)migrateKeychainItem:toKeybag:.cold.2()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_6();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_2183AD000, v1, OS_LOG_TYPE_ERROR, "Failed to migrate keychain item %@: %@", v2, 0x16u);
}

- (void)migrateKeychainItem:(NSObject *)a3 toKeybag:.cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = [NSNumber numberWithInteger:a2];
  OUTLINED_FUNCTION_2_4();
  __int16 v7 = v5;
  uint64_t v8 = &unk_26C998988;
  _os_log_debug_impl(&dword_2183AD000, a3, OS_LOG_TYPE_DEBUG, "Attempting to migrate keychain item %@ from %@ to %@", v6, 0x20u);
}

void __50__ACDKeychainMigrator__validateKeychainItemClass___block_invoke_cold_1(uint64_t a1)
{
  os_log_t v1 = [*(id *)(a1 + 32) service];
  OUTLINED_FUNCTION_6();
}

void __50__ACDKeychainMigrator__validateKeychainItemClass___block_invoke_cold_2(uint64_t a1)
{
  os_log_t v1 = [*(id *)(a1 + 32) service];
  OUTLINED_FUNCTION_6();
}

void __50__ACDKeychainMigrator__validateKeychainItemClass___block_invoke_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __50__ACDKeychainMigrator__validateKeychainItemClass___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_2183AD000, v0, v1, "Could not find account type for identifier %@.", v2, v3, v4, v5, v6);
}

- (void)_migrateUUIDKeychainItems:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 account];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_28(&dword_2183AD000, v2, v3, "Could not find an account with identifier %@, assuming item already username-based.", v4, v5, v6, v7, v8);
}

- (void)_migrateUUIDKeychainItems:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_2183AD000, v0, OS_LOG_TYPE_ERROR, "Found account %@ is missing username, will not update item.", v1, 0xCu);
}

- (void)_migrateUUIDKeychainItems:(os_log_t)log .cold.3(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_2183AD000, log, OS_LOG_TYPE_DEBUG, "Keychain item 'acct' did not match Account UUID format", v1, 2u);
}

- (void)_keychainItemsForAccount:(NSObject *)a3 accountTypeIdentifiers:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v4 = [NSNumber numberWithInt:a2];
  OUTLINED_FUNCTION_2_4();
  _os_log_error_impl(&dword_2183AD000, a3, OS_LOG_TYPE_ERROR, "Failed to query keychain for account: %@, errno %@", v5, 0x16u);
}

@end