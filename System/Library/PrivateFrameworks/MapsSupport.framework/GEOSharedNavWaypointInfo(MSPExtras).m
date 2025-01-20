@interface GEOSharedNavWaypointInfo(MSPExtras)
- (id)name;
@end

@implementation GEOSharedNavWaypointInfo(MSPExtras)

- (id)name
{
  if ([a1 hasChargingStationInfo])
  {
    v2 = [a1 chargingStationInfo];
    uint64_t v3 = [v2 name];
  }
  else
  {
    v2 = [a1 mapItemStorage];
    if ([v2 _placeDisplayType] == 3
      || ([v2 name], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      uint64_t v3 = [v2 shortAddress];
    }
  }
  v4 = (void *)v3;

  return v4;
}

@end