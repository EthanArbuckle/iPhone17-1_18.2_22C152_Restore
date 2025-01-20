@interface ENCypher_AES128
+ (BOOL)supportsSecureCoding;
+ (id)_decryptData:(id)a3 withKey:(id)a4;
+ (id)_encryptData:(id)a3 withKey:(id)a4;
+ (id)_randomDataWithLength:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (ENCypher_AES128)initWithCoder:(id)a3;
- (ENCypher_AES128)initWithKey:(id)a3;
- (ENCypher_AES128)initWithRandomKey;
- (NSData)key;
- (NSString)identifier;
- (id)cypherData:(id)a3 withAccountIdentity:(id)a4 identifier:(id *)a5 error:(id *)a6;
- (id)decypherData:(id)a3 withAccountIdentity:(id)a4 signingDevicePublicKey:(id)a5 identifier:(id)a6 error:(id *)a7;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setKey:(id)a3;
@end

@implementation ENCypher_AES128

- (ENCypher_AES128)initWithRandomKey
{
  v3 = [(id)objc_opt_class() _randomDataWithLength:32];
  v4 = [(ENCypher_AES128 *)self initWithKey:v3];

  return v4;
}

- (ENCypher_AES128)initWithKey:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ENCypher_AES128;
  v6 = [(ENCypher_AES128 *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_key, a3);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 key];
    v6 = [(ENCypher_AES128 *)self key];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(ENCypher_AES128 *)self key];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ENCypher_AES128)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ENCypher_AES128KeyKey"];

  v6 = [(ENCypher_AES128 *)self initWithKey:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ENCypher_AES128 *)self key];
  [v4 encodeObject:v5 forKey:@"ENCypher_AES128KeyKey"];
}

- (NSString)identifier
{
  return (NSString *)@"AES128";
}

- (id)cypherData:(id)a3 withAccountIdentity:(id)a4 identifier:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  if (!a5) {
    goto LABEL_5;
  }
  id v12 = *a5;
  if (!*a5
    || ([(ENCypher_AES128 *)self identifier],
        v13 = objc_claimAutoreleasedReturnValue(),
        int v14 = [v12 isEqualToString:v13],
        v13,
        v14))
  {
    *a5 = [(ENCypher_AES128 *)self identifier];
LABEL_5:
    v15 = objc_opt_class();
    v16 = [(ENCypher_AES128 *)self key];
    v17 = [v15 _encryptData:v10 withKey:v16];

    goto LABEL_6;
  }
  if (a6)
  {
    v19 = +[ENLog groupContext];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      sub_1DD45E944((uint64_t *)a5, self, v19);
    }

    [MEMORY[0x1E4F28C58] errorWithDomain:@"ENCypherErrorDomain" code:-1001 userInfo:0];
    v17 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
LABEL_6:

  return v17;
}

- (id)decypherData:(id)a3 withAccountIdentity:(id)a4 signingDevicePublicKey:(id)a5 identifier:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v15
    && ([(ENCypher_AES128 *)self identifier],
        v16 = objc_claimAutoreleasedReturnValue(),
        int v17 = [v15 isEqualToString:v16],
        v16,
        !v17))
  {
    if (a7)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"ENCypherErrorDomain" code:-1001 userInfo:0];
      v20 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }
  }
  else
  {
    v18 = objc_opt_class();
    v19 = [(ENCypher_AES128 *)self key];
    v20 = [v18 _decryptData:v12 withKey:v19];
  }
  return v20;
}

+ (id)_randomDataWithLength:(int64_t)a3
{
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:a3];
  id v5 = (const __SecRandom *)*MEMORY[0x1E4F3BC60];
  id v6 = v4;
  if (SecRandomCopyBytes(v5, a3, (void *)[v6 mutableBytes])) {
    char v7 = 0;
  }
  else {
    char v7 = v6;
  }
  id v8 = v7;

  return v8;
}

+ (id)_encryptData:(id)a3 withKey:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  memset(key, 0, sizeof(key));
  id v5 = a4;
  id v6 = a3;
  [v5 bytes];
  [v5 length];

  __memcpy_chk();
  size_t v7 = [v6 length];
  dataOut = malloc_type_malloc(v7 + 16, 0x5356A6C0uLL);
  size_t v13 = 0;
  id v9 = v6;
  id v10 = (const void *)[v9 bytes];

  if (CCCrypt(0, 0, 3u, key, 0x10uLL, 0, v10, v7, dataOut, v7 + 16, &v13))
  {
    free(dataOut);
    id v11 = 0;
  }
  else
  {
    id v11 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:dataOut length:v13];
  }
  return v11;
}

+ (id)_decryptData:(id)a3 withKey:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  memset(key, 0, sizeof(key));
  id v5 = a4;
  id v6 = a3;
  [v5 bytes];
  [v5 length];

  __memcpy_chk();
  size_t v7 = [v6 length];
  dataOut = malloc_type_malloc(v7 + 16, 0x763FB6DAuLL);
  size_t v13 = 0;
  id v9 = v6;
  id v10 = (const void *)[v9 bytes];

  if (CCCrypt(1u, 0, 3u, key, 0x10uLL, 0, v10, v7, dataOut, v7 + 16, &v13))
  {
    free(dataOut);
    id v11 = 0;
  }
  else
  {
    id v11 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:dataOut length:v13];
  }
  return v11;
}

- (NSData)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end