@interface HMMHomeGroupSpecifier
+ (id)type;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToHomeGroupSpecifier:(id)a3;
- (HMMHomeGroupSpecifier)initWithHomeUUID:(id)a3 groupName:(id)a4;
- (NSUUID)homeUUID;
- (id)coreDataGroupUsingContext:(id)a3;
- (id)description;
- (id)descriptor;
- (unint64_t)hash;
@end

@implementation HMMHomeGroupSpecifier

- (void).cxx_destruct
{
}

- (NSUUID)homeUUID
{
  return self->_homeUUID;
}

- (id)description
{
  v3 = NSString;
  v4 = [(HMMNamedGroupSpecifier *)self groupName];
  v5 = [(HMMHomeGroupSpecifier *)self homeUUID];
  v6 = [v3 stringWithFormat:@"%@/%@", v4, v5];

  return v6;
}

- (unint64_t)hash
{
  v3 = [(HMMNamedGroupSpecifier *)self groupName];
  uint64_t v4 = 3 * [v3 hash];
  v5 = [(HMMHomeGroupSpecifier *)self homeUUID];
  unint64_t v6 = [v5 hash] + v4;

  return v6;
}

- (BOOL)isEqualToHomeGroupSpecifier:(id)a3
{
  id v4 = a3;
  v5 = [(HMMNamedGroupSpecifier *)self groupName];
  unint64_t v6 = [v4 groupName];
  if ([v5 isEqualToString:v6])
  {
    v7 = [(HMMHomeGroupSpecifier *)self homeUUID];
    v8 = [v4 homeUUID];
    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMMHomeGroupSpecifier *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else if ([(HMMHomeGroupSpecifier *)v4 isMemberOfClass:objc_opt_class()])
  {
    BOOL v5 = [(HMMHomeGroupSpecifier *)self isEqualToHomeGroupSpecifier:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)coreDataGroupUsingContext:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"HomeGroup"];
  unint64_t v6 = (void *)MEMORY[0x1E4F28F60];
  v7 = [(HMMNamedGroupSpecifier *)self groupName];
  v8 = [(HMMHomeGroupSpecifier *)self homeUUID];
  char v9 = [v6 predicateWithFormat:@"(name == %@) && (homeUUID == %@)", v7, v8];
  [v5 setPredicate:v9];

  [v5 setIncludesSubentities:0];
  id v26 = 0;
  v10 = [v4 executeFetchRequest:v5 error:&v26];
  id v11 = v26;
  if ([v10 count])
  {
    if ([v10 count] == 1)
    {
      v12 = [v10 objectAtIndexedSubscript:0];
    }
    else
    {
      v20 = (void *)MEMORY[0x1D944E970]();
      v21 = self;
      v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = HMFGetLogIdentifier();
        v24 = [(HMMNamedGroupSpecifier *)v21 groupName];
        *(_DWORD *)buf = 138543618;
        v28 = v23;
        __int16 v29 = 2114;
        v30 = v24;
        _os_log_impl(&dword_1D4999000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unexpected extra groups returned for group %{public}@", buf, 0x16u);
      }
      v12 = 0;
    }
  }
  else
  {
    if (v11)
    {
      v13 = (void *)MEMORY[0x1D944E970]();
      v14 = self;
      v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = HMFGetLogIdentifier();
        v17 = [(HMMNamedGroupSpecifier *)v14 groupName];
        *(_DWORD *)buf = 138543874;
        v28 = v16;
        __int16 v29 = 2114;
        v30 = v17;
        __int16 v31 = 2114;
        id v32 = v11;
        _os_log_impl(&dword_1D4999000, v15, OS_LOG_TYPE_ERROR, "%{public}@Error getting group %{public}@: %{public}@", buf, 0x20u);
      }
    }
    v12 = [[HMMCoreDataHomeGroup alloc] initWithContext:v4];
    v18 = [(HMMNamedGroupSpecifier *)self groupName];
    [(HMMCoreDataHomeGroup *)v12 setName:v18];

    v19 = [(HMMHomeGroupSpecifier *)self homeUUID];
    [(HMMCoreDataHomeGroup *)v12 setHomeUUID:v19];
  }
  return v12;
}

- (id)descriptor
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v9[0] = @"homeGroup";
  v8[0] = HMMGroupDescriptorGroupType;
  v8[1] = HMMGroupDescriptorGroupName;
  v3 = [(HMMNamedGroupSpecifier *)self groupName];
  v9[1] = v3;
  v8[2] = HMMGroupDescriptorHomeUUID;
  id v4 = [(HMMHomeGroupSpecifier *)self homeUUID];
  BOOL v5 = [v4 UUIDString];
  v9[2] = v5;
  unint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

- (HMMHomeGroupSpecifier)initWithHomeUUID:(id)a3 groupName:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMMHomeGroupSpecifier;
  v8 = [(HMMNamedGroupSpecifier *)&v11 initWithGroupName:a4];
  char v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_homeUUID, a3);
  }

  return v9;
}

+ (id)type
{
  if ((id)objc_opt_class() != a1)
  {
    id v4 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v5 = *MEMORY[0x1E4F1C3B8];
    unint64_t v6 = NSString;
    id v7 = NSStringFromSelector(a2);
    v8 = [v6 stringWithFormat:@"You must override %@ in a subclass", v7];
    id v9 = [v4 exceptionWithName:v5 reason:v8 userInfo:0];

    objc_exception_throw(v9);
  }
  return @"homeGroup";
}

@end