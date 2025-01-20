@interface AAInheritanceInvitation
+ (BOOL)supportsSecureCoding;
- (AAInheritanceInvitation)initWithBeneficiaryID:(id)a3 beneficiaryHandle:(id)a4;
- (AAInheritanceInvitation)initWithBeneficiaryID:(id)a3 beneficiaryHandle:(id)a4 beneficiaryFirstName:(id)a5 beneficiaryLastName:(id)a6 beneficiaryDisplayName:(id)a7 status:(int64_t)a8;
- (AAInheritanceInvitation)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)beneficiaryDisplayName;
- (NSString)beneficiaryFirstName;
- (NSString)beneficiaryHandle;
- (NSString)beneficiaryLastName;
- (NSUUID)beneficiaryID;
- (id)_statusDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)status;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AAInheritanceInvitation

- (AAInheritanceInvitation)initWithBeneficiaryID:(id)a3 beneficiaryHandle:(id)a4
{
  return [(AAInheritanceInvitation *)self initWithBeneficiaryID:a3 beneficiaryHandle:a4 beneficiaryFirstName:0 beneficiaryLastName:0 beneficiaryDisplayName:0 status:1];
}

- (AAInheritanceInvitation)initWithBeneficiaryID:(id)a3 beneficiaryHandle:(id)a4 beneficiaryFirstName:(id)a5 beneficiaryLastName:(id)a6 beneficiaryDisplayName:(id)a7 status:(int64_t)a8
{
  id v22 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)AAInheritanceInvitation;
  v18 = [(AAInheritanceInvitation *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_beneficiaryID, a3);
    objc_storeStrong((id *)&v19->_beneficiaryHandle, a4);
    objc_storeStrong((id *)&v19->_beneficiaryFirstName, a5);
    objc_storeStrong((id *)&v19->_beneficiaryLastName, a6);
    objc_storeStrong((id *)&v19->_beneficiaryDisplayName, a7);
    v19->_status = a8;
  }

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  beneficiaryID = self->_beneficiaryID;
  id v5 = a3;
  [v5 encodeObject:beneficiaryID forKey:@"_beneficiaryID"];
  [v5 encodeObject:self->_beneficiaryHandle forKey:@"_beneficiaryHandle"];
  [v5 encodeObject:self->_beneficiaryFirstName forKey:@"_beneficiaryFirstName"];
  [v5 encodeObject:self->_beneficiaryLastName forKey:@"_beneficiaryLastName"];
  [v5 encodeObject:self->_beneficiaryDisplayName forKey:@"_beneficiaryHandle"];
  id v6 = [NSNumber numberWithInteger:self->_status];
  [v5 encodeObject:v6 forKey:@"_status"];
}

- (AAInheritanceInvitation)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AAInheritanceInvitation *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_beneficiaryID"];
    beneficiaryID = v5->_beneficiaryID;
    v5->_beneficiaryID = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_beneficiaryHandle"];
    beneficiaryHandle = v5->_beneficiaryHandle;
    v5->_beneficiaryHandle = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_beneficiaryFirstName"];
    beneficiaryFirstName = v5->_beneficiaryFirstName;
    v5->_beneficiaryFirstName = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_beneficiaryLastName"];
    beneficiaryLastName = v5->_beneficiaryLastName;
    v5->_beneficiaryLastName = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_beneficiaryHandle"];
    beneficiaryDisplayName = v5->_beneficiaryDisplayName;
    v5->_beneficiaryDisplayName = (NSString *)v14;

    id v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_status"];
    v5->_status = [v16 integerValue];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSUUID *)self->_beneficiaryID copy];
  uint64_t v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(NSString *)self->_beneficiaryHandle copy];
  uint64_t v8 = (void *)v4[2];
  v4[2] = v7;

  uint64_t v9 = [(NSString *)self->_beneficiaryFirstName copy];
  uint64_t v10 = (void *)v4[3];
  v4[3] = v9;

  uint64_t v11 = [(NSString *)self->_beneficiaryLastName copy];
  uint64_t v12 = (void *)v4[4];
  v4[4] = v11;

  uint64_t v13 = [(NSString *)self->_beneficiaryDisplayName copy];
  uint64_t v14 = (void *)v4[5];
  v4[5] = v13;

  v4[6] = self->_status;
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AAInheritanceInvitation *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t v6 = [(AAInheritanceInvitation *)self beneficiaryID];
      uint64_t v7 = [(AAInheritanceInvitation *)v5 beneficiaryID];

      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (id)_statusDescription
{
  int64_t v2 = [(AAInheritanceInvitation *)self status];
  if ((unint64_t)(v2 + 1) > 5) {
    return 0;
  }
  else {
    return *(&off_1E5A48DB0 + v2 + 1);
  }
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(AAInheritanceInvitation *)self _statusDescription];
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p> Inheritance Invitation with Status: %@ \nBeneficiary ID: %@ \nBeneficiary Handle: %@ \nBeneficiary FirstName: %@, \nBeneficiary LastName: %@ \nBeneficiary DisplayName: %@", v4, self, v5, self->_beneficiaryID, self->_beneficiaryHandle, self->_beneficiaryFirstName, self->_beneficiaryLastName, self->_beneficiaryDisplayName];

  return v6;
}

- (NSUUID)beneficiaryID
{
  return self->_beneficiaryID;
}

- (NSString)beneficiaryHandle
{
  return self->_beneficiaryHandle;
}

- (NSString)beneficiaryFirstName
{
  return self->_beneficiaryFirstName;
}

- (NSString)beneficiaryLastName
{
  return self->_beneficiaryLastName;
}

- (NSString)beneficiaryDisplayName
{
  return self->_beneficiaryDisplayName;
}

- (int64_t)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_beneficiaryDisplayName, 0);
  objc_storeStrong((id *)&self->_beneficiaryLastName, 0);
  objc_storeStrong((id *)&self->_beneficiaryFirstName, 0);
  objc_storeStrong((id *)&self->_beneficiaryHandle, 0);

  objc_storeStrong((id *)&self->_beneficiaryID, 0);
}

@end