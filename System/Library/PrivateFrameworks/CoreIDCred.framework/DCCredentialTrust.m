@interface DCCredentialTrust
+ (BOOL)supportsSecureCoding;
- (BOOL)credentialAccessibilityEnabled;
- (DCCredentialTrust)initWithCoder:(id)a3;
- (DCCredentialTrust)initWithCredentialKeyBlob:(id)a3 baaCertificate:(id)a4 pairingID:(id)a5 isAccessibilityEnabled:(BOOL)a6;
- (NSData)credentialBAACertificate;
- (NSData)credentialKeyBlob;
- (NSString)credentialPairingID;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DCCredentialTrust

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  v4 = [(DCCredentialTrust *)self credentialKeyBlob];
  [v7 encodeObject:v4 forKey:0x26C59B5E0];

  v5 = [(DCCredentialTrust *)self credentialBAACertificate];
  [v7 encodeObject:v5 forKey:0x26C59B5C0];

  v6 = [(DCCredentialTrust *)self credentialPairingID];
  [v7 encodeObject:v6 forKey:0x26C59B600];

  objc_msgSend(v7, "encodeBool:forKey:", -[DCCredentialTrust credentialAccessibilityEnabled](self, "credentialAccessibilityEnabled"), 0x26C59B620);
}

- (DCCredentialTrust)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DCCredentialTrust;
  v5 = [(DCCredentialTrust *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B5E0];
    credentialKeyBlob = v5->_credentialKeyBlob;
    v5->_credentialKeyBlob = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B5C0];
    credentialBAACertificate = v5->_credentialBAACertificate;
    v5->_credentialBAACertificate = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59B600];
    credentialPairingID = v5->_credentialPairingID;
    v5->_credentialPairingID = (NSString *)v10;

    v5->_credentialAccessibilityEnabled = [v4 decodeBoolForKey:0x26C59B620];
  }

  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"DCCredentialTrust credentialBAACertificate = %@, credentialKeyBlob = %@, credentialPairingID = %@, credentialAccessibilityEnabled = %d", self->_credentialBAACertificate, self->_credentialKeyBlob, self->_credentialPairingID, self->_credentialAccessibilityEnabled];
}

- (DCCredentialTrust)initWithCredentialKeyBlob:(id)a3 baaCertificate:(id)a4 pairingID:(id)a5 isAccessibilityEnabled:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)DCCredentialTrust;
  objc_super v13 = [(DCCredentialTrust *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    credentialKeyBlob = v13->_credentialKeyBlob;
    v13->_credentialKeyBlob = (NSData *)v14;

    uint64_t v16 = [v11 copy];
    credentialBAACertificate = v13->_credentialBAACertificate;
    v13->_credentialBAACertificate = (NSData *)v16;

    uint64_t v18 = [v12 copy];
    credentialPairingID = v13->_credentialPairingID;
    v13->_credentialPairingID = (NSString *)v18;

    v13->_credentialAccessibilityEnabled = a6;
  }

  return v13;
}

- (NSData)credentialBAACertificate
{
  return self->_credentialBAACertificate;
}

- (NSData)credentialKeyBlob
{
  return self->_credentialKeyBlob;
}

- (NSString)credentialPairingID
{
  return self->_credentialPairingID;
}

- (BOOL)credentialAccessibilityEnabled
{
  return self->_credentialAccessibilityEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialPairingID, 0);
  objc_storeStrong((id *)&self->_credentialKeyBlob, 0);

  objc_storeStrong((id *)&self->_credentialBAACertificate, 0);
}

@end