@interface GEORoadMatcherCandidateSegment
- ($1AB5FA073B851C12C2339EC22442E995)coordinateOnSegment;
- (GEOMapFeatureJunction)junction;
- (GEOMapFeatureRoad)road;
- (GEORoadMatcherCandidateSegment)init;
- (GEORoadMatcherCandidateSegment)initWithCoordinate:(id)a3 angle:(double)a4 road:(id)a5 startCoordinate:(id)a6 endCoordinate:(id)a7 penalties:(id)a8;
- (double)distanceFromJunction;
- (double)distanceFromSegment;
- (double)score;
- (double)segmentAngle;
@end

@implementation GEORoadMatcherCandidateSegment

- (GEORoadMatcherCandidateSegment)init
{
  result = (GEORoadMatcherCandidateSegment *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEORoadMatcherCandidateSegment)initWithCoordinate:(id)a3 angle:(double)a4 road:(id)a5 startCoordinate:(id)a6 endCoordinate:(id)a7 penalties:(id)a8
{
  double var2 = a6.var2;
  double var1 = a6.var1;
  double var0 = a6.var0;
  double v13 = a3.var1;
  double v14 = a3.var0;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v16 = a5;
  id v17 = a8;
  v47.receiver = self;
  v47.super_class = (Class)GEORoadMatcherCandidateSegment;
  v18 = [(GEORoadMatcherCandidateSegment *)&v47 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_road, a5);
    long double v20 = GEOBearingFromCoordinateToCoordinate(var0, var1, a7.var0, a7.var1);
    long double v21 = fmod(v20, 360.0);
    v19->_segmentAngle = fmod(v21 + 360.0, 360.0) + 0.0;
    double v24 = GEOClosestCoordinateOnLineSegmentFromCoordinate3D(var0, var1, var2, a7.var0, a7.var1, a7.var2, v22, v23, v14, v13);
    double v26 = v25;
    v19->_coordinateOnSegment.latitude = v24;
    v19->_coordinateOnSegment.longitude = v25;
    v19->_coordinateOnSegment.altitude = v27;
    v19->_distanceFromSegment = GEOCalculateDistanceRadius(v24, v25, v14, v13, 6367000.0);
    [v16 roadWidth];
    v19->_score = v19->_distanceFromSegment + v28 * -0.5;
    v29 = [v16 startJunction];
    v30 = [v16 endJunction];
    v19->_distanceInMetersFromJunction = 1.79769313e308;
    if ([v29 connectivityJunction])
    {
      [v29 coordinate];
      v19->_distanceInMetersFromJunction = GEOCalculateDistanceRadius(v24, v26, v31, v32, 6367000.0);
      objc_storeStrong((id *)&v19->_junction, v29);
    }
    if (v30)
    {
      [v30 coordinate];
      double v35 = GEOCalculateDistanceRadius(v24, v26, v33, v34, 6367000.0);
      if (v19->_distanceInMetersFromJunction > v35)
      {
        v19->_distanceInMetersFromJunction = v35;
        objc_storeStrong((id *)&v19->_junction, v30);
      }
    }
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v36 = v17;
    uint64_t v37 = [v36 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v37)
    {
      uint64_t v38 = *(void *)v44;
      do
      {
        uint64_t v39 = 0;
        do
        {
          if (*(void *)v44 != v38) {
            objc_enumerationMutation(v36);
          }
          [*(id *)(*((void *)&v43 + 1) + 8 * v39) penaltyForCandidate:v19];
          v19->_score = v40 + v19->_score;
          ++v39;
        }
        while (v37 != v39);
        uint64_t v37 = [v36 countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v37);
    }

    v41 = v19;
  }

  return v19;
}

- (double)score
{
  return self->_score;
}

- (GEOMapFeatureRoad)road
{
  return self->_road;
}

- ($1AB5FA073B851C12C2339EC22442E995)coordinateOnSegment
{
  double latitude = self->_coordinateOnSegment.latitude;
  double longitude = self->_coordinateOnSegment.longitude;
  double altitude = self->_coordinateOnSegment.altitude;
  result.double var2 = altitude;
  result.double var1 = longitude;
  result.double var0 = latitude;
  return result;
}

- (double)distanceFromSegment
{
  return self->_distanceFromSegment;
}

- (double)segmentAngle
{
  return self->_segmentAngle;
}

- (GEOMapFeatureJunction)junction
{
  return self->_junction;
}

- (double)distanceFromJunction
{
  return self->_distanceInMetersFromJunction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_junction, 0);

  objc_storeStrong((id *)&self->_road, 0);
}

@end