@interface HKCountrySet(WristTemperatureMeasurements)
+ (id)localAvailabilityForWristTemperatureMeasurements;
@end

@implementation HKCountrySet(WristTemperatureMeasurements)

+ (id)localAvailabilityForWristTemperatureMeasurements
{
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F2AE70]) initWithCountryBitmasks:&unk_1F17EA5F0 compatibilityVersion:1 contentVersion:3 provenance:3];
  if (!v4)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKCountrySet+WristTemperatureMeasurements.m" lineNumber:40 description:@"Local generated country set should never be nil"];
  }

  return v4;
}

@end