@interface HKFeatureAvailabilityRequirementLocalDeviceIsCapableOfWatchPairing
+ (id)requirementIdentifier;
- (HKFeatureAvailabilityRequirementLocalDeviceIsCapableOfWatchPairing)init;
- (id)requirementDescription;
@end

@implementation HKFeatureAvailabilityRequirementLocalDeviceIsCapableOfWatchPairing

- (HKFeatureAvailabilityRequirementLocalDeviceIsCapableOfWatchPairing)init
{
  v3 = off_1E58BB000;
  v4 = +[_HKBehavior sharedBehavior];
  char v5 = [v4 isCompanionCapable];
  if (v5)
  {
    uint64_t v6 = 1;
  }
  else
  {
    v3 = +[_HKBehavior sharedBehavior];
    uint64_t v6 = [v3 isAppleWatch];
  }
  v9.receiver = self;
  v9.super_class = (Class)HKFeatureAvailabilityRequirementLocalDeviceIsCapableOfWatchPairing;
  v7 = [(HKFeatureAvailabilityMustBeTrueRequirement *)&v9 initWithWhatMustBeTrue:v6];
  if ((v5 & 1) == 0) {

  }
  return v7;
}

+ (id)requirementIdentifier
{
  return @"LocalDeviceIsCapableOfWatchPairing";
}

- (id)requirementDescription
{
  return @"The local device must be able to pair with a watch or is a watch";
}

@end