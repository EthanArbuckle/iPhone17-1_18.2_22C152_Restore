@interface AKCustodianSetupResult
+ (BOOL)supportsSecureCoding;
- (AKCustodianSetupResult)initWithCoder:(id)a3;
- (NSData)encryptedPRKC;
- (NSString)ownerCustodianAltDSID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setEncryptedPRKC:(id)a3;
- (void)setOwnerCustodianAltDSID:(id)a3;
@end

@implementation AKCustodianSetupResult

- (AKCustodianSetupResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AKCustodianSetupResult *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_encryptedPRKC"];
    encryptedPRKC = v5->_encryptedPRKC;
    v5->_encryptedPRKC = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_ownerCustodianAltDSID"];
    ownerCustodianAltDSID = v5->_ownerCustodianAltDSID;
    v5->_ownerCustodianAltDSID = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  encryptedPRKC = self->_encryptedPRKC;
  id v5 = a3;
  [v5 encodeObject:encryptedPRKC forKey:@"_encryptedPRKC"];
  [v5 encodeObject:self->_ownerCustodianAltDSID forKey:@"_ownerCustodianAltDSID"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSData *)self->_encryptedPRKC copy];
  uint64_t v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(NSString *)self->_ownerCustodianAltDSID copy];
  uint64_t v8 = (void *)v4[2];
  v4[2] = v7;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)debugDescription
{
  id v3 = (id)[[NSString alloc] initWithData:self->_encryptedPRKC encoding:4];
  id v4 = v3;
  if ((unint64_t)[v3 length] >= 4)
  {
    id v4 = [v3 substringToIndex:4];
  }
  uint64_t v5 = NSString;
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  uint64_t v8 = [v5 stringWithFormat:@"<%@: %p {\nencryptedPRKC: %@...\nownerCustodianAltDSID: %@\n}>", v7, self, v4, self->_ownerCustodianAltDSID];

  return v8;
}

- (NSData)encryptedPRKC
{
  return self->_encryptedPRKC;
}

- (void)setEncryptedPRKC:(id)a3
{
}

- (NSString)ownerCustodianAltDSID
{
  return self->_ownerCustodianAltDSID;
}

- (void)setOwnerCustodianAltDSID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownerCustodianAltDSID, 0);

  objc_storeStrong((id *)&self->_encryptedPRKC, 0);
}

@end