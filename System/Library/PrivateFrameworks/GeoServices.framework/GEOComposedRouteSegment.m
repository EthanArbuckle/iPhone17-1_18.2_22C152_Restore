@interface GEOComposedRouteSegment
+ (BOOL)supportsSecureCoding;
- ($212C09783140BCCD23384160D545CE0D)endRouteCoordinate;
- ($212C09783140BCCD23384160D545CE0D)startRouteCoordinate;
- (BOOL)contains:(id)a3;
- (GEOComposedRoute)composedRoute;
- (GEOComposedRouteSegment)initWithCoder:(id)a3;
- (GEOComposedRouteSegment)initWithComposedRoute:(id)a3 stepRange:(_NSRange)a4 pointRange:(_NSRange)a5 segmentIndex:(unint64_t)a6;
- (GEOComposedRouteSegment)nextSegment;
- (GEOPBTransitStop)endingTransitStop;
- (GEOPBTransitStop)startingTransitStop;
- (NSArray)steps;
- (_NSRange)pointRange;
- (_NSRange)stepRange;
- (_NSRange)transitStepRange;
- (double)expectedTime;
- (double)remainingDistanceAlongSegmentFromStepIndex:(unint64_t)a3 currentStepRemainingDistance:(double)a4;
- (double)remainingTimeAlongSegmentFromStepIndex:(unint64_t)a3 currentStepRemainingDistance:(double)a4;
- (id)description;
- (int)transportType;
- (int64_t)type;
- (unint64_t)endStepIndex;
- (unint64_t)numberOfTransitStops;
- (unint64_t)pointCount;
- (unint64_t)segmentIndex;
- (unint64_t)startStepIndex;
- (unint64_t)stepCount;
- (unsigned)endPointIndex;
- (unsigned)startPointIndex;
- (void)encodeWithCoder:(id)a3;
- (void)setComposedRoute:(id)a3;
@end

@implementation GEOComposedRouteSegment

- (GEOComposedRouteSegment)initWithComposedRoute:(id)a3 stepRange:(_NSRange)a4 pointRange:(_NSRange)a5 segmentIndex:(unint64_t)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v9 = a4.length;
  NSUInteger v10 = a4.location;
  id v12 = a3;
  v17.receiver = self;
  v17.super_class = (Class)GEOComposedRouteSegment;
  v13 = [(GEOComposedRouteSegment *)&v17 init];
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_composedRoute, v12);
    v14->_stepRange.NSUInteger location = v10;
    v14->_stepRange.NSUInteger length = v9;
    v14->_pointRange.NSUInteger location = location;
    v14->_pointRange.NSUInteger length = length;
    v14->_segmentIndex = a6;
    v15 = v14;
  }

  return v14;
}

- (GEOComposedRouteSegment)nextSegment
{
  unint64_t v3 = self->_segmentIndex + 1;
  p_composedRoute = &self->_composedRoute;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_composedRoute);
  v6 = [WeakRetained segments];
  if (v3 >= [v6 count])
  {
    NSUInteger v9 = 0;
  }
  else
  {
    id v7 = objc_loadWeakRetained((id *)p_composedRoute);
    v8 = [v7 segments];
    NSUInteger v9 = [v8 objectAtIndexedSubscript:self->_segmentIndex + 1];
  }

  return (GEOComposedRouteSegment *)v9;
}

- (int64_t)type
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)unint64_t v3 = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: Must be implemented by subclasses.", v3, 2u);
  }
  return 0;
}

- (int)transportType
{
  int64_t v2 = [(GEOComposedRouteSegment *)self type];
  if ((unint64_t)(v2 - 1) > 5) {
    return 4;
  }
  else {
    return dword_18A63DD80[v2 - 1];
  }
}

- (double)expectedTime
{
  unint64_t v3 = [(GEOComposedRouteSegment *)self startStepIndex];

  [(GEOComposedRouteSegment *)self remainingTimeAlongSegmentFromStepIndex:v3 currentStepRemainingDistance:0.0];
  return result;
}

- (unsigned)startPointIndex
{
  return self->_pointRange.location;
}

- ($212C09783140BCCD23384160D545CE0D)startRouteCoordinate
{
  return ($212C09783140BCCD23384160D545CE0D)[(GEOComposedRouteSegment *)self startPointIndex];
}

- (unsigned)endPointIndex
{
  NSUInteger length = self->_pointRange.length;
  if (length) {
    return LODWORD(self->_pointRange.location) + length - 1;
  }
  else {
    return self->_pointRange.location;
  }
}

- ($212C09783140BCCD23384160D545CE0D)endRouteCoordinate
{
  return ($212C09783140BCCD23384160D545CE0D)[(GEOComposedRouteSegment *)self endPointIndex];
}

- (unint64_t)pointCount
{
  return self->_pointRange.length;
}

- (unint64_t)startStepIndex
{
  return self->_stepRange.location;
}

- (unint64_t)endStepIndex
{
  NSUInteger length = self->_stepRange.length;
  BOOL v3 = length != 0;
  NSUInteger v4 = length - 1;
  if (!v3) {
    NSUInteger v4 = 0;
  }
  return self->_stepRange.location + v4;
}

- (unint64_t)stepCount
{
  return self->_stepRange.length;
}

- (NSArray)steps
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_composedRoute);
  NSUInteger v4 = [WeakRetained steps];
  v5 = objc_msgSend(v4, "subarrayWithRange:", self->_stepRange.location, self->_stepRange.length);

  return (NSArray *)v5;
}

- (BOOL)contains:(id)a3
{
  id v4 = a3;
  v5 = [(GEOComposedRouteSegment *)self composedRoute];
  v6 = [v5 steps];
  unint64_t v7 = [v6 indexOfObject:v4];

  unint64_t v8 = [(GEOComposedRouteSegment *)self stepRange];
  BOOL v11 = v7 >= v8 && v7 - v8 < v9;

  return v11;
}

- (_NSRange)transitStepRange
{
  NSUInteger v2 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v3 = 0;
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

- (unint64_t)numberOfTransitStops
{
  return 0;
}

- (double)remainingDistanceAlongSegmentFromStepIndex:(unint64_t)a3 currentStepRemainingDistance:(double)a4
{
  double v7 = 0.0;
  if ([(GEOComposedRouteSegment *)self endStepIndex] >= a3)
  {
    unint64_t v8 = a3 + 1;
    if (v8 <= [(GEOComposedRouteSegment *)self endStepIndex])
    {
      double v7 = a4;
      do
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_composedRoute);
        NSUInteger v10 = [WeakRetained stepAtIndex:v8];

        [v10 distance];
        double v7 = v7 + v11;

        ++v8;
      }
      while (v8 <= [(GEOComposedRouteSegment *)self endStepIndex]);
    }
    else
    {
      return a4;
    }
  }
  return v7;
}

- (double)remainingTimeAlongSegmentFromStepIndex:(unint64_t)a3 currentStepRemainingDistance:(double)a4
{
  double v7 = 0.0;
  if ([(GEOComposedRouteSegment *)self endStepIndex] >= a3)
  {
    uint64_t v8 = 0;
    do
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_composedRoute);
      NSUInteger v10 = [WeakRetained stepAtIndex:a3 + v8];

      double v11 = (double)[v10 duration];
      if (!v8)
      {
        id v12 = [v10 geoStep];
        v13 = [v12 timeCheckpoints];

        [v10 distance];
        double v11 = GEORemainingTimeForRemainingDistanceAlongStep(v13, a4, v11, v14);
      }
      double v7 = v7 + v11;

      ++v8;
    }
    while (a3 + v8 <= [(GEOComposedRouteSegment *)self endStepIndex]);
  }
  return v7;
}

- (GEOPBTransitStop)startingTransitStop
{
  return 0;
}

- (GEOPBTransitStop)endingTransitStop
{
  return 0;
}

- (id)description
{
  NSUInteger v3 = NSString;
  unint64_t segmentIndex = self->_segmentIndex;
  unint64_t v5 = [(GEOComposedRouteSegment *)self type] - 1;
  if (v5 > 5) {
    v6 = @"unknown";
  }
  else {
    v6 = off_1E53E8010[v5];
  }
  unint64_t v7 = [(GEOComposedRouteSegment *)self startStepIndex];
  unint64_t v8 = [(GEOComposedRouteSegment *)self endStepIndex];
  $212C09783140BCCD23384160D545CE0D v9 = [(GEOComposedRouteSegment *)self startRouteCoordinate];
  double v11 = GEOPolylineCoordinateAsString(*(void *)&v9, 1, 0, v10);
  $212C09783140BCCD23384160D545CE0D v12 = [(GEOComposedRouteSegment *)self endRouteCoordinate];
  double v14 = GEOPolylineCoordinateAsString(*(void *)&v12, 1, 0, v13);
  v15 = [v3 stringWithFormat:@"Segment %d | %@, Steps %d-%d, [%@ - %@]", segmentIndex, v6, v7, v8, v11, v14];

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedRouteSegment)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOComposedRouteSegment;
  unint64_t v5 = [(GEOComposedRouteSegment *)&v12 init];
  if (v5)
  {
    v5->_unint64_t segmentIndex = [v4 decodeIntegerForKey:@"_segmentIndex"];
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_pointRange"];
    v5->_pointRange.NSUInteger location = [v6 rangeValue];
    v5->_pointRange.NSUInteger length = v7;
    unint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_stepRange"];
    v5->_stepRange.NSUInteger location = [v8 rangeValue];
    v5->_stepRange.NSUInteger length = v9;
    double v10 = v5;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t segmentIndex = self->_segmentIndex;
  id v5 = a3;
  [v5 encodeInteger:segmentIndex forKey:@"_segmentIndex"];
  v6 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", self->_pointRange.location, self->_pointRange.length);
  [v5 encodeObject:v6 forKey:@"_pointRange"];

  objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", self->_stepRange.location, self->_stepRange.length);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v7 forKey:@"_stepRange"];
}

- (GEOComposedRoute)composedRoute
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_composedRoute);

  return (GEOComposedRoute *)WeakRetained;
}

- (void)setComposedRoute:(id)a3
{
}

- (unint64_t)segmentIndex
{
  return self->_segmentIndex;
}

- (_NSRange)stepRange
{
  NSUInteger length = self->_stepRange.length;
  NSUInteger location = self->_stepRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (_NSRange)pointRange
{
  NSUInteger length = self->_pointRange.length;
  NSUInteger location = self->_pointRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void).cxx_destruct
{
}

@end