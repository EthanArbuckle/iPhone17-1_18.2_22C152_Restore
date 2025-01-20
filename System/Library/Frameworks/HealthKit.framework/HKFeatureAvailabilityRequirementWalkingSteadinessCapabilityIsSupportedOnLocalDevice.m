@interface HKFeatureAvailabilityRequirementWalkingSteadinessCapabilityIsSupportedOnLocalDevice
+ (NSString)requirementIdentifier;
- (HKFeatureAvailabilityRequirementWalkingSteadinessCapabilityIsSupportedOnLocalDevice)init;
- (NSString)requirementDescription;
@end

@implementation HKFeatureAvailabilityRequirementWalkingSteadinessCapabilityIsSupportedOnLocalDevice

- (HKFeatureAvailabilityRequirementWalkingSteadinessCapabilityIsSupportedOnLocalDevice)init
{
  v3.receiver = self;
  v3.super_class = (Class)HKFeatureAvailabilityRequirementWalkingSteadinessCapabilityIsSupportedOnLocalDevice;
  return -[HKFeatureAvailabilityMustBeTrueRequirement initWithWhatMustBeTrue:](&v3, sel_initWithWhatMustBeTrue_, [MEMORY[0x1E4F222D0] isWalkingSteadinessAvailable]);
}

+ (NSString)requirementIdentifier
{
  return (NSString *)@"WalkingSteadinessCapabilityIsSupportedOnLocalDevice";
}

- (NSString)requirementDescription
{
  return (NSString *)@"The local device must be able to support walking steadiness classifications";
}

@end