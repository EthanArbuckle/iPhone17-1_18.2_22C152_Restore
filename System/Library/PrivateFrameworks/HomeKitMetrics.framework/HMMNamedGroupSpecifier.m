@interface HMMNamedGroupSpecifier
+ (NSString)type;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToGroupNameSpecifier:(id)a3;
- (HMMNamedGroupSpecifier)initWithGroupName:(id)a3;
- (NSDictionary)descriptor;
- (NSString)description;
- (NSString)groupName;
- (id)coreDataGroupUsingContext:(id)a3;
- (unint64_t)hash;
@end

@implementation HMMNamedGroupSpecifier

- (void).cxx_destruct
{
}

- (NSString)groupName
{
  return self->_groupName;
}

- (NSString)description
{
  v2 = [(HMMNamedGroupSpecifier *)self groupName];
  v3 = [v2 description];

  return (NSString *)v3;
}

- (unint64_t)hash
{
  v2 = [(HMMNamedGroupSpecifier *)self groupName];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqualToGroupNameSpecifier:(id)a3
{
  id v4 = a3;
  v5 = [(HMMNamedGroupSpecifier *)self groupName];
  v6 = [v4 groupName];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMMNamedGroupSpecifier *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else if ([(HMMNamedGroupSpecifier *)v4 isMemberOfClass:objc_opt_class()])
  {
    BOOL v5 = [(HMMNamedGroupSpecifier *)self isEqualToGroupNameSpecifier:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)coreDataGroupUsingContext:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"NamedGroup"];
  v6 = (void *)MEMORY[0x1E4F28F60];
  v7 = [(HMMNamedGroupSpecifier *)self groupName];
  v8 = [v6 predicateWithFormat:@"name == %@", v7];
  [v5 setPredicate:v8];

  [v5 setIncludesSubentities:0];
  id v24 = 0;
  v9 = [v4 executeFetchRequest:v5 error:&v24];
  id v10 = v24;
  if ([v9 count])
  {
    if ([v9 count] == 1)
    {
      v11 = [v9 objectAtIndexedSubscript:0];
    }
    else
    {
      v18 = (void *)MEMORY[0x1D944E970]();
      v19 = self;
      v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = HMFGetLogIdentifier();
        v22 = [(HMMNamedGroupSpecifier *)v19 groupName];
        *(_DWORD *)buf = 138543618;
        v26 = v21;
        __int16 v27 = 2114;
        v28 = v22;
        _os_log_impl(&dword_1D4999000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unexpected extra groups returned for group %{public}@", buf, 0x16u);
      }
      v11 = 0;
    }
  }
  else
  {
    if (v10)
    {
      v12 = (void *)MEMORY[0x1D944E970]();
      v13 = self;
      v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = HMFGetLogIdentifier();
        v16 = [(HMMNamedGroupSpecifier *)v13 groupName];
        *(_DWORD *)buf = 138543874;
        v26 = v15;
        __int16 v27 = 2114;
        v28 = v16;
        __int16 v29 = 2114;
        id v30 = v10;
        _os_log_impl(&dword_1D4999000, v14, OS_LOG_TYPE_ERROR, "%{public}@Error getting group %{public}@: %{public}@", buf, 0x20u);
      }
    }
    v11 = [[HMMCoreDataNamedGroup alloc] initWithContext:v4];
    v17 = [(HMMNamedGroupSpecifier *)self groupName];
    [(HMMCoreDataNamedGroup *)v11 setName:v17];
  }
  return v11;
}

- (NSDictionary)descriptor
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v5[0] = HMMGroupDescriptorGroupType;
  v5[1] = HMMGroupDescriptorGroupName;
  v6[0] = @"namedGroup";
  v2 = [(HMMNamedGroupSpecifier *)self groupName];
  v6[1] = v2;
  unint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];

  return (NSDictionary *)v3;
}

- (HMMNamedGroupSpecifier)initWithGroupName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMMNamedGroupSpecifier;
  v6 = [(HMMNamedGroupSpecifier *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_groupName, a3);
  }

  return v7;
}

+ (NSString)type
{
  if ((id)objc_opt_class() != a1)
  {
    id v4 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v5 = *MEMORY[0x1E4F1C3B8];
    v6 = NSString;
    v7 = NSStringFromSelector(a2);
    v8 = [v6 stringWithFormat:@"You must override %@ in a subclass", v7];
    id v9 = [v4 exceptionWithName:v5 reason:v8 userInfo:0];

    objc_exception_throw(v9);
  }
  return (NSString *)@"namedGroup";
}

@end