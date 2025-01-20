@interface HMSiriEndpointApplyOnboardingSelectionsResponsePayload
+ (id)logCategory;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMSiriEndpointApplyOnboardingSelectionsResponsePayload)initWithOnboardingResult:(int64_t)a3;
- (HMSiriEndpointApplyOnboardingSelectionsResponsePayload)initWithPayload:(id)a3;
- (NSArray)attributeDescriptions;
- (NSString)description;
- (NSString)shortDescription;
- (id)payloadCopy;
- (int64_t)onboardingResult;
@end

@implementation HMSiriEndpointApplyOnboardingSelectionsResponsePayload

- (int64_t)onboardingResult
{
  return self->_onboardingResult;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMSiriEndpointApplyOnboardingSelectionsResponsePayload *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
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
      int64_t v7 = [(HMSiriEndpointApplyOnboardingSelectionsResponsePayload *)self onboardingResult];
      BOOL v8 = v7 == [(HMSiriEndpointApplyOnboardingSelectionsResponsePayload *)v6 onboardingResult];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  return v8;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSArray)attributeDescriptions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = HMSiriEndpointOnboardingResultAsString([(HMSiriEndpointApplyOnboardingSelectionsResponsePayload *)self onboardingResult]);
  v5 = (void *)[v3 initWithName:@"onboardingResult" value:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return (NSArray *)v6;
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (HMSiriEndpointApplyOnboardingSelectionsResponsePayload)initWithPayload:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v13 = 0;
  uint64_t v5 = objc_msgSend(v4, "hmf_integerForKey:error:", @"HMSiriEndpointOnboardingResultPayloadKey", &v13);
  id v6 = v13;
  if (v6)
  {
    int64_t v7 = (void *)MEMORY[0x19F3A64A0]();
    BOOL v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v15 = v10;
      __int16 v16 = 2112;
      id v17 = v4;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Failed to decode apply onboarding selections payload: %@ error: %@", buf, 0x20u);
    }
    v11 = 0;
  }
  else
  {
    BOOL v8 = [(HMSiriEndpointApplyOnboardingSelectionsResponsePayload *)self initWithOnboardingResult:v5];
    v11 = v8;
  }

  return v11;
}

- (id)payloadCopy
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = @"HMSiriEndpointOnboardingResultPayloadKey";
  v2 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMSiriEndpointApplyOnboardingSelectionsResponsePayload onboardingResult](self, "onboardingResult"));
  v6[0] = v2;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (HMSiriEndpointApplyOnboardingSelectionsResponsePayload)initWithOnboardingResult:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMSiriEndpointApplyOnboardingSelectionsResponsePayload;
  result = [(HMSiriEndpointApplyOnboardingSelectionsResponsePayload *)&v5 init];
  if (result) {
    result->_onboardingResult = a3;
  }
  return result;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_50157 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_50157, &__block_literal_global_50158);
  }
  v2 = (void *)logCategory__hmf_once_v2_50159;

  return v2;
}

uint64_t __69__HMSiriEndpointApplyOnboardingSelectionsResponsePayload_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v2_50159;
  logCategory__hmf_once_v2_50159 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

@end