@interface GEOComposedWaypoint
- (id)hawkQueryRepresentation;
- (id)shortDescription;
@end

@implementation GEOComposedWaypoint

- (id)shortDescription
{
  uint64_t v16 = objc_opt_class();
  id v15 = [(GEOComposedWaypoint *)self muid];
  v3 = [(GEOComposedWaypoint *)self timezone];
  v4 = [(GEOComposedWaypoint *)self location];
  v5 = [(GEOComposedWaypoint *)self name];
  v6 = [(GEOComposedWaypoint *)self navDisplayName];
  v7 = [(GEOComposedWaypoint *)self navDisplayAddress];
  v8 = [(GEOComposedWaypoint *)self directionsListAddress];
  id v9 = [(GEOComposedWaypoint *)self waypointCategory];
  if (v9 >= 0xE)
  {
    v10 = +[NSString stringWithFormat:@"(unknown: %i)", v9];
  }
  else
  {
    v10 = *(&off_100081BD8 + (int)v9);
  }
  id v11 = [(GEOComposedWaypoint *)self type];
  if (v11 >= 4)
  {
    v12 = +[NSString stringWithFormat:@"(unknown: %i)", v11];
  }
  else
  {
    v12 = *(&off_100081C48 + (int)v11);
  }
  v13 = +[NSString stringWithFormat:@"<%@:%p, muid: %llu, timezone: %@, location: %@, name: %@, navDisplayName: %@, navDisplayAddress: %@, directionsListAddress: %@, waypointCategory: %@, waypointType: %@, isCurrentLocation: %d, isServerProvidedWaypoint: %d>", v16, self, v15, v3, v4, v5, v6, v7, v8, v10, v12, [(GEOComposedWaypoint *)self isCurrentLocation], [(GEOComposedWaypoint *)self isServerProvidedWaypoint]];

  return v13;
}

- (id)hawkQueryRepresentation
{
  v3 = [(GEOComposedWaypoint *)self navDisplayAddress];
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = [(GEOComposedWaypoint *)self bestLatLng];
    v7 = v6;
    if (v6)
    {
      [v6 coordinate];
      double v9 = v8;
      v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      id v11 = +[NSNumber numberWithDouble:v9];
      id v12 = +[NSString stringWithFormat:@"%@, %@", v10, v11];
    }
    v5 = @"<invalid>";
  }

  return v5;
}

@end