@interface SGPersistentSaltProvider
+ (id)hexStringForData:(id)a3;
+ (id)saltProviderFromKeyChainWithServiceIdentifier:(id)a3 accessGroup:(id)a4;
+ (id)saltProviderWithString:(id)a3 serviceIdentifier:(id)a4 accessGroup:(id)a5;
- (SGPersistentSaltProvider)initWithServiceIdentifier:(id)a3 accessGroup:(id)a4;
- (id)_createSalt;
- (id)_findExistingSaltError:(id *)a3;
- (id)_findOrCreateSalt;
- (id)_queryKeychainError:(id *)a3;
- (id)salt;
- (void)_deleteSalt;
@end

@implementation SGPersistentSaltProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessGroup, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

- (void)_deleteSalt
{
  v15[4] = *MEMORY[0x1E4F143B8];
  v3 = sgLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v13[0]) = 0;
    _os_log_impl(&dword_1A4D8C000, v3, OS_LOG_TYPE_INFO, "Will delete salt", (uint8_t *)v13, 2u);
  }

  uint64_t v4 = *MEMORY[0x1E4F3B988];
  uint64_t v5 = *MEMORY[0x1E4F3B550];
  v14[0] = *MEMORY[0x1E4F3B978];
  v14[1] = v5;
  serviceIdentifier = self->_serviceIdentifier;
  accessGroup = self->_accessGroup;
  v15[0] = v4;
  v15[1] = accessGroup;
  uint64_t v8 = *MEMORY[0x1E4F3B878];
  v14[2] = *MEMORY[0x1E4F3B850];
  v14[3] = v8;
  v15[2] = serviceIdentifier;
  v15[3] = MEMORY[0x1E4F1CC38];
  CFDictionaryRef v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  OSStatus v10 = SecItemDelete(v9);
  if (v10)
  {
    OSStatus v11 = v10;
    v12 = sgLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13[0] = 67109120;
      v13[1] = v11;
      _os_log_error_impl(&dword_1A4D8C000, v12, OS_LOG_TYPE_ERROR, "Error deleting salt: %d", (uint8_t *)v13, 8u);
    }
  }
}

- (id)_createSalt
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = sgLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4D8C000, v3, OS_LOG_TYPE_INFO, "Will create new salt", buf, 2u);
  }

  *(_OWORD *)buf = 0u;
  long long v25 = 0u;
  arc4random_buf(buf, 0x20uLL);
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:buf length:32];
  uint64_t v5 = +[SGPersistentSaltProvider hexStringForData:v4];
  v6 = [v5 dataUsingEncoding:4];

  uint64_t v7 = *MEMORY[0x1E4F3B978];
  v22[0] = *MEMORY[0x1E4F3BD38];
  v22[1] = v7;
  uint64_t v8 = *MEMORY[0x1E4F3B988];
  v23[0] = v6;
  v23[1] = v8;
  uint64_t v9 = *MEMORY[0x1E4F3B850];
  v22[2] = *MEMORY[0x1E4F3B550];
  v22[3] = v9;
  serviceIdentifier = self->_serviceIdentifier;
  v23[2] = self->_accessGroup;
  v23[3] = serviceIdentifier;
  v22[4] = *MEMORY[0x1E4F3B698];
  OSStatus v11 = [NSNumber numberWithInt:os_variant_has_internal_diagnostics() ^ 1];
  uint64_t v12 = *MEMORY[0x1E4F3B558];
  uint64_t v13 = *MEMORY[0x1E4F3B570];
  v23[4] = v11;
  v23[5] = v13;
  uint64_t v14 = *MEMORY[0x1E4F3B878];
  v22[5] = v12;
  v22[6] = v14;
  v23[6] = MEMORY[0x1E4F1CC38];
  CFDictionaryRef v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:7];

  OSStatus v16 = SecItemAdd(v15, 0);
  if (v16)
  {
    OSStatus v17 = v16;
    v18 = sgLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v21[0] = 67109120;
      v21[1] = v17;
      _os_log_error_impl(&dword_1A4D8C000, v18, OS_LOG_TYPE_ERROR, "Error creating new salt: %d", (uint8_t *)v21, 8u);
    }

    id v19 = 0;
  }
  else
  {
    id v19 = v4;
  }

  return v19;
}

- (id)_findExistingSaltError:(id *)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = -[SGPersistentSaltProvider _queryKeychainError:](self, "_queryKeychainError:");
  if (v4)
  {
    uint64_t v5 = v4;
    v6 = [v4 sortedArrayUsingComparator:&__block_literal_global_5896];

    uint64_t v7 = [v6 firstObject];
    uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F3BD38]];

    uint64_t v9 = objc_opt_new();
    if (v8)
    {
      if ([v8 length])
      {
        unint64_t v10 = 0;
        do
        {
          __int16 v18 = 0;
          objc_msgSend(v8, "getBytes:range:", &v18, v10, 2);
          if ((v18 & 0x10) != 0) {
            char v11 = 0;
          }
          else {
            char v11 = 9;
          }
          char v12 = v11 + v18;
          if ((v18 & 0x1000) != 0) {
            char v13 = -16;
          }
          else {
            char v13 = 9;
          }
          char v17 = v13 + (HIBYTE(v18) & 0x1F) + 16 * v12;
          [v9 appendBytes:&v17 length:1];
          v10 += 2;
        }
        while (v10 < [v8 length]);
      }
      v19[0] = v9;
      uint64_t v14 = [v6 firstObject];
      v19[1] = v14;
      CFDictionaryRef v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    }
    else
    {
      CFDictionaryRef v15 = 0;
      if (a3) {
        *a3 = 0;
      }
    }
  }
  else
  {
    CFDictionaryRef v15 = 0;
  }

  return v15;
}

uint64_t __51__SGPersistentSaltProvider__findExistingSaltError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *MEMORY[0x1E4F3B668];
  id v5 = a3;
  v6 = [a2 objectForKeyedSubscript:v4];
  uint64_t v7 = [v5 objectForKeyedSubscript:v4];

  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (v6) {
      uint64_t v9 = -1;
    }
    else {
      uint64_t v9 = 1;
    }
  }
  else
  {
    uint64_t v9 = [v6 compare:v7];
  }

  return v9;
}

- (id)_queryKeychainError:(id *)a3
{
  v20[6] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F3B988];
  uint64_t v5 = *MEMORY[0x1E4F3B850];
  v19[0] = *MEMORY[0x1E4F3B978];
  v19[1] = v5;
  serviceIdentifier = self->_serviceIdentifier;
  v20[0] = v4;
  v20[1] = serviceIdentifier;
  uint64_t v7 = *MEMORY[0x1E4F3BC70];
  v19[2] = *MEMORY[0x1E4F3B878];
  void v19[3] = v7;
  v20[2] = MEMORY[0x1E4F1CC38];
  v20[3] = MEMORY[0x1E4F1CC38];
  uint64_t v8 = *MEMORY[0x1E4F3BB80];
  v19[4] = *MEMORY[0x1E4F3BC68];
  v19[5] = v8;
  v20[4] = MEMORY[0x1E4F1CC38];
  v20[5] = &unk_1EF92F6B8;
  CFDictionaryRef v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:6];
  CFTypeRef result = 0;
  OSStatus v10 = SecItemCopyMatching(v9, &result);
  if (v10)
  {
    OSStatus v11 = v10;
    if (v10 == -25300)
    {
      char v12 = sgLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4D8C000, v12, OS_LOG_TYPE_INFO, "No salt found", buf, 2u);
      }
    }
    else
    {
      uint64_t v14 = sgLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        OSStatus v18 = v11;
        _os_log_error_impl(&dword_1A4D8C000, v14, OS_LOG_TYPE_ERROR, "Error finding existing salt: %d", buf, 8u);
      }

      if (a3)
      {
        [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v11 userInfo:0];
        char v13 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
    }
  }
  else if (result)
  {
    CFAutorelease(result);
    char v13 = (id)result;
    goto LABEL_13;
  }
  char v13 = 0;
LABEL_13:

  return v13;
}

- (id)_findOrCreateSalt
{
  id v15 = 0;
  v3 = [(SGPersistentSaltProvider *)self _findExistingSaltError:&v15];
  id v4 = v15;
  if (!v3)
  {
LABEL_9:
    uint64_t v10 = [(SGPersistentSaltProvider *)self _createSalt];
    goto LABEL_10;
  }
  uint64_t v5 = [v3 objectAtIndexedSubscript:1];
  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F3B558]];
  int v7 = [v6 isEqual:*MEMORY[0x1E4F3B570]];

  uint64_t v8 = sgLogHandle();
  CFDictionaryRef v9 = v8;
  if (!v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)char v13 = 0;
      _os_log_error_impl(&dword_1A4D8C000, v9, OS_LOG_TYPE_ERROR, "Existing salt has wrong access class. Re-creating salt", v13, 2u);
    }

    [(SGPersistentSaltProvider *)self _deleteSalt];
    goto LABEL_9;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4D8C000, v9, OS_LOG_TYPE_INFO, "Found existing salt", buf, 2u);
  }

  uint64_t v10 = [v3 objectAtIndexedSubscript:0];
LABEL_10:
  OSStatus v11 = (void *)v10;

  return v11;
}

- (id)salt
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  char v12 = __Block_byref_object_copy__5909;
  char v13 = __Block_byref_object_dispose__5910;
  id v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __32__SGPersistentSaltProvider_salt__block_invoke;
  v8[3] = &unk_1E5B8FE88;
  v8[4] = self;
  v8[5] = &v9;
  [(_PASLock *)lock runWithLockAcquired:v8];
  v3 = (void *)v10[5];
  if (!v3)
  {
    id v4 = sgLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)int v7 = 0;
      _os_log_fault_impl(&dword_1A4D8C000, v4, OS_LOG_TYPE_FAULT, "Could not generate salt.", v7, 2u);
    }

    if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
      abort();
    }
    v3 = (void *)v10[5];
  }
  id v5 = v3;
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __32__SGPersistentSaltProvider_salt__block_invoke(uint64_t a1, void *a2)
{
  v6 = a2;
  v3 = (void *)v6[1];
  if (!v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) _findOrCreateSalt];
    id v5 = (void *)v6[1];
    v6[1] = v4;

    v3 = (void *)v6[1];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3);
}

- (SGPersistentSaltProvider)initWithServiceIdentifier:(id)a3 accessGroup:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SGPersistentSaltProvider;
  uint64_t v9 = [(SGPersistentSaltProvider *)&v16 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serviceIdentifier, a3);
    objc_storeStrong((id *)&v10->_accessGroup, a4);
    id v11 = objc_alloc(MEMORY[0x1E4F93B70]);
    char v12 = objc_opt_new();
    uint64_t v13 = [v11 initWithGuardedData:v12];
    lock = v10->_lock;
    v10->_lock = (_PASLock *)v13;
  }
  return v10;
}

+ (id)hexStringForData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 length];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:2 * v4];
  id v6 = v3;
  uint64_t v7 = [v6 bytes];
  if (v4)
  {
    id v8 = (unsigned __int8 *)v7;
    do
    {
      unsigned int v9 = *v8++;
      objc_msgSend(v5, "appendFormat:", @"%02X", v9);
      --v4;
    }
    while (v4);
  }

  return v5;
}

+ (id)saltProviderFromKeyChainWithServiceIdentifier:(id)a3 accessGroup:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithServiceIdentifier:v7 accessGroup:v6];

  return v8;
}

+ (id)saltProviderWithString:(id)a3 serviceIdentifier:(id)a4 accessGroup:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = (void *)[objc_alloc((Class)a1) initWithServiceIdentifier:v10 accessGroup:v9];

  char v12 = (void *)v11[1];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __81__SGPersistentSaltProvider_saltProviderWithString_serviceIdentifier_accessGroup___block_invoke;
  v15[3] = &unk_1E5B8FE60;
  id v16 = v8;
  id v13 = v8;
  [v12 runWithLockAcquired:v15];

  return v11;
}

void __81__SGPersistentSaltProvider_saltProviderWithString_serviceIdentifier_accessGroup___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 dataUsingEncoding:4];
  id v5 = (id)v3[1];
  v3[1] = v4;
}

@end