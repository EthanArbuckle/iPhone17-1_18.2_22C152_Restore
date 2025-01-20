@interface AALoginContextTransientStorage
+ (id)sharedStorage;
- (AALoginContextTransientStorage)init;
- (id)_keychainItemForUsername:(id)a3 service:(id)a4;
- (id)_readNonsensitiveParameters;
- (id)storedContext;
- (void)_deleteKeychainItemForUsername:(id)a3 service:(id)a4;
- (void)_saveKeychainItem:(id)a3 forUsername:(id)a4 service:(id)a5;
- (void)_saveNonsensitiveParameters:(id)a3;
- (void)clear;
- (void)save:(id)a3;
@end

@implementation AALoginContextTransientStorage

+ (id)sharedStorage
{
  if (sharedStorage_onceToken != -1) {
    dispatch_once(&sharedStorage_onceToken, &__block_literal_global_29);
  }
  v2 = (void *)sharedStorage_storage;

  return v2;
}

uint64_t __47__AALoginContextTransientStorage_sharedStorage__block_invoke()
{
  sharedStorage_storage = objc_alloc_init(AALoginContextTransientStorage);

  return MEMORY[0x1F41817F8]();
}

- (AALoginContextTransientStorage)init
{
  v6.receiver = self;
  v6.super_class = (Class)AALoginContextTransientStorage;
  v2 = [(AALoginContextTransientStorage *)&v6 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    clearLock = v2->_clearLock;
    v2->_clearLock = v3;
  }
  return v2;
}

- (void)save:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSLock *)self->_clearLock lock];
  self->_hasBeenCleared = 0;
  [(NSLock *)self->_clearLock unlock];
  v5 = [v4 appleID];
  objc_super v6 = _AALogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      v28 = v5;
      _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "AALoginContextTransientStorage: saving tokens for Apple ID %@...", buf, 0xCu);
    }

    v25 = @"AKTransientAppleID";
    v26 = v5;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    objc_super v6 = [v8 mutableCopy];

    v9 = [v4 altDSID];
    if (v9)
    {
      [v6 setObject:v9 forKeyedSubscript:@"AKTransientAltDSID"];
    }
    else
    {
      v10 = _AALogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A11D8000, v10, OS_LOG_TYPE_DEFAULT, "AALoginContextTransientStorage: no altDSID in login context!", buf, 2u);
      }
    }
    v11 = [v4 DSID];

    if (v11)
    {
      v12 = [v4 DSID];
      [v6 setObject:v12 forKeyedSubscript:@"AKTransientDSID"];
    }
    if ([v4 isBeneficiaryLogin])
    {
      v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isBeneficiaryLogin"));
      [v6 setObject:v13 forKeyedSubscript:@"AKTransientIsBeneficiaryLogin"];
    }
    v14 = [v4 firstName];

    if (v14)
    {
      v15 = [v4 firstName];
      [v6 setObject:v15 forKeyedSubscript:@"AKTransientFirstName"];
    }
    v16 = [v4 middleName];

    if (v16)
    {
      v17 = [v4 middleName];
      [v6 setObject:v17 forKeyedSubscript:@"AKTransientMiddleName"];
    }
    v18 = [v4 lastName];

    if (v18)
    {
      v19 = [v4 lastName];
      [v6 setObject:v19 forKeyedSubscript:@"AKTransientLastName"];
    }
    [(AALoginContextTransientStorage *)self _saveNonsensitiveParameters:v6];
    v20 = _AALogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v5;
      _os_log_impl(&dword_1A11D8000, v20, OS_LOG_TYPE_DEFAULT, "AALoginContextTransientStorage: saving tokens for Apple ID %@...", buf, 0xCu);
    }

    v21 = [v4 rawPassword];
    [(AALoginContextTransientStorage *)self _saveKeychainItem:v21 forUsername:v5 service:@"com.apple.transient.rp"];

    v22 = [v4 continuationKey];
    [(AALoginContextTransientStorage *)self _saveKeychainItem:v22 forUsername:v5 service:@"com.apple.transient.ck"];

    v23 = [v4 passwordResetKey];
    [(AALoginContextTransientStorage *)self _saveKeychainItem:v23 forUsername:v5 service:@"com.apple.transient.prk"];

    v24 = [v4 cloudKitToken];
    [(AALoginContextTransientStorage *)self _saveKeychainItem:v24 forUsername:v5 service:@"com.apple.transient.ckt"];
  }
  else if (v7)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "AALoginContextTransientStorage: fatal error! No Apple ID in login context!", buf, 2u);
  }
}

- (id)storedContext
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [(NSLock *)self->_clearLock lock];
  BOOL hasBeenCleared = self->_hasBeenCleared;
  [(NSLock *)self->_clearLock unlock];
  if (hasBeenCleared)
  {
    id v4 = 0;
  }
  else
  {
    v5 = _AALogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_1A11D8000, v5, OS_LOG_TYPE_DEFAULT, "AALoginContextTransientStorage: retrieving stored login response parameters...", (uint8_t *)&v22, 2u);
    }

    objc_super v6 = [(AALoginContextTransientStorage *)self _readNonsensitiveParameters];
    BOOL v7 = v6;
    if (v6)
    {
      v8 = [v6 objectForKeyedSubscript:@"AKTransientAppleID"];
      v9 = [v7 objectForKeyedSubscript:@"AKTransientAltDSID"];
      v10 = _AALogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138412290;
        v23 = v8;
        _os_log_impl(&dword_1A11D8000, v10, OS_LOG_TYPE_DEFAULT, "AALoginContextTransientStorage: found stored login response parameters for %@!", (uint8_t *)&v22, 0xCu);
      }

      id v4 = [[AAStorableLoginContext alloc] initWithAppleID:v8 altDSID:v9];
      v11 = [v7 objectForKeyedSubscript:@"AKTransientDSID"];
      [(AAStorableLoginContext *)v4 setDSID:v11];

      v12 = [v7 objectForKeyedSubscript:@"AKTransientIsBeneficiaryLogin"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        -[AAStorableLoginContext setBeneficiaryLogin:](v4, "setBeneficiaryLogin:", [v12 BOOLValue]);
      }
      v13 = [v7 objectForKeyedSubscript:@"AKTransientFirstName"];
      [(AAStorableLoginContext *)v4 setFirstName:v13];

      v14 = [v7 objectForKeyedSubscript:@"AKTransientMiddleName"];
      [(AAStorableLoginContext *)v4 setMiddleName:v14];

      v15 = [v7 objectForKeyedSubscript:@"AKTransientLastName"];
      [(AAStorableLoginContext *)v4 setLastName:v15];

      v16 = _AALogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138412290;
        v23 = v8;
        _os_log_impl(&dword_1A11D8000, v16, OS_LOG_TYPE_DEFAULT, "AALoginContextTransientStorage: retrieving temporary keychain items Apple ID %@!", (uint8_t *)&v22, 0xCu);
      }

      v17 = [(AALoginContextTransientStorage *)self _keychainItemForUsername:v8 service:@"com.apple.transient.rp"];
      [(AAStorableLoginContext *)v4 setRawPassword:v17];

      v18 = [(AALoginContextTransientStorage *)self _keychainItemForUsername:v8 service:@"com.apple.transient.ck"];
      [(AAStorableLoginContext *)v4 setContinuationKey:v18];

      v19 = [(AALoginContextTransientStorage *)self _keychainItemForUsername:v8 service:@"com.apple.transient.prk"];
      [(AAStorableLoginContext *)v4 setPasswordResetKey:v19];

      v20 = [(AALoginContextTransientStorage *)self _keychainItemForUsername:v8 service:@"com.apple.transient.ckt"];
      [(AAStorableLoginContext *)v4 setCloudKitToken:v20];
    }
    else
    {
      v8 = _AALogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_1A11D8000, v8, OS_LOG_TYPE_DEFAULT, "AALoginContextTransientStorage: no known stored Apple ID.", (uint8_t *)&v22, 2u);
      }
      id v4 = 0;
    }
  }

  return v4;
}

- (void)clear
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [(NSLock *)self->_clearLock lock];
  self->_BOOL hasBeenCleared = 1;
  [(NSLock *)self->_clearLock unlock];
  v3 = [(AALoginContextTransientStorage *)self _readNonsensitiveParameters];
  id v4 = v3;
  if (v3)
  {
    v5 = [v3 objectForKeyedSubscript:@"AKTransientAppleID"];
    objc_super v6 = _AALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "AALoginContextTransientStorage: removing stored login response parameters for Apple ID %@...", (uint8_t *)&v8, 0xCu);
    }

    [(AALoginContextTransientStorage *)self _saveNonsensitiveParameters:0];
    BOOL v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1A11D8000, v7, OS_LOG_TYPE_DEFAULT, "AALoginContextTransientStorage: removing temporary keychain items...", (uint8_t *)&v8, 2u);
    }

    [(AALoginContextTransientStorage *)self _deleteKeychainItemForUsername:v5 service:@"com.apple.transient.rp"];
    [(AALoginContextTransientStorage *)self _deleteKeychainItemForUsername:v5 service:@"com.apple.transient.ck"];
    [(AALoginContextTransientStorage *)self _deleteKeychainItemForUsername:v5 service:@"com.apple.transient.prk"];
    [(AALoginContextTransientStorage *)self _deleteKeychainItemForUsername:v5 service:@"com.apple.transient.ckt"];
  }
  else
  {
    v5 = _AALogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1A11D8000, v5, OS_LOG_TYPE_DEFAULT, "AALoginContextTransientStorage: nothing to clear.", (uint8_t *)&v8, 2u);
    }
  }
}

- (void)_saveNonsensitiveParameters:(id)a3
{
  CFPreferencesSetAppValue(@"AAStoredLoginContext", a3, @"com.apple.appleaccount.notbackedup");
  CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3C8];

  CFPreferencesSynchronize(@"com.apple.appleaccount.notbackedup", v3, v4);
}

- (id)_readNonsensitiveParameters
{
  CFStringRef v2 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  CFPreferencesSynchronize(@"com.apple.appleaccount.notbackedup", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  CFStringRef v4 = (void *)CFPreferencesCopyValue(@"AAStoredLoginContext", @"com.apple.appleaccount.notbackedup", v2, v3);

  return v4;
}

- (void)_saveKeychainItem:(id)a3 forUsername:(id)a4 service:(id)a5
{
  v37[7] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = v9;
  if (v7)
  {
    if (v9)
    {
      uint64_t v11 = [v7 dataUsingEncoding:4];
      v12 = v11;
      if (v11)
      {
        uint64_t v13 = *MEMORY[0x1E4F3B578];
        uint64_t v14 = *MEMORY[0x1E4F3B5C0];
        v36[0] = *MEMORY[0x1E4F3B558];
        v36[1] = v14;
        v37[0] = v13;
        v37[1] = v8;
        uint64_t v15 = *MEMORY[0x1E4F3B978];
        v36[2] = *MEMORY[0x1E4F3B850];
        v36[3] = v15;
        uint64_t v16 = *MEMORY[0x1E4F3B988];
        v37[2] = v10;
        v37[3] = v16;
        uint64_t v17 = *MEMORY[0x1E4F3B878];
        v36[4] = *MEMORY[0x1E4F3B888];
        v36[5] = v17;
        v37[4] = &unk_1EF483ED0;
        v37[5] = MEMORY[0x1E4F1CC28];
        uint64_t v18 = *MEMORY[0x1E4F3BD38];
        v36[6] = *MEMORY[0x1E4F3BD38];
        v37[6] = v11;
        CFDictionaryRef v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:7];
        uint64_t v20 = SecItemAdd(v19, 0);
        v21 = _AALogSystem();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          int v22 = [NSNumber numberWithInt:v20];
          *(_DWORD *)buf = 138412802;
          id v31 = v8;
          __int16 v32 = 2112;
          v33 = v10;
          __int16 v34 = 2112;
          v35 = v22;
          _os_log_impl(&dword_1A11D8000, v21, OS_LOG_TYPE_DEFAULT, "AALoginContextTransientStorage: SecItemAdd (u: %@, s: %@) result: %@", buf, 0x20u);
        }
        if (v20 == -25299)
        {
          uint64_t v29 = v18;
          v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
          CFDictionaryRef v24 = [(__CFDictionary *)v19 dictionaryWithValuesForKeys:v23];

          v25 = (void *)[(__CFDictionary *)v19 mutableCopy];
          [v25 removeObjectForKey:v18];
          uint64_t v26 = SecItemUpdate((CFDictionaryRef)v25, v24);
          v27 = _AALogSystem();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            v28 = [NSNumber numberWithInt:v26];
            *(_DWORD *)buf = 138412802;
            id v31 = v8;
            __int16 v32 = 2112;
            v33 = v10;
            __int16 v34 = 2112;
            v35 = v28;
            _os_log_impl(&dword_1A11D8000, v27, OS_LOG_TYPE_DEFAULT, "AALoginContextTransientStorage: SecItemUpdate (u: %@, s: %@) result: %@", buf, 0x20u);
          }
        }
      }
      else
      {
        _AALogSystem();
        CFDictionaryRef v19 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A11D8000, (os_log_t)v19, OS_LOG_TYPE_DEFAULT, "AALoginContextTransientStorage: save error - could not encode item data", buf, 2u);
        }
      }
    }
    else
    {
      v12 = _AALogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "AALoginContextTransientStorage: save error - given nil service!", buf, 2u);
      }
    }
  }
}

- (id)_keychainItemForUsername:(id)a3 service:(id)a4
{
  v29[5] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!v6)
  {
    uint64_t v11 = _AALogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v18 = "AALoginContextTransientStorage: fetch error - given nil service!";
LABEL_12:
      _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, v18, buf, 2u);
    }
LABEL_19:
    uint64_t v17 = 0;
    goto LABEL_20;
  }
  if (!v5)
  {
    uint64_t v11 = _AALogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v18 = "AALoginContextTransientStorage: fetch error - given nil username!";
      goto LABEL_12;
    }
    goto LABEL_19;
  }
  uint64_t v8 = *MEMORY[0x1E4F3B850];
  v28[0] = *MEMORY[0x1E4F3B5C0];
  v28[1] = v8;
  v29[0] = v5;
  v29[1] = v6;
  uint64_t v9 = *MEMORY[0x1E4F3B988];
  uint64_t v10 = *MEMORY[0x1E4F3BC70];
  v28[2] = *MEMORY[0x1E4F3B978];
  v28[3] = v10;
  v29[2] = v9;
  v29[3] = MEMORY[0x1E4F1CC38];
  v28[4] = *MEMORY[0x1E4F3BCF0];
  v29[4] = *MEMORY[0x1E4F3BD00];
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:5];
  CFTypeRef result = 0;
  uint64_t v12 = SecItemCopyMatching((CFDictionaryRef)v11, &result);
  CFTypeRef v13 = result;
  uint64_t v14 = _AALogSystem();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v12 || !v13)
  {
    if (v12)
    {
      if (v15)
      {
        CFDictionaryRef v19 = [NSNumber numberWithInt:v12];
        *(_DWORD *)buf = 138412802;
        id v23 = v5;
        __int16 v24 = 2112;
        v25 = v7;
        __int16 v26 = 2112;
        v27 = v19;
        _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "AALoginContextTransientStorage: SecItemCopyMatching (u: %@, s: %@) failed: %@", buf, 0x20u);
      }
    }
    else if (v15)
    {
      *(_DWORD *)buf = 138412546;
      id v23 = v5;
      __int16 v24 = 2112;
      v25 = v7;
      _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "AALoginContextTransientStorage: SecItemCopyMatching (u: %@, s: %@) returned noErr and nil data!", buf, 0x16u);
    }

    goto LABEL_19;
  }
  if (v15)
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v7;
    _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "AALoginContextTransientStorage: successfully read keychain item %@", buf, 0xCu);
  }

  id v16 = [NSString alloc];
  uint64_t v17 = (void *)[v16 initWithData:result encoding:4];
  CFRelease(result);
LABEL_20:

  return v17;
}

- (void)_deleteKeychainItemForUsername:(id)a3 service:(id)a4
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!v6)
  {
    uint64_t v10 = _AALogSystem();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    LOWORD(v15) = 0;
    uint64_t v14 = "AALoginContextTransientStorage: delete error - given nil service!";
LABEL_10:
    _os_log_impl(&dword_1A11D8000, v10, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v15, 2u);
    goto LABEL_11;
  }
  if (!v5)
  {
    uint64_t v10 = _AALogSystem();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    LOWORD(v15) = 0;
    uint64_t v14 = "AALoginContextTransientStorage: delete error - given nil username!";
    goto LABEL_10;
  }
  uint64_t v8 = *MEMORY[0x1E4F3B988];
  uint64_t v9 = *MEMORY[0x1E4F3B5C0];
  v21[0] = *MEMORY[0x1E4F3B978];
  v21[1] = v9;
  v22[0] = v8;
  v22[1] = v5;
  v21[2] = *MEMORY[0x1E4F3B850];
  v22[2] = v6;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
  uint64_t v11 = SecItemDelete((CFDictionaryRef)v10);
  uint64_t v12 = _AALogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    CFTypeRef v13 = [NSNumber numberWithInt:v11];
    int v15 = 138412802;
    id v16 = v5;
    __int16 v17 = 2112;
    uint64_t v18 = v7;
    __int16 v19 = 2112;
    uint64_t v20 = v13;
    _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "AALoginContextTransientStorage: SecItemDelete (u: %@, s: %@) result: %@", (uint8_t *)&v15, 0x20u);
  }
LABEL_11:
}

- (void).cxx_destruct
{
}

@end