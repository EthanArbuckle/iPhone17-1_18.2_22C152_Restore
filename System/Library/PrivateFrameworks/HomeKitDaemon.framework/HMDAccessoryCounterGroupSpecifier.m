@interface HMDAccessoryCounterGroupSpecifier
+ (BOOL)supportsSecureCoding;
+ (id)specifierWithGroupName:(id)a3 homeUUID:(id)a4 accessoryUUID:(id)a5 date:(id)a6;
- (BOOL)isEqual:(id)a3;
- (HMDAccessoryCounterGroupSpecifier)initWithCoder:(id)a3;
- (HMDAccessoryCounterGroupSpecifier)initWithGroupName:(id)a3 homeUUID:(id)a4 accessoryUUID:(id)a5 date:(id)a6;
- (NSUUID)accessoryUUID;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDAccessoryCounterGroupSpecifier

- (void).cxx_destruct
{
}

- (NSUUID)accessoryUUID
{
  return self->_accessoryUUID;
}

- (id)description
{
  v3 = NSString;
  v4 = [(HMDEventCounterGroupNameSpecifier *)self groupName];
  v5 = [(HMDHouseholdDataEventCounterGroupSpecifier *)self homeUUID];
  v6 = [(HMDAccessoryCounterGroupSpecifier *)self accessoryUUID];
  v7 = [(HMDDateCounterGroupSpecifier *)self date];
  v8 = [v3 stringWithFormat:@"%@/%@/%@/%@", v4, v5, v6, v7];

  return v8;
}

- (unint64_t)hash
{
  v3 = [(HMDEventCounterGroupNameSpecifier *)self groupName];
  uint64_t v4 = [v3 hash];
  v5 = [(HMDHouseholdDataEventCounterGroupSpecifier *)self homeUUID];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(HMDAccessoryCounterGroupSpecifier *)self accessoryUUID];
  uint64_t v8 = [v7 hash];
  v9 = [(HMDDateCounterGroupSpecifier *)self date];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HMDAccessoryCounterGroupSpecifier *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else if ([(HMDAccessoryCounterGroupSpecifier *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    uint64_t v6 = [(HMDEventCounterGroupNameSpecifier *)self groupName];
    v7 = [(HMDEventCounterGroupNameSpecifier *)v5 groupName];
    if ([v6 isEqualToString:v7])
    {
      uint64_t v8 = [(HMDHouseholdDataEventCounterGroupSpecifier *)self homeUUID];
      v9 = [(HMDHouseholdDataEventCounterGroupSpecifier *)v5 homeUUID];
      if (objc_msgSend(v8, "hmf_isEqualToUUID:", v9))
      {
        unint64_t v10 = [(HMDAccessoryCounterGroupSpecifier *)self accessoryUUID];
        v11 = [(HMDAccessoryCounterGroupSpecifier *)v5 accessoryUUID];
        if (objc_msgSend(v10, "hmf_isEqualToUUID:", v11))
        {
          v15 = [(HMDDateCounterGroupSpecifier *)self date];
          v12 = [(HMDDateCounterGroupSpecifier *)v5 date];
          char v13 = [v15 isEqualToDate:v12];
        }
        else
        {
          char v13 = 0;
        }
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HMDAccessoryCounterGroupSpecifier;
  id v4 = a3;
  [(HMDHouseholdDataEventCounterGroupSpecifier *)&v6 encodeWithCoder:v4];
  v5 = [(HMDAccessoryCounterGroupSpecifier *)self accessoryUUID];
  [v4 encodeObject:v5 forKey:@"accessoryUUID"];
}

- (HMDAccessoryCounterGroupSpecifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDAccessoryCounterGroupSpecifier;
  v5 = [(HMDHouseholdDataEventCounterGroupSpecifier *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessoryUUID"];
    accessoryUUID = v5->_accessoryUUID;
    v5->_accessoryUUID = (NSUUID *)v6;
  }
  return v5;
}

- (HMDAccessoryCounterGroupSpecifier)initWithGroupName:(id)a3 homeUUID:(id)a4 accessoryUUID:(id)a5 date:(id)a6
{
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDAccessoryCounterGroupSpecifier;
  v12 = [(HMDHouseholdDataEventCounterGroupSpecifier *)&v15 initWithGroupName:a3 homeUUID:a4 date:a6];
  char v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_accessoryUUID, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)specifierWithGroupName:(id)a3 homeUUID:(id)a4 accessoryUUID:(id)a5 date:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  char v13 = [[HMDAccessoryCounterGroupSpecifier alloc] initWithGroupName:v12 homeUUID:v11 accessoryUUID:v10 date:v9];

  return v13;
}

@end