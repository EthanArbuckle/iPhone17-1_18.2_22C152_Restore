@interface GEOComposedWaypointDisplayInfo
+ (BOOL)supportsSecureCoding;
- ($F24F406B2B787EFB06265DBA3D28CBD5)position;
- (GEOARInfo)arInfo;
- (GEOComposedRouteEVChargingStationInfo)evChargingInfo;
- (GEOComposedString)waypointCaption;
- (GEOComposedWaypointDisplayInfo)initWithCoder:(id)a3;
- (GEOComposedWaypointDisplayInfo)initWithGeoWaypointInfo:(id)a3 waypoint:(id)a4;
- (GEOPBTransitArtwork)artwork;
- (GEOStyleAttributes)styleAttributes;
- (GEOWaypointInfo)waypointInfo;
- (NSString)name;
- (id)description;
- (void)_initPositionWithGeoWaypointInfo:(id)a3 waypoint:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setArInfo:(id)a3;
- (void)setArtwork:(id)a3;
- (void)setEvChargingInfo:(id)a3;
- (void)setName:(id)a3;
- (void)setPosition:(id)a3;
- (void)setStyleAttributes:(id)a3;
- (void)setWaypointCaption:(id)a3;
- (void)setWaypointInfo:(id)a3;
@end

@implementation GEOComposedWaypointDisplayInfo

- (GEOComposedWaypointDisplayInfo)initWithGeoWaypointInfo:(id)a3 waypoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GEOComposedWaypointDisplayInfo;
  v8 = [(GEOComposedWaypointDisplayInfo *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(GEOComposedWaypointDisplayInfo *)v8 setWaypointInfo:v6];
    [(GEOComposedWaypointDisplayInfo *)v9 _initPositionWithGeoWaypointInfo:v6 waypoint:v7];
  }

  return v9;
}

- (void)_initPositionWithGeoWaypointInfo:(id)a3 waypoint:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  if ([v21 hasPosition])
  {
    id v7 = [v21 position];
    [v7 lat];
    double v9 = v8;
    v10 = [v21 position];
LABEL_8:
    v14 = v10;
    [v10 lng];
    self->_position.latitude = v9;
    self->_position.longitude = v20;
    goto LABEL_9;
  }
  if (![v6 hasWaypoint]
    || ([v6 waypoint],
        objc_super v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 hasWaypointPlace],
        v11,
        !v12))
  {
    if (![v6 hasLatLng]) {
      goto LABEL_10;
    }
    id v7 = [v6 latLng];
    [v7 lat];
    double v9 = v19;
    v10 = [v6 latLng];
    goto LABEL_8;
  }
  v13 = [v6 waypoint];
  id v7 = [v13 waypointPlace];

  v14 = [v7 center];
  [v14 lat];
  double v16 = v15;
  v17 = [v7 center];
  [v17 lng];
  self->_position.latitude = v16;
  self->_position.longitude = v18;

LABEL_9:
LABEL_10:
}

- (void)setWaypointInfo:(id)a3
{
  v4 = (GEOWaypointInfo *)a3;
  v5 = [(GEOWaypointInfo *)v4 arInfo];
  arInfo = v5;
  if (!v5) {
    arInfo = self->_arInfo;
  }
  objc_storeStrong((id *)&self->_arInfo, arInfo);

  id v7 = [(GEOWaypointInfo *)v4 artwork];
  artwork = v7;
  if (!v7) {
    artwork = self->_artwork;
  }
  objc_storeStrong((id *)&self->_artwork, artwork);

  double v9 = [(GEOWaypointInfo *)v4 styleAttributes];
  styleAttributes = v9;
  if (!v9) {
    styleAttributes = self->_styleAttributes;
  }
  objc_storeStrong((id *)&self->_styleAttributes, styleAttributes);

  objc_super v11 = [(GEOWaypointInfo *)v4 name];
  name = v11;
  if (!v11) {
    name = self->_name;
  }
  objc_storeStrong((id *)&self->_name, name);

  if ([(GEOWaypointInfo *)v4 hasWaypointCaption])
  {
    v13 = [GEOComposedString alloc];
    v14 = [(GEOWaypointInfo *)v4 waypointCaption];
    double v15 = [(GEOComposedString *)v13 initWithGeoFormattedString:v14];
    waypointCaption = self->_waypointCaption;
    self->_waypointCaption = v15;
  }
  else
  {
    v17 = self->_waypointCaption;
    v14 = self->_waypointCaption;
    self->_waypointCaption = v17;
  }

  if ([(GEOWaypointInfo *)v4 hasEvChargingInfo])
  {
    double v18 = [GEOComposedRouteEVChargingStationInfo alloc];
    double v19 = [(GEOWaypointInfo *)v4 evChargingInfo];
    double v20 = [(GEOComposedRouteEVChargingStationInfo *)v18 initWithGeoEVChargingInfo:v19 muid:[(GEOWaypointInfo *)v4 muid] name:self->_name];
    evChargingInfo = self->_evChargingInfo;
    self->_evChargingInfo = v20;
  }
  else
  {
    v22 = self->_evChargingInfo;
    double v19 = self->_evChargingInfo;
    self->_evChargingInfo = v22;
  }

  waypointInfo = self->_waypointInfo;
  self->_waypointInfo = v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  arInfo = self->_arInfo;
  id v5 = a3;
  [v5 encodeObject:arInfo forKey:@"_arInfo"];
  [v5 encodeObject:self->_artwork forKey:@"_artwork"];
  [v5 encodeObject:self->_evChargingInfo forKey:@"_evChargingInfo"];
  [v5 encodeObject:self->_name forKey:@"_name"];
  [v5 encodeBytes:&self->_position length:16 forKey:@"_position"];
  [v5 encodeObject:self->_styleAttributes forKey:@"_styleAttributes"];
  [v5 encodeObject:self->_waypointCaption forKey:@"_waypointCaption"];
}

- (GEOComposedWaypointDisplayInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)GEOComposedWaypointDisplayInfo;
  id v5 = [(GEOComposedWaypointDisplayInfo *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_arInfo"];
    arInfo = v5->_arInfo;
    v5->_arInfo = (GEOARInfo *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_artwork"];
    artwork = v5->_artwork;
    v5->_artwork = (GEOPBTransitArtwork *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_evChargingInfo"];
    evChargingInfo = v5->_evChargingInfo;
    v5->_evChargingInfo = (GEOComposedRouteEVChargingStationInfo *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_name"];
    name = v5->_name;
    v5->_name = (NSString *)v12;

    unint64_t v22 = 0;
    id v14 = v4;
    double v15 = (const void *)[v14 decodeBytesForKey:@"_position" returnedLength:&v22];
    if (v22 && v15)
    {
      if (v22 >= 0x10) {
        size_t v16 = 16;
      }
      else {
        size_t v16 = v22;
      }
      memcpy(&v5->_position, v15, v16);
    }
    uint64_t v17 = [v14 decodeObjectOfClass:objc_opt_class() forKey:@"_styleAttributes"];
    styleAttributes = v5->_styleAttributes;
    v5->_styleAttributes = (GEOStyleAttributes *)v17;

    uint64_t v19 = [v14 decodeObjectOfClass:objc_opt_class() forKey:@"_waypointCaption"];
    waypointCaption = v5->_waypointCaption;
    v5->_waypointCaption = (GEOComposedString *)v19;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  long long v9 = *(_OWORD *)&self->_arInfo;
  evChargingInfo = self->_evChargingInfo;
  name = self->_name;
  uint64_t v6 = [NSString stringWithFormat:@"%+.8f, %+.8f", *(void *)&self->_position.latitude, *(void *)&self->_position.longitude];
  id v7 = [v3 stringWithFormat:@"arInfo: %@ | artwork: %@ | evChargingInfo: %@ | name: %@ | position: %@ | styleAttributes: %@ | caption: %@", v9, evChargingInfo, name, v6, self->_styleAttributes, self->_waypointCaption];

  return v7;
}

- (GEOARInfo)arInfo
{
  return self->_arInfo;
}

- (void)setArInfo:(id)a3
{
}

- (GEOPBTransitArtwork)artwork
{
  return self->_artwork;
}

- (void)setArtwork:(id)a3
{
}

- (GEOComposedRouteEVChargingStationInfo)evChargingInfo
{
  return self->_evChargingInfo;
}

- (void)setEvChargingInfo:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)position
{
  double latitude = self->_position.latitude;
  double longitude = self->_position.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void)setPosition:(id)a3
{
  self->_position = ($AB5116BA7E623E054F959CECB034F4E7)a3;
}

- (GEOStyleAttributes)styleAttributes
{
  return self->_styleAttributes;
}

- (void)setStyleAttributes:(id)a3
{
}

- (GEOComposedString)waypointCaption
{
  return self->_waypointCaption;
}

- (void)setWaypointCaption:(id)a3
{
}

- (GEOWaypointInfo)waypointInfo
{
  return self->_waypointInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypointCaption, 0);
  objc_storeStrong((id *)&self->_waypointInfo, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_evChargingInfo, 0);
  objc_storeStrong((id *)&self->_artwork, 0);

  objc_storeStrong((id *)&self->_arInfo, 0);
}

@end