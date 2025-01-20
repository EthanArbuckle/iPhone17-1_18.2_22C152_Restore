@interface EDInteractionEventLogSaltProvider
+ (OS_os_log)log;
+ (id)saltProviderFromKeyChain;
+ (id)saltProviderWithString:(id)a3;
- (BOOL)migrateAccessClass;
- (EDInteractionEventLogSaltProvider)init;
- (NSData)salt;
- (id)_createSalt;
- (id)_findExistingSaltError:(id *)a3;
- (id)_findOrCreateSalt;
- (id)_queryKeychainError:(id *)a3;
- (void)_createSalt;
- (void)_deleteSalt;
- (void)_findOrCreateSalt;
- (void)migrateAccessClass;
- (void)salt;
- (void)setSalt:(id)a3;
@end

@implementation EDInteractionEventLogSaltProvider

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__EDInteractionEventLogSaltProvider_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_41 != -1) {
    dispatch_once(&log_onceToken_41, block);
  }
  v2 = (void *)log_log_41;

  return (OS_os_log *)v2;
}

void __40__EDInteractionEventLogSaltProvider_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_41;
  log_log_41 = (uint64_t)v1;
}

+ (id)saltProviderWithString:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  uint64_t v6 = [v4 dataUsingEncoding:4];
  v7 = (void *)v5[2];
  v5[2] = v6;

  return v5;
}

+ (id)saltProviderFromKeyChain
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (EDInteractionEventLogSaltProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)EDInteractionEventLogSaltProvider;
  result = [(EDInteractionEventLogSaltProvider *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (NSData)salt
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  salt = self->_salt;
  if (!salt)
  {
    v5 = [(EDInteractionEventLogSaltProvider *)self _findOrCreateSalt];
    uint64_t v6 = self->_salt;
    self->_salt = v5;

    salt = self->_salt;
  }
  v7 = salt;
  os_unfair_lock_unlock(p_lock);
  if (!v7)
  {
    v8 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      char v9 = EFDeviceUnlockedSinceBoot();
      [(EDInteractionEventLogSaltProvider *)v9 salt];
    }
  }

  return v7;
}

- (id)_findOrCreateSalt
{
  id v14 = 0;
  objc_super v3 = [(EDInteractionEventLogSaltProvider *)self _findExistingSaltError:&v14];
  id v4 = v14;
  if (!v3)
  {
LABEL_9:
    uint64_t v9 = [(EDInteractionEventLogSaltProvider *)self _createSalt];
    goto LABEL_10;
  }
  v5 = [v3 second];
  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F3B558]];
  int v7 = [v6 isEqual:*MEMORY[0x1E4F3B570]];

  if (!v7)
  {
    v10 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[EDInteractionEventLogSaltProvider _findOrCreateSalt](v10);
    }

    [(EDInteractionEventLogSaltProvider *)self _deleteSalt];
    goto LABEL_9;
  }
  v8 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "Found existing salt", v13, 2u);
  }

  uint64_t v9 = [v3 first];
LABEL_10:
  v11 = (void *)v9;

  return v11;
}

- (id)_queryKeychainError:(id *)a3
{
  v24[6] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F3B988];
  uint64_t v5 = *MEMORY[0x1E4F3B850];
  v23[0] = *MEMORY[0x1E4F3B978];
  v23[1] = v5;
  v24[0] = v4;
  v24[1] = @"com.apple.mail.interaction-log.salt";
  uint64_t v6 = *MEMORY[0x1E4F3BC70];
  v23[2] = *MEMORY[0x1E4F3B878];
  v23[3] = v6;
  v24[2] = MEMORY[0x1E4F1CC38];
  v24[3] = MEMORY[0x1E4F1CC38];
  uint64_t v7 = *MEMORY[0x1E4F3BB80];
  v23[4] = *MEMORY[0x1E4F3BC68];
  v23[5] = v7;
  v24[4] = MEMORY[0x1E4F1CC38];
  v24[5] = &unk_1F35BAC70;
  CFDictionaryRef v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:6];
  CFTypeRef result = 0;
  uint64_t v9 = SecItemCopyMatching(v8, &result);
  uint64_t v10 = v9;
  if (v9)
  {
    if (v9 == -25300)
    {
      v11 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_1DB39C000, v11, OS_LOG_TYPE_DEFAULT, "No salt found", v21, 2u);
      }
    }
    else
    {
      v13 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[EDInteractionEventLogSaltProvider _queryKeychainError:](v10, v13, v14, v15, v16, v17, v18, v19);
      }

      if (a3)
      {
        [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:(int)v10 userInfo:0];
        uint64_t v12 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
    }
  }
  else if (result)
  {
    CFAutorelease(result);
    uint64_t v12 = (id)result;
    goto LABEL_13;
  }
  uint64_t v12 = 0;
LABEL_13:

  return v12;
}

- (id)_findExistingSaltError:(id *)a3
{
  uint64_t v4 = -[EDInteractionEventLogSaltProvider _queryKeychainError:](self, "_queryKeychainError:");
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = [v4 sortedArrayUsingComparator:&__block_literal_global_28];

    uint64_t v7 = [v6 firstObject];
    CFDictionaryRef v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F3BD38]];

    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
    if (v8)
    {
      for (unint64_t i = 0; i < [v8 length]; i += 2)
      {
        __int16 v19 = -21846;
        objc_msgSend(v8, "getBytes:range:", &v19, i, 2);
        if ((v19 & 0x10) != 0) {
          char v11 = 0;
        }
        else {
          char v11 = 9;
        }
        char v12 = v11 + v19;
        if ((v19 & 0x1000) != 0) {
          char v13 = -16;
        }
        else {
          char v13 = 9;
        }
        char v18 = v13 + (HIBYTE(v19) & 0x1F) + 16 * v12;
        [v9 appendBytes:&v18 length:1];
      }
      uint64_t v14 = (void *)MEMORY[0x1E4F60DF0];
      uint64_t v15 = [v6 firstObject];
      uint64_t v16 = [v14 pairWithFirst:v9 second:v15];
    }
    else
    {
      uint64_t v16 = 0;
      if (a3) {
        *a3 = 0;
      }
    }
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

uint64_t __60__EDInteractionEventLogSaltProvider__findExistingSaltError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4F3B668];
  uint64_t v6 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F3B668]];
  uint64_t v7 = [v4 objectForKeyedSubscript:v5];
  CFDictionaryRef v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (v6) {
      uint64_t v10 = -1;
    }
    else {
      uint64_t v10 = 1;
    }
  }
  else
  {
    uint64_t v10 = [v6 compare:v7];
  }

  return v10;
}

- (id)_createSalt
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v2 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB39C000, v2, OS_LOG_TYPE_DEFAULT, "Will create new salt", buf, 2u);
  }

  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)buf = v3;
  long long v33 = v3;
  arc4random_buf(buf, 0x20uLL);
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:buf length:32];
  uint64_t v5 = objc_msgSend(v4, "ef_hexString");
  uint64_t v6 = [v5 dataUsingEncoding:4];

  uint64_t v7 = *MEMORY[0x1E4F3B978];
  v27[0] = *MEMORY[0x1E4F3BD38];
  v27[1] = v7;
  uint64_t v8 = *MEMORY[0x1E4F3B988];
  v31[0] = v6;
  v31[1] = v8;
  uint64_t v9 = *MEMORY[0x1E4F3B850];
  uint64_t v28 = *MEMORY[0x1E4F3B550];
  v31[2] = @"com.apple.mail";
  v31[3] = @"com.apple.mail.interaction-log.salt";
  uint64_t v10 = NSNumber;
  char v11 = objc_msgSend(MEMORY[0x1E4F60D58], "currentDevice", v27[0], v7, v28, v9, *MEMORY[0x1E4F3B698]);
  char v12 = objc_msgSend(v10, "numberWithInt:", objc_msgSend(v11, "isInternal") ^ 1);
  uint64_t v13 = *MEMORY[0x1E4F3B558];
  uint64_t v14 = *MEMORY[0x1E4F3B570];
  v31[4] = v12;
  v31[5] = v14;
  uint64_t v15 = *MEMORY[0x1E4F3B878];
  uint64_t v29 = v13;
  uint64_t v30 = v15;
  v31[6] = MEMORY[0x1E4F1CC38];
  CFDictionaryRef v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v27 count:7];

  uint64_t v17 = SecItemAdd(v16, 0);
  if (v17)
  {
    char v18 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      [(EDInteractionEventLogSaltProvider *)v17 _createSalt];
    }

    id v25 = 0;
  }
  else
  {
    id v25 = v4;
  }

  return v25;
}

- (void)_deleteSalt
{
}

- (BOOL)migrateAccessClass
{
  long long v3 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_DEFAULT, "Will migrate salt", buf, 2u);
  }

  id v10 = 0;
  id v4 = [(EDInteractionEventLogSaltProvider *)self _findExistingSaltError:&v10];
  id v5 = v10;
  uint64_t v6 = v5;
  if (v4)
  {
    [(EDInteractionEventLogSaltProvider *)self _deleteSalt];
    uint64_t v7 = [(EDInteractionEventLogSaltProvider *)self _createSalt];
    BOOL v8 = v7 != 0;
  }
  else
  {
    if (!v5 || [v5 code] != -25308)
    {
      BOOL v8 = 1;
      goto LABEL_12;
    }
    uint64_t v7 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[EDInteractionEventLogSaltProvider migrateAccessClass](v7);
    }
    BOOL v8 = 0;
  }

LABEL_12:
  return v8;
}

- (void)setSalt:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)salt
{
  long long v3 = @"NO";
  if (a1) {
    long long v3 = @"YES";
  }
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = v3;
  _os_log_fault_impl(&dword_1DB39C000, log, OS_LOG_TYPE_FAULT, "Could not generate salt. Device unlocked since boot: %@", buf, 0xCu);
}

- (void)_findOrCreateSalt
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Existing salt has wrong access class. Re-creating salt", v1, 2u);
}

- (void)_queryKeychainError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_createSalt
{
}

- (void)migrateAccessClass
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "errSecInteractionNotAllowed from keychain. Is the device still locked?", v1, 2u);
}

@end