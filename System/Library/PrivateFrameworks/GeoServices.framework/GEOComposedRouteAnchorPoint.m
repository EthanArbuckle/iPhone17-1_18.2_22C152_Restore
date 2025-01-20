@interface GEOComposedRouteAnchorPoint
+ (BOOL)supportsSecureCoding;
+ (GEOComposedRouteAnchorPoint)anchorPointWithCoordinate:(id)a3;
+ (GEOComposedRouteAnchorPoint)anchorPointWithCoordinate:(id)a3 isCurrentLocation:(BOOL)a4 name:(id)a5;
+ (GEOComposedRouteAnchorPoint)anchorPointWithMapItem:(id)a3 coordinate:(id)a4;
+ (GEOComposedRouteAnchorPoint)anchorPointWithMapItemIdentifier:(id)a3 coordinate:(id)a4;
- ($1AB5FA073B851C12C2339EC22442E995)locationCoordinate;
- ($212C09783140BCCD23384160D545CE0D)routeCoordinate;
- (BOOL)elevationIsValid;
- (BOOL)isAddress;
- (BOOL)isCoordinate;
- (BOOL)isCuratedRoute;
- (BOOL)isCurrentLocation;
- (BOOL)isEqual:(id)a3;
- (GEOComposedRouteAnchorPoint)initWithCoder:(id)a3;
- (GEOComposedRouteAnchorPoint)initWithLocationCoordinate:(id)a3;
- (GEOComposedRouteAnchorPoint)initWithLocationCoordinate:(id)a3 isCurrentLocation:(BOOL)a4 name:(id)a5;
- (GEOComposedRouteAnchorPoint)initWithMapItem:(id)a3;
- (GEOComposedRouteAnchorPoint)initWithMapItem:(id)a3 coordinate:(id)a4;
- (GEOComposedRouteAnchorPoint)initWithMapItemIdentifier:(id)a3;
- (GEOComposedRouteAnchorPoint)initWithMapItemIdentifier:(id)a3 coordinate:(id)a4;
- (GEOComposedRouteAnchorPoint)initWithUniqueID:(id)a3 locationCoordinate:(id)a4 routeCoordinate:(id)a5;
- (GEOComposedWaypointDisplayInfo)displayInfo;
- (GEOFeatureStyleAttributes)styleAttributes;
- (GEOMapItemIdentifier)mapItemIdentifier;
- (NSString)countryCode;
- (NSString)name;
- (NSUUID)uniqueID;
- (double)elevation;
- (id)_defaultDisplayInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)duplicateWithRouteCoordinate:(id)a3;
- (id)location;
- (id)updatedAnchorPointWithLocationCoordinate:(id)a3 routeCoordinate:(id)a4;
- (int)mapDisplayType;
- (unint64_t)anchorPointType;
- (unint64_t)hash;
- (void)_setElevationIfNecessaryForMapItem:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)refineWithMapItem:(id)a3;
- (void)setAnchorPointType:(unint64_t)a3;
- (void)setDisplayInfo:(id)a3;
- (void)setIsAddress:(BOOL)a3;
- (void)setIsCoordinate:(BOOL)a3;
- (void)setIsCuratedRoute:(BOOL)a3;
- (void)setIsCurrentLocation:(BOOL)a3;
- (void)setUniqueID:(id)a3;
@end

@implementation GEOComposedRouteAnchorPoint

- (GEOComposedRouteAnchorPoint)initWithLocationCoordinate:(id)a3
{
  return -[GEOComposedRouteAnchorPoint initWithLocationCoordinate:isCurrentLocation:name:](self, "initWithLocationCoordinate:isCurrentLocation:name:", 0, 0, a3.var0, a3.var1, a3.var2);
}

- (GEOComposedRouteAnchorPoint)initWithLocationCoordinate:(id)a3 isCurrentLocation:(BOOL)a4 name:(id)a5
{
  double var2 = a3.var2;
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)GEOComposedRouteAnchorPoint;
  v11 = [(GEOComposedWaypoint *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [MEMORY[0x1E4F29128] UUID];
    uniqueID = v11->_uniqueID;
    v11->_uniqueID = (NSUUID *)v12;

    [(GEOComposedWaypoint *)v11 setType:1];
    v14 = [(NSUUID *)v11->_uniqueID _geo_data];
    [(GEOComposedWaypoint *)v11 setUniqueWaypointID:v14];

    v11->_locationCoordinate.latitude = var0;
    v11->_locationCoordinate.longitude = var1;
    v11->_locationCoordinate.altitude = var2;
    v11->_routeCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)0xBF80000000000000;
    uint64_t v15 = [v10 copy];
    name = v11->_name;
    v11->_name = (NSString *)v15;

    v11->_mapDisplayType = 0;
    v11->_elevation = NAN;
    v11->_isCurrentLocation = a4;
    v11->_isCoordinate = 1;
    v11->_anchorPointType = 0;
    v17 = v11;
  }

  return v11;
}

- (GEOComposedRouteAnchorPoint)initWithMapItem:(id)a3
{
  id v4 = a3;
  [v4 coordinate];
  v5 = -[GEOComposedRouteAnchorPoint initWithMapItem:coordinate:](self, "initWithMapItem:coordinate:", v4);

  return v5;
}

- (GEOComposedRouteAnchorPoint)initWithMapItem:(id)a3 coordinate:(id)a4
{
  double var2 = a4.var2;
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOComposedRouteAnchorPoint;
  v9 = [(GEOComposedWaypoint *)&v15 init];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F29128] UUID];
    uniqueID = v9->_uniqueID;
    v9->_uniqueID = (NSUUID *)v10;

    [(GEOComposedWaypoint *)v9 setType:1];
    uint64_t v12 = [(NSUUID *)v9->_uniqueID _geo_data];
    [(GEOComposedWaypoint *)v9 setUniqueWaypointID:v12];

    v9->_locationCoordinate.latitude = var0;
    v9->_locationCoordinate.longitude = var1;
    v9->_locationCoordinate.altitude = var2;
    v9->_routeCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)0xBF80000000000000;
    v9->_anchorPointType = 0;
    [(GEOComposedRouteAnchorPoint *)v9 refineWithMapItem:v8];
    v13 = v9;
  }

  return v9;
}

- (GEOComposedRouteAnchorPoint)initWithMapItemIdentifier:(id)a3
{
  id v4 = a3;
  [v4 coordinate];
  v5 = -[GEOComposedRouteAnchorPoint initWithMapItemIdentifier:coordinate:](self, "initWithMapItemIdentifier:coordinate:", v4);

  return v5;
}

- (GEOComposedRouteAnchorPoint)initWithMapItemIdentifier:(id)a3 coordinate:(id)a4
{
  double var2 = a4.var2;
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v8 = a3;
  v9 = -[GEOComposedRouteAnchorPoint initWithLocationCoordinate:](self, "initWithLocationCoordinate:", var0, var1, var2);
  uint64_t v10 = v9;
  if (v9)
  {
    v9->_isCoordinate = 0;
    uint64_t v11 = [v8 copy];
    mapItemIdentifier = v10->_mapItemIdentifier;
    v10->_mapItemIdentifier = (GEOMapItemIdentifier *)v11;

    v13 = v10;
  }

  return v10;
}

+ (GEOComposedRouteAnchorPoint)anchorPointWithCoordinate:(id)a3
{
  return (GEOComposedRouteAnchorPoint *)objc_msgSend(a1, "anchorPointWithCoordinate:isCurrentLocation:name:", 0, 0, a3.var0, a3.var1, a3.var2);
}

+ (GEOComposedRouteAnchorPoint)anchorPointWithCoordinate:(id)a3 isCurrentLocation:(BOOL)a4 name:(id)a5
{
  BOOL v5 = a4;
  double var2 = a3.var2;
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v9 = a5;
  uint64_t v10 = -[GEOComposedRouteAnchorPoint initWithLocationCoordinate:isCurrentLocation:name:]([GEOComposedRouteAnchorPoint alloc], "initWithLocationCoordinate:isCurrentLocation:name:", v5, v9, var0, var1, var2);

  return v10;
}

+ (GEOComposedRouteAnchorPoint)anchorPointWithMapItem:(id)a3 coordinate:(id)a4
{
  double var2 = a4.var2;
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v7 = a3;
  id v8 = -[GEOComposedRouteAnchorPoint initWithMapItem:coordinate:]([GEOComposedRouteAnchorPoint alloc], "initWithMapItem:coordinate:", v7, var0, var1, var2);

  return v8;
}

+ (GEOComposedRouteAnchorPoint)anchorPointWithMapItemIdentifier:(id)a3 coordinate:(id)a4
{
  double var2 = a4.var2;
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v7 = a3;
  id v8 = -[GEOComposedRouteAnchorPoint initWithMapItemIdentifier:coordinate:]([GEOComposedRouteAnchorPoint alloc], "initWithMapItemIdentifier:coordinate:", v7, var0, var1, var2);

  return v8;
}

- (void)refineWithMapItem:(id)a3
{
  if (a3)
  {
    id v16 = a3;
    id v4 = [v16 _identifier];
    -[GEOComposedWaypoint setMuid:](self, "setMuid:", [v4 muid]);

    BOOL v5 = [v16 name];
    v6 = (NSString *)[v5 copy];
    name = self->_name;
    self->_name = v6;

    id v8 = [v16 _styleAttributes];
    styleAttributes = self->_styleAttributes;
    self->_styleAttributes = v8;

    uint64_t v10 = [v16 _identifier];
    uint64_t v11 = (GEOMapItemIdentifier *)[v10 copy];
    mapItemIdentifier = self->_mapItemIdentifier;
    self->_mapItemIdentifier = v11;

    self->_mapDisplayType = [v16 mapDisplayType];
    self->_isAddress = [v16 _placeDisplayType] == 3;
    v13 = [v16 _bestAvailableCountryCode];
    v14 = (NSString *)[v13 copy];
    countryCode = self->_countryCode;
    self->_countryCode = v14;

    [(GEOComposedRouteAnchorPoint *)self _setElevationIfNecessaryForMapItem:v16];
  }
}

- (id)duplicateWithRouteCoordinate:(id)a3
{
  uint64_t v4 = [(GEOComposedRouteAnchorPoint *)self copy];
  uint64_t v5 = [MEMORY[0x1E4F29128] UUID];
  v6 = *(void **)(v4 + 144);
  *(void *)(v4 + 144) = v5;

  id v7 = objc_msgSend(*(id *)(v4 + 144), "_geo_data");
  [(id)v4 setUniqueWaypointID:v7];

  *($212C09783140BCCD23384160D545CE0D *)(v4 + 152) = a3;

  return (id)v4;
}

- (GEOFeatureStyleAttributes)styleAttributes
{
  if (self->_anchorPointType - 3 <= 1 && self->_isCoordinate) {
    goto LABEL_3;
  }
  styleAttributes = self->_styleAttributes;
  if (styleAttributes)
  {
    v2 = styleAttributes;
  }
  else if (self->_isCurrentLocation)
  {
    v2 = +[GEOFeatureStyleAttributes customRouteCreationCurrentLocationStyleAttributes];
  }
  else
  {
    if (!self->_isCuratedRoute)
    {
LABEL_3:
      v2 = +[GEOFeatureStyleAttributes customRouteGenericAnchorPointStyleAttributes];
      goto LABEL_10;
    }
    v2 = +[GEOFeatureStyleAttributes curatedRouteStyleAttributes];
  }
LABEL_10:

  return v2;
}

- (BOOL)elevationIsValid
{
  return 1;
}

- (void)_setElevationIfNecessaryForMapItem:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_elevation = NAN;
  if ([v4 _placeCategoryType] - 3 <= 1)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = objc_msgSend(v4, "_encyclopedicInfo", 0);
    v6 = [v5 factoids];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ([v11 semantic] == 5)
          {
            [v11 value];
            self->_elevation = v12;
            goto LABEL_12;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
}

- (id)_defaultDisplayInfo
{
  v3 = objc_opt_new();
  id v4 = [(GEOComposedRouteAnchorPoint *)self name];
  [v3 setName:v4];

  objc_msgSend(v3, "setPosition:", self->_locationCoordinate.latitude, self->_locationCoordinate.longitude);
  if ([(GEOComposedRouteAnchorPoint *)self elevationIsValid])
  {
    uint64_t v5 = GEOStringForDistance(97, self->_elevation);
    v6 = [[GEOComposedString alloc] initWithString:v5];
    [v3 setWaypointCaption:v6];
  }

  return v3;
}

- (id)location
{
  p_locationCoordinate = &self->_locationCoordinate;
  v3 = [[GEOLocation alloc] initWithLatitude:self->_locationCoordinate.latitude longitude:self->_locationCoordinate.longitude];
  [(GEOLocation *)v3 setAltitude:(int)p_locationCoordinate->altitude];

  return v3;
}

- (NSString)name
{
  name = [(GEOComposedWaypointDisplayInfo *)self->_displayInfo name];
  id v4 = name;
  if (!name) {
    name = self->_name;
  }
  uint64_t v5 = name;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)GEOComposedRouteAnchorPoint;
  id v4 = [(GEOComposedWaypoint *)&v11 copyWithZone:a3];
  objc_storeStrong((id *)v4 + 18, self->_uniqueID);
  long long v5 = *(_OWORD *)&self->_locationCoordinate.latitude;
  *((void *)v4 + 27) = *(void *)&self->_locationCoordinate.altitude;
  *(_OWORD *)(v4 + 200) = v5;
  *((void *)v4 + 19) = self->_routeCoordinate;
  uint64_t v6 = [(NSString *)self->_name copy];
  uint64_t v7 = (void *)*((void *)v4 + 20);
  *((void *)v4 + 20) = v6;

  objc_storeStrong((id *)v4 + 21, self->_styleAttributes);
  objc_storeStrong((id *)v4 + 22, self->_mapItemIdentifier);
  *((_DWORD *)v4 + 34) = self->_mapDisplayType;
  uint64_t v8 = [(NSString *)self->_countryCode copy];
  uint64_t v9 = (void *)*((void *)v4 + 23);
  *((void *)v4 + 23) = v8;

  *((void *)v4 + 24) = *(void *)&self->_elevation;
  v4[112] = self->_isCurrentLocation;
  v4[113] = self->_isCoordinate;
  v4[114] = self->_isAddress;
  v4[115] = self->_isCuratedRoute;
  *((void *)v4 + 15) = self->_anchorPointType;
  objc_storeStrong((id *)v4 + 16, self->_displayInfo);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uniqueID = self->_uniqueID;
  id v5 = a3;
  [v5 encodeObject:uniqueID forKey:@"_uniqueID"];
  [v5 encodeBytes:&self->_locationCoordinate length:24 forKey:@"_locationCoordinate"];
  [v5 encodeBytes:&self->_routeCoordinate length:8 forKey:@"_routeCoordinate"];
  [v5 encodeObject:self->_name forKey:@"_name"];
  [v5 encodeObject:self->_styleAttributes forKey:@"_styleAttributes"];
  [v5 encodeObject:self->_mapItemIdentifier forKey:@"_mapItemIdentifier"];
  [v5 encodeInteger:self->_mapDisplayType forKey:@"_mapDisplayType"];
  [v5 encodeObject:self->_countryCode forKey:@"_countryCode"];
  [v5 encodeDouble:@"_elevation" forKey:self->_elevation];
  [v5 encodeBool:self->_isCurrentLocation forKey:@"_isCurrentLocation"];
  [v5 encodeBool:self->_isCoordinate forKey:@"_isCoordinate"];
  [v5 encodeBool:self->_isAddress forKey:@"_isAddress"];
  [v5 encodeBool:self->_isCuratedRoute forKey:@"_isCuratedRoute"];
  [v5 encodeInteger:self->_anchorPointType forKey:@"_anchorPointType"];
}

- (GEOComposedRouteAnchorPoint)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)GEOComposedRouteAnchorPoint;
  id v5 = [(GEOComposedWaypoint *)&v27 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_uniqueID"];
    uniqueID = v5->_uniqueID;
    v5->_uniqueID = (NSUUID *)v6;

    unint64_t v26 = 0;
    id v8 = v4;
    uint64_t v9 = (const void *)[v8 decodeBytesForKey:@"_locationCoordinate" returnedLength:&v26];
    if (v26 && v9)
    {
      if (v26 >= 0x18) {
        size_t v10 = 24;
      }
      else {
        size_t v10 = v26;
      }
      memcpy(&v5->_locationCoordinate, v9, v10);
    }
    unint64_t v26 = 0;
    id v11 = v8;
    double v12 = (const void *)[v11 decodeBytesForKey:@"_routeCoordinate" returnedLength:&v26];
    if (v26 && v12)
    {
      if (v26 >= 8) {
        size_t v13 = 8;
      }
      else {
        size_t v13 = v26;
      }
      memcpy(&v5->_routeCoordinate, v12, v13);
    }
    uint64_t v14 = [v11 decodeObjectOfClass:objc_opt_class() forKey:@"_name"];
    name = v5->_name;
    v5->_name = (NSString *)v14;

    uint64_t v16 = [v11 decodeObjectOfClass:objc_opt_class() forKey:@"_styleAttributes"];
    styleAttributes = v5->_styleAttributes;
    v5->_styleAttributes = (GEOFeatureStyleAttributes *)v16;

    uint64_t v18 = [v11 decodeObjectOfClass:objc_opt_class() forKey:@"_mapItemIdentifier"];
    mapItemIdentifier = v5->_mapItemIdentifier;
    v5->_mapItemIdentifier = (GEOMapItemIdentifier *)v18;

    v5->_mapDisplayType = [v11 decodeIntegerForKey:@"_mapDisplayType"];
    uint64_t v20 = [v11 decodeObjectOfClass:objc_opt_class() forKey:@"_countryCode"];
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v20;

    [v11 decodeDoubleForKey:@"_elevation"];
    v5->_elevation = v22;
    v5->_isCurrentLocation = [v11 decodeBoolForKey:@"_isCurrentLocation"];
    v5->_isCoordinate = [v11 decodeBoolForKey:@"_isCoordinate"];
    v5->_isAddress = [v11 decodeBoolForKey:@"_isAddress"];
    v5->_isCuratedRoute = [v11 decodeBoolForKey:@"_isCuratedRoute"];
    v5->_anchorPointType = [v11 decodeIntegerForKey:@"_anchorPointType"];
    v23 = [(NSUUID *)v5->_uniqueID _geo_data];
    [(GEOComposedWaypoint *)v5 setUniqueWaypointID:v23];

    [(GEOComposedWaypoint *)v5 setType:1];
    [(GEOComposedWaypoint *)v5 setMuid:[(GEOMapItemIdentifier *)v5->_mapItemIdentifier muid]];
    v24 = v5;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uniqueID = self->_uniqueID;
    uint64_t v6 = [v4 uniqueID];
    char v7 = [(NSUUID *)uniqueID isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_uniqueID hash];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  double altitude = self->_locationCoordinate.altitude;
  if (altitude == 1.79769313e308) {
    double altitude = 0.0;
  }
  id v5 = [NSString stringWithFormat:@"%f, %f, %g", *(void *)&self->_locationCoordinate.latitude, *(void *)&self->_locationCoordinate.longitude, *(void *)&altitude];
  [v3 addObject:v5];

  if (self->_name) {
    name = (__CFString *)self->_name;
  }
  else {
    name = @"(No name)";
  }
  [v3 addObject:name];
  char v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  id v8 = v7;
  if (self->_isCurrentLocation) {
    [v7 addObject:@"Current Location"];
  }
  if (self->_isCoordinate) {
    [v8 addObject:@"Coordinate"];
  }
  if (self->_isAddress) {
    [v8 addObject:@"Address"];
  }
  if ([v8 count])
  {
    uint64_t v9 = NSString;
    size_t v10 = [v8 componentsJoinedByString:@", "];
    id v11 = [v9 stringWithFormat:@"(%@)", v10];
    [v3 addObject:v11];
  }
  if (self->_countryCode) {
    objc_msgSend(v3, "addObject:");
  }
  unint64_t v12 = self->_anchorPointType - 1;
  if (v12 > 3) {
    size_t v13 = @"Unknown";
  }
  else {
    size_t v13 = off_1E53E9988[v12];
  }
  [v3 addObject:v13];
  int mapDisplayType = self->_mapDisplayType;
  if (mapDisplayType)
  {
    if (mapDisplayType == 1)
    {
      long long v15 = @"TOPOGRAPHIC";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_mapDisplayType);
      long long v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    long long v15 = @"DEFAULT";
  }
  [v3 addObject:v15];

  uint64_t v16 = NSString;
  uint64_t v18 = GEOPolylineCoordinateAsString(*(void *)&self->_routeCoordinate, 1, 0, v17);
  objc_super v19 = [v16 stringWithFormat:@"[%@]", v18];
  [v3 addObject:v19];

  if ([(GEOMapItemIdentifier *)self->_mapItemIdentifier muid])
  {
    uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"(%llu)", -[GEOMapItemIdentifier muid](self->_mapItemIdentifier, "muid"));
    [v3 addObject:v20];
  }
  v21 = [(NSUUID *)self->_uniqueID UUIDString];
  [v3 addObject:v21];

  double v22 = [v3 componentsJoinedByString:@" | "];

  return v22;
}

- (NSUUID)uniqueID
{
  return self->_uniqueID;
}

- ($1AB5FA073B851C12C2339EC22442E995)locationCoordinate
{
  double latitude = self->_locationCoordinate.latitude;
  double longitude = self->_locationCoordinate.longitude;
  double altitude = self->_locationCoordinate.altitude;
  result.double var2 = altitude;
  result.double var1 = longitude;
  result.double var0 = latitude;
  return result;
}

- ($212C09783140BCCD23384160D545CE0D)routeCoordinate
{
  return ($212C09783140BCCD23384160D545CE0D)self->_routeCoordinate;
}

- (GEOMapItemIdentifier)mapItemIdentifier
{
  return self->_mapItemIdentifier;
}

- (int)mapDisplayType
{
  return self->_mapDisplayType;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (double)elevation
{
  return self->_elevation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_mapItemIdentifier, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);

  objc_storeStrong((id *)&self->_displayInfo, 0);
}

- (BOOL)isCurrentLocation
{
  return self->_isCurrentLocation;
}

- (void)setIsCurrentLocation:(BOOL)a3
{
  self->_isCurrentLocation = a3;
}

- (BOOL)isCoordinate
{
  return self->_isCoordinate;
}

- (void)setIsCoordinate:(BOOL)a3
{
  self->_isCoordinate = a3;
}

- (BOOL)isAddress
{
  return self->_isAddress;
}

- (void)setIsAddress:(BOOL)a3
{
  self->_isAddress = a3;
}

- (BOOL)isCuratedRoute
{
  return self->_isCuratedRoute;
}

- (void)setIsCuratedRoute:(BOOL)a3
{
  self->_isCuratedRoute = a3;
}

- (unint64_t)anchorPointType
{
  return self->_anchorPointType;
}

- (void)setAnchorPointType:(unint64_t)a3
{
  self->_anchorPointType = a3;
}

- (GEOComposedWaypointDisplayInfo)displayInfo
{
  displayInfo = self->_displayInfo;
  if (!displayInfo)
  {
    id v4 = [(GEOComposedRouteAnchorPoint *)self _defaultDisplayInfo];
    id v5 = self->_displayInfo;
    self->_displayInfo = v4;

    displayInfo = self->_displayInfo;
  }

  return displayInfo;
}

- (void)setDisplayInfo:(id)a3
{
}

- (GEOComposedRouteAnchorPoint)initWithUniqueID:(id)a3 locationCoordinate:(id)a4 routeCoordinate:(id)a5
{
  double var2 = a4.var2;
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v11 = a3;
  unint64_t v12 = -[GEOComposedRouteAnchorPoint initWithLocationCoordinate:](self, "initWithLocationCoordinate:", var0, var1, var2);
  size_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_uniqueID, a3);
    v13->_routeCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)a5;
    uint64_t v14 = v13;
  }

  return v13;
}

- (id)updatedAnchorPointWithLocationCoordinate:(id)a3 routeCoordinate:(id)a4
{
  double var2 = a3.var2;
  double var1 = a3.var1;
  double var0 = a3.var0;
  uint64_t v8 = [(GEOComposedRouteAnchorPoint *)self copy];
  *(double *)(v8 + 200) = var0;
  *(double *)(v8 + 208) = var1;
  *(double *)(v8 + 216) = var2;
  *($212C09783140BCCD23384160D545CE0D *)(v8 + 152) = a4;

  return (id)v8;
}

- (void)setUniqueID:(id)a3
{
  p_uniqueID = &self->_uniqueID;
  objc_storeStrong((id *)&self->_uniqueID, a3);
  id v6 = a3;
  id v7 = [(NSUUID *)*p_uniqueID _geo_data];

  [(GEOComposedWaypoint *)self setUniqueWaypointID:v7];
}

@end