@interface HDEncryptedArchiveSymmetricKey
+ (BOOL)supportsSecureCoding;
+ (id)fetchFromKeychainForLabel:(id)a3 error:(id *)a4;
+ (id)randomKeyWithError:(id *)a3;
- (BOOL)addToKeychainWithLabel:(id)a3 error:(id *)a4;
- (BOOL)deleteFromKeychainWithLabel:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)symmetric;
- (HDEncryptedArchiveSymmetricKey)initWithCoder:(id)a3;
- (HDEncryptedArchiveSymmetricKey)initWithData:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)keyDataForDecryptionWithError:(id *)a3;
- (id)keyDataForEncryptionWithError:(id *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDEncryptedArchiveSymmetricKey

- (HDEncryptedArchiveSymmetricKey)initWithData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDEncryptedArchiveSymmetricKey;
  v5 = [(HDEncryptedArchiveSymmetricKey *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    key = v5->_key;
    v5->_key = (NSData *)v6;
  }
  return v5;
}

+ (id)randomKeyWithError:(id *)a3
{
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:32];
  v5 = (const __SecRandom *)*MEMORY[0x1E4F3BC60];
  size_t v6 = [v4 length];
  id v7 = v4;
  uint64_t v8 = SecRandomCopyBytes(v5, v6, (void *)[v7 mutableBytes]);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 2000, @"Failed to generate random symmetric key: %d", v8);
    objc_super v9 = 0;
  }
  else
  {
    objc_super v9 = [[HDEncryptedArchiveSymmetricKey alloc] initWithData:v7];
  }

  return v9;
}

+ (id)fetchFromKeychainForLabel:(id)a3 error:(id *)a4
{
  v31[7] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  CFTypeRef result = 0;
  uint64_t v6 = *MEMORY[0x1E4F3B978];
  v30[0] = *MEMORY[0x1E4F3B788];
  v30[1] = v6;
  uint64_t v7 = *MEMORY[0x1E4F3B9A0];
  v31[0] = v5;
  v31[1] = v7;
  uint64_t v8 = *MEMORY[0x1E4F3B700];
  uint64_t v9 = *MEMORY[0x1E4F3BD08];
  v30[2] = *MEMORY[0x1E4F3B6D8];
  v30[3] = v9;
  uint64_t v10 = *MEMORY[0x1E4F3B558];
  v30[4] = *MEMORY[0x1E4F3B878];
  v30[5] = v10;
  uint64_t v11 = *MEMORY[0x1E4F3B5B8];
  v31[4] = MEMORY[0x1E4F1CC28];
  v31[5] = v11;
  v31[2] = v8;
  v31[3] = MEMORY[0x1E4F1CC38];
  v30[6] = *MEMORY[0x1E4F3BC70];
  v31[6] = MEMORY[0x1E4F1CC38];
  CFDictionaryRef v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:7];
  OSStatus v13 = SecItemCopyMatching(v12, &result);
  if (v13)
  {
    if (v13 != -25300)
    {
      v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = *MEMORY[0x1E4F28760];
      uint64_t v16 = v13;
      uint64_t v28 = *MEMORY[0x1E4F28568];
      v29 = @"Failed to retrieve symmetric key.";
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      id v18 = [v14 errorWithDomain:v15 code:v16 userInfo:v17];
      if (v18)
      {
        if (a4) {
          *a4 = v18;
        }
        else {
          _HKLogDroppedError();
        }
      }

      goto LABEL_13;
    }
    goto LABEL_9;
  }
  if (!result)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 118, @"No matching key found.");
    goto LABEL_13;
  }
  CFTypeID v19 = CFGetTypeID(result);
  if (v19 == CFDataGetTypeID())
  {
    v20 = [HDEncryptedArchiveSymmetricKey alloc];
    v21 = (void *)result;
    v22 = [(HDEncryptedArchiveSymmetricKey *)v20 initWithData:result];

    goto LABEL_14;
  }
  v23 = (void *)MEMORY[0x1E4F28C58];
  CFTypeID v24 = CFGetTypeID(result);
  v25 = (__CFString *)CFCopyTypeIDDescription(v24);
  objc_msgSend(v23, "hk_assignError:code:format:", a4, 3, @"Unexpected return type %@ during keychain fetch.", v25);

  CFRelease(result);
LABEL_13:
  v22 = 0;
LABEL_14:

  return v22;
}

- (BOOL)addToKeychainWithLabel:(id)a3 error:(id *)a4
{
  v27[8] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  key = self->_key;
  uint64_t v8 = *MEMORY[0x1E4F3B978];
  v26[0] = *MEMORY[0x1E4F3BD38];
  v26[1] = v8;
  uint64_t v9 = *MEMORY[0x1E4F3B9A0];
  v27[0] = key;
  v27[1] = v9;
  v26[2] = *MEMORY[0x1E4F3B708];
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 8 * -[NSData length](key, "length"));
  uint64_t v11 = *MEMORY[0x1E4F3B6D8];
  uint64_t v12 = *MEMORY[0x1E4F3B700];
  v27[2] = v10;
  v27[3] = v12;
  uint64_t v13 = *MEMORY[0x1E4F3B788];
  v26[3] = v11;
  v26[4] = v13;
  uint64_t v14 = *MEMORY[0x1E4F3BD08];
  v27[4] = v6;
  v27[5] = MEMORY[0x1E4F1CC38];
  uint64_t v15 = *MEMORY[0x1E4F3B878];
  v26[5] = v14;
  v26[6] = v15;
  v26[7] = *MEMORY[0x1E4F3B558];
  uint64_t v16 = *MEMORY[0x1E4F3B5B8];
  v27[6] = MEMORY[0x1E4F1CC28];
  v27[7] = v16;
  CFDictionaryRef v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:8];

  OSStatus v18 = SecItemAdd(v17, 0);
  if (v18)
  {
    CFTypeID v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28760];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    v25 = @"Failed to store public key.";
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    id v22 = [v19 errorWithDomain:v20 code:v18 userInfo:v21];
    if (v22)
    {
      if (a4) {
        *a4 = v22;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v18 == 0;
}

- (BOOL)deleteFromKeychainWithLabel:(id)a3 error:(id *)a4
{
  v22[5] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *MEMORY[0x1E4F3B978];
  v21[0] = *MEMORY[0x1E4F3B788];
  v21[1] = v6;
  uint64_t v7 = *MEMORY[0x1E4F3B9A0];
  v22[0] = v5;
  v22[1] = v7;
  uint64_t v8 = *MEMORY[0x1E4F3B878];
  v21[2] = *MEMORY[0x1E4F3BD08];
  v21[3] = v8;
  v22[2] = MEMORY[0x1E4F1CC38];
  v22[3] = MEMORY[0x1E4F1CC28];
  v21[4] = *MEMORY[0x1E4F3B558];
  v22[4] = *MEMORY[0x1E4F3B5B8];
  CFDictionaryRef v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:5];
  OSStatus v10 = SecItemDelete(v9);
  OSStatus v11 = v10;
  if (v10 != -25300 && v10)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F28760];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    uint64_t v20 = @"Failed to delete key.";
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    id v15 = [v12 errorWithDomain:v13 code:v11 userInfo:v14];
    if (v15)
    {
      if (a4) {
        *a4 = v15;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  if (v11) {
    BOOL v16 = v11 == -25300;
  }
  else {
    BOOL v16 = 1;
  }
  BOOL v17 = v16;

  return v17;
}

- (unint64_t)hash
{
  return [(NSData *)self->_key hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(NSData *)self->_key isEqualToData:v4[1]];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[HDEncryptedArchiveSymmetricKey allocWithZone:a3];
  key = self->_key;

  return [(HDEncryptedArchiveSymmetricKey *)v4 initWithData:key];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (HDEncryptedArchiveSymmetricKey)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sym_key"];

  if (v5)
  {
    self = [(HDEncryptedArchiveSymmetricKey *)self initWithData:v5];
    uint64_t v6 = self;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)symmetric
{
  return 1;
}

- (id)keyDataForEncryptionWithError:(id *)a3
{
  return self->_key;
}

- (id)keyDataForDecryptionWithError:(id *)a3
{
  return self->_key;
}

- (void).cxx_destruct
{
}

@end