@interface HMDAccessoryFirmwareUpdatePolicyServiceConfiguration
- (HMDAccessoryFirmwareUpdatePolicyCriteria)criteria;
- (HMDAccessoryFirmwareUpdatePolicyServiceConfiguration)initWithType:(id)a3 category:(id)a4 criteria:(id)a5;
- (NSString)category;
- (NSString)type;
@end

@implementation HMDAccessoryFirmwareUpdatePolicyServiceConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_criteria, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (HMDAccessoryFirmwareUpdatePolicyCriteria)criteria
{
  return (HMDAccessoryFirmwareUpdatePolicyCriteria *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)category
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (HMDAccessoryFirmwareUpdatePolicyServiceConfiguration)initWithType:(id)a3 category:(id)a4 criteria:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDAccessoryFirmwareUpdatePolicyServiceConfiguration;
  v12 = [(HMDAccessoryFirmwareUpdatePolicyServiceConfiguration *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_type, a3);
    objc_storeStrong((id *)&v13->_category, a4);
    objc_storeStrong((id *)&v13->_criteria, a5);
  }

  return v13;
}

@end