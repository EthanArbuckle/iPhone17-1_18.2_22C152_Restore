@interface HMDTimeBasedFlagNameSpecifier
+ (BOOL)supportsSecureCoding;
+ (id)specifierWithFlagName:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToGroupNameSpecifier:(id)a3;
- (HMDTimeBasedFlagNameSpecifier)initWithCoder:(id)a3;
- (HMDTimeBasedFlagNameSpecifier)initWithFlagName:(id)a3;
- (NSString)description;
- (NSString)flagName;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDTimeBasedFlagNameSpecifier

- (void).cxx_destruct
{
}

- (NSString)flagName
{
  return self->_flagName;
}

- (NSString)description
{
  v2 = [(HMDTimeBasedFlagNameSpecifier *)self flagName];
  v3 = [v2 description];

  return (NSString *)v3;
}

- (unint64_t)hash
{
  v2 = [(HMDTimeBasedFlagNameSpecifier *)self flagName];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqualToGroupNameSpecifier:(id)a3
{
  id v4 = a3;
  v5 = [(HMDTimeBasedFlagNameSpecifier *)self flagName];
  v6 = [v4 flagName];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDTimeBasedFlagNameSpecifier *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    if (v6)
    {
      v7 = [(HMDTimeBasedFlagNameSpecifier *)self flagName];
      v8 = [(HMDTimeBasedFlagNameSpecifier *)v6 flagName];
      char v9 = [v7 isEqualToString:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDTimeBasedFlagNameSpecifier *)self flagName];
  [v4 encodeObject:v5 forKey:@"flagName"];
}

- (HMDTimeBasedFlagNameSpecifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDTimeBasedFlagNameSpecifier;
  id v5 = [(HMDTimeBasedFlagNameSpecifier *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"flagName"];
    flagName = v5->_flagName;
    v5->_flagName = (NSString *)v6;
  }
  return v5;
}

- (HMDTimeBasedFlagNameSpecifier)initWithFlagName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDTimeBasedFlagNameSpecifier;
  uint64_t v6 = [(HMDTimeBasedFlagNameSpecifier *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_flagName, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)specifierWithFlagName:(id)a3
{
  id v3 = a3;
  id v4 = [[HMDTimeBasedFlagNameSpecifier alloc] initWithFlagName:v3];

  return v4;
}

@end