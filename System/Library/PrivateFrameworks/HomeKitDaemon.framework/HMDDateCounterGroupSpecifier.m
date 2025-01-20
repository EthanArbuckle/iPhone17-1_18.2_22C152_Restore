@interface HMDDateCounterGroupSpecifier
+ (BOOL)supportsSecureCoding;
+ (id)specifierWithGroupName:(id)a3 date:(id)a4;
- (BOOL)isEqual:(id)a3;
- (HMDDateCounterGroupSpecifier)initWithCoder:(id)a3;
- (HMDDateCounterGroupSpecifier)initWithGroupName:(id)a3 date:(id)a4;
- (NSDate)date;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDDateCounterGroupSpecifier

- (void).cxx_destruct
{
}

- (NSDate)date
{
  return self->_date;
}

- (id)description
{
  v3 = NSString;
  v4 = [(HMDEventCounterGroupNameSpecifier *)self groupName];
  v5 = [(HMDDateCounterGroupSpecifier *)self date];
  v6 = [v3 stringWithFormat:@"%@/%@", v4, v5];

  return v6;
}

- (unint64_t)hash
{
  v3 = [(HMDEventCounterGroupNameSpecifier *)self groupName];
  uint64_t v4 = [v3 hash];
  v5 = [(HMDDateCounterGroupSpecifier *)self date];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HMDDateCounterGroupSpecifier *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else if ([(HMDDateCounterGroupSpecifier *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    unint64_t v6 = [(HMDEventCounterGroupNameSpecifier *)self groupName];
    v7 = [(HMDEventCounterGroupNameSpecifier *)v5 groupName];
    if ([v6 isEqualToString:v7])
    {
      v8 = [(HMDDateCounterGroupSpecifier *)self date];
      v9 = [(HMDDateCounterGroupSpecifier *)v5 date];
      char v10 = [v8 isEqualToDate:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HMDDateCounterGroupSpecifier;
  id v4 = a3;
  [(HMDEventCounterGroupNameSpecifier *)&v6 encodeWithCoder:v4];
  v5 = [(HMDDateCounterGroupSpecifier *)self date];
  [v4 encodeObject:v5 forKey:@"date"];
}

- (HMDDateCounterGroupSpecifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDDateCounterGroupSpecifier;
  v5 = [(HMDEventCounterGroupNameSpecifier *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    date = v5->_date;
    v5->_date = (NSDate *)v6;
  }
  return v5;
}

- (HMDDateCounterGroupSpecifier)initWithGroupName:(id)a3 date:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDDateCounterGroupSpecifier;
  v8 = [(HMDEventCounterGroupNameSpecifier *)&v11 initWithGroupName:a3];
  objc_super v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_date, a4);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)specifierWithGroupName:(id)a3 date:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[HMDDateCounterGroupSpecifier alloc] initWithGroupName:v6 date:v5];

  return v7;
}

@end