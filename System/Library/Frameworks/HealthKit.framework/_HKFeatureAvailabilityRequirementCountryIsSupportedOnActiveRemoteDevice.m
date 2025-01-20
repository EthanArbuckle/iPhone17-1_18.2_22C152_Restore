@interface _HKFeatureAvailabilityRequirementCountryIsSupportedOnActiveRemoteDevice
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (_HKFeatureAvailabilityRequirementCountryIsSupportedOnActiveRemoteDevice)initWithCoder:(id)a3;
- (_HKFeatureAvailabilityRequirementCountryIsSupportedOnActiveRemoteDevice)initWithFeatureIdentifier:(id)a3;
- (_HKFeatureAvailabilityRequirementCountryIsSupportedOnActiveRemoteDevice)initWithFeatureIdentifier:(id)a3 isSupportedIfCountryListMissing:(BOOL)a4;
- (id)isSatisfiedWithOnboardingEligibility:(id)a3 error:(id *)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _HKFeatureAvailabilityRequirementCountryIsSupportedOnActiveRemoteDevice

- (_HKFeatureAvailabilityRequirementCountryIsSupportedOnActiveRemoteDevice)initWithFeatureIdentifier:(id)a3
{
  return [(_HKFeatureAvailabilityRequirementCountryIsSupportedOnActiveRemoteDevice *)self initWithFeatureIdentifier:a3 isSupportedIfCountryListMissing:0];
}

- (_HKFeatureAvailabilityRequirementCountryIsSupportedOnActiveRemoteDevice)initWithFeatureIdentifier:(id)a3 isSupportedIfCountryListMissing:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)_HKFeatureAvailabilityRequirementCountryIsSupportedOnActiveRemoteDevice;
  result = [(HKFeatureAvailabilityOnboardingEligibilityRequirement *)&v6 initWithFeatureIdentifier:a3];
  if (result) {
    result->_isSupportedIfCountryListMissing = a4;
  }
  return result;
}

- (id)isSatisfiedWithOnboardingEligibility:(id)a3 error:(id *)a4
{
  id v5 = a3;
  char v6 = [v5 ineligibilityReasons];
  char v7 = [v5 ineligibilityReasons];
  char v8 = [v5 ineligibilityReasons];

  if ((v6 & 2) != 0)
  {
    v10 = (void *)MEMORY[0x1E4F1CC28];
  }
  else
  {
    BOOL isSupportedIfCountryListMissing = (v8 & 0x20) == 0;
    if ((v7 & 0x10) != 0) {
      BOOL isSupportedIfCountryListMissing = self->_isSupportedIfCountryListMissing;
    }
    v10 = [NSNumber numberWithBool:isSupportedIfCountryListMissing];
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (unsigned __int8 *)a3;
  v7.receiver = self;
  v7.super_class = (Class)_HKFeatureAvailabilityRequirementCountryIsSupportedOnActiveRemoteDevice;
  BOOL v5 = [(HKFeatureAvailabilityOnboardingEligibilityRequirement *)&v7 isEqual:v4]
    && [v4 isMemberOfClass:objc_opt_class()]
    && self->_isSupportedIfCountryListMissing == v4[16];

  return v5;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)_HKFeatureAvailabilityRequirementCountryIsSupportedOnActiveRemoteDevice;
  return [(HKFeatureAvailabilityOnboardingEligibilityRequirement *)&v3 hash] ^ self->_isSupportedIfCountryListMissing;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_HKFeatureAvailabilityRequirementCountryIsSupportedOnActiveRemoteDevice;
  id v4 = a3;
  [(HKFeatureAvailabilityOnboardingEligibilityRequirement *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_isSupportedIfCountryListMissing, @"isSupportedIfCountryListMissing", v5.receiver, v5.super_class);
}

- (_HKFeatureAvailabilityRequirementCountryIsSupportedOnActiveRemoteDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_HKFeatureAvailabilityRequirementCountryIsSupportedOnActiveRemoteDevice;
  objc_super v5 = [(HKFeatureAvailabilityOnboardingEligibilityRequirement *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_BOOL isSupportedIfCountryListMissing = [v4 decodeBoolForKey:@"isSupportedIfCountryListMissing"];
  }

  return v5;
}

@end