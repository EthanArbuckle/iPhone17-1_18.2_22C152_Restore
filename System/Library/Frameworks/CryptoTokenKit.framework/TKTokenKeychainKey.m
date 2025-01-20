@interface TKTokenKeychainKey
+ (BOOL)canDecrypt:(unsigned __int8)a3;
+ (BOOL)canPerformKeyExchange:(unsigned __int8)a3;
+ (BOOL)canSign:(unsigned __int8)a3;
- (BOOL)canDecrypt;
- (BOOL)canPerformKeyExchange;
- (BOOL)canSign;
- (BOOL)isSuitableForLogin;
- (BOOL)satisfiesKeyUsage:(unint64_t)a3;
- (BOOL)setupWithPublicKey:(__SecKey *)a3 label:(id)a4;
- (NSData)applicationTag;
- (NSData)publicKeyData;
- (NSData)publicKeyHash;
- (NSInteger)keySizeInBits;
- (NSString)keyType;
- (TKTokenKeychainKey)initWithCertificate:(SecCertificateRef)certificateRef objectID:(TKTokenObjectID)objectID;
- (TKTokenKeychainKey)initWithItemInfo:(id)a3;
- (TKTokenKeychainKey)initWithPublicKey:(__SecKey *)a3 label:(id)a4 objectID:(id)a5 canSign:(BOOL)a6 canDecrypt:(BOOL)a7 canPerformKeyExchange:(BOOL)a8;
- (id)encodedObjectID;
- (id)keychainAttributes;
- (unint64_t)keyUsage;
- (void)setApplicationTag:(NSData *)applicationTag;
- (void)setCanDecrypt:(BOOL)canDecrypt;
- (void)setCanPerformKeyExchange:(BOOL)canPerformKeyExchange;
- (void)setCanSign:(BOOL)canSign;
- (void)setKeySizeInBits:(NSInteger)keySizeInBits;
- (void)setKeyType:(NSString *)keyType;
- (void)setPublicKeyData:(NSData *)publicKeyData;
- (void)setPublicKeyHash:(NSData *)publicKeyHash;
- (void)setSuitableForLogin:(BOOL)suitableForLogin;
@end

@implementation TKTokenKeychainKey

- (TKTokenKeychainKey)initWithCertificate:(SecCertificateRef)certificateRef objectID:(TKTokenObjectID)objectID
{
  v14.receiver = self;
  v14.super_class = (Class)TKTokenKeychainKey;
  v5 = [(TKTokenKeychainItem *)&v14 initWithObjectID:objectID];
  v6 = v5;
  if (certificateRef && v5)
  {
    v7 = (__CFString *)SecCertificateCopySubjectSummary(certificateRef);
    SecKeyRef v8 = SecCertificateCopyKey(certificateRef);
    if (v8)
    {
      v9 = [NSNumber numberWithUnsignedInt:SecCertificateGetKeyUsage()];
      uint64_t v10 = [v9 unsignedCharValue];

      [(TKTokenKeychainKey *)v6 setCanSign:+[TKTokenKeychainKey canSign:v10]];
      [(TKTokenKeychainKey *)v6 setCanDecrypt:+[TKTokenKeychainKey canDecrypt:v10]];
      [(TKTokenKeychainKey *)v6 setCanPerformKeyExchange:+[TKTokenKeychainKey canPerformKeyExchange:v10]];
      [(TKTokenKeychainKey *)v6 setSuitableForLogin:[(TKTokenKeychainKey *)v6 canSign]];
      if ([(TKTokenKeychainKey *)v6 setupWithPublicKey:v8 label:v7])
      {
        v11 = v6;
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      v12 = TK_LOG_token_2();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[TKTokenKeychainKey initWithCertificate:objectID:](v12);
      }
    }
    v11 = 0;
    goto LABEL_11;
  }
  v11 = v5;
LABEL_12:

  return v11;
}

- (TKTokenKeychainKey)initWithPublicKey:(__SecKey *)a3 label:(id)a4 objectID:(id)a5 canSign:(BOOL)a6 canDecrypt:(BOOL)a7 canPerformKeyExchange:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v14 = a4;
  v19.receiver = self;
  v19.super_class = (Class)TKTokenKeychainKey;
  v15 = [(TKTokenKeychainItem *)&v19 initWithObjectID:a5];
  v16 = v15;
  if (v15
    && ([(TKTokenKeychainKey *)v15 setCanSign:v10],
        [(TKTokenKeychainKey *)v16 setCanDecrypt:v9],
        [(TKTokenKeychainKey *)v16 setCanPerformKeyExchange:v8],
        [(TKTokenKeychainKey *)v16 setSuitableForLogin:[(TKTokenKeychainKey *)v16 canSign]], [(TKTokenKeychainKey *)v16 setupWithPublicKey:a3 label:v14]))
  {
    v17 = v16;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)setupWithPublicKey:(__SecKey *)a3 label:(id)a4
{
  [(TKTokenKeychainItem *)self setLabel:a4];
  CFDictionaryRef v6 = SecKeyCopyAttributes(a3);
  v7 = [(__CFDictionary *)v6 objectForKeyedSubscript:*MEMORY[0x1E4F3BD38]];
  publicKeyData = self->_publicKeyData;
  self->_publicKeyData = v7;

  BOOL v9 = self->_publicKeyData;
  if (v9)
  {
    BOOL v10 = [(__CFDictionary *)v6 objectForKeyedSubscript:*MEMORY[0x1E4F3B718]];
    keyType = self->_keyType;
    self->_keyType = v10;

    v12 = [(__CFDictionary *)v6 objectForKeyedSubscript:*MEMORY[0x1E4F3B708]];
    self->_keySizeInBits = [v12 integerValue];

    v13 = [(__CFDictionary *)v6 objectForKeyedSubscript:*MEMORY[0x1E4F3B5D0]];
    publicKeyHash = self->_publicKeyHash;
    self->_publicKeyHash = v13;

    v15 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
    if ([(TKTokenKeychainKey *)self canSign]) {
      [v15 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:&unk_1F19F81F8];
    }
    if ([(TKTokenKeychainKey *)self canDecrypt]) {
      [v15 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:&unk_1F19F8210];
    }
    if ([(TKTokenKeychainKey *)self canPerformKeyExchange]) {
      [v15 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:&unk_1F19F8228];
    }
    v16 = (void *)[v15 copy];
    [(TKTokenKeychainItem *)self setConstraints:v16];
  }
  else
  {
    v17 = TK_LOG_token_2();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[TKTokenKeychainKey setupWithPublicKey:label:](v17);
    }
  }
  return v9 != 0;
}

- (id)keychainAttributes
{
  v18.receiver = self;
  v18.super_class = (Class)TKTokenKeychainKey;
  v3 = [(TKTokenKeychainItem *)&v18 keychainAttributes];
  [v3 setObject:*MEMORY[0x1E4F3B9A0] forKeyedSubscript:*MEMORY[0x1E4F3B978]];
  [v3 setObject:*MEMORY[0x1E4F3B6E8] forKeyedSubscript:*MEMORY[0x1E4F3B6D8]];
  [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3B6C0]];
  v4 = [(TKTokenKeychainKey *)self keyType];
  [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F3B718]];

  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[TKTokenKeychainKey keySizeInBits](self, "keySizeInBits"));
  [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F3B708]];

  CFDictionaryRef v6 = objc_msgSend(NSNumber, "numberWithBool:", -[TKTokenKeychainKey canDecrypt](self, "canDecrypt"));
  [v3 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F3B618]];

  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[TKTokenKeychainKey canSign](self, "canSign"));
  [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F3B630]];

  BOOL v8 = objc_msgSend(NSNumber, "numberWithBool:", -[TKTokenKeychainKey canDecrypt](self, "canDecrypt"));
  [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F3B638]];

  BOOL v9 = objc_msgSend(NSNumber, "numberWithBool:", -[TKTokenKeychainKey canPerformKeyExchange](self, "canPerformKeyExchange"));
  [v3 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F3B620]];

  BOOL v10 = [(TKTokenKeychainKey *)self applicationTag];

  if (v10)
  {
    v11 = [(TKTokenKeychainKey *)self applicationTag];
    [v3 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F3B5E0]];
  }
  v12 = [(TKTokenKeychainKey *)self publicKeyHash];

  if (v12)
  {
    v13 = [(TKTokenKeychainKey *)self publicKeyHash];
    [v3 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F3B5D0]];
  }
  id v14 = [(TKTokenKeychainKey *)self publicKeyData];

  if (v14)
  {
    v15 = [(TKTokenKeychainKey *)self publicKeyData];
    [v3 setObject:v15 forKeyedSubscript:@"pubk"];
  }
  v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TKTokenKeychainKey keyUsage](self, "keyUsage"));
  [v3 setObject:v16 forKeyedSubscript:@"keyUsage"];

  return v3;
}

- (id)encodedObjectID
{
  v2 = [(TKTokenKeychainItem *)self objectID];
  v3 = +[TKTokenID encodedKeyID:v2];

  return v3;
}

- (TKTokenKeychainKey)initWithItemInfo:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)TKTokenKeychainKey;
  v5 = [(TKTokenKeychainItem *)&v21 initWithItemInfo:v4];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3BD38]];
    publicKeyData = v5->_publicKeyData;
    v5->_publicKeyData = (NSData *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3B718]];
    keyType = v5->_keyType;
    v5->_keyType = (NSString *)v8;

    BOOL v10 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3B708]];
    v5->_keySizeInBits = [v10 integerValue];

    uint64_t v11 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3B5D0]];
    publicKeyHash = v5->_publicKeyHash;
    v5->_publicKeyHash = (NSData *)v11;

    uint64_t v13 = [v4 objectForKeyedSubscript:@"pubk"];
    id v14 = v5->_publicKeyData;
    v5->_publicKeyData = (NSData *)v13;

    v15 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3B618]];
    v5->_canDecrypt = [v15 BOOLValue];

    v16 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3B630]];
    v5->_canSign = [v16 BOOLValue];

    v17 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3B638]];
    v5->_canDecrypt = [v17 BOOLValue];

    objc_super v18 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3B620]];
    v5->_canPerformKeyExchange = [v18 BOOLValue];

    objc_super v19 = [v4 objectForKeyedSubscript:@"keyUsage"];
    v5->_suitableForLogin = [v19 integerValue] & 1;
  }
  return v5;
}

+ (BOOL)canSign:(unsigned __int8)a3
{
  return (a3 & 0x63) != 0;
}

+ (BOOL)canDecrypt:(unsigned __int8)a3
{
  return (a3 & 0x1C) != 0;
}

+ (BOOL)canPerformKeyExchange:(unsigned __int8)a3
{
  return (a3 >> 4) & 1;
}

- (unint64_t)keyUsage
{
  unint64_t v3 = [(TKTokenKeychainKey *)self isSuitableForLogin];
  if ([(TKTokenKeychainKey *)self canSign]) {
    v3 |= 8uLL;
  }
  if ([(TKTokenKeychainKey *)self canDecrypt]) {
    v3 |= 2uLL;
  }
  if ([(TKTokenKeychainKey *)self canPerformKeyExchange]) {
    return v3 | 4;
  }
  else {
    return v3;
  }
}

- (BOOL)satisfiesKeyUsage:(unint64_t)a3
{
  return !a3 || ([(TKTokenKeychainKey *)self keyUsage] & a3) != 0;
}

- (NSString)keyType
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setKeyType:(NSString *)keyType
{
}

- (NSData)applicationTag
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setApplicationTag:(NSData *)applicationTag
{
}

- (NSInteger)keySizeInBits
{
  return self->_keySizeInBits;
}

- (void)setKeySizeInBits:(NSInteger)keySizeInBits
{
  self->_keySizeInBits = keySizeInBits;
}

- (NSData)publicKeyData
{
  return (NSData *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPublicKeyData:(NSData *)publicKeyData
{
}

- (NSData)publicKeyHash
{
  return (NSData *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPublicKeyHash:(NSData *)publicKeyHash
{
}

- (BOOL)canDecrypt
{
  return self->_canDecrypt;
}

- (void)setCanDecrypt:(BOOL)canDecrypt
{
  self->_canDecrypt = canDecrypt;
}

- (BOOL)canSign
{
  return self->_canSign;
}

- (void)setCanSign:(BOOL)canSign
{
  self->_canSign = canSign;
}

- (BOOL)canPerformKeyExchange
{
  return self->_canPerformKeyExchange;
}

- (void)setCanPerformKeyExchange:(BOOL)canPerformKeyExchange
{
  self->_canPerformKeyExchange = canPerformKeyExchange;
}

- (BOOL)isSuitableForLogin
{
  return self->_suitableForLogin;
}

- (void)setSuitableForLogin:(BOOL)suitableForLogin
{
  self->_suitableForLogin = suitableForLogin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicKeyHash, 0);
  objc_storeStrong((id *)&self->_publicKeyData, 0);
  objc_storeStrong((id *)&self->_applicationTag, 0);

  objc_storeStrong((id *)&self->_keyType, 0);
}

- (void)initWithCertificate:(os_log_t)log objectID:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BED55000, log, OS_LOG_TYPE_ERROR, "Failed to get public key from certificate", v1, 2u);
}

- (void)setupWithPublicKey:(os_log_t)log label:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BED55000, log, OS_LOG_TYPE_ERROR, "Failed to get public key data", v1, 2u);
}

@end