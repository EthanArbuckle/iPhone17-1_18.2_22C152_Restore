@interface INRideStatus(WFNaming)
- (id)wfName;
@end

@implementation INRideStatus(WFNaming)

- (id)wfName
{
  v2 = NSString;
  v3 = [a1 rideOption];
  v4 = [v3 name];
  v5 = [a1 driver];
  v6 = [v5 displayName];
  v7 = [a1 vehicle];
  v8 = [v7 wfName];
  v9 = [v2 stringWithFormat:@"%@ %@ %@", v4, v6, v8];

  return v9;
}

@end