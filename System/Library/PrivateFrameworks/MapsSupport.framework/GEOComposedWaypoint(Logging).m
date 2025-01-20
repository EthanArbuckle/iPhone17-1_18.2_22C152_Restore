@interface GEOComposedWaypoint(Logging)
- (__CFString)hawkQueryRepresentation;
- (id)shortDescription;
@end

@implementation GEOComposedWaypoint(Logging)

- (id)shortDescription
{
  v16 = NSString;
  uint64_t v15 = objc_opt_class();
  uint64_t v14 = [a1 muid];
  v2 = [a1 timezone];
  v3 = [a1 location];
  v4 = [a1 name];
  v5 = [a1 navDisplayName];
  v6 = [a1 navDisplayAddress];
  v7 = [a1 directionsListAddress];
  uint64_t v8 = [a1 waypointCategory];
  if (v8 >= 0xE)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E617EAA0[(int)v8];
  }
  uint64_t v10 = [a1 type];
  if (v10 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = off_1E617EB10[(int)v10];
  }
  v12 = [v16 stringWithFormat:@"<%@:%p, muid: %llu, timezone: %@, location: %@, name: %@, navDisplayName: %@, navDisplayAddress: %@, directionsListAddress: %@, waypointCategory: %@, waypointType: %@, isCurrentLocation: %d, isServerProvidedWaypoint: %d>", v15, a1, v14, v2, v3, v4, v5, v6, v7, v9, v11, objc_msgSend(a1, "isCurrentLocation"), objc_msgSend(a1, "isServerProvidedWaypoint")];

  return v12;
}

- (__CFString)hawkQueryRepresentation
{
  v2 = [a1 navDisplayAddress];
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    v5 = [a1 bestLatLng];
    v6 = v5;
    if (v5)
    {
      [v5 coordinate];
      double v8 = v7;
      v9 = NSString;
      uint64_t v10 = objc_msgSend(NSNumber, "numberWithDouble:");
      v11 = [NSNumber numberWithDouble:v8];
      id v12 = (id)[v9 stringWithFormat:@"%@, %@", v10, v11];
    }
    v4 = @"<invalid>";
  }

  return v4;
}

@end