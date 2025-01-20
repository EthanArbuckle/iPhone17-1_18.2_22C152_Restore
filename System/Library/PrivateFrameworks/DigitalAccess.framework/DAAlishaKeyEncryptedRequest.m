@interface DAAlishaKeyEncryptedRequest
+ (BOOL)supportsSecureCoding;
+ (id)decodeWithData:(id)a3 error:(id *)a4;
- (DAAlishaKeyEncryptedRequest)initWithCoder:(id)a3;
- (DAAlishaKeyEncryptedRequest)initWithVersion:(id)a3 ephemeralPublicKey:(id)a4 publicKeyHash:(id)a5 encryptedRequest:(id)a6;
- (NSData)encryptedRequest;
- (NSData)ephemeralPublicKey;
- (NSData)publicKeyHash;
- (NSString)version;
- (id)description;
- (id)encodeWithError:(id *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DAAlishaKeyEncryptedRequest

- (DAAlishaKeyEncryptedRequest)initWithVersion:(id)a3 ephemeralPublicKey:(id)a4 publicKeyHash:(id)a5 encryptedRequest:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)DAAlishaKeyEncryptedRequest;
  v15 = [(DAAlishaKeyEncryptedRequest *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_version, a3);
    objc_storeStrong((id *)&v16->_ephemeralPublicKey, a4);
    objc_storeStrong((id *)&v16->_publicKeyHash, a5);
    objc_storeStrong((id *)&v16->_encryptedRequest, a6);
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DAAlishaKeyEncryptedRequest *)self version];
  [v4 encodeObject:v5 forKey:@"version"];

  v6 = [(DAAlishaKeyEncryptedRequest *)self ephemeralPublicKey];
  [v4 encodeObject:v6 forKey:@"ephemeralPublicKey"];

  v7 = [(DAAlishaKeyEncryptedRequest *)self publicKeyHash];
  [v4 encodeObject:v7 forKey:@"publicKeyHash"];

  id v8 = [(DAAlishaKeyEncryptedRequest *)self encryptedRequest];
  [v4 encodeObject:v8 forKey:@"encryptedRequest"];
}

- (DAAlishaKeyEncryptedRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DAAlishaKeyEncryptedRequest;
  v5 = [(DAAlishaKeyEncryptedRequest *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"version"];
    version = v5->_version;
    v5->_version = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ephemeralPublicKey"];
    ephemeralPublicKey = v5->_ephemeralPublicKey;
    v5->_ephemeralPublicKey = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publicKeyHash"];
    publicKeyHash = v5->_publicKeyHash;
    v5->_publicKeyHash = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"encryptedRequest"];
    encryptedRequest = v5->_encryptedRequest;
    v5->_encryptedRequest = (NSData *)v12;
  }
  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] string];
  [v3 appendFormat:@"Version               : %@\n", self->_version];
  id v4 = kmlUtilHexStringFromData(self->_ephemeralPublicKey);
  [v3 appendFormat:@"EphemeralPublicKey    : %@\n", v4];

  v5 = kmlUtilHexStringFromData(self->_publicKeyHash);
  [v3 appendFormat:@"PublickKeyHash        : %@\n", v5];

  uint64_t v6 = kmlUtilHexStringFromData(self->_encryptedRequest);
  [v3 appendFormat:@"EncryptedRequest      : %@", v6];

  return v3;
}

- (id)encodeWithError:(id *)a3
{
  return (id)[MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:a3];
}

+ (id)decodeWithData:(id)a3 error:(id *)a4
{
  v5 = (void *)MEMORY[0x263F08928];
  uint64_t v6 = (void *)MEMORY[0x263EFFA08];
  id v7 = a3;
  uint64_t v8 = [v6 setWithObject:objc_opt_class()];
  v9 = [v5 unarchivedObjectOfClasses:v8 fromData:v7 error:a4];

  return v9;
}

- (NSString)version
{
  return self->_version;
}

- (NSData)ephemeralPublicKey
{
  return self->_ephemeralPublicKey;
}

- (NSData)publicKeyHash
{
  return self->_publicKeyHash;
}

- (NSData)encryptedRequest
{
  return self->_encryptedRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedRequest, 0);
  objc_storeStrong((id *)&self->_publicKeyHash, 0);
  objc_storeStrong((id *)&self->_ephemeralPublicKey, 0);

  objc_storeStrong((id *)&self->_version, 0);
}

@end