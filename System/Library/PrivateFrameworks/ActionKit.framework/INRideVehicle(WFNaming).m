@interface INRideVehicle(WFNaming)
- (id)wfName;
@end

@implementation INRideVehicle(WFNaming)

- (id)wfName
{
  v2 = NSString;
  v3 = [a1 manufacturer];
  v4 = [a1 model];
  v5 = [a1 registrationPlate];
  v6 = [v2 stringWithFormat:@"%@ %@ - (%@)", v3, v4, v5];

  return v6;
}

@end