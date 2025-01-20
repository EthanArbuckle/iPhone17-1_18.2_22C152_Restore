@interface AKBeneficiaryAliasSetupResult
+ (BOOL)supportsSecureCoding;
- (AKBeneficiaryAliasSetupResult)initWithCoder:(id)a3;
- (NSString)beneficiaryAccountName;
- (NSString)beneficiaryAltDSID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setBeneficiaryAccountName:(id)a3;
- (void)setBeneficiaryAltDSID:(id)a3;
@end

@implementation AKBeneficiaryAliasSetupResult

- (AKBeneficiaryAliasSetupResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AKBeneficiaryAliasSetupResult *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_beneficiaryAltDSID"];
    beneficiaryAltDSID = v5->_beneficiaryAltDSID;
    v5->_beneficiaryAltDSID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_beneficiaryAccountName"];
    beneficiaryAccountName = v5->_beneficiaryAccountName;
    v5->_beneficiaryAccountName = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  beneficiaryAltDSID = self->_beneficiaryAltDSID;
  id v5 = a3;
  [v5 encodeObject:beneficiaryAltDSID forKey:@"_beneficiaryAltDSID"];
  [v5 encodeObject:self->_beneficiaryAccountName forKey:@"_beneficiaryAccountName"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSString *)self->_beneficiaryAltDSID copy];
  uint64_t v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(NSString *)self->_beneficiaryAccountName copy];
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
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p {\nbeneficiaryAltDSID: %@\nbeneficiaryAccountName: %@\n}>", v5, self, self->_beneficiaryAltDSID, self->_beneficiaryAccountName];

  return v6;
}

- (NSString)beneficiaryAltDSID
{
  return self->_beneficiaryAltDSID;
}

- (void)setBeneficiaryAltDSID:(id)a3
{
}

- (NSString)beneficiaryAccountName
{
  return self->_beneficiaryAccountName;
}

- (void)setBeneficiaryAccountName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_beneficiaryAccountName, 0);

  objc_storeStrong((id *)&self->_beneficiaryAltDSID, 0);
}

@end