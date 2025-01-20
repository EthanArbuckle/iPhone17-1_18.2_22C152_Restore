@interface TrustedPeersHelperCustodianRecoveryKey
+ (BOOL)supportsSecureCoding;
- (NSData)encryptionKey;
- (NSData)signingKey;
- (NSString)recoveryString;
- (NSString)salt;
- (NSString)uuid;
- (TrustedPeersHelperCustodianRecoveryKey)initWithCoder:(id)a3;
- (TrustedPeersHelperCustodianRecoveryKey)initWithUUID:(id)a3 encryptionKey:(id)a4 signingKey:(id)a5 recoveryString:(id)a6 salt:(id)a7 kind:(int)a8;
- (id)description;
- (int)kind;
- (void)encodeWithCoder:(id)a3;
- (void)setEncryptionKey:(id)a3;
- (void)setKind:(int)a3;
- (void)setRecoveryString:(id)a3;
- (void)setSalt:(id)a3;
- (void)setSigningKey:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation TrustedPeersHelperCustodianRecoveryKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_salt, 0);
  objc_storeStrong((id *)&self->_recoveryString, 0);
  objc_storeStrong((id *)&self->_signingKey, 0);
  objc_storeStrong((id *)&self->_encryptionKey, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)setKind:(int)a3
{
  self->_kind = a3;
}

- (int)kind
{
  return self->_kind;
}

- (void)setSalt:(id)a3
{
}

- (NSString)salt
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRecoveryString:(id)a3
{
}

- (NSString)recoveryString
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSigningKey:(id)a3
{
}

- (NSData)signingKey
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setEncryptionKey:(id)a3
{
}

- (NSData)encryptionKey
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUuid:(id)a3
{
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  v4 = [(TrustedPeersHelperCustodianRecoveryKey *)self uuid];
  [v9 encodeObject:v4 forKey:@"uuid"];

  v5 = [(TrustedPeersHelperCustodianRecoveryKey *)self encryptionKey];
  [v9 encodeObject:v5 forKey:@"encryptionKey"];

  v6 = [(TrustedPeersHelperCustodianRecoveryKey *)self signingKey];
  [v9 encodeObject:v6 forKey:@"signingKey"];

  v7 = [(TrustedPeersHelperCustodianRecoveryKey *)self recoveryString];
  [v9 encodeObject:v7 forKey:@"recoveryString"];

  v8 = [(TrustedPeersHelperCustodianRecoveryKey *)self salt];
  [v9 encodeObject:v8 forKey:@"salt"];

  objc_msgSend(v9, "encodeInt32:forKey:", -[TrustedPeersHelperCustodianRecoveryKey kind](self, "kind"), @"kind");
}

- (TrustedPeersHelperCustodianRecoveryKey)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TrustedPeersHelperCustodianRecoveryKey;
  v5 = [(TrustedPeersHelperCustodianRecoveryKey *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"encryptionKey"];
    encryptionKey = v5->_encryptionKey;
    v5->_encryptionKey = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signingKey"];
    signingKey = v5->_signingKey;
    v5->_signingKey = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recoveryString"];
    recoveryString = v5->_recoveryString;
    v5->_recoveryString = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"salt"];
    salt = v5->_salt;
    v5->_salt = (NSString *)v14;

    v5->_kind = [v4 decodeInt32ForKey:@"kind"];
  }

  return v5;
}

- (id)description
{
  v3 = [(TrustedPeersHelperCustodianRecoveryKey *)self uuid];
  uint64_t v4 = [(TrustedPeersHelperCustodianRecoveryKey *)self kind];
  if (v4 >= 3)
  {
    v5 = +[NSString stringWithFormat:@"(unknown: %i)", v4];
  }
  else
  {
    v5 = *(&off_100289860 + v4);
  }
  uint64_t v6 = +[NSString stringWithFormat:@"<CustodianRecoveryKey: %@, (%@)>", v3, v5];

  return v6;
}

- (TrustedPeersHelperCustodianRecoveryKey)initWithUUID:(id)a3 encryptionKey:(id)a4 signingKey:(id)a5 recoveryString:(id)a6 salt:(id)a7 kind:(int)a8
{
  id v22 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)TrustedPeersHelperCustodianRecoveryKey;
  v18 = [(TrustedPeersHelperCustodianRecoveryKey *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_uuid, a3);
    objc_storeStrong((id *)&v19->_encryptionKey, a4);
    objc_storeStrong((id *)&v19->_signingKey, a5);
    objc_storeStrong((id *)&v19->_recoveryString, a6);
    objc_storeStrong((id *)&v19->_salt, a7);
    v19->_kind = a8;
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end