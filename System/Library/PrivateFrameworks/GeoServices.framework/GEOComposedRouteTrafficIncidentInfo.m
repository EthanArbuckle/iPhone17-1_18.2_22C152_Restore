@interface GEOComposedRouteTrafficIncidentInfo
+ (BOOL)supportsSecureCoding;
- ($212C09783140BCCD23384160D545CE0D)routeCoordinate;
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate;
- (GEOComposedRouteTrafficIncidentInfo)init;
- (GEOComposedRouteTrafficIncidentInfo)initWithCoder:(id)a3;
- (GEORouteIncident)incident;
- (double)offsetMeters;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCoordinate:(id)a3;
- (void)setIncident:(id)a3;
- (void)setOffsetMeters:(double)a3;
- (void)setRouteCoordinate:(id)a3;
@end

@implementation GEOComposedRouteTrafficIncidentInfo

- (GEOComposedRouteTrafficIncidentInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOComposedRouteTrafficIncidentInfo;
  v2 = [(GEOComposedRouteTrafficIncidentInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_offsetMeters = -1.0;
    v2->_routeCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)0xBF80000000000000;
    v4 = v2;
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedRouteTrafficIncidentInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GEOComposedRouteTrafficIncidentInfo;
  v5 = [(GEOComposedRouteTrafficIncidentInfo *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_incident"];
    incident = v5->_incident;
    v5->_incident = (GEORouteIncident *)v6;

    unint64_t v15 = 0;
    id v8 = v4;
    v9 = (const void *)[v8 decodeBytesForKey:@"_coordinate" returnedLength:&v15];
    if (v15 && v9)
    {
      if (v15 >= 0x10) {
        size_t v10 = 16;
      }
      else {
        size_t v10 = v15;
      }
      memcpy(&v5->_coordinate, v9, v10);
    }
    [v8 decodeDoubleForKey:@"_offsetMeters"];
    v5->_offsetMeters = v11;
    unint64_t v15 = 0;
    v12 = (const void *)[v8 decodeBytesForKey:@"_routeCoordinate" returnedLength:&v15];
    if (v15 && v12)
    {
      if (v15 >= 8) {
        size_t v13 = 8;
      }
      else {
        size_t v13 = v15;
      }
      memcpy(&v5->_routeCoordinate, v12, v13);
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  incident = self->_incident;
  id v5 = a3;
  [v5 encodeObject:incident forKey:@"_incident"];
  [v5 encodeBytes:&self->_coordinate length:16 forKey:@"_coordinate"];
  [v5 encodeDouble:@"_offsetMeters" forKey:self->_offsetMeters];
  [v5 encodeBytes:&self->_routeCoordinate length:8 forKey:@"_routeCoordinate"];
}

- (id)description
{
  uint64_t routeCoordinate = (uint64_t)self->_routeCoordinate;
  LODWORD(v2) = HIDWORD(routeCoordinate);
  if (*((float *)&routeCoordinate + 1) >= 0.0)
  {
    uint64_t v6 = NSString;
    v7 = GEOPolylineCoordinateAsString(routeCoordinate, 1, 0, v2);
    id v5 = [v6 stringWithFormat:@"[%@ | %gm] ", v7, *(void *)&self->_offsetMeters];
  }
  else
  {
    id v5 = &stru_1ED51F370;
  }
  id v8 = NSString;
  uint64_t v9 = [(GEORouteIncident *)self->_incident type];
  size_t v10 = @"ACCIDENT";
  switch((int)v9)
  {
    case 0:
      break;
    case 1:
      size_t v10 = @"CONSTRUCTION";
      break;
    case 2:
      size_t v10 = @"ROAD_CLOSURE";
      break;
    case 3:
      size_t v10 = @"EVENT";
      break;
    case 4:
      size_t v10 = @"HAZARD";
      break;
    case 5:
      size_t v10 = @"LANE_CLOSURE";
      break;
    case 6:
      size_t v10 = @"RAMP_CLOSURE";
      break;
    case 7:
      size_t v10 = @"TRAFFIC";
      break;
    case 8:
      size_t v10 = @"WALKING_CLOSURE";
      break;
    case 9:
      size_t v10 = @"CONGESTION_ZONE_RESTRICTION";
      break;
    case 10:
      size_t v10 = @"LICENSE_PLATE_RESTRICTION";
      break;
    case 11:
    case 12:
      goto LABEL_8;
    case 13:
      size_t v10 = @"SPEED_TRAP";
      break;
    case 14:
      size_t v10 = @"AREA_INCIDENT";
      break;
    default:
      if (v9 == 100)
      {
        size_t v10 = @"TIME_BASED_RESTRICTION";
      }
      else
      {
LABEL_8:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v9);
        size_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      break;
  }
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  size_t v13 = [(GEORouteIncident *)self->_incident street];
  v14 = [v8 stringWithFormat:@"%@%@ (%f, %f) %@", v5, v10, *(void *)&latitude, *(void *)&longitude, v13];

  return v14;
}

- (GEORouteIncident)incident
{
  return self->_incident;
}

- (void)setIncident:(id)a3
{
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void)setCoordinate:(id)a3
{
  self->_coordinate = ($AB5116BA7E623E054F959CECB034F4E7)a3;
}

- (double)offsetMeters
{
  return self->_offsetMeters;
}

- (void)setOffsetMeters:(double)a3
{
  self->_offsetMeters = a3;
}

- ($212C09783140BCCD23384160D545CE0D)routeCoordinate
{
  return ($212C09783140BCCD23384160D545CE0D)self->_routeCoordinate;
}

- (void)setRouteCoordinate:(id)a3
{
  self->_uint64_t routeCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)a3;
}

- (void).cxx_destruct
{
}

@end