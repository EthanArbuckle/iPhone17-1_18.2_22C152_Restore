@interface HMDEventCounterGroupNameSpecifier
+ (BOOL)supportsSecureCoding;
+ (id)specifierWithGroupName:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToGroupNameSpecifier:(id)a3;
- (HMDEventCounterGroupNameSpecifier)initWithCoder:(id)a3;
- (HMDEventCounterGroupNameSpecifier)initWithGroupName:(id)a3;
- (NSString)description;
- (NSString)groupName;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDEventCounterGroupNameSpecifier

- (unint64_t)hash
{
  v2 = [(HMDEventCounterGroupNameSpecifier *)self groupName];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqualToGroupNameSpecifier:(id)a3
{
  id v4 = a3;
  v5 = [(HMDEventCounterGroupNameSpecifier *)self groupName];
  v6 = [v4 groupName];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void).cxx_destruct
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDEventCounterGroupNameSpecifier *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else if ([(HMDEventCounterGroupNameSpecifier *)v4 isMemberOfClass:objc_opt_class()])
  {
    BOOL v5 = [(HMDEventCounterGroupNameSpecifier *)self isEqualToGroupNameSpecifier:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (HMDEventCounterGroupNameSpecifier)initWithGroupName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDEventCounterGroupNameSpecifier;
  v6 = [(HMDEventCounterGroupNameSpecifier *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_groupName, a3);
  }

  return v7;
}

+ (id)specifierWithGroupName:(id)a3
{
  id v3 = a3;
  id v4 = [[HMDEventCounterGroupNameSpecifier alloc] initWithGroupName:v3];

  return v4;
}

- (NSString)description
{
  v2 = [(HMDEventCounterGroupNameSpecifier *)self groupName];
  id v3 = [v2 description];

  return (NSString *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDEventCounterGroupNameSpecifier *)self groupName];
  [v4 encodeObject:v5 forKey:@"groupName"];
}

- (HMDEventCounterGroupNameSpecifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDEventCounterGroupNameSpecifier;
  id v5 = [(HMDEventCounterGroupNameSpecifier *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupName"];
    groupName = v5->_groupName;
    v5->_groupName = (NSString *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end