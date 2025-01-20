@interface HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveWatch
+ (BOOL)supportsSecureCoding;
+ (id)requirementIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportedOnLocalDevice;
- (HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveWatch)initWithCoder:(id)a3;
- (HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveWatch)initWithFeatureIdentifier:(id)a3 supportedOnLocalDevice:(BOOL)a4;
- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4;
- (id)requirementDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)registerObserver:(id)a3 forDataSource:(id)a4;
- (void)unregisterObserver:(id)a3 fromDataSource:(id)a4;
@end

@implementation HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveWatch

- (HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveWatch)initWithFeatureIdentifier:(id)a3 supportedOnLocalDevice:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveWatch;
  result = [(HKFeatureAvailabilityOnboardingEligibilityRequirement *)&v6 initWithFeatureIdentifier:a3];
  if (result) {
    result->_supportedOnLocalDevice = a4;
  }
  return result;
}

+ (id)requirementIdentifier
{
  return @"CapabilityIsSupportedOnActiveWatch";
}

- (id)requirementDescription
{
  v3 = +[_HKBehavior sharedBehavior];
  int v4 = [v3 isAppleWatch];

  v5 = NSString;
  if (v4)
  {
    objc_super v6 = [NSString stringWithFormat:@"The Mobile Gestalt capability must be supported"];
  }
  else
  {
    v7 = [(HKFeatureAvailabilityOnboardingEligibilityRequirement *)self featureIdentifier];
    objc_super v6 = [v5 stringWithFormat:@"The paired device capability for %@ must be supported", v7];
  }

  return v6;
}

- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 behavior];
  int v8 = [v7 isAppleWatch];

  if (v8)
  {
    uint64_t v9 = [NSNumber numberWithBool:self->_supportedOnLocalDevice];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveWatch;
    uint64_t v9 = [(HKFeatureAvailabilityOnboardingEligibilityRequirement *)&v12 isSatisfiedWithDataSource:v6 error:a4];
  }
  v10 = (void *)v9;

  return v10;
}

- (void)registerObserver:(id)a3 forDataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [v7 behavior];
  char v9 = [v8 isAppleWatch];

  if ((v9 & 1) == 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveWatch;
    [(_HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveRemoteDevice *)&v10 registerObserver:v6 forDataSource:v7];
  }
}

- (void)unregisterObserver:(id)a3 fromDataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [v7 behavior];
  char v9 = [v8 isAppleWatch];

  if ((v9 & 1) == 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveWatch;
    [(_HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveRemoteDevice *)&v10 unregisterObserver:v6 fromDataSource:v7];
  }
}

- (BOOL)isEqual:(id)a3
{
  int v4 = (unsigned __int8 *)a3;
  v7.receiver = self;
  v7.super_class = (Class)HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveWatch;
  BOOL v5 = [(HKFeatureAvailabilityOnboardingEligibilityRequirement *)&v7 isEqual:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && self->_supportedOnLocalDevice == v4[16];

  return v5;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveWatch;
  return [(HKFeatureAvailabilityOnboardingEligibilityRequirement *)&v3 hash] ^ self->_supportedOnLocalDevice;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveWatch;
  id v4 = a3;
  [(HKFeatureAvailabilityOnboardingEligibilityRequirement *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_supportedOnLocalDevice, @"supportedOnLocalDevice", v5.receiver, v5.super_class);
}

- (HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveWatch)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveWatch;
  objc_super v5 = [(HKFeatureAvailabilityOnboardingEligibilityRequirement *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_supportedOnLocalDevice = [v4 decodeBoolForKey:@"supportedOnLocalDevice"];
  }

  return v5;
}

- (BOOL)supportedOnLocalDevice
{
  return self->_supportedOnLocalDevice;
}

@end