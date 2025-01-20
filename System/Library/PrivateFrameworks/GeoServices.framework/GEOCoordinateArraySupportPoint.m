@interface GEOCoordinateArraySupportPoint
+ (BOOL)supportsSecureCoding;
- (BOOL)isUTurn;
- (GEOCoordinateArraySupportPoint)init;
- (GEOCoordinateArraySupportPoint)initWithCoder:(id)a3;
- (NSUUID)anchorPointID;
- (PolylineCoordinate)routeCoordinate;
- (double)heading;
- (id).cxx_construct;
- (id)description;
- (int)legacyFormOfWay;
- (int)legacyRoadClass;
- (int64_t)matchType;
- (int64_t)roadID;
- (unint64_t)index;
- (void)encodeWithCoder:(id)a3;
- (void)setAnchorPointID:(id)a3;
- (void)setHeading:(double)a3;
- (void)setIndex:(unint64_t)a3;
- (void)setIsUTurn:(BOOL)a3;
- (void)setLegacyFormOfWay:(int)a3;
- (void)setLegacyRoadClass:(int)a3;
- (void)setMatchType:(int64_t)a3;
- (void)setRoadID:(int64_t)a3;
- (void)setRouteCoordinate:(PolylineCoordinate)a3;
@end

@implementation GEOCoordinateArraySupportPoint

- (GEOCoordinateArraySupportPoint)init
{
  v3.receiver = self;
  v3.super_class = (Class)GEOCoordinateArraySupportPoint;
  result = [(GEOCoordinateArraySupportPoint *)&v3 init];
  if (result)
  {
    result->_heading = -1.0;
    *(void *)&result->_legacyRoadClass = 9;
    result->_matchType = 0;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOCoordinateArraySupportPoint)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOCoordinateArraySupportPoint;
  v5 = [(GEOCoordinateArraySupportPoint *)&v15 init];
  if (v5)
  {
    unint64_t v14 = 0;
    id v6 = v4;
    v7 = (const void *)[v6 decodeBytesForKey:@"_routeCoordinate" returnedLength:&v14];
    if (v14 && v7)
    {
      if (v14 >= 8) {
        size_t v8 = 8;
      }
      else {
        size_t v8 = v14;
      }
      memcpy(&v5->_routeCoordinate, v7, v8);
    }
    v5->_index = [v6 decodeIntegerForKey:@"_index"];
    v5->_roadID = [v6 decodeInt64ForKey:@"_roadID"];
    [v6 decodeDoubleForKey:@"_heading"];
    v5->_heading = v9;
    v5->_isUTurn = [v6 decodeBoolForKey:@"_isUTurn"];
    v5->_legacyRoadClass = [v6 decodeIntegerForKey:@"_legacyRoadClass"];
    v5->_legacyFormOfWay = [v6 decodeIntegerForKey:@"_legacyFormOfWay"];
    uint64_t v10 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"_anchorPointID"];
    anchorPointID = v5->_anchorPointID;
    v5->_anchorPointID = (NSUUID *)v10;

    v5->_matchType = [v6 decodeIntegerForKey:@"_matchType"];
    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeBytes:&self->_routeCoordinate length:8 forKey:@"_routeCoordinate"];
  [v4 encodeInteger:self->_index forKey:@"_index"];
  [v4 encodeInt64:self->_roadID forKey:@"_roadID"];
  [v4 encodeDouble:@"_heading" forKey:self->_heading];
  [v4 encodeBool:self->_isUTurn forKey:@"_isUTurn"];
  [v4 encodeInteger:self->_legacyRoadClass forKey:@"_legacyRoadClass"];
  [v4 encodeInteger:self->_legacyFormOfWay forKey:@"_legacyFormOfWay"];
  [v4 encodeObject:self->_anchorPointID forKey:@"_anchorPointID"];
  [v4 encodeInteger:self->_matchType forKey:@"_matchType"];
}

- (id)description
{
  int64_t matchType = self->_matchType;
  if (matchType)
  {
    if (matchType == 1) {
      v5 = @"No match start";
    }
    else {
      v5 = @"No match end";
    }
    id v6 = v5;
    v7 = (void *)MEMORY[0x1E4F28E78];
    double v9 = GEOPolylineCoordinateAsString(*(void *)&self->_routeCoordinate, 1, 0, v8);
    uint64_t v10 = [v7 stringWithFormat:@"[%@] (%@)", v9, v6];

    goto LABEL_10;
  }
  v11 = (void *)MEMORY[0x1E4F28E78];
  v12 = GEOPolylineCoordinateAsString(*(void *)&self->_routeCoordinate, 1, 0, v2);
  uint64_t v10 = [v11 stringWithFormat:@"[%@] %d: %lld", v12, self->_index, self->_roadID];

  if (self->_isUTurn) {
    [v10 appendString:@" (U-turn)"];
  }
  anchorPointID = self->_anchorPointID;
  if (anchorPointID)
  {
    id v6 = [(NSUUID *)anchorPointID UUIDString];
    [v10 appendFormat:@" | Anchor: %@", v6];
LABEL_10:
  }

  return v10;
}

- (PolylineCoordinate)routeCoordinate
{
  return self->_routeCoordinate;
}

- (void)setRouteCoordinate:(PolylineCoordinate)a3
{
  self->_routeCoordinate = a3;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (int64_t)roadID
{
  return self->_roadID;
}

- (void)setRoadID:(int64_t)a3
{
  self->_roadID = a3;
}

- (double)heading
{
  return self->_heading;
}

- (void)setHeading:(double)a3
{
  self->_heading = a3;
}

- (BOOL)isUTurn
{
  return self->_isUTurn;
}

- (void)setIsUTurn:(BOOL)a3
{
  self->_isUTurn = a3;
}

- (int)legacyRoadClass
{
  return self->_legacyRoadClass;
}

- (void)setLegacyRoadClass:(int)a3
{
  self->_legacyRoadClass = a3;
}

- (int)legacyFormOfWay
{
  return self->_legacyFormOfWay;
}

- (void)setLegacyFormOfWay:(int)a3
{
  self->_legacyFormOfWay = a3;
}

- (NSUUID)anchorPointID
{
  return self->_anchorPointID;
}

- (void)setAnchorPointID:(id)a3
{
}

- (int64_t)matchType
{
  return self->_matchType;
}

- (void)setMatchType:(int64_t)a3
{
  self->_int64_t matchType = a3;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0xBF80000000000000;
  return self;
}

@end