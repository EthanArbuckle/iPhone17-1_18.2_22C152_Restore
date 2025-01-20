@interface GEOComposedRouteLaneChangeInfo
+ (BOOL)supportsSecureCoding;
- ($1AB5FA073B851C12C2339EC22442E995)endCoordinate;
- ($1AB5FA073B851C12C2339EC22442E995)startCoordinate;
- (GEOComposedRouteLaneChangeInfo)initWithCoder:(id)a3;
- (GEOComposedRouteLaneChangeInfo)initWithGeoLaneChangeInfo:(id)a3 pathIndex:(unint64_t)a4 coordinates:(id)a5 distanceOffset:(double)a6;
- (GEOPolylineCoordinateRange)routeCoordinateRange;
- (id)description;
- (unint64_t)laneCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOComposedRouteLaneChangeInfo

- (id)description
{
  v4 = NSString;
  v5 = GEOPolylineCoordinateRangeAsString(*(void *)&self->_routeCoordinateRange.start, *(void *)&self->_routeCoordinateRange.end, v2);
  v6 = [v4 stringWithFormat:@"[%@] (%f, %f) to (%f, %f) | %d lanes", v5, *(void *)&self->_startCoordinate.latitude, *(void *)&self->_startCoordinate.longitude, *(void *)&self->_endCoordinate.latitude, *(void *)&self->_endCoordinate.longitude, self->_laneCount];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t laneCount = self->_laneCount;
  id v5 = a3;
  [v5 encodeInteger:laneCount forKey:@"_laneCount"];
  [v5 encodeBytes:&self->_routeCoordinateRange length:16 forKey:@"_routeCoordinateRange"];
  [v5 encodeBytes:&self->_startCoordinate length:24 forKey:@"_startCoordinate"];
  [v5 encodeBytes:&self->_endCoordinate length:24 forKey:@"_endCoordinate"];
}

- (GEOComposedRouteLaneChangeInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)GEOComposedRouteLaneChangeInfo;
  id v5 = [(GEOComposedRouteLaneChangeInfo *)&v17 init];
  if (v5)
  {
    v5->_unint64_t laneCount = [v4 decodeIntegerForKey:@"_laneCount"];
    unint64_t v16 = 0;
    id v6 = v4;
    v7 = (const void *)[v6 decodeBytesForKey:@"_routeCoordinateRange" returnedLength:&v16];
    if (v16 && v7)
    {
      if (v16 >= 0x10) {
        size_t v8 = 16;
      }
      else {
        size_t v8 = v16;
      }
      memcpy(&v5->_routeCoordinateRange, v7, v8);
    }
    unint64_t v16 = 0;
    id v9 = v6;
    v10 = (const void *)[v9 decodeBytesForKey:@"_startCoordinate" returnedLength:&v16];
    if (v16 && v10)
    {
      if (v16 >= 0x18) {
        size_t v11 = 24;
      }
      else {
        size_t v11 = v16;
      }
      memcpy(&v5->_startCoordinate, v10, v11);
    }
    unint64_t v16 = 0;
    v12 = (const void *)[v9 decodeBytesForKey:@"_endCoordinate" returnedLength:&v16];
    if (v16 && v12)
    {
      if (v16 >= 0x18) {
        size_t v13 = 24;
      }
      else {
        size_t v13 = v16;
      }
      memcpy(&v5->_endCoordinate, v12, v13);
    }
    v14 = v5;
  }

  return v5;
}

- (unint64_t)laneCount
{
  return self->_laneCount;
}

- (GEOPolylineCoordinateRange)routeCoordinateRange
{
  PolylineCoordinate end = self->_routeCoordinateRange.end;
  PolylineCoordinate start = self->_routeCoordinateRange.start;
  result.PolylineCoordinate end = end;
  result.PolylineCoordinate start = start;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)startCoordinate
{
  double latitude = self->_startCoordinate.latitude;
  double longitude = self->_startCoordinate.longitude;
  double altitude = self->_startCoordinate.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)endCoordinate
{
  double latitude = self->_endCoordinate.latitude;
  double longitude = self->_endCoordinate.longitude;
  double altitude = self->_endCoordinate.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (GEOComposedRouteLaneChangeInfo)initWithGeoLaneChangeInfo:(id)a3 pathIndex:(unint64_t)a4 coordinates:(id)a5 distanceOffset:(double)a6
{
  id v10 = a3;
  id v11 = a5;
  v40.receiver = self;
  v40.super_class = (Class)GEOComposedRouteLaneChangeInfo;
  v12 = [(GEOComposedRouteLaneChangeInfo *)&v40 init];
  if (v12)
  {
    v12->_unint64_t laneCount = [v10 numValidLanes];
    [v11 distanceFromStartToStartOfPathIndex:a4];
    double v14 = v13;
    uint64_t v15 = [v11 routeCoordinateRangeForPathIndex:a4];
    uint64_t v17 = v16;
    double v18 = v14 + a6;
    double v19 = v14 + a6 + (float)[v10 startOffsetCm] * 0.01;
    float v20 = (float)[v10 endOffsetCm];
    uint64_t v21 = [v11 routeCoordinateForDistanceAfterStart:v19];
    if (v17 == v15)
    {
      uint64_t v22 = v15;
      uint64_t v23 = v17;
      if (*((float *)&v17 + 1) == *((float *)&v15 + 1)
        || (uint64_t v22 = v15, v23 = v17, *((float *)&v17 + 1) >= *((float *)&v15 + 1)))
      {
LABEL_8:
        float v24 = *((float *)&v22 + 1);
        if (v22 == v21)
        {
          BOOL v25 = *((float *)&v22 + 1) != *((float *)&v21 + 1) && *((float *)&v22 + 1) < *((float *)&v21 + 1);
          uint64_t v26 = v22;
          if (!v25)
          {
LABEL_13:
            if (v22 == v23)
            {
              if (v24 == *((float *)&v23 + 1) || v24 >= *((float *)&v23 + 1))
              {
LABEL_21:
                v12->_routeCoordinateRange.PolylineCoordinate start = (PolylineCoordinate)v23;
                uint64_t v27 = [v11 routeCoordinateForDistanceAfterStart:v18 + v20 * 0.01];
                if (v17 == v15)
                {
                  if (*((float *)&v17 + 1) == *((float *)&v15 + 1) || *((float *)&v17 + 1) >= *((float *)&v15 + 1)) {
                    goto LABEL_24;
                  }
                }
                else if (v17 >= v15)
                {
LABEL_24:
                  uint64_t v28 = v15;
                  uint64_t v15 = v17;
                  goto LABEL_27;
                }
                uint64_t v28 = v17;
LABEL_27:
                float v29 = *((float *)&v28 + 1);
                if (v28 == v27)
                {
                  BOOL v30 = *((float *)&v28 + 1) != *((float *)&v27 + 1) && *((float *)&v28 + 1) < *((float *)&v27 + 1);
                  uint64_t v31 = v28;
                  if (!v30)
                  {
LABEL_32:
                    if (v28 == v15)
                    {
                      if (v29 == *((float *)&v15 + 1) || v29 >= *((float *)&v15 + 1)) {
                        goto LABEL_40;
                      }
                    }
                    else if (v28 >= v15)
                    {
LABEL_40:
                      v12->_routeCoordinateRange.PolylineCoordinate end = (PolylineCoordinate)v15;
                      [v11 coordinateForRouteCoordinate:*(void *)&v12->_routeCoordinateRange.start];
                      v12->_startCoordinate.double latitude = v32;
                      v12->_startCoordinate.double longitude = v33;
                      v12->_startCoordinate.double altitude = v34;
                      [v11 coordinateForRouteCoordinate:*(void *)&v12->_routeCoordinateRange.end];
                      v12->_endCoordinate.double latitude = v35;
                      v12->_endCoordinate.double longitude = v36;
                      v12->_endCoordinate.double altitude = v37;
                      v38 = v12;
                      goto LABEL_41;
                    }
                    uint64_t v15 = v31;
                    goto LABEL_40;
                  }
                }
                else
                {
                  uint64_t v31 = v28;
                  if (v28 >= v27) {
                    goto LABEL_32;
                  }
                }
                float v29 = *((float *)&v27 + 1);
                LODWORD(v28) = v27;
                uint64_t v31 = v27;
                goto LABEL_32;
              }
            }
            else if (v22 >= v23)
            {
              goto LABEL_21;
            }
            uint64_t v23 = v26;
            goto LABEL_21;
          }
        }
        else
        {
          uint64_t v26 = v22;
          if (v22 >= v21) {
            goto LABEL_13;
          }
        }
        float v24 = *((float *)&v21 + 1);
        LODWORD(v22) = v21;
        uint64_t v26 = v21;
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v22 = v15;
      uint64_t v23 = v17;
      if (v17 >= v15) {
        goto LABEL_8;
      }
    }
    uint64_t v22 = v17;
    uint64_t v23 = v15;
    goto LABEL_8;
  }
LABEL_41:

  return v12;
}

@end