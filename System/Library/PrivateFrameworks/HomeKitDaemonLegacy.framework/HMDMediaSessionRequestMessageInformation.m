@interface HMDMediaSessionRequestMessageInformation
+ (id)logCategory;
- (HMDDevice)remoteSourceDevice;
- (HMDMediaSessionRequestMessageInformation)initWithMessage:(id)a3;
- (HMFMessage)message;
- (NSUUID)messageIdentifier;
- (id)attributeDescriptions;
@end

@implementation HMDMediaSessionRequestMessageInformation

- (void).cxx_destruct
{
}

- (HMFMessage)message
{
  return (HMFMessage *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMDMediaSessionRequestMessageInformation *)self messageIdentifier];
  v5 = (void *)[v3 initWithName:@"messageIdentifier" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMDMediaSessionRequestMessageInformation *)self remoteSourceDevice];
  v8 = (void *)[v6 initWithName:@"remoteSourceDevice" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];

  return v9;
}

- (HMDDevice)remoteSourceDevice
{
  v2 = [(HMDMediaSessionRequestMessageInformation *)self message];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  if (v4)
  {
    v5 = [v4 destination];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;

    if (v7)
    {
      v8 = [v7 device];
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return (HMDDevice *)v8;
}

- (NSUUID)messageIdentifier
{
  v2 = [(HMDMediaSessionRequestMessageInformation *)self message];
  id v3 = [v2 identifier];

  return (NSUUID *)v3;
}

- (HMDMediaSessionRequestMessageInformation)initWithMessage:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)HMDMediaSessionRequestMessageInformation;
    id v7 = [(HMDMediaSessionRequestMessageInformation *)&v12 init];
    v8 = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->_message, a3);
    }

    return v8;
  }
  else
  {
    v10 = (void *)_HMFPreconditionFailure();
    return (HMDMediaSessionRequestMessageInformation *)+[HMDMediaSessionRequestMessageInformation logCategory];
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_93484 != -1) {
    dispatch_once(&logCategory__hmf_once_t2_93484, &__block_literal_global_93485);
  }
  v2 = (void *)logCategory__hmf_once_v3_93486;
  return v2;
}

uint64_t __55__HMDMediaSessionRequestMessageInformation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v3_93486;
  logCategory__hmf_once_v3_93486 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end