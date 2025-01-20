@interface HDEncryptedArchiveKeyPair
+ (id)fetchFromKeychainForLabel:(id)a3 includePrivate:(BOOL)a4 error:(id *)a5;
+ (id)randomKeyPairWithError:(id *)a3;
- (BOOL)_deleteFromKeychainWithLabel:(id)a3 public:(BOOL)a4 error:(id *)a5;
- (BOOL)addToKeychainWithLabel:(id)a3 error:(id *)a4;
- (BOOL)deleteFromKeychainWithLabel:(id)a3 error:(id *)a4;
- (BOOL)symmetric;
- (HDEncryptedArchiveKeyPair)initWithPublicSecKey:(__SecKey *)a3;
- (HDEncryptedArchiveKeyPair)initWithSecKey:(__SecKey *)a3;
- (id)keyDataForDecryptionWithError:(id *)a3;
- (id)keyDataForEncryptionWithError:(id *)a3;
- (void)dealloc;
@end

@implementation HDEncryptedArchiveKeyPair

- (HDEncryptedArchiveKeyPair)initWithSecKey:(__SecKey *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HDEncryptedArchiveKeyPair;
  v4 = [(HDEncryptedArchiveKeyPair *)&v6 init];
  if (v4)
  {
    CFRetain(a3);
    v4->_fullKey = a3;
    v4->_publicKey = SecKeyCopyPublicKey(a3);
  }
  return v4;
}

- (HDEncryptedArchiveKeyPair)initWithPublicSecKey:(__SecKey *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HDEncryptedArchiveKeyPair;
  v4 = [(HDEncryptedArchiveKeyPair *)&v6 init];
  if (v4)
  {
    CFRetain(a3);
    v4->_publicKey = a3;
  }
  return v4;
}

- (void)dealloc
{
  fullKey = self->_fullKey;
  if (fullKey)
  {
    CFRelease(fullKey);
    self->_fullKey = 0;
  }
  CFRelease(self->_publicKey);
  self->_publicKey = 0;
  v4.receiver = self;
  v4.super_class = (Class)HDEncryptedArchiveKeyPair;
  [(HDEncryptedArchiveKeyPair *)&v4 dealloc];
}

+ (id)randomKeyPairWithError:(id *)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F3B740];
  uint64_t v5 = *MEMORY[0x1E4F3B708];
  v13[0] = *MEMORY[0x1E4F3B718];
  v13[1] = v5;
  v14[0] = v4;
  v14[1] = &unk_1F17EED90;
  CFDictionaryRef v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  CFErrorRef v12 = 0;
  SecKeyRef v7 = SecKeyCreateRandomKey(v6, &v12);
  if (v7)
  {
    SecKeyRef v8 = v7;
    v9 = [[HDEncryptedArchiveKeyPair alloc] initWithSecKey:v7];
    CFRelease(v8);
  }
  else
  {
    v10 = v12;
    if (v10)
    {
      if (a3) {
        *a3 = v10;
      }
      else {
        _HKLogDroppedError();
      }
    }

    v9 = 0;
  }

  return v9;
}

+ (id)fetchFromKeychainForLabel:(id)a3 includePrivate:(BOOL)a4 error:(id *)a5
{
  v34[6] = *MEMORY[0x1E4F143B8];
  SecKeyRef v7 = "private";
  if (a4)
  {
    SecKeyRef v8 = (uint64_t *)MEMORY[0x1E4F3B5B8];
  }
  else
  {
    SecKeyRef v7 = "public";
    SecKeyRef v8 = (uint64_t *)MEMORY[0x1E4F3B578];
  }
  v9 = [NSString stringWithFormat:@"%@-%s", a3, v7];
  CFTypeRef result = 0;
  uint64_t v10 = *MEMORY[0x1E4F3B978];
  v33[0] = *MEMORY[0x1E4F3B788];
  v33[1] = v10;
  uint64_t v11 = *MEMORY[0x1E4F3B9A0];
  v34[0] = v9;
  v34[1] = v11;
  uint64_t v12 = *MEMORY[0x1E4F3B878];
  v33[2] = *MEMORY[0x1E4F3BD08];
  v33[3] = v12;
  v34[2] = MEMORY[0x1E4F1CC38];
  v34[3] = MEMORY[0x1E4F1CC28];
  uint64_t v13 = *v8;
  uint64_t v14 = *MEMORY[0x1E4F3BC80];
  v33[4] = *MEMORY[0x1E4F3B558];
  v33[5] = v14;
  v34[4] = v13;
  v34[5] = MEMORY[0x1E4F1CC38];
  CFDictionaryRef v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:6];
  OSStatus v16 = SecItemCopyMatching(v15, &result);
  if (v16)
  {
    if (v16 == -25300)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 118, @"No matching key found.");
    }
    else
    {
      v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v21 = *MEMORY[0x1E4F28760];
      uint64_t v22 = v16;
      uint64_t v31 = *MEMORY[0x1E4F28568];
      v32 = @"Failed to retrieve key.";
      v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      id v24 = [v20 errorWithDomain:v21 code:v22 userInfo:v23];
      if (v24)
      {
        if (a5) {
          *a5 = v24;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
  }
  else
  {
    CFTypeID v17 = CFGetTypeID(result);
    if (v17 == SecKeyGetTypeID())
    {
      v18 = [HDEncryptedArchiveKeyPair alloc];
      if (a4) {
        uint64_t v19 = [(HDEncryptedArchiveKeyPair *)v18 initWithSecKey:result];
      }
      else {
        uint64_t v19 = [(HDEncryptedArchiveKeyPair *)v18 initWithPublicSecKey:result];
      }
      v28 = (void *)v19;
      goto LABEL_19;
    }
    v25 = (void *)MEMORY[0x1E4F28C58];
    CFTypeID v26 = CFGetTypeID(result);
    v27 = (__CFString *)CFCopyTypeIDDescription(v26);
    objc_msgSend(v25, "hk_assignError:code:format:", a5, 3, @"Unexpected return type %@ during keychain fetch.", v27);

    CFRelease(result);
  }
  v28 = 0;
LABEL_19:

  return v28;
}

- (BOOL)addToKeychainWithLabel:(id)a3 error:(id *)a4
{
  v49[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  CFDictionaryRef v6 = (void *)MEMORY[0x1E4F3B788];
  SecKeyRef v7 = (uint64_t *)MEMORY[0x1E4F3BD08];
  uint64_t v8 = MEMORY[0x1E4F1CC38];
  v9 = (uint64_t *)MEMORY[0x1E4F3B878];
  uint64_t v10 = MEMORY[0x1E4F1CC28];
  uint64_t v11 = (void *)MEMORY[0x1E4F3B558];
  uint64_t v12 = (const void **)MEMORY[0x1E4F3BD48];
  if (self->_fullKey)
  {
    v48[0] = *MEMORY[0x1E4F3B788];
    id v40 = v5;
    id v39 = v5;
    uint64_t v13 = (uint64_t *)MEMORY[0x1E4F3BD08];
    uint64_t v14 = [NSString stringWithFormat:@"%@-%s", v39, "private"];
    uint64_t v15 = *v13;
    v49[0] = v14;
    v49[1] = v8;
    uint64_t v16 = *v9;
    v48[1] = v15;
    v48[2] = v16;
    v48[3] = *v11;
    uint64_t v17 = *MEMORY[0x1E4F3B5B8];
    v49[2] = v10;
    v49[3] = v17;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:4];
    uint64_t v18 = v10;
    CFDictionaryRef v19 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v19);
    CFDictionarySetValue(MutableCopy, *v12, self->_fullKey);
    OSStatus v21 = SecItemAdd(MutableCopy, 0);
    CFRelease(MutableCopy);
    if (v21)
    {
      uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = *MEMORY[0x1E4F28760];
      uint64_t v46 = *MEMORY[0x1E4F28568];
      v47 = @"Failed to store private key.";
      id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
      id v25 = [v22 errorWithDomain:v23 code:v21 userInfo:v24];
      if (!v25)
      {
        id v5 = v40;
        goto LABEL_14;
      }
      id v5 = v40;
      CFTypeID v26 = a4;
      if (a4) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }

    uint64_t v10 = v18;
    id v5 = v40;
    v9 = (uint64_t *)MEMORY[0x1E4F3B878];
    SecKeyRef v7 = (uint64_t *)MEMORY[0x1E4F3BD08];
    CFDictionaryRef v6 = (void *)MEMORY[0x1E4F3B788];
  }
  if (self->_publicKey)
  {
    v44[0] = *v6;
    v27 = v7;
    v28 = [NSString stringWithFormat:@"%@-%s", v5, "public"];
    uint64_t v29 = *v27;
    v45[0] = v28;
    v45[1] = v8;
    uint64_t v30 = *v9;
    v44[1] = v29;
    v44[2] = v30;
    v44[3] = *v11;
    uint64_t v31 = *MEMORY[0x1E4F3B578];
    v45[2] = v10;
    v45[3] = v31;
    CFDictionaryRef v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:4];

    v32 = CFDictionaryCreateMutableCopy(0, 0, v19);
    CFDictionarySetValue(v32, *v12, self->_publicKey);
    OSStatus v33 = SecItemAdd(v32, 0);
    CFRelease(v32);
    if (!v33)
    {
      BOOL v37 = 1;
      goto LABEL_15;
    }
    v34 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v35 = *MEMORY[0x1E4F28760];
    uint64_t v36 = v33;
    uint64_t v42 = *MEMORY[0x1E4F28568];
    v43 = @"Failed to store public key.";
    id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    id v25 = [v34 errorWithDomain:v35 code:v36 userInfo:v24];
    if (!v25)
    {
LABEL_14:

      BOOL v37 = 0;
LABEL_15:

      goto LABEL_16;
    }
    CFTypeID v26 = a4;
    if (a4)
    {
LABEL_5:
      id v25 = v25;
      *CFTypeID v26 = v25;
      goto LABEL_14;
    }
LABEL_11:
    _HKLogDroppedError();
    goto LABEL_14;
  }
  BOOL v37 = 1;
LABEL_16:

  return v37;
}

- (BOOL)_deleteFromKeychainWithLabel:(id)a3 public:(BOOL)a4 error:(id *)a5
{
  v27[6] = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v6 = "public";
  if (a4)
  {
    SecKeyRef v7 = (uint64_t *)MEMORY[0x1E4F3B578];
  }
  else
  {
    CFDictionaryRef v6 = "private";
    SecKeyRef v7 = (uint64_t *)MEMORY[0x1E4F3B5B8];
  }
  uint64_t v8 = [NSString stringWithFormat:@"%@-%s", a3, v6];
  uint64_t v9 = *MEMORY[0x1E4F3B978];
  v26[0] = *MEMORY[0x1E4F3B788];
  v26[1] = v9;
  uint64_t v10 = *MEMORY[0x1E4F3B9A0];
  v27[0] = v8;
  v27[1] = v10;
  uint64_t v11 = *MEMORY[0x1E4F3B878];
  v26[2] = *MEMORY[0x1E4F3BD08];
  v26[3] = v11;
  v27[2] = MEMORY[0x1E4F1CC38];
  v27[3] = MEMORY[0x1E4F1CC28];
  uint64_t v12 = *v7;
  uint64_t v13 = *MEMORY[0x1E4F3BC80];
  v26[4] = *MEMORY[0x1E4F3B558];
  v26[5] = v13;
  v27[4] = v12;
  v27[5] = MEMORY[0x1E4F1CC38];
  CFDictionaryRef v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:6];
  OSStatus v15 = SecItemDelete(v14);
  OSStatus v16 = v15;
  if (v15 != -25300 && v15)
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F28760];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    id v25 = @"Failed to delete key.";
    CFDictionaryRef v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    id v20 = [v17 errorWithDomain:v18 code:v16 userInfo:v19];
    if (v20)
    {
      if (a5) {
        *a5 = v20;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  if (v16) {
    BOOL v21 = v16 == -25300;
  }
  else {
    BOOL v21 = 1;
  }
  BOOL v22 = v21;

  return v22;
}

- (BOOL)deleteFromKeychainWithLabel:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = 0;
  if ([(HDEncryptedArchiveKeyPair *)self _deleteFromKeychainWithLabel:v6 public:0 error:a4])
  {
    BOOL v7 = [(HDEncryptedArchiveKeyPair *)self _deleteFromKeychainWithLabel:v6 public:1 error:a4];
  }

  return v7;
}

- (BOOL)symmetric
{
  return 0;
}

- (id)keyDataForEncryptionWithError:(id *)a3
{
  CFErrorRef error = 0;
  CFDataRef v4 = SecKeyCopyExternalRepresentation(self->_publicKey, &error);
  CFDataRef v5 = v4;
  if (v4)
  {
    CFDataRef v6 = v4;
  }
  else
  {
    BOOL v7 = error;
    if (v7)
    {
      if (a3) {
        *a3 = v7;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }

  return v5;
}

- (id)keyDataForDecryptionWithError:(id *)a3
{
  fullKey = self->_fullKey;
  if (fullKey)
  {
    CFErrorRef error = 0;
    CFDataRef v5 = SecKeyCopyExternalRepresentation(fullKey, &error);
    CFDataRef v6 = v5;
    if (v5)
    {
      CFDataRef v7 = v5;
    }
    else
    {
      uint64_t v8 = error;
      if (v8)
      {
        if (a3) {
          *a3 = v8;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 924, @"Private key not available; did you only fetch the public key?");
    CFDataRef v6 = 0;
  }

  return v6;
}

@end