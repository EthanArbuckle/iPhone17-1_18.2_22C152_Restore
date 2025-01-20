@interface NSData(Encryption)
- (id)AESGCM256DecryptedDataWithSymmetricKey:()Encryption;
- (id)AESGCM256EncryptedDataWithSymmetricKey:()Encryption;
- (id)_randomDataGeneratorWithNumberOfBytes:()Encryption;
@end

@implementation NSData(Encryption)

- (id)AESGCM256EncryptedDataWithSymmetricKey:()Encryption
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFF990];
  uint64_t v6 = IV_LENGTH;
  uint64_t v7 = [a1 length];
  v8 = [v5 dataWithLength:v7 + v6 + TAG_LENGTH];
  v9 = [a1 _randomDataGeneratorWithNumberOfBytes:IV_LENGTH];
  if (v9)
  {
    id v32 = v4;
    id v10 = v4;
    [v10 bytes];
    [v10 length];
    id v11 = v9;
    [v11 bytes];
    [v11 length];
    id v12 = a1;
    [v12 bytes];
    uint64_t v13 = [v12 length];
    v31 = v8;
    id v14 = v8;
    uint64_t v15 = [v14 mutableBytes];
    uint64_t v16 = v15 + IV_LENGTH;
    id v17 = v14;
    uint64_t v18 = [v17 mutableBytes];
    uint64_t v19 = IV_LENGTH;
    uint64_t v29 = v18 + v19 + [v12 length];
    uint64_t v30 = TAG_LENGTH;
    int v20 = CCCryptorGCMOneshotEncrypt();
    if (v20)
    {
      int v21 = v20;
      v22 = _CDPLogSystem();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[NSData(Encryption) AESGCM256EncryptedDataWithSymmetricKey:](v21, v22);
      }

      v23 = 0;
    }
    else
    {
      id v25 = v17;
      v26 = objc_msgSend(v25, "mutableBytes", v13, v16, v29, v30);
      v27 = (const void *)[v11 bytes];
      memcpy(v26, v27, IV_LENGTH);
      v23 = (void *)[v25 copy];
    }
    v8 = v31;
    id v4 = v32;
  }
  else
  {
    v24 = _CDPLogSystem();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[NSData(Encryption) AESGCM256EncryptedDataWithSymmetricKey:](v24);
    }

    v23 = 0;
  }

  return v23;
}

- (id)AESGCM256DecryptedDataWithSymmetricKey:()Encryption
{
  id v4 = (void *)MEMORY[0x263EFF990];
  id v5 = a3;
  uint64_t v6 = [a1 length];
  uint64_t v7 = [v4 dataWithLength:v6 - (IV_LENGTH + TAG_LENGTH)];
  id v8 = [MEMORY[0x263EFF990] dataWithLength:IV_LENGTH];
  v9 = (void *)[v8 mutableBytes];
  id v10 = a1;
  id v11 = (const void *)[v10 bytes];
  memcpy(v9, v11, IV_LENGTH);
  id v12 = v5;
  [v12 bytes];
  [v12 length];

  id v13 = v8;
  [v13 bytes];
  [v13 length];
  id v14 = v10;
  [v14 bytes];
  uint64_t v15 = [v7 length];
  id v16 = v7;
  uint64_t v17 = [v16 mutableBytes];
  uint64_t v18 = [v14 bytes] + IV_LENGTH;
  uint64_t v24 = v18 + [v16 length];
  uint64_t v25 = TAG_LENGTH;
  int v19 = CCCryptorGCMOneshotDecrypt();
  if (v19)
  {
    int v20 = v19;
    int v21 = _CDPLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[NSData(Encryption) AESGCM256DecryptedDataWithSymmetricKey:](v20, v21);
    }

    v22 = 0;
  }
  else
  {
    v22 = objc_msgSend(v16, "copy", v15, v17, v24, v25);
  }

  return v22;
}

- (id)_randomDataGeneratorWithNumberOfBytes:()Encryption
{
  v7[1] = *MEMORY[0x263EF8340];
  id v4 = (char *)v7 - ((count + 15) & 0xFFFFFFFFFFFFFFF0);
  if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x263F17510], count, v4))
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [MEMORY[0x263EFF8F8] dataWithBytes:v4 length:count];
  }
  return v5;
}

- (void)AESGCM256EncryptedDataWithSymmetricKey:()Encryption .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_218640000, log, OS_LOG_TYPE_ERROR, "Failed to generate random IV data. Can't perform encryption.", v1, 2u);
}

- (void)AESGCM256EncryptedDataWithSymmetricKey:()Encryption .cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_218640000, a2, OS_LOG_TYPE_ERROR, "Failed to encrypt data with status: %d", (uint8_t *)v2, 8u);
}

- (void)AESGCM256DecryptedDataWithSymmetricKey:()Encryption .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_218640000, a2, OS_LOG_TYPE_ERROR, "Failed to decrypt data with status: %d", (uint8_t *)v2, 8u);
}

@end