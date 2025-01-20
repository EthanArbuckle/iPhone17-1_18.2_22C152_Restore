@interface _GEOTransitRouteStepInfo
- (GEOStep)walkingStep;
- (GEOTransitStep)transitStep;
- (_NSRange)maneuverPointRange;
- (_NSRange)pointRange;
- (double)distance;
- (int64_t)routeSegmentType;
- (unint64_t)numPoints;
- (unsigned)duration;
- (void)setDuration:(unsigned int)a3;
- (void)setManeuverPointRange:(_NSRange)a3;
- (void)setPointRange:(_NSRange)a3;
- (void)setRouteSegmentType:(int64_t)a3;
- (void)setTransitStep:(id)a3;
- (void)setWalkingStep:(id)a3;
@end

@implementation _GEOTransitRouteStepInfo

- (double)distance
{
  walkingStep = self->_walkingStep;
  if (!walkingStep) {
    return (double)[(GEOTransitStep *)self->_transitStep distanceInMeters];
  }
  [(GEOStep *)walkingStep distanceMeters];
  return v4;
}

- (unint64_t)numPoints
{
  if (self->_pointRange.location == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  NSUInteger length = self->_pointRange.length;
  unint64_t v4 = length - 1;
  if (length == 1) {
    unint64_t v4 = 1;
  }
  if (length) {
    return v4;
  }
  else {
    return 0;
  }
}

- (int64_t)routeSegmentType
{
  return self->_routeSegmentType;
}

- (void)setRouteSegmentType:(int64_t)a3
{
  self->_routeSegmentType = a3;
}

- (_NSRange)pointRange
{
  NSUInteger length = self->_pointRange.length;
  NSUInteger location = self->_pointRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setPointRange:(_NSRange)a3
{
  self->_pointRange = a3;
}

- (GEOTransitStep)transitStep
{
  return self->_transitStep;
}

- (void)setTransitStep:(id)a3
{
}

- (unsigned)duration
{
  return self->_duration;
}

- (void)setDuration:(unsigned int)a3
{
  self->_duration = a3;
}

- (GEOStep)walkingStep
{
  return self->_walkingStep;
}

- (void)setWalkingStep:(id)a3
{
}

- (_NSRange)maneuverPointRange
{
  NSUInteger length = self->_maneuverPointRange.length;
  NSUInteger location = self->_maneuverPointRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setManeuverPointRange:(_NSRange)a3
{
  self->_maneuverPointRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walkingStep, 0);

  objc_storeStrong((id *)&self->_transitStep, 0);
}

@end