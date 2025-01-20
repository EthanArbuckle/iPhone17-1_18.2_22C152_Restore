@interface HKFeatureAvailabilityRequirementLocalDeviceIsCapableOfPairingWithWatch
+ (id)requirementIdentifier;
- (HKFeatureAvailabilityRequirementLocalDeviceIsCapableOfPairingWithWatch)init;
- (id)requirementDescription;
@end

@implementation HKFeatureAvailabilityRequirementLocalDeviceIsCapableOfPairingWithWatch

- (HKFeatureAvailabilityRequirementLocalDeviceIsCapableOfPairingWithWatch)init
{
  v3 = +[_HKBehavior sharedBehavior];
  v6.receiver = self;
  v6.super_class = (Class)HKFeatureAvailabilityRequirementLocalDeviceIsCapableOfPairingWithWatch;
  v4 = -[HKFeatureAvailabilityMustBeTrueRequirement initWithWhatMustBeTrue:](&v6, sel_initWithWhatMustBeTrue_, [v3 isCompanionCapable]);

  return v4;
}

+ (id)requirementIdentifier
{
  return @"LocalDeviceIsCapableOfPairingWithWatch";
}

- (id)requirementDescription
{
  return @"The local device must be able to pair with a watch";
}

@end