@interface DCCredentialCryptoKeyInfo
+ (BOOL)supportsSecureCoding;
- (DCCredentialCryptoKeyInfo)initWithCoder:(id)a3;
- (DCCredentialCryptoKeyInfo)initWithIdentifier:(id)a3 credentialIdentifier:(id)a4 publicKey:(id)a5 publicKeyIdentifier:(id)a6 keyType:(id)a7 keyUsage:(id)a8 createdAt:(id)a9 updatedAt:(id)a10 presentmentKeyTimesUsed:(int64_t)a11 acl:(id)a12;
- (NSData)acl;
- (NSData)publicKey;
- (NSData)publicKeyIdentifier;
- (NSDate)createdAt;
- (NSDate)updatedAt;
- (NSString)credentialIdentifier;
- (NSString)identifier;
- (NSString)keyType;
- (NSString)keyUsage;
- (int64_t)presentmentKeyTimesUsed;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DCCredentialCryptoKeyInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DCCredentialCryptoKeyInfo *)self identifier];
  [v4 encodeObject:v5 forKey:0x26C59B140];

  v6 = [(DCCredentialCryptoKeyInfo *)self credentialIdentifier];
  [v4 encodeObject:v6 forKey:0x26C59B000];

  v7 = [(DCCredentialCryptoKeyInfo *)self publicKey];
  [v4 encodeObject:v7 forKey:0x26C59B460];

  v8 = [(DCCredentialCryptoKeyInfo *)self publicKeyIdentifier];
  [v4 encodeObject:v8 forKey:0x26C59B160];

  v9 = [(DCCredentialCryptoKeyInfo *)self keyType];
  [v4 encodeObject:v9 forKey:0x26C59B180];

  v10 = [(DCCredentialCryptoKeyInfo *)self keyUsage];
  [v4 encodeObject:v10 forKey:0x26C59B1A0];

  v11 = [(DCCredentialCryptoKeyInfo *)self createdAt];
  [v4 encodeObject:v11 forKey:0x26C59B080];

  v12 = [(DCCredentialCryptoKeyInfo *)self updatedAt];
  [v4 encodeObject:v12 forKey:0x26C59B0A0];

  objc_msgSend(v4, "encodeInteger:forKey:", -[DCCredentialCryptoKeyInfo presentmentKeyTimesUsed](self, "presentmentKeyTimesUsed"), 0x26C59B520);
  id v13 = [(DCCredentialCryptoKeyInfo *)self acl];
  [v4 encodeObject:v13 forKey:0x26C59B640];
}

- (DCCredentialCryptoKeyInfo)initWithCoder:(id)a3
{
  v24.receiver = self;
  v24.super_class = (Class)DCCredentialCryptoKeyInfo;
  id v3 = a3;
  id v4 = [(DCCredentialCryptoKeyInfo *)&v24 init];
  uint64_t v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x26C59B140, v24.receiver, v24.super_class);
  identifier = v4->_identifier;
  v4->_identifier = (NSString *)v5;

  uint64_t v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B000];
  credentialIdentifier = v4->_credentialIdentifier;
  v4->_credentialIdentifier = (NSString *)v7;

  uint64_t v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B460];
  publicKey = v4->_publicKey;
  v4->_publicKey = (NSData *)v9;

  uint64_t v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B160];
  publicKeyIdentifier = v4->_publicKeyIdentifier;
  v4->_publicKeyIdentifier = (NSData *)v11;

  uint64_t v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B180];
  keyType = v4->_keyType;
  v4->_keyType = (NSString *)v13;

  uint64_t v15 = [v3 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B1A0];
  keyUsage = v4->_keyUsage;
  v4->_keyUsage = (NSString *)v15;

  uint64_t v17 = [v3 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B080];
  createdAt = v4->_createdAt;
  v4->_createdAt = (NSDate *)v17;

  uint64_t v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B0A0];
  updatedAt = v4->_updatedAt;
  v4->_updatedAt = (NSDate *)v19;

  v4->_presentmentKeyTimesUsed = [v3 decodeIntegerForKey:0x26C59B520];
  uint64_t v21 = [v3 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B640];

  acl = v4->_acl;
  v4->_acl = (NSData *)v21;

  return v4;
}

- (DCCredentialCryptoKeyInfo)initWithIdentifier:(id)a3 credentialIdentifier:(id)a4 publicKey:(id)a5 publicKeyIdentifier:(id)a6 keyType:(id)a7 keyUsage:(id)a8 createdAt:(id)a9 updatedAt:(id)a10 presentmentKeyTimesUsed:(int64_t)a11 acl:(id)a12
{
  uint64_t v17 = (NSString *)a3;
  v18 = (NSString *)a4;
  uint64_t v19 = (NSData *)a5;
  v20 = (NSData *)a6;
  uint64_t v21 = (NSString *)a7;
  v22 = (NSString *)a8;
  v23 = (NSDate *)a9;
  objc_super v24 = (NSDate *)a10;
  v43 = (NSData *)a12;
  v46.receiver = self;
  v46.super_class = (Class)DCCredentialCryptoKeyInfo;
  v25 = [(DCCredentialCryptoKeyInfo *)&v46 init];
  identifier = v25->_identifier;
  v25->_identifier = v17;
  v45 = v17;

  credentialIdentifier = v25->_credentialIdentifier;
  v25->_credentialIdentifier = v18;
  v28 = v18;

  publicKey = v25->_publicKey;
  v25->_publicKey = v19;
  v30 = v19;

  publicKeyIdentifier = v25->_publicKeyIdentifier;
  v25->_publicKeyIdentifier = v20;
  v32 = v20;

  keyType = v25->_keyType;
  v25->_keyType = v21;
  v34 = v21;

  keyUsage = v25->_keyUsage;
  v25->_keyUsage = v22;
  v36 = v22;

  createdAt = v25->_createdAt;
  v25->_createdAt = v23;
  v38 = v23;

  updatedAt = v25->_updatedAt;
  v25->_updatedAt = v24;
  v40 = v24;

  acl = v25->_acl;
  v25->_presentmentKeyTimesUsed = a11;
  v25->_acl = v43;

  return v25;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)credentialIdentifier
{
  return self->_credentialIdentifier;
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (NSData)publicKeyIdentifier
{
  return self->_publicKeyIdentifier;
}

- (NSString)keyType
{
  return self->_keyType;
}

- (NSString)keyUsage
{
  return self->_keyUsage;
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (NSDate)updatedAt
{
  return self->_updatedAt;
}

- (int64_t)presentmentKeyTimesUsed
{
  return self->_presentmentKeyTimesUsed;
}

- (NSData)acl
{
  return self->_acl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acl, 0);
  objc_storeStrong((id *)&self->_updatedAt, 0);
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_keyUsage, 0);
  objc_storeStrong((id *)&self->_keyType, 0);
  objc_storeStrong((id *)&self->_publicKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_credentialIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end