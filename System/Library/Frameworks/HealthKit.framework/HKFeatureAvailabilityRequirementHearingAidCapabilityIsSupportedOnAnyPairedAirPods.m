@interface HKFeatureAvailabilityRequirementHearingAidCapabilityIsSupportedOnAnyPairedAirPods
+ (id)requirementIdentifier;
- (BOOL)capabilityIsSupportedOnPairedBluetoothDevice:(id)a3;
- (id)requirementDescription;
@end

@implementation HKFeatureAvailabilityRequirementHearingAidCapabilityIsSupportedOnAnyPairedAirPods

+ (id)requirementIdentifier
{
  return @"HearingAidCapabilityIsSupportedOnAnyPairedAirPods";
}

- (id)requirementDescription
{
  return @"At least one pair of AirPods paired must be capable of performing as a hearing aid";
}

- (BOOL)capabilityIsSupportedOnPairedBluetoothDevice:(id)a3
{
  return [a3 isHearingAidCapable];
}

@end