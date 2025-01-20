@interface AKInheritanceContext
+ (BOOL)supportsSecureCoding;
- (AKBeneficiaryManifest)manifest;
- (AKInheritanceAccessKey)accessKey;
- (AKInheritanceContext)initWithAuthenticationContext:(id)a3;
- (AKInheritanceContext)initWithCoder:(id)a3;
- (AKInheritanceContext)initWithOwnerAltDSID:(id)a3;
- (NSString)altDSID;
- (NSString)beneficiaryIdentifier;
- (NSString)beneficiarySetupToken;
- (NSUUID)_identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessKey:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setBeneficiaryIdentifier:(id)a3;
- (void)setBeneficiarySetupToken:(id)a3;
- (void)setManifest:(id)a3;
@end

@implementation AKInheritanceContext

- (AKInheritanceContext)initWithOwnerAltDSID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKInheritanceContext;
  v6 = [(AKInheritanceContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_altDSID, a3);
  }

  return v7;
}

- (AKInheritanceContext)initWithAuthenticationContext:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKInheritanceContext;
  id v5 = [(AKInheritanceContext *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 altDSID];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;
  }
  return v5;
}

- (AKInheritanceContext)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AKInheritanceContext *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_beneficiaryIdentifier"];
    beneficiaryIdentifier = v5->_beneficiaryIdentifier;
    v5->_beneficiaryIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_manifest"];
    manifest = v5->_manifest;
    v5->_manifest = (AKBeneficiaryManifest *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_accessCode"];
    accessKey = v5->_accessKey;
    v5->_accessKey = (AKInheritanceAccessKey *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_beneficiarySetupToken"];
    beneficiarySetupToken = v5->_beneficiarySetupToken;
    v5->_beneficiarySetupToken = (NSString *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  altDSID = self->_altDSID;
  id v5 = a3;
  [v5 encodeObject:altDSID forKey:@"_altDSID"];
  [v5 encodeObject:self->_beneficiaryIdentifier forKey:@"_beneficiaryIdentifier"];
  [v5 encodeObject:self->_manifest forKey:@"_manifest"];
  [v5 encodeObject:self->_accessKey forKey:@"_accessCode"];
  [v5 encodeObject:self->_beneficiarySetupToken forKey:@"_beneficiarySetupToken"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSString *)self->_altDSID copy];
  uint64_t v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_beneficiaryIdentifier copy];
  uint64_t v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(AKBeneficiaryManifest *)self->_manifest copy];
  uint64_t v10 = (void *)v4[5];
  v4[5] = v9;

  uint64_t v11 = [(AKInheritanceAccessKey *)self->_accessKey copy];
  uint64_t v12 = (void *)v4[6];
  v4[6] = v11;

  uint64_t v13 = [(NSString *)self->_beneficiarySetupToken copy];
  uint64_t v14 = (void *)v4[4];
  v4[4] = v13;

  return v4;
}

- (NSUUID)_identifier
{
  return self->_identifier;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)beneficiaryIdentifier
{
  return self->_beneficiaryIdentifier;
}

- (void)setBeneficiaryIdentifier:(id)a3
{
}

- (NSString)beneficiarySetupToken
{
  return self->_beneficiarySetupToken;
}

- (void)setBeneficiarySetupToken:(id)a3
{
}

- (AKBeneficiaryManifest)manifest
{
  return self->_manifest;
}

- (void)setManifest:(id)a3
{
}

- (AKInheritanceAccessKey)accessKey
{
  return self->_accessKey;
}

- (void)setAccessKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessKey, 0);
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_beneficiarySetupToken, 0);
  objc_storeStrong((id *)&self->_beneficiaryIdentifier, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end