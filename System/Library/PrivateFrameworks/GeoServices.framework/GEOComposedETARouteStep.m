@interface GEOComposedETARouteStep
+ (BOOL)supportsSecureCoding;
- (GEOComposedETARouteStep)init;
- (GEOComposedETARouteStep)initWithCoder:(id)a3;
- (GEOPolylineCoordinateRange)routeCoordinateRange;
- (GEOTimeCheckpoints)timeCheckpoints;
- (NSString)description;
- (double)distance;
- (double)length;
- (double)travelDuration;
- (double)travelTime;
- (id)descriptionWithPrecision:(unint64_t)a3;
- (unint64_t)stepID;
- (void)encodeWithCoder:(id)a3;
- (void)setLength:(double)a3;
- (void)setRouteCoordinateRange:(GEOPolylineCoordinateRange)a3;
- (void)setStepID:(unint64_t)a3;
- (void)setTimeCheckpoints:(id)a3;
- (void)setTravelDuration:(double)a3;
@end

@implementation GEOComposedETARouteStep

- (GEOComposedETARouteStep)init
{
  v3.receiver = self;
  v3.super_class = (Class)GEOComposedETARouteStep;
  result = [(GEOComposedETARouteStep *)&v3 init];
  if (result) {
    result->_routeCoordinateRange = (GEOPolylineCoordinateRange)GEOPolylineCoordinateRangeInvalid;
  }
  return result;
}

- (NSString)description
{
  return (NSString *)[(GEOComposedETARouteStep *)self descriptionWithPrecision:0];
}

- (id)descriptionWithPrecision:(unint64_t)a3
{
  double v5 = self->_length / self->_travelDuration;
  double v6 = v5 * 2.237;
  v7 = (void *)MEMORY[0x1E4F28E78];
  unint64_t stepID = self->_stepID;
  v9 = GEOPolylineCoordinateRangeAsString(*(void *)&self->_routeCoordinateRange.start, *(void *)&self->_routeCoordinateRange.end, v5);
  v10 = [v7 stringWithFormat:@"%*d: [%@] %gm, %gs, %0.1f mph", a3, stepID, v9, *(void *)&self->_length, *(void *)&self->_travelDuration, *(void *)&v6];

  if ([(GEOTimeCheckpoints *)self->_timeCheckpoints distToNextCheckpointsCount]) {
    objc_msgSend(v10, "appendFormat:", @" | timeCheckpoints: %d", -[GEOTimeCheckpoints distToNextCheckpointsCount](self->_timeCheckpoints, "distToNextCheckpointsCount"));
  }

  return v10;
}

- (double)distance
{
  return self->_length;
}

- (double)travelTime
{
  return self->_travelDuration;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedETARouteStep)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOComposedETARouteStep;
  double v5 = [(GEOComposedETARouteStep *)&v15 init];
  if (v5)
  {
    v5->_unint64_t stepID = [v4 decodeIntegerForKey:@"_stepID"];
    unint64_t v14 = 0;
    id v6 = v4;
    v7 = (const void *)[v6 decodeBytesForKey:@"_routeCoordinateRange" returnedLength:&v14];
    if (v14 && v7)
    {
      if (v14 >= 0x10) {
        size_t v8 = 16;
      }
      else {
        size_t v8 = v14;
      }
      memcpy(&v5->_routeCoordinateRange, v7, v8);
    }
    [v6 decodeDoubleForKey:@"_travelDuration"];
    v5->_travelDuration = v9;
    [v6 decodeDoubleForKey:@"_length"];
    v5->_length = v10;
    uint64_t v11 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"_timeCheckpoints"];
    timeCheckpoints = v5->_timeCheckpoints;
    v5->_timeCheckpoints = (GEOTimeCheckpoints *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t stepID = self->_stepID;
  id v5 = a3;
  [v5 encodeInteger:stepID forKey:@"_stepID"];
  [v5 encodeBytes:&self->_routeCoordinateRange length:16 forKey:@"_routeCoordinateRange"];
  [v5 encodeDouble:@"_travelDuration" forKey:self->_travelDuration];
  [v5 encodeDouble:@"_length" forKey:self->_length];
  [v5 encodeObject:self->_timeCheckpoints forKey:@"_timeCheckpoints"];
}

- (unint64_t)stepID
{
  return self->_stepID;
}

- (void)setStepID:(unint64_t)a3
{
  self->_unint64_t stepID = a3;
}

- (GEOPolylineCoordinateRange)routeCoordinateRange
{
  PolylineCoordinate end = self->_routeCoordinateRange.end;
  PolylineCoordinate start = self->_routeCoordinateRange.start;
  result.PolylineCoordinate end = end;
  result.PolylineCoordinate start = start;
  return result;
}

- (void)setRouteCoordinateRange:(GEOPolylineCoordinateRange)a3
{
  self->_routeCoordinateRange = a3;
}

- (double)travelDuration
{
  return self->_travelDuration;
}

- (void)setTravelDuration:(double)a3
{
  self->_travelDuration = a3;
}

- (double)length
{
  return self->_length;
}

- (void)setLength:(double)a3
{
  self->_length = a3;
}

- (GEOTimeCheckpoints)timeCheckpoints
{
  return self->_timeCheckpoints;
}

- (void)setTimeCheckpoints:(id)a3
{
}

- (void).cxx_destruct
{
}

@end