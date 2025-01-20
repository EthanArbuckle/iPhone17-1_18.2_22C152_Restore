@interface AABenefactorInfo
+ (BOOL)supportsSecureCoding;
- (AABenefactorInfo)initWithBeneficiaryID:(id)a3 benefactorAltDSID:(id)a4;
- (AABenefactorInfo)initWithBeneficiaryID:(id)a3 benefactorAltDSID:(id)a4 handle:(id)a5;
- (AABenefactorInfo)initWithBeneficiaryID:(id)a3 handle:(id)a4 status:(int64_t)a5;
- (AABenefactorInfo)initWithCoder:(id)a3;
- (AKInheritanceAccessKey)accessKey;
- (NSString)benefactorAltDSID;
- (NSString)description;
- (NSString)handle;
- (NSUUID)beneficiaryID;
- (id)_statusDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)status;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessKey:(id)a3;
@end

@implementation AABenefactorInfo

- (AABenefactorInfo)initWithBeneficiaryID:(id)a3 benefactorAltDSID:(id)a4
{
  return [(AABenefactorInfo *)self initWithBeneficiaryID:a3 benefactorAltDSID:a4 handle:0];
}

- (AABenefactorInfo)initWithBeneficiaryID:(id)a3 benefactorAltDSID:(id)a4 handle:(id)a5
{
  return [(AABenefactorInfo *)self initWithBeneficiaryID:a3 handle:a5 status:1];
}

- (AABenefactorInfo)initWithBeneficiaryID:(id)a3 handle:(id)a4 status:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AABenefactorInfo;
  v11 = [(AABenefactorInfo *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_beneficiaryID, a3);
    objc_storeStrong((id *)&v12->_handle, a4);
    v12->_status = a5;
  }

  return v12;
}

- (AABenefactorInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AABenefactorInfo;
  v5 = [(AABenefactorInfo *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_beneficiaryID"];
    beneficiaryID = v5->_beneficiaryID;
    v5->_beneficiaryID = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_accessKey"];
    accessKey = v5->_accessKey;
    v5->_accessKey = (AKInheritanceAccessKey *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_handle"];
    handle = v5->_handle;
    v5->_handle = (NSString *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_status"];
    v5->_status = [v12 integerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  beneficiaryID = self->_beneficiaryID;
  id v5 = a3;
  [v5 encodeObject:beneficiaryID forKey:@"_beneficiaryID"];
  [v5 encodeObject:self->_accessKey forKey:@"_accessKey"];
  [v5 encodeObject:self->_handle forKey:@"_handle"];
  id v6 = [NSNumber numberWithInteger:self->_status];
  [v5 encodeObject:v6 forKey:@"_status"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSUUID *)self->_beneficiaryID copy];
  id v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(AKInheritanceAccessKey *)self->_accessKey copy];
  uint64_t v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_handle copy];
  uint64_t v10 = (void *)v4[4];
  v4[4] = v9;

  v4[5] = self->_status;
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_statusDescription
{
  int64_t v2 = [(AABenefactorInfo *)self status];
  if ((unint64_t)(v2 + 1) > 5) {
    return 0;
  }
  else {
    return *(&off_1E5A48608 + v2 + 1);
  }
}

- (NSString)description
{
  v3 = NSString;
  id v4 = [(AABenefactorInfo *)self accessKey];
  uint64_t v5 = [v4 claimTokenString];
  id v6 = [(AABenefactorInfo *)self accessKey];
  uint64_t v7 = [v6 wrappingKeyString];
  v19 = [v3 stringWithFormat:@"%@-%@", v5, v7];

  v18 = NSString;
  uint64_t v8 = objc_opt_class();
  beneficiaryID = self->_beneficiaryID;
  handle = self->_handle;
  v11 = [(AABenefactorInfo *)self _statusDescription];
  v12 = [(AABenefactorInfo *)self accessKey];
  v13 = [v12 claimTokenString];
  objc_super v14 = [(AABenefactorInfo *)self accessKey];
  v15 = [v14 wrappingKeyString];
  v16 = [v18 stringWithFormat:@"<%@: %p> \nBeneficiaryID: %@ \nBenefactor Handle: %@ \nStatus: %@ \nClaim Code: %@\nAccess Key: %@\nFull Access Key: %@", v8, self, beneficiaryID, handle, v11, v13, v15, v19];

  return (NSString *)v16;
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

- (NSString)handle
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (int64_t)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_accessKey, 0);
  objc_storeStrong((id *)&self->_benefactorAltDSID, 0);

  objc_storeStrong((id *)&self->_beneficiaryID, 0);
}

@end