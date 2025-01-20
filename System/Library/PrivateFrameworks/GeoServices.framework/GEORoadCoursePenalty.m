@interface GEORoadCoursePenalty
- (BOOL)useRawLocations;
- (GEORoadCoursePenalty)init;
- (GEORoadCoursePenalty)initWithLocation:(id)a3;
- (double)penaltyForCandidate:(id)a3;
- (void)setUseRawLocations:(BOOL)a3;
@end

@implementation GEORoadCoursePenalty

- (GEORoadCoursePenalty)init
{
  result = (GEORoadCoursePenalty *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEORoadCoursePenalty)initWithLocation:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEORoadCoursePenalty;
  v6 = [(GEORoadCoursePenalty *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_location, a3);
    v7->_useRawLocations = 0;
    v8 = v7;
  }

  return v7;
}

- (void)setUseRawLocations:(BOOL)a3
{
  self->_useRawLocations = a3;
}

- (BOOL)useRawLocations
{
  return self->_useRawLocations;
}

- (double)penaltyForCandidate:(id)a3
{
  id v4 = a3;
  if ([(GEORoadCoursePenalty *)self useRawLocations]
    && [(GEOLocation *)self->_location hasRawCourse])
  {
    [(GEOLocation *)self->_location rawCourse];
  }
  else
  {
    [(GEOLocation *)self->_location course];
  }
  double v6 = v5;
  v7 = [v4 road];
  [v7 roadWidth];
  double v9 = v8;

  if (v6 < 0.0)
  {
LABEL_6:
    double v10 = 0.0;
    goto LABEL_15;
  }
  [v4 segmentAngle];
  long double v12 = fmod(v11 - v6 + 180.0, 360.0);
  double v13 = fmod(v12 + 360.0, 360.0);
  [v4 distanceFromJunction];
  double v14 = fabs(v13 + -180.0);
  if (v15 <= 11.1)
  {
    [v4 distanceFromSegment];
    if (v16 <= v9 * 0.5)
    {
      if (v14 > 60.0)
      {
        double v10 = 150.0;
        goto LABEL_15;
      }
      goto LABEL_6;
    }
  }
  double v10 = 0.0;
  if (v14 >= 15.0)
  {
    double v10 = 10.0;
    if (v14 >= 30.0)
    {
      double v10 = 25.0;
      if (v14 >= 45.0) {
        double v10 = dbl_18A632100[v14 < 60.0];
      }
    }
  }
LABEL_15:

  return v10;
}

- (void).cxx_destruct
{
}

@end