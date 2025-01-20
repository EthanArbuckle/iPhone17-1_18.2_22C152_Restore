@interface AKInheritanceCLIContext
+ (BOOL)supportsSecureCoding;
- (AKInheritanceCLIContext)initWithCoder:(id)a3;
- (NSString)accessKeyString;
- (NSString)beneficiaryFirstName;
- (NSString)beneficiaryLastName;
- (NSString)beneficiaryPassword;
- (NSString)identityToken;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessKeyString:(id)a3;
- (void)setBeneficiaryFirstName:(id)a3;
- (void)setBeneficiaryLastName:(id)a3;
- (void)setBeneficiaryPassword:(id)a3;
- (void)setIdentityToken:(id)a3;
@end

@implementation AKInheritanceCLIContext

- (AKInheritanceCLIContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AKInheritanceCLIContext;
  v5 = [(AKInheritanceContext *)&v17 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_accessKey"];
    accessKeyString = v5->_accessKeyString;
    v5->_accessKeyString = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_beneficiaryPassword"];
    beneficiaryPassword = v5->_beneficiaryPassword;
    v5->_beneficiaryPassword = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_beneficiaryFirstName"];
    beneficiaryFirstName = v5->_beneficiaryFirstName;
    v5->_beneficiaryFirstName = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_beneficiaryLastName"];
    beneficiaryLastName = v5->_beneficiaryLastName;
    v5->_beneficiaryLastName = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identityToken"];
    identityToken = v5->_identityToken;
    v5->_identityToken = (NSString *)v14;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)AKInheritanceCLIContext;
  id v4 = [(AKInheritanceContext *)&v16 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_accessKeyString copy];
  uint64_t v6 = (void *)v4[7];
  v4[7] = v5;

  uint64_t v7 = [(NSString *)self->_beneficiaryPassword copy];
  uint64_t v8 = (void *)v4[8];
  v4[8] = v7;

  uint64_t v9 = [(NSString *)self->_beneficiaryFirstName copy];
  uint64_t v10 = (void *)v4[9];
  v4[9] = v9;

  uint64_t v11 = [(NSString *)self->_beneficiaryLastName copy];
  uint64_t v12 = (void *)v4[10];
  v4[10] = v11;

  uint64_t v13 = [(NSString *)self->_identityToken copy];
  uint64_t v14 = (void *)v4[11];
  v4[11] = v13;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AKInheritanceCLIContext;
  id v4 = a3;
  [(AKInheritanceContext *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_accessKeyString, @"_accessKey", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_beneficiaryPassword forKey:@"_beneficiaryPassword"];
  [v4 encodeObject:self->_beneficiaryFirstName forKey:@"_beneficiaryFirstName"];
  [v4 encodeObject:self->_beneficiaryLastName forKey:@"_beneficiaryLastName"];
  [v4 encodeObject:self->_identityToken forKey:@"_identityToken"];
}

- (id)description
{
  v2 = NSString;
  accessKeyString = self->_accessKeyString;
  beneficiaryPassword = self->_beneficiaryPassword;
  beneficiaryFirstName = self->_beneficiaryFirstName;
  beneficiaryLastName = self->_beneficiaryLastName;
  identityToken = self->_identityToken;
  uint64_t v8 = [(AKInheritanceContext *)self beneficiarySetupToken];
  uint64_t v9 = [v2 stringWithFormat:@"Access Key: %@ \nbeneficiaryPassword: %@\nbeneficiaryFirstName: %@\nbeneficiaryLastName: %@\nidentityToken: %@\nauthToken: %@", accessKeyString, beneficiaryPassword, beneficiaryFirstName, beneficiaryLastName, identityToken, v8];

  return v9;
}

- (NSString)accessKeyString
{
  return self->_accessKeyString;
}

- (void)setAccessKeyString:(id)a3
{
}

- (NSString)beneficiaryPassword
{
  return self->_beneficiaryPassword;
}

- (void)setBeneficiaryPassword:(id)a3
{
}

- (NSString)beneficiaryFirstName
{
  return self->_beneficiaryFirstName;
}

- (void)setBeneficiaryFirstName:(id)a3
{
}

- (NSString)beneficiaryLastName
{
  return self->_beneficiaryLastName;
}

- (void)setBeneficiaryLastName:(id)a3
{
}

- (NSString)identityToken
{
  return self->_identityToken;
}

- (void)setIdentityToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityToken, 0);
  objc_storeStrong((id *)&self->_beneficiaryLastName, 0);
  objc_storeStrong((id *)&self->_beneficiaryFirstName, 0);
  objc_storeStrong((id *)&self->_beneficiaryPassword, 0);

  objc_storeStrong((id *)&self->_accessKeyString, 0);
}

@end