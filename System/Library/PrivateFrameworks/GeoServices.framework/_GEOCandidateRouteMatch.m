@interface _GEOCandidateRouteMatch
- (_GEOCandidateRouteMatch)initWithRoute:(id)a3;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setScoreInfos:(uint64_t)a1;
- (void)setSegment:(uint64_t)a1;
@end

@implementation _GEOCandidateRouteMatch

- (_GEOCandidateRouteMatch)initWithRoute:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_GEOCandidateRouteMatch;
  v3 = [(_GEOCandidateRouteMatch *)&v7 init];
  v4 = v3;
  if (v3)
  {
    v3->_distanceFromRoute = -1.79769313e308;
    v3->_score = -1.79769313e308;
    v3->_routeCoordinate = (PolylineCoordinate)0xBF80000000000000;
    v3->_locationCoordinate = ($AB5116BA7E623E054F959CECB034F4E7)kGEOLocationCoordinate2DInvalid;
    v5 = v3;
  }

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[_GEOCandidateRouteMatch allocWithZone:a3] init];
  v4->_isGoodMatch = self->_isGoodMatch;
  v4->_score = self->_score;
  v4->_routeCoordinate = self->_routeCoordinate;
  v4->_locationCoordinate = self->_locationCoordinate;
  v4->_stepIndex = self->_stepIndex;
  v4->_distanceFromRoute = self->_distanceFromRoute;
  v4->_maxDistance = self->_maxDistance;
  v4->_distanceMatchScore = self->_distanceMatchScore;
  v4->_distanceWeight = self->_distanceWeight;
  v4->_courseDelta = self->_courseDelta;
  v4->_maxCourseDelta = self->_maxCourseDelta;
  v4->_courseMatchScore = self->_courseMatchScore;
  v4->_courseWeight = self->_courseWeight;
  v4->_distanceAlongRouteFromPreviousMatch = self->_distanceAlongRouteFromPreviousMatch;
  objc_storeStrong((id *)&v4->_segment, self->_segment);
  uint64_t v5 = [(NSArray *)self->_scoreInfos copy];
  scoreInfos = v4->_scoreInfos;
  v4->_scoreInfos = (NSArray *)v5;

  return v4;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Candidate match: [%0.2f] (%0.5f, %0.5f) | score: %0.2f | dist: %0.1fm", (float)(self->_routeCoordinate.offset + (float)self->_routeCoordinate.index), *(void *)&self->_locationCoordinate.latitude, *(void *)&self->_locationCoordinate.longitude, *(void *)&self->_score, *(void *)&self->_distanceFromRoute];
}

- (void)setSegment:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 128), a2);
  }
}

- (void)setScoreInfos:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 136), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoreInfos, 0);

  objc_storeStrong((id *)&self->_segment, 0);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0xBF80000000000000;
  return self;
}

@end