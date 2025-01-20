@interface HDLegacyClinicalCredentialManager
- (BOOL)_assignCredentialManagerError:(uint64_t)a3 code:(void *)a4 description:;
- (BOOL)deleteCredentialKeyFromKeychainWithError:(id *)a3;
- (BOOL)unitTesting_storeCredentialKeyInKeychain:(id)a3 error:(id *)a4;
- (HDLegacyClinicalCredentialManager)init;
- (NSData)cachedCredentialKey;
- (id)_credentialKeyBaseAttributes;
- (id)_tokenDataFromToken:(id)a3 error:(id *)a4;
- (id)unitTesting_retrieveCredentialKeyFromKeychainWithError:(id *)a3;
- (void)_assignCredentialManagerError:(uint64_t)a3 code:(void *)a4 format:(uint64_t)a5;
- (void)setCachedCredentialKey:(id)a3;
@end

@implementation HDLegacyClinicalCredentialManager

- (HDLegacyClinicalCredentialManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)HDLegacyClinicalCredentialManager;
  v2 = [(HDLegacyClinicalCredentialManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = HKCreateSerialDispatchQueue();
    credentialKeyQueue = v2->_credentialKeyQueue;
    v2->_credentialKeyQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (BOOL)_assignCredentialManagerError:(uint64_t)a3 code:(void *)a4 description:
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v8 = v7;
  if (a1)
  {
    if (v7)
    {
      uint64_t v12 = *MEMORY[0x1E4F28568];
      v13[0] = v7;
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    }
    else
    {
      v9 = 0;
    }
    id v10 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.healthd.healthrecords.HDClinicalCredentialManager" code:a3 userInfo:v9];
    if (v10)
    {
      if (a2) {
        *a2 = v10;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return a1 != 0;
}

- (id)_tokenDataFromToken:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = v6;
  if (!self) {
    goto LABEL_6;
  }
  id v8 = v6;
  v9 = (void *)MEMORY[0x1E4F28B88];
  id v10 = v8;
  uint64_t v11 = [v9 characterSetWithCharactersInString:&stru_1F1754960];
  uint64_t v12 = [v10 stringByTrimmingCharactersInSet:v11];

  LOBYTE(v11) = [v12 isEqualToString:v10];
  if ((v11 & 1) == 0)
  {
    -[HDLegacyClinicalCredentialManager _assignCredentialManagerError:code:description:]((uint64_t)self, a4, 106, @"Token contains invalid padding.");

LABEL_6:
    v13 = 0;
    goto LABEL_7;
  }

  v13 = [v10 dataUsingEncoding:4];
  if (!v13) {
    -[HDLegacyClinicalCredentialManager _assignCredentialManagerError:code:description:]((uint64_t)self, a4, 103, @"Failed to encode token.");
  }
LABEL_7:

  return v13;
}

- (void)_assignCredentialManagerError:(uint64_t)a3 code:(void *)a4 format:(uint64_t)a5
{
  if (a1)
  {
    uint64_t v11 = (objc_class *)NSString;
    id v12 = a4;
    v13 = (void *)[[v11 alloc] initWithFormat:v12 arguments:&a9];

    -[HDLegacyClinicalCredentialManager _assignCredentialManagerError:code:description:](a1, a2, 1, v13);
  }
}

- (id)_credentialKeyBaseAttributes
{
  v8[3] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v1 = *MEMORY[0x1E4F3B9A0];
    uint64_t v2 = *MEMORY[0x1E4F3B558];
    v7[0] = *MEMORY[0x1E4F3B978];
    v7[1] = v2;
    uint64_t v3 = *MEMORY[0x1E4F3B5B0];
    v8[0] = v1;
    v8[1] = v3;
    v7[2] = *MEMORY[0x1E4F3B5E0];
    v4 = [@"com.apple.healthd.healthrecords.credential-key" dataUsingEncoding:4];
    v8[2] = v4;
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)unitTesting_retrieveCredentialKeyFromKeychainWithError:(id *)a3
{
  result[1] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  if (self)
  {
    v5 = -[HDLegacyClinicalCredentialManager _credentialKeyBaseAttributes]((uint64_t)self);
    id v6 = (void *)[v5 mutableCopy];

    uint64_t v20 = *MEMORY[0x1E4F3BC70];
    result[0] = *(CFTypeRef *)MEMORY[0x1E4F1CFD0];
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:result forKeys:&v20 count:1];
    [v6 addEntriesFromDictionary:v7];

    result[0] = 0;
    uint64_t v8 = SecItemCopyMatching((CFDictionaryRef)v6, result);
    switch(v8)
    {
      case 0xFFFF9D24:
        v15 = @"Credential key not accessible.";
        v16 = self;
        v17 = a3;
        uint64_t v18 = 102;
        break;
      case 0xFFFF9D2C:
        v15 = @"Credential key not found.";
        v16 = self;
        v17 = a3;
        uint64_t v18 = 100;
        break;
      case 0:
        v14 = (void *)result[0];
LABEL_11:

        goto LABEL_12;
      default:
        [(HDLegacyClinicalCredentialManager *)(uint64_t)self _assignCredentialManagerError:v9, @"Failed to fetch credential key. OSStatus: %d", v10, v11, v12, v13, v8 code format];
LABEL_10:
        v14 = 0;
        goto LABEL_11;
    }
    -[HDLegacyClinicalCredentialManager _assignCredentialManagerError:code:description:]((uint64_t)v16, v17, v18, v15);
    goto LABEL_10;
  }
  v14 = 0;
LABEL_12:

  return v14;
}

- (BOOL)unitTesting_storeCredentialKeyInKeychain:(id)a3 error:(id *)a4
{
  v34[13] = *MEMORY[0x1E4F143B8];
  if (!self) {
    return 0;
  }
  id v6 = a3;
  id v7 = -[HDLegacyClinicalCredentialManager _credentialKeyBaseAttributes]((uint64_t)self);
  uint64_t v8 = (void *)[v7 mutableCopy];

  uint64_t v9 = *MEMORY[0x1E4F3B6D8];
  v34[0] = *MEMORY[0x1E4F3B700];
  uint64_t v10 = *MEMORY[0x1E4F3B708];
  v33[0] = v9;
  v33[1] = v10;
  uint64_t v11 = [NSNumber numberWithInteger:256];
  v34[1] = v11;
  v33[2] = *MEMORY[0x1E4F3B680];
  uint64_t v12 = [NSNumber numberWithInteger:256];
  uint64_t v13 = *MEMORY[0x1E4F3B628];
  uint64_t v14 = *MEMORY[0x1E4F1CFD0];
  v34[2] = v12;
  v34[3] = v14;
  uint64_t v15 = *MEMORY[0x1E4F3B618];
  v33[3] = v13;
  v33[4] = v15;
  uint64_t v16 = *MEMORY[0x1E4F3B620];
  uint64_t v17 = *MEMORY[0x1E4F1CFC8];
  v34[4] = v14;
  v34[5] = v17;
  uint64_t v18 = *MEMORY[0x1E4F3B630];
  v33[5] = v16;
  v33[6] = v18;
  uint64_t v19 = *MEMORY[0x1E4F3B640];
  v34[6] = v17;
  v34[7] = v17;
  uint64_t v20 = *MEMORY[0x1E4F3B648];
  v33[7] = v19;
  v33[8] = v20;
  uint64_t v21 = *MEMORY[0x1E4F3B6B0];
  v33[9] = *MEMORY[0x1E4F3B638];
  v33[10] = v21;
  v34[8] = v17;
  v34[9] = v17;
  uint64_t v22 = *MEMORY[0x1E4F3B878];
  v34[10] = v14;
  v34[11] = v17;
  uint64_t v23 = *MEMORY[0x1E4F3BD38];
  v33[11] = v22;
  v33[12] = v23;
  v34[12] = v6;
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:13];

  [v8 addEntriesFromDictionary:v24];
  uint64_t v25 = SecItemAdd((CFDictionaryRef)v8, 0);
  if (v25)
  {
    if (v25 == -25299) {
      -[HDLegacyClinicalCredentialManager _assignCredentialManagerError:code:description:]((uint64_t)self, a4, 101, @"Credential key exists in Keychain.");
    }
    else {
      [(HDLegacyClinicalCredentialManager *)(uint64_t)self _assignCredentialManagerError:v26, @"Failed to add credential key. OSStatus: %d", v27, v28, v29, v30, v25 code format];
    }
    BOOL v31 = 0;
  }
  else
  {
    BOOL v31 = 1;
  }

  return v31;
}

- (BOOL)deleteCredentialKeyFromKeychainWithError:(id *)a3
{
  -[HDLegacyClinicalCredentialManager _credentialKeyBaseAttributes]((uint64_t)self);
  CFDictionaryRef v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = SecItemDelete(v5);
  BOOL v12 = 1;
  if (v6 && v6 != -25300)
  {
    if (v6 == -25308) {
      -[HDLegacyClinicalCredentialManager _assignCredentialManagerError:code:description:]((uint64_t)self, a3, 102, @"Credential key not accessible.");
    }
    else {
      [(HDLegacyClinicalCredentialManager *)(uint64_t)self _assignCredentialManagerError:v7, @"Failed to delete credential key. OSStatus: %d", v8, v9, v10, v11, v6 code format];
    }
    BOOL v12 = 0;
  }

  return v12;
}

- (NSData)cachedCredentialKey
{
  uint64_t v2 = self;
  if (self) {
    self = (HDLegacyClinicalCredentialManager *)self->_credentialKeyQueue;
  }
  dispatch_assert_queue_not_V2(&self->super);
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__154;
  uint64_t v11 = __Block_byref_object_dispose__154;
  id v12 = 0;
  if (v2) {
    credentialKeyQueue = v2->_credentialKeyQueue;
  }
  else {
    credentialKeyQueue = 0;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__HDLegacyClinicalCredentialManager_cachedCredentialKey__block_invoke;
  v6[3] = &unk_1E62F3230;
  v6[4] = v2;
  v6[5] = &v7;
  dispatch_sync(credentialKeyQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSData *)v4;
}

void __56__HDLegacyClinicalCredentialManager_cachedCredentialKey__block_invoke(uint64_t a1)
{
}

- (void)setCachedCredentialKey:(id)a3
{
  id v4 = a3;
  if (self) {
    credentialKeyQueue = self->_credentialKeyQueue;
  }
  else {
    credentialKeyQueue = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__HDLegacyClinicalCredentialManager_setCachedCredentialKey___block_invoke;
  void v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(credentialKeyQueue, v7);
}

void __60__HDLegacyClinicalCredentialManager_setCachedCredentialKey___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialKeyQueue, 0);

  objc_storeStrong((id *)&self->_cachedCredentialKey, 0);
}

@end