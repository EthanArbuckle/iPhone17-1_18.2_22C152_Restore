@interface HMAccessoryProfile
- (BOOL)isEqual:(id)a3;
- (BOOL)mergeFromNewObject:(id)a3;
- (HMAccessory)accessory;
- (HMAccessoryProfile)initWithAccessoryProfile:(id)a3;
- (NSArray)services;
- (NSString)description;
- (NSUUID)profileUniqueIdentifier;
- (NSUUID)uniqueIdentifier;
- (_HMAccessoryProfile)accessoryProfile;
- (id)assistantIdentifier;
- (unint64_t)hash;
- (void)handleRuntimeStateUpdate:(id)a3;
- (void)recomputeAssistantIdentifier;
- (void)refreshStateWithCompletionHandler:(id)a3;
@end

@implementation HMAccessoryProfile

- (NSArray)services
{
  v2 = [(HMAccessoryProfile *)self accessoryProfile];
  v3 = [v2 services];

  return (NSArray *)v3;
}

- (unint64_t)hash
{
  v2 = [(HMAccessoryProfile *)self accessoryProfile];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (_HMAccessoryProfile)accessoryProfile
{
  return self->_accessoryProfile;
}

- (HMAccessoryProfile)initWithAccessoryProfile:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMAccessoryProfile;
  v6 = [(HMAccessoryProfile *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accessoryProfile, a3);
  }

  return v7;
}

- (NSUUID)uniqueIdentifier
{
  v2 = [(HMAccessoryProfile *)self accessoryProfile];
  unint64_t v3 = [v2 uniqueIdentifier];

  return (NSUUID *)v3;
}

- (void)handleRuntimeStateUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [(HMAccessoryProfile *)self accessoryProfile];
  [v5 handleRuntimeStateUpdate:v4];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMAccessoryProfile *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(HMAccessoryProfile *)self accessoryProfile];
      v7 = [(HMAccessoryProfile *)v5 accessoryProfile];

      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (HMAccessory)accessory
{
  v2 = [(HMAccessoryProfile *)self accessoryProfile];
  unint64_t v3 = [v2 accessory];

  return (HMAccessory *)v3;
}

- (NSString)description
{
  v2 = NSString;
  unint64_t v3 = [(HMAccessoryProfile *)self accessoryProfile];
  id v4 = [v2 stringWithFormat:@"Wrapping %@", v3];

  return (NSString *)v4;
}

- (void).cxx_destruct
{
}

- (void)refreshStateWithCompletionHandler:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if (!v4)
  {
    if (v8)
    {
      v11 = HMFGetLogIdentifier();
      int v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_ERROR, "%{public}@nil completion handler", (uint8_t *)&v13, 0xCu);
    }
    id v12 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"You must provide a completion handler" userInfo:0];
    objc_exception_throw(v12);
  }
  if (v8)
  {
    objc_super v9 = HMFGetLogIdentifier();
    int v13 = 138543362;
    v14 = v9;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_ERROR, "%{public}@Refreshing state is not supported on this accessory profile", (uint8_t *)&v13, 0xCu);
  }
  v10 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
  v4[2](v4, v10);
}

- (id)assistantIdentifier
{
  v2 = [(HMAccessoryProfile *)self accessoryProfile];
  unint64_t v3 = [v2 assistantIdentifier];

  return v3;
}

- (void)recomputeAssistantIdentifier
{
  id v2 = [(HMAccessoryProfile *)self accessoryProfile];
  [v2 recomputeAssistantIdentifier];
}

- (NSUUID)profileUniqueIdentifier
{
  id v2 = [(HMAccessoryProfile *)self accessoryProfile];
  unint64_t v3 = [v2 profileUniqueIdentifier];

  return (NSUUID *)v3;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  return 0;
}

@end