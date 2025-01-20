@interface EDInteractionEventLogLegacyPersistentBitsProvider
+ (OS_os_log)log;
- (id)_findExistingSaltError:(id *)a3;
- (id)_oldSalt;
- (id)_persistentBits;
- (id)_queryKeychainError:(id *)a3;
@end

@implementation EDInteractionEventLogLegacyPersistentBitsProvider

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__EDInteractionEventLogLegacyPersistentBitsProvider_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_39 != -1) {
    dispatch_once(&log_onceToken_39, block);
  }
  v2 = (void *)log_log_39;

  return (OS_os_log *)v2;
}

void __56__EDInteractionEventLogLegacyPersistentBitsProvider_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_39;
  log_log_39 = (uint64_t)v1;
}

- (id)_persistentBits
{
  v2 = [(EDInteractionEventLogLegacyPersistentBitsProvider *)self _oldSalt];
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 length];
    char v8 = -86;
    unsigned __int8 v7 = -86;
    objc_msgSend(v3, "getBytes:range:", &v8, 0, 1);
    objc_msgSend(v3, "getBytes:range:", &v7, v4 - 1, 1);
    v5 = [NSNumber numberWithUnsignedInt:v8 & 7 ^ (v7 >> 5)];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_oldSalt
{
  id v12 = 0;
  v2 = [(EDInteractionEventLogLegacyPersistentBitsProvider *)self _findExistingSaltError:&v12];
  id v3 = v12;
  uint64_t v4 = 0;
  if (v3) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v2 == 0;
  }
  if (!v5)
  {
    v6 = [v2 second];
    unsigned __int8 v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F3B558]];
    int v8 = [v7 isEqual:*MEMORY[0x1E4F3B570]];

    if (v8)
    {
      v9 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEFAULT, "Found existing old salt", v11, 2u);
      }

      uint64_t v4 = [v2 first];
    }
    else
    {
      uint64_t v4 = 0;
    }
  }

  return v4;
}

- (id)_findExistingSaltError:(id *)a3
{
  uint64_t v4 = -[EDInteractionEventLogLegacyPersistentBitsProvider _queryKeychainError:](self, "_queryKeychainError:");
  if (v4)
  {
    BOOL v5 = v4;
    v6 = [v4 sortedArrayUsingComparator:&__block_literal_global_26];

    unsigned __int8 v7 = [v6 firstObject];
    int v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F3BD38]];

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
      v14 = (void *)MEMORY[0x1E4F60DF0];
      v15 = [v6 firstObject];
      v16 = [v14 pairWithFirst:v9 second:v15];
    }
    else
    {
      v16 = 0;
      if (a3) {
        *a3 = 0;
      }
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

uint64_t __76__EDInteractionEventLogLegacyPersistentBitsProvider__findExistingSaltError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4F3B668];
  v6 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F3B668]];
  uint64_t v7 = [v4 objectForKeyedSubscript:v5];
  int v8 = (void *)v7;
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

- (id)_queryKeychainError:(id *)a3
{
  v18[6] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F3B988];
  uint64_t v5 = *MEMORY[0x1E4F3B850];
  v17[0] = *MEMORY[0x1E4F3B978];
  v17[1] = v5;
  v18[0] = v4;
  v18[1] = @"com.apple.mail.interaction-log.salt";
  uint64_t v6 = *MEMORY[0x1E4F3BC70];
  v17[2] = *MEMORY[0x1E4F3B878];
  v17[3] = v6;
  v18[2] = MEMORY[0x1E4F1CC38];
  v18[3] = MEMORY[0x1E4F1CC38];
  uint64_t v7 = *MEMORY[0x1E4F3BB80];
  v17[4] = *MEMORY[0x1E4F3BC68];
  v17[5] = v7;
  v18[4] = MEMORY[0x1E4F1CC38];
  v18[5] = &unk_1F35BAC58;
  CFDictionaryRef v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:6];
  CFTypeRef result = 0;
  OSStatus v9 = SecItemCopyMatching(v8, &result);
  int v10 = v9;
  if (v9)
  {
    if (v9 == -25300)
    {
      char v11 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1DB39C000, v11, OS_LOG_TYPE_DEFAULT, "No old salt found", v15, 2u);
      }
    }
    else
    {
      char v13 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[EDInteractionEventLogLegacyPersistentBitsProvider _queryKeychainError:](v10, v13);
      }

      if (a3)
      {
        [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v10 userInfo:0];
        char v12 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
    }
  }
  else if (result)
  {
    CFAutorelease(result);
    char v12 = (id)result;
    goto LABEL_13;
  }
  char v12 = 0;
LABEL_13:

  return v12;
}

- (void)_queryKeychainError:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1DB39C000, a2, OS_LOG_TYPE_ERROR, "Error finding existing old salt: %d", (uint8_t *)v2, 8u);
}

@end