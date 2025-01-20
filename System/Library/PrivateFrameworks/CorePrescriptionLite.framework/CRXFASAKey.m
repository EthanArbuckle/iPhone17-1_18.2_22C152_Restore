@interface CRXFASAKey
+ (id)keyInPEMFormat:(id)a3 isPublic:(BOOL)a4;
- (BOOL)isEqual:(id)a3;
- (CRXFASAKey)initWithName:(id)a3 privateKey:(id)a4 publicKey:(id)a5 creationDate:(id)a6;
- (NSData)privateKey;
- (NSData)publicKey;
- (NSDate)creationDate;
- (NSString)name;
- (NSString)privateKeyPEM;
- (NSString)publicKeyPEM;
- (void)setCreationDate:(id)a3;
@end

@implementation CRXFASAKey

- (CRXFASAKey)initWithName:(id)a3 privateKey:(id)a4 publicKey:(id)a5 creationDate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)CRXFASAKey;
  v15 = [(CRXFASAKey *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_name, a3);
    objc_storeStrong((id *)&v16->_privateKey, a4);
    objc_storeStrong((id *)&v16->_publicKey, a5);
    if (v14)
    {
      v17 = (NSDate *)v14;
    }
    else
    {
      v17 = [MEMORY[0x263EFF910] date];
    }
    creationDate = v16->_creationDate;
    v16->_creationDate = v17;
  }
  return v16;
}

- (NSString)privateKeyPEM
{
  privateKeyPEM = self->_privateKeyPEM;
  if (!privateKeyPEM)
  {
    v4 = [(id)objc_opt_class() keyInPEMFormat:self->_privateKey isPublic:0];
    v5 = self->_privateKeyPEM;
    self->_privateKeyPEM = v4;

    privateKeyPEM = self->_privateKeyPEM;
  }
  v6 = (void *)[(NSString *)privateKeyPEM copy];
  return (NSString *)v6;
}

- (NSString)publicKeyPEM
{
  publicKeyPEM = self->_publicKeyPEM;
  if (!publicKeyPEM)
  {
    v4 = [(id)objc_opt_class() keyInPEMFormat:self->_publicKey isPublic:1];
    v5 = self->_publicKeyPEM;
    self->_publicKeyPEM = v4;

    publicKeyPEM = self->_publicKeyPEM;
  }
  v6 = (void *)[(NSString *)publicKeyPEM copy];
  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(CRXFASAKey *)self name];
    v7 = [v5 name];
    if (CRXUObjectsEqual((unint64_t)v6, (uint64_t)v7))
    {
      v8 = [(CRXFASAKey *)self privateKey];
      v9 = [v5 privateKey];
      if (CRXUObjectsEqual((unint64_t)v8, (uint64_t)v9))
      {
        v10 = [(CRXFASAKey *)self publicKey];
        id v11 = [v5 publicKey];
        char v12 = CRXUObjectsEqual((unint64_t)v10, (uint64_t)v11);
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

+ (id)keyInPEMFormat:(id)a3 isPublic:(BOOL)a4
{
  BOOL v4 = a4;
  if (a4) {
    uint64_t v5 = 120;
  }
  else {
    uint64_t v5 = 167;
  }
  v6 = (objc_class *)MEMORY[0x263EFF990];
  id v7 = a3;
  v8 = (void *)[[v6 alloc] initWithCapacity:v5];
  v9 = v8;
  if (v4)
  {
    [v8 appendBytes:&keyInPEMFormat_isPublic__kPublicKeyHeader length:23];
    [v9 appendData:v7];

    v10 = "-----END PUBLIC KEY-----";
    id v11 = "-----BEGIN PUBLIC KEY-----";
  }
  else
  {
    [v8 appendBytes:&keyInPEMFormat_isPublic__kPrivateKeyHeader length:8];
    id v12 = v7;
    objc_msgSend(v9, "appendBytes:length:", objc_msgSend(v12, "bytes") + 97, 48);
    [v9 appendBytes:&keyInPEMFormat_isPublic__kPrivateKeyParamsBlock length:14];
    id v13 = v12;
    uint64_t v14 = [v13 bytes];

    [v9 appendBytes:v14 length:97];
    v10 = "-----END EC PRIVATE KEY-----";
    id v11 = "-----BEGIN EC PRIVATE KEY-----";
  }
  v15 = [v9 base64EncodedStringWithOptions:33];
  v16 = [NSString stringWithFormat:@"%s\n%@\n%s\n", v11, v15, v10];

  return v16;
}

- (NSString)name
{
  return self->_name;
}

- (NSData)privateKey
{
  return self->_privateKey;
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_privateKey, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_publicKeyPEM, 0);
  objc_storeStrong((id *)&self->_privateKeyPEM, 0);
}

@end