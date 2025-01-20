@interface HMSiriEndpointApplyOnboardingSelectionsPayload
+ (id)logCategory;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMSiriEndpointApplyOnboardingSelectionsPayload)initWithAccessoryUUID:(id)a3 onboardingSelections:(id)a4;
- (HMSiriEndpointApplyOnboardingSelectionsPayload)initWithPayload:(id)a3;
- (HMSiriEndpointOnboardingSelections)onboardingSelections;
- (NSArray)attributeDescriptions;
- (NSString)description;
- (NSString)shortDescription;
- (NSUUID)accessoryUUID;
- (id)payloadCopy;
- (unint64_t)hash;
@end

@implementation HMSiriEndpointApplyOnboardingSelectionsPayload

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onboardingSelections, 0);

  objc_storeStrong((id *)&self->_accessoryUUID, 0);
}

- (HMSiriEndpointOnboardingSelections)onboardingSelections
{
  return (HMSiriEndpointOnboardingSelections *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)accessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)hash
{
  v2 = [(HMSiriEndpointApplyOnboardingSelectionsPayload *)self accessoryUUID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMSiriEndpointApplyOnboardingSelectionsPayload *)a3;
  if (v4 == self)
  {
    char v11 = 1;
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
      v7 = [(HMSiriEndpointApplyOnboardingSelectionsPayload *)self accessoryUUID];
      v8 = [(HMSiriEndpointApplyOnboardingSelectionsPayload *)v6 accessoryUUID];
      if (objc_msgSend(v7, "hmf_isEqualToUUID:", v8))
      {
        v9 = [(HMSiriEndpointApplyOnboardingSelectionsPayload *)self onboardingSelections];
        v10 = [(HMSiriEndpointApplyOnboardingSelectionsPayload *)v6 onboardingSelections];
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
  }
  return v11;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSArray)attributeDescriptions
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMSiriEndpointApplyOnboardingSelectionsPayload *)self accessoryUUID];
  v5 = (void *)[v3 initWithName:@"accessoryUUID" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMSiriEndpointApplyOnboardingSelectionsPayload *)self onboardingSelections];
  v8 = (void *)[v6 initWithName:@"onboardingSelections" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];

  return (NSArray *)v9;
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (HMSiriEndpointApplyOnboardingSelectionsPayload)initWithPayload:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(v4, "hmf_UUIDForKey:", @"HMAccessoryUUIDPayloadKey");
  id v6 = objc_msgSend(v4, "hmf_dictionaryForKey:", @"HMSiriEndpointOnboardingSelectionsPayloadKey");
  v7 = [[HMSiriEndpointOnboardingSelections alloc] initWithPayload:v6];
  v8 = v7;
  if (v5 && v7)
  {
    v9 = [(HMSiriEndpointApplyOnboardingSelectionsPayload *)self initWithAccessoryUUID:v5 onboardingSelections:v7];
    v10 = v9;
  }
  else
  {
    char v11 = (void *)MEMORY[0x19F3A64A0]();
    v9 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = HMFGetLogIdentifier();
      int v15 = 138543618;
      v16 = v13;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@Failed to decode apply onboarding selections payload: %@", (uint8_t *)&v15, 0x16u);
    }
    v10 = 0;
  }

  return v10;
}

- (id)payloadCopy
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"HMAccessoryUUIDPayloadKey";
  id v3 = [(HMSiriEndpointApplyOnboardingSelectionsPayload *)self accessoryUUID];
  id v4 = [v3 UUIDString];
  v9[1] = @"HMSiriEndpointOnboardingSelectionsPayloadKey";
  v10[0] = v4;
  v5 = [(HMSiriEndpointApplyOnboardingSelectionsPayload *)self onboardingSelections];
  id v6 = [v5 payloadCopy];
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

- (HMSiriEndpointApplyOnboardingSelectionsPayload)initWithAccessoryUUID:(id)a3 onboardingSelections:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMSiriEndpointApplyOnboardingSelectionsPayload;
  v9 = [(HMSiriEndpointApplyOnboardingSelectionsPayload *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessoryUUID, a3);
    objc_storeStrong((id *)&v10->_onboardingSelections, a4);
  }

  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_55188 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_55188, &__block_literal_global_55189);
  }
  v2 = (void *)logCategory__hmf_once_v2_55190;

  return v2;
}

uint64_t __61__HMSiriEndpointApplyOnboardingSelectionsPayload_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v2_55190;
  logCategory__hmf_once_v2_55190 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

@end