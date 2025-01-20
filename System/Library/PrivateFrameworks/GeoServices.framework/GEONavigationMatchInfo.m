@interface GEONavigationMatchInfo
- (double)courseDelta;
- (double)courseMatchScore;
- (double)courseWeight;
- (double)distanceFromNearestJunction;
- (double)distanceFromRoad;
- (double)distanceFromRoute;
- (double)distanceMatchScore;
- (double)distanceWeight;
- (double)maxCourseDelta;
- (double)maxDistance;
- (double)roadCourseDelta;
- (double)roadWidthOnRoute;
- (double)routeMatchScore;
- (id)description;
- (void)setCourseDelta:(double)a3;
- (void)setCourseMatchScore:(double)a3;
- (void)setCourseWeight:(double)a3;
- (void)setDistanceFromNearestJunction:(double)a3;
- (void)setDistanceFromRoad:(double)a3;
- (void)setDistanceFromRoute:(double)a3;
- (void)setDistanceMatchScore:(double)a3;
- (void)setDistanceWeight:(double)a3;
- (void)setMaxCourseDelta:(double)a3;
- (void)setMaxDistance:(double)a3;
- (void)setRoadCourseDelta:(double)a3;
- (void)setRoadWidthOnRoute:(double)a3;
- (void)setRouteMatchScore:(double)a3;
@end

@implementation GEONavigationMatchInfo

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"GEONavigationMatchInfo:\n\trouteMatchScore: %0.2f\n\tdistanceFromRoute: %0.2f\n\tmaxDistance: %0.2f\n\tdistanceMatchScore: %0.2f\n\tdistanceWeight: %0.2f\n\tcourseDelta: %0.2f\n\tmaxCourseDelta: %0.2f\n\tcourseMatchScore: %0.2f\n\tcourseWeight: %0.2f\n\troadWidthOnRoute: %0.2f\n\tdistanceFromRoad: %0.2f\n\troadCourseDelta: %0.2f\n\tdistanceFromNearestJunction: %0.2f", *(void *)&self->routeMatchScore, *(void *)&self->distanceFromRoute, *(void *)&self->maxDistance, *(void *)&self->distanceMatchScore, *(void *)&self->distanceWeight, *(void *)&self->courseDelta, *(void *)&self->maxCourseDelta, *(void *)&self->courseMatchScore, *(void *)&self->courseWeight, *(void *)&self->roadWidthOnRoute, *(void *)&self->distanceFromRoad, *(void *)&self->roadCourseDelta, *(void *)&self->distanceFromNearestJunction);
}

- (double)routeMatchScore
{
  return self->routeMatchScore;
}

- (void)setRouteMatchScore:(double)a3
{
  self->routeMatchScore = a3;
}

- (double)distanceFromRoute
{
  return self->distanceFromRoute;
}

- (void)setDistanceFromRoute:(double)a3
{
  self->distanceFromRoute = a3;
}

- (double)maxDistance
{
  return self->maxDistance;
}

- (void)setMaxDistance:(double)a3
{
  self->maxDistance = a3;
}

- (double)distanceMatchScore
{
  return self->distanceMatchScore;
}

- (void)setDistanceMatchScore:(double)a3
{
  self->distanceMatchScore = a3;
}

- (double)distanceWeight
{
  return self->distanceWeight;
}

- (void)setDistanceWeight:(double)a3
{
  self->distanceWeight = a3;
}

- (double)courseDelta
{
  return self->courseDelta;
}

- (void)setCourseDelta:(double)a3
{
  self->courseDelta = a3;
}

- (double)maxCourseDelta
{
  return self->maxCourseDelta;
}

- (void)setMaxCourseDelta:(double)a3
{
  self->maxCourseDelta = a3;
}

- (double)courseMatchScore
{
  return self->courseMatchScore;
}

- (void)setCourseMatchScore:(double)a3
{
  self->courseMatchScore = a3;
}

- (double)courseWeight
{
  return self->courseWeight;
}

- (void)setCourseWeight:(double)a3
{
  self->courseWeight = a3;
}

- (double)roadWidthOnRoute
{
  return self->roadWidthOnRoute;
}

- (void)setRoadWidthOnRoute:(double)a3
{
  self->roadWidthOnRoute = a3;
}

- (double)distanceFromRoad
{
  return self->distanceFromRoad;
}

- (void)setDistanceFromRoad:(double)a3
{
  self->distanceFromRoad = a3;
}

- (double)roadCourseDelta
{
  return self->roadCourseDelta;
}

- (void)setRoadCourseDelta:(double)a3
{
  self->roadCourseDelta = a3;
}

- (double)distanceFromNearestJunction
{
  return self->distanceFromNearestJunction;
}

- (void)setDistanceFromNearestJunction:(double)a3
{
  self->distanceFromNearestJunction = a3;
}

@end