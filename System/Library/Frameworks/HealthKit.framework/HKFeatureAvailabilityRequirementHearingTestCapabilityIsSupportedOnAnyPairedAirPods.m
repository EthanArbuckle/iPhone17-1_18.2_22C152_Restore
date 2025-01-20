@interface HKFeatureAvailabilityRequirementHearingTestCapabilityIsSupportedOnAnyPairedAirPods
+ (id)requirementIdentifier;
- (BOOL)capabilityIsSupportedOnPairedBluetoothDevice:(id)a3;
- (id)requirementDescription;
@end

@implementation HKFeatureAvailabilityRequirementHearingTestCapabilityIsSupportedOnAnyPairedAirPods

+ (id)requirementIdentifier
{
  return @"HearingTestCapabilityIsSupportedOnAnyPairedAirPods";
}

- (id)requirementDescription
{
  return @"At least one pair of AirPods paired must be capable of performing a hearing test";
}

- (BOOL)capabilityIsSupportedOnPairedBluetoothDevice:(id)a3
{
  return [a3 isHearingTestCapable];
}

@end