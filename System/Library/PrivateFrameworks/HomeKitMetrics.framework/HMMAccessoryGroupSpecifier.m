@interface HMMAccessoryGroupSpecifier
+ (id)type;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAccessoryGroupSpecifier:(id)a3;
- (HMMAccessoryGroupSpecifier)initWithAccessoryUUID:(id)a3 homeUUID:(id)a4 groupName:(id)a5;
- (NSUUID)accessoryUUID;
- (id)coreDataGroupUsingContext:(id)a3;
- (id)description;
- (id)descriptor;
- (unint64_t)hash;
@end

@implementation HMMAccessoryGroupSpecifier

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
  v4 = [(HMMNamedGroupSpecifier *)self groupName];
  v5 = [(HMMHomeGroupSpecifier *)self homeUUID];
  v6 = [(HMMAccessoryGroupSpecifier *)self accessoryUUID];
  v7 = [v3 stringWithFormat:@"%@/%@/%@", v4, v5, v6];

  return v7;
}

- (unint64_t)hash
{
  v3 = [(HMMNamedGroupSpecifier *)self groupName];
  uint64_t v4 = 3 * [v3 hash];
  v5 = [(HMMHomeGroupSpecifier *)self homeUUID];
  uint64_t v6 = 5 * [v5 hash] + v4;
  v7 = [(HMMAccessoryGroupSpecifier *)self accessoryUUID];
  unint64_t v8 = v6 + [v7 hash];

  return v8;
}

- (BOOL)isEqualToAccessoryGroupSpecifier:(id)a3
{
  id v4 = a3;
  v5 = [(HMMNamedGroupSpecifier *)self groupName];
  uint64_t v6 = [v4 groupName];
  if ([v5 isEqualToString:v6])
  {
    v7 = [(HMMHomeGroupSpecifier *)self homeUUID];
    unint64_t v8 = [v4 homeUUID];
    if ([v7 isEqual:v8])
    {
      v9 = [(HMMAccessoryGroupSpecifier *)self accessoryUUID];
      v10 = [v4 accessoryUUID];
      char v11 = [v9 isEqual:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMMAccessoryGroupSpecifier *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else if ([(HMMAccessoryGroupSpecifier *)v4 isMemberOfClass:objc_opt_class()])
  {
    BOOL v5 = [(HMMAccessoryGroupSpecifier *)self isEqualToAccessoryGroupSpecifier:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)coreDataGroupUsingContext:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"AccessoryGroup"];
  uint64_t v6 = (void *)MEMORY[0x1E4F28F60];
  v7 = [(HMMNamedGroupSpecifier *)self groupName];
  unint64_t v8 = [(HMMHomeGroupSpecifier *)self homeUUID];
  v9 = [(HMMAccessoryGroupSpecifier *)self accessoryUUID];
  v10 = [v6 predicateWithFormat:@"(name == %@) && (homeUUID == %@) && (accessoryUUID == %@)", v7, v8, v9];
  [v5 setPredicate:v10];

  [v5 setIncludesSubentities:0];
  id v28 = 0;
  char v11 = [v4 executeFetchRequest:v5 error:&v28];
  id v12 = v28;
  if ([v11 count])
  {
    if ([v11 count] == 1)
    {
      v13 = [v11 objectAtIndexedSubscript:0];
    }
    else
    {
      v22 = (void *)MEMORY[0x1D944E970]();
      v23 = self;
      v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = HMFGetLogIdentifier();
        v26 = [(HMMNamedGroupSpecifier *)v23 groupName];
        *(_DWORD *)buf = 138543618;
        v30 = v25;
        __int16 v31 = 2114;
        v32 = v26;
        _os_log_impl(&dword_1D4999000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unexpected extra accessory groups returned for group %{public}@", buf, 0x16u);
      }
      v13 = 0;
    }
  }
  else
  {
    if (v12)
    {
      v14 = (void *)MEMORY[0x1D944E970]();
      v15 = self;
      v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = HMFGetLogIdentifier();
        v18 = [(HMMNamedGroupSpecifier *)v15 groupName];
        *(_DWORD *)buf = 138543874;
        v30 = v17;
        __int16 v31 = 2114;
        v32 = v18;
        __int16 v33 = 2114;
        id v34 = v12;
        _os_log_impl(&dword_1D4999000, v16, OS_LOG_TYPE_ERROR, "%{public}@Error getting accessory group %{public}@: %{public}@", buf, 0x20u);
      }
    }
    v13 = [[HMMCoreDataAccessoryGroup alloc] initWithContext:v4];
    v19 = [(HMMNamedGroupSpecifier *)self groupName];
    [(HMMCoreDataAccessoryGroup *)v13 setName:v19];

    v20 = [(HMMHomeGroupSpecifier *)self homeUUID];
    [(HMMCoreDataAccessoryGroup *)v13 setHomeUUID:v20];

    v21 = [(HMMAccessoryGroupSpecifier *)self accessoryUUID];
    [(HMMCoreDataAccessoryGroup *)v13 setAccessoryUUID:v21];
  }
  return v13;
}

- (id)descriptor
{
  v11[4] = *MEMORY[0x1E4F143B8];
  v11[0] = @"accessoryGroup";
  v10[0] = HMMGroupDescriptorGroupType;
  v10[1] = HMMGroupDescriptorGroupName;
  v3 = [(HMMNamedGroupSpecifier *)self groupName];
  v11[1] = v3;
  v10[2] = HMMGroupDescriptorHomeUUID;
  id v4 = [(HMMHomeGroupSpecifier *)self homeUUID];
  BOOL v5 = [v4 UUIDString];
  v11[2] = v5;
  v10[3] = HMMGroupDescriptorAccessoryUUID;
  uint64_t v6 = [(HMMAccessoryGroupSpecifier *)self accessoryUUID];
  v7 = [v6 UUIDString];
  v11[3] = v7;
  unint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:4];

  return v8;
}

- (HMMAccessoryGroupSpecifier)initWithAccessoryUUID:(id)a3 homeUUID:(id)a4 groupName:(id)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMMAccessoryGroupSpecifier;
  v10 = [(HMMHomeGroupSpecifier *)&v13 initWithHomeUUID:a4 groupName:a5];
  char v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_accessoryUUID, a3);
  }

  return v11;
}

+ (id)type
{
  if ((id)objc_opt_class() != a1)
  {
    id v4 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v5 = *MEMORY[0x1E4F1C3B8];
    uint64_t v6 = NSString;
    v7 = NSStringFromSelector(a2);
    unint64_t v8 = [v6 stringWithFormat:@"You must override %@ in a subclass", v7];
    id v9 = [v4 exceptionWithName:v5 reason:v8 userInfo:0];

    objc_exception_throw(v9);
  }
  return @"accessoryGroup";
}

@end