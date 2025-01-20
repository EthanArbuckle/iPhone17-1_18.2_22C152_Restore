@interface ASCLockupFeatureExtendedAttributes
+ (BOOL)supportsSecureCoding;
- (ASCLockupFeatureExtendedAttributes)initWithCoder:(id)a3;
- (ASCLockupFeatureExtendedAttributes)initWithPrivacyPolicyUrl:(id)a3 eula:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)eula;
- (NSString)privacyPolicyUrl;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCLockupFeatureExtendedAttributes

- (ASCLockupFeatureExtendedAttributes)initWithPrivacyPolicyUrl:(id)a3 eula:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ASCLockupFeatureExtendedAttributes;
  v8 = [(ASCLockupFeatureExtendedAttributes *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    privacyPolicyUrl = v8->_privacyPolicyUrl;
    v8->_privacyPolicyUrl = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    eula = v8->_eula;
    v8->_eula = (NSString *)v11;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCLockupFeatureExtendedAttributes)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"privacyPolicyUrl"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eula"];

  id v7 = [(ASCLockupFeatureExtendedAttributes *)self initWithPrivacyPolicyUrl:v5 eula:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASCLockupFeatureExtendedAttributes *)self privacyPolicyUrl];
  [v4 encodeObject:v5 forKey:@"privacyPolicyUrl"];

  id v6 = [(ASCLockupFeatureExtendedAttributes *)self eula];
  [v4 encodeObject:v6 forKey:@"eula"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(ASCHasher);
  id v4 = [(ASCLockupFeatureExtendedAttributes *)self privacyPolicyUrl];
  [(ASCHasher *)v3 combineObject:v4];

  v5 = [(ASCLockupFeatureExtendedAttributes *)self eula];
  [(ASCHasher *)v3 combineObject:v5];

  unint64_t v6 = [(ASCHasher *)v3 finalizeHash];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ASCLockupFeatureExtendedAttributes *)a3;
  if (self != v4)
  {
    objc_opt_class();
    v5 = v4;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        unint64_t v6 = v5;
      }
      else {
        unint64_t v6 = 0;
      }
    }
    else
    {
      unint64_t v6 = 0;
    }
    v8 = v6;

    if (!v8)
    {
      char v7 = 0;
LABEL_21:

      goto LABEL_22;
    }
    uint64_t v9 = [(ASCLockupFeatureExtendedAttributes *)self privacyPolicyUrl];
    uint64_t v10 = [(ASCLockupFeatureExtendedAttributes *)v8 privacyPolicyUrl];
    uint64_t v11 = (void *)v10;
    if (v9 && v10)
    {
      if ([v9 isEqual:v10]) {
        goto LABEL_12;
      }
    }
    else if (v9 == (void *)v10)
    {
LABEL_12:
      v12 = [(ASCLockupFeatureExtendedAttributes *)self eula];
      uint64_t v13 = [(ASCLockupFeatureExtendedAttributes *)v8 eula];
      objc_super v14 = (void *)v13;
      if (v12 && v13) {
        char v7 = [v12 isEqual:v13];
      }
      else {
        char v7 = v12 == (void *)v13;
      }

      goto LABEL_20;
    }
    char v7 = 0;
LABEL_20:

    goto LABEL_21;
  }
  char v7 = 1;
LABEL_22:

  return v7;
}

- (NSString)description
{
  v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCLockupFeatureExtendedAttributes *)self privacyPolicyUrl];
  [(ASCDescriber *)v3 addObject:v4 withName:@"privacyPolicyUrl"];

  v5 = [(ASCLockupFeatureExtendedAttributes *)self eula];
  [(ASCDescriber *)v3 addObject:v5 withName:@"eula"];

  unint64_t v6 = [(ASCDescriber *)v3 finalizeDescription];

  return (NSString *)v6;
}

- (NSString)privacyPolicyUrl
{
  return self->_privacyPolicyUrl;
}

- (NSString)eula
{
  return self->_eula;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eula, 0);

  objc_storeStrong((id *)&self->_privacyPolicyUrl, 0);
}

@end