@interface AABeneficiary
+ (BOOL)supportsSecureCoding;
- (AABeneficiary)initWithBeneficiaryID:(id)a3 benefactorAltDSID:(id)a4;
- (AABeneficiary)initWithCoder:(id)a3;
- (AKInheritanceAccessKey)accessKey;
- (NSString)benefactorAltDSID;
- (NSString)description;
- (NSUUID)beneficiaryID;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessKey:(id)a3;
@end

@implementation AABeneficiary

- (AABeneficiary)initWithBeneficiaryID:(id)a3 benefactorAltDSID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AABeneficiary;
  v9 = [(AABeneficiary *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_beneficiaryID, a3);
    objc_storeStrong((id *)&v10->_benefactorAltDSID, a4);
  }

  return v10;
}

- (AABeneficiary)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AABeneficiary *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_beneficiaryID"];
    beneficiaryID = v5->_beneficiaryID;
    v5->_beneficiaryID = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_benefactorAltDSID"];
    benefactorAltDSID = v5->_benefactorAltDSID;
    v5->_benefactorAltDSID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_accessKey"];
    accessKey = v5->_accessKey;
    v5->_accessKey = (AKInheritanceAccessKey *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  beneficiaryID = self->_beneficiaryID;
  id v5 = a3;
  [v5 encodeObject:beneficiaryID forKey:@"_beneficiaryID"];
  [v5 encodeObject:self->_benefactorAltDSID forKey:@"_benefactorAltDSID"];
  [v5 encodeObject:self->_accessKey forKey:@"_accessKey"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSUUID *)self->_beneficiaryID copy];
  uint64_t v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(NSString *)self->_benefactorAltDSID copy];
  uint64_t v8 = (void *)v4[2];
  v4[2] = v7;

  uint64_t v9 = [(AKInheritanceAccessKey *)self->_accessKey copy];
  uint64_t v10 = (void *)v4[3];
  v4[3] = v9;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@: %p> \nBeneficiaryID %@ \nBenefactorAltDSID %@", objc_opt_class(), self, self->_beneficiaryID, self->_benefactorAltDSID];
}

- (NSUUID)beneficiaryID
{
  return self->_beneficiaryID;
}

- (NSString)benefactorAltDSID
{
  return self->_benefactorAltDSID;
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
  objc_storeStrong((id *)&self->_benefactorAltDSID, 0);

  objc_storeStrong((id *)&self->_beneficiaryID, 0);
}

@end