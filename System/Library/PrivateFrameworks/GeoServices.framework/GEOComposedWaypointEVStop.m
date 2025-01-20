@interface GEOComposedWaypointEVStop
+ (BOOL)supportsSecureCoding;
- ($1AB5FA073B851C12C2339EC22442E995)coordinate;
- (BOOL)isServerProvidedWaypoint;
- (GEOComposedWaypointEVStop)initWithCoder:(id)a3;
- (GEOComposedWaypointEVStop)initWithGeoWaypointInfo:(id)a3;
- (GEOComposedWaypointEVStop)initWithGeoWaypointInfo:(id)a3 mapItem:(id)a4;
- (id)artwork;
- (id)chargingInfo;
- (id)geoWaypointTyped;
- (id)name;
- (unint64_t)muid;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOComposedWaypointEVStop

- (GEOComposedWaypointEVStop)initWithGeoWaypointInfo:(id)a3 mapItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v31.receiver = self;
    v31.super_class = (Class)GEOComposedWaypointEVStop;
    v8 = [(GEOComposedWaypoint *)&v31 initWithMapItem:v7];
  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)GEOComposedWaypointEVStop;
    v8 = [(GEOComposedWaypoint *)&v30 init];
  }
  v9 = v8;
  if (v8)
  {
    v10 = [v6 name];
    uint64_t v11 = [v10 copy];
    name = v9->_name;
    v9->_name = (NSString *)v11;

    v9->_muid = [v6 muid];
    v13 = [v6 position];
    [v13 coordinate];
    v9->_coordinate.latitude = v14;
    v9->_coordinate.longitude = v15;
    v9->_coordinate.altitude = 1.79769313e308;

    uint64_t v16 = [v6 artwork];
    artwork = v9->_artwork;
    v9->_artwork = (GEOTransitArtworkDataSource *)v16;

    v9->_isServerProvidedWaypoint = [v6 source] == 2;
    v18 = [GEOComposedRouteEVChargingStationInfo alloc];
    v19 = [v6 evChargingInfo];
    uint64_t v20 = [(GEOComposedRouteEVChargingStationInfo *)v18 initWithGeoEVChargingInfo:v19 muid:v9->_muid name:v9->_name];
    chargingInfo = v9->_chargingInfo;
    v9->_chargingInfo = (GEOComposedRouteEVChargingStationInfo *)v20;

    v22 = [GEOLocation alloc];
    v23 = [v6 position];
    v24 = [(GEOLocation *)v22 initWithLocation:v23];
    [(GEOComposedWaypoint *)v9 setLocation:v24];

    v25 = [v6 position];
    [(GEOComposedWaypoint *)v9 setLatLng:v25];

    v26 = [(GEOComposedWaypoint *)v9 uniqueWaypointID];

    if (!v26)
    {
      v27 = objc_msgSend(MEMORY[0x1E4F29128], "_geo_dataForUUID");
      [(GEOComposedWaypoint *)v9 setUniqueWaypointID:v27];
    }
    v28 = v9;
  }

  return v9;
}

- (GEOComposedWaypointEVStop)initWithGeoWaypointInfo:(id)a3
{
  return [(GEOComposedWaypointEVStop *)self initWithGeoWaypointInfo:a3 mapItem:0];
}

- (id)name
{
  return self->_name;
}

- (unint64_t)muid
{
  return self->_muid;
}

- ($1AB5FA073B851C12C2339EC22442E995)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  double altitude = self->_coordinate.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (id)artwork
{
  return self->_artwork;
}

- (BOOL)isServerProvidedWaypoint
{
  return self->_isServerProvidedWaypoint;
}

- (id)chargingInfo
{
  return self->_chargingInfo;
}

- (id)geoWaypointTyped
{
  if (self->_isServerProvidedWaypoint)
  {
    v2 = 0;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)GEOComposedWaypointEVStop;
    v2 = [(GEOComposedWaypoint *)&v4 geoWaypointTyped];
  }

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedWaypointEVStop)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEOComposedWaypointEVStop;
  v5 = [(GEOComposedWaypointEVStop *)&v18 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v5->_muid = [v4 decodeInt64ForKey:@"_muid"];
    unint64_t v17 = 0;
    id v8 = v4;
    v9 = (const void *)[v8 decodeBytesForKey:@"_coordinate" returnedLength:&v17];
    if (v17 && v9)
    {
      if (v17 >= 0x18) {
        size_t v10 = 24;
      }
      else {
        size_t v10 = v17;
      }
      memcpy(&v5->_coordinate, v9, v10);
    }
    uint64_t v11 = [v8 decodeObjectOfClass:objc_opt_class() forKey:@"_artwork"];
    artwork = v5->_artwork;
    v5->_artwork = (GEOTransitArtworkDataSource *)v11;

    v5->_isServerProvidedWaypoint = [v8 decodeBoolForKey:@"_isServerProvidedWaypoint"];
    uint64_t v13 = [v8 decodeObjectOfClass:objc_opt_class() forKey:@"_chargingInfo"];
    chargingInfo = v5->_chargingInfo;
    v5->_chargingInfo = (GEOComposedRouteEVChargingStationInfo *)v13;

    double v15 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOComposedWaypointEVStop;
  id v4 = a3;
  [(GEOComposedWaypointEVStop *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, @"_name", v5.receiver, v5.super_class);
  [v4 encodeInt64:self->_muid forKey:@"_muid"];
  [v4 encodeBytes:&self->_coordinate length:24 forKey:@"_coordinate"];
  [v4 encodeObject:self->_artwork forKey:@"_artwork"];
  [v4 encodeBool:self->_isServerProvidedWaypoint forKey:@"_isServerProvidedWaypoint"];
  [v4 encodeObject:self->_chargingInfo forKey:@"_chargingInfo"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chargingInfo, 0);
  objc_storeStrong((id *)&self->_artwork, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end