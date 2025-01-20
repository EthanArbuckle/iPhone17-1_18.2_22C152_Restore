@interface GEODrivingRouteMatcher
- ($F24F406B2B787EFB06265DBA3D28CBD5)_coordinateFromLocation:(id)a3;
- (BOOL)_supportsSnapping;
- (GEODrivingRouteMatcher)initWithRoute:(id)a3 auditToken:(id)a4;
- (double)_courseFromLocation:(id)a3;
- (double)_courseWeightForLocation:(id)a3 accuracyType:(int64_t)a4;
- (double)_maxCourseDelta:(id)a3 previousRouteMatch:(id)a4 timeSinceTunnel:(double)a5;
- (double)_maxMatchDistance:(double)a3 routeCoordinate:(PolylineCoordinate)a4 previousRouteMatch:(id)a5 timeSinceTunnel:(double)a6;
- (double)_modifiedCourseAccuracyForLocation:(id)a3 previousRouteMatch:(id)a4;
- (double)_modifiedHorizontalAccuracy:(double)a3 routeCoordinate:(PolylineCoordinate)a4;
- (id)_candidateForSegment:(id)a3 location:(id)a4 previousRouteMatch:(id)a5;
- (id)_startStepForPreviousRouteMatch:(id)a3;
- (void)_finishRouteMatch:(id)a3 previousRouteMatch:(id)a4 forLocation:(id)a5;
@end

@implementation GEODrivingRouteMatcher

- (GEODrivingRouteMatcher)initWithRoute:(id)a3 auditToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEODrivingRouteMatcher;
  v8 = [(GEORouteMatcher *)&v12 initWithRoute:v6 auditToken:v7];
  v9 = v8;
  if (v8)
  {
    [(GEORouteMatcher *)v8 setShouldSnapRouteMatchToRoute:1];
    v9->_differentLegScorePenalty = GEOConfigGetDouble(GeoServicesConfig_NavdRouteMatchDifferentLegScorePenalty, (uint64_t)off_1E9114718);
    v10 = v9;
  }

  return v9;
}

- (id)_candidateForSegment:(id)a3 location:(id)a4 previousRouteMatch:(id)a5
{
  v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v103 = 0xBF80000000000000;
  [(GEODrivingRouteMatcher *)self _coordinateFromLocation:v9];
  double v19 = -[_GEORouteMatchingSegment distanceFromCoordinate:outCoordinateOnSegment:outRouteCoordinate:]((uint64_t)v8, &v102.latitude, (uint64_t)&v103, v11, v12, v13, v14, v15, v16, v17, v18);
  v20 = [v10 road];
  double v21 = 978307200.0;
  if (v20)
  {
    v22 = [v10 road];
    int v23 = [v22 isTunnel];

    if (v23)
    {
      [v9 timestamp];
      double v25 = v24;
      v26 = [v10 timestamp];
      [v26 timeIntervalSinceReferenceDate];
      double v21 = v25 - v27;
    }
  }
  [v9 horizontalAccuracy];
  -[GEODrivingRouteMatcher _maxMatchDistance:routeCoordinate:previousRouteMatch:timeSinceTunnel:](self, "_maxMatchDistance:routeCoordinate:previousRouteMatch:timeSinceTunnel:", v103, v10);
  double v29 = v28;
  [(GEODrivingRouteMatcher *)self _maxCourseDelta:v9 previousRouteMatch:v10 timeSinceTunnel:v21];
  double v31 = v30;
  id v32 = v9;
  id v33 = v10;
  [v32 course];
  if (v34 < 0.0
    || ([v32 courseAccuracy], v35 < 0.0)
    || ([v32 courseAccuracy], v36 >= 180.0))
  {
    uint64_t v39 = 0;
    char v38 = 1;
  }
  else
  {
    if ([v33 isGoodMatch])
    {
      [v32 speedAccuracy];
      if (v37 < 0.0)
      {
        char v38 = 0;
        uint64_t v39 = 1;
        goto LABEL_11;
      }
      [v32 speed];
      char v38 = 0;
      uint64_t v39 = 1;
      if (v21 < 30.0 || v99 < 3.0) {
        goto LABEL_11;
      }
    }
    char v38 = 0;
    uint64_t v39 = 2;
  }
LABEL_11:

  [(GEODrivingRouteMatcher *)self _courseFromLocation:v32];
  double v41 = v40;
  v42 = [(GEORouteMatcher *)self route];
  id v43 = v42;
  if (v8) {
    uint64_t v44 = *((unsigned int *)v8 + 2);
  }
  else {
    uint64_t v44 = 0;
  }
  [v42 courseAtRouteCoordinateIndex:v44];
  double v46 = v45;

  double v47 = -1.0;
  if (v41 >= 0.0)
  {
    long double v48 = fmod(v41 - v46 + 180.0, 360.0);
    double v47 = fabs(fmod(v48 + 360.0, 360.0) + -180.0);
  }
  if (v29 - v19 <= 0.0) {
    double v49 = v19 * -20.0;
  }
  else {
    double v49 = (v29 - v19) / v29;
  }
  if (v19 >= v29)
  {
    double v53 = -3600.0;
LABEL_27:
    double v101 = v53;
    goto LABEL_28;
  }
  [v32 courseAccuracy];
  double v101 = -0.5;
  if ((v38 & 1) == 0)
  {
    double v101 = 1.0;
    if (v47 > v50)
    {
      double v51 = (v31 - v47) / v31;
      double v52 = 0.5;
      if (v47 < 30.0) {
        double v52 = 1.0;
      }
      if (v51 <= 0.0) {
        double v52 = -20.0;
      }
      double v53 = v51 * v51 * v52;
      goto LABEL_27;
    }
  }
LABEL_28:
  if ([v33 isGoodMatch])
  {
    v54 = [(GEORouteMatcher *)self route];
    uint64_t v55 = [v33 routeCoordinate];
    [v54 stepDistanceFromPoint:v55 toPoint:v103];
    double v57 = v56;

    [v32 timestamp];
    double v59 = v58;
    id v43 = [v33 timestamp];
    double v100 = v49;
    double v60 = v29;
    double v61 = v47;
    double v62 = v31;
    double v63 = v19;
    [v43 timeIntervalSinceReferenceDate];
    double v65 = v64;

    [v32 speed];
    double v67 = v66;
    [v32 speedAccuracy];
    double v68 = fabs(v57);
    double v70 = fmax((v59 - v65) * (v67 + v69), 4.4704);
    double v71 = v70 * 3.0;
    double v72 = v70 * 5.0;
    double v73 = 0.0;
    if (v71 != v72)
    {
      if (v71 <= v68) {
        double v74 = v68;
      }
      else {
        double v74 = v71;
      }
      if (v74 > v72) {
        double v74 = v72;
      }
      float v75 = (v74 - v71) / (v72 - v71);
      double v73 = v75;
    }
    double v76 = 1.0 - v73;
    double v19 = v63;
    double v31 = v62;
    double v47 = v61;
    double v29 = v60;
    double v49 = v100;
    double v77 = v68;
  }
  else
  {
    double v76 = 1.0;
    double v77 = 0.0;
  }
  [(GEODrivingRouteMatcher *)self _courseWeightForLocation:v32 accuracyType:v39];
  double v79 = v78;
  double v80 = (v101 * v79 + v49 * 0.65 + v76 * 0.1) / (v79 + 0.65 + 0.1);
  if ([(GEORouteMatcher *)self targetLegIndex] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v81 = [(GEORouteMatcher *)self route];
    v82 = v8 ? (void *)v8[7] : 0;
    id v43 = v82;
    uint64_t v83 = objc_msgSend(v81, "legIndexForStepIndex:", objc_msgSend(v43, "stepIndex"));

    if (v83 != [(GEORouteMatcher *)self targetLegIndex]) {
      double v80 = v80 - self->_differentLegScorePenalty;
    }
  }
  BOOL v84 = v80 >= 0.0;
  if ([(GEORouteMatcher *)self useStrictInitialOnRouteCriteria]
    && (!v33 || ([v33 isGoodMatch] & 1) == 0))
  {
    [v32 speed];
    if (v85 >= 9.0)
    {
      char v86 = 1;
      if (v33)
      {
LABEL_48:
        uint64_t v87 = [v33 routeCoordinate];
        if (v103 > v87
          || (BOOL v88 = 0, v103 == v87) && *((float *)&v103 + 1) > *((float *)&v87 + 1))
        {
          uint64_t v89 = [v33 consecutiveProgressionsOffRoute];
          BOOL v88 = 0;
          if ((unint64_t)(v89 - 3) <= 0xFFFFFFFFFFFFFFFBLL && v19 <= 30.0)
          {
            [v33 distanceTraveledOffRoute];
            BOOL v88 = v90 >= 13.0;
          }
        }
        goto LABEL_56;
      }
    }
    else
    {
      char v86 = [v32 isMatchedLocation];
      if (v33) {
        goto LABEL_48;
      }
    }
    BOOL v88 = 0;
LABEL_56:
    char v91 = v86 | v88;
    if (v80 >= 0.0) {
      BOOL v84 = v91;
    }
    else {
      BOOL v84 = 0;
    }
  }
  v92 = objc_alloc_init(_GEOCandidateRouteMatch);
  if (v84)
  {
    BOOL v93 = 1;
  }
  else
  {
    if (v8) {
      v94 = (void *)v8[7];
    }
    else {
      v94 = 0;
    }
    id v43 = v94;
    BOOL v93 = [v43 routeSegmentType] == 3;
  }
  if (v92) {
    v92->_isGoodMatch = v93;
  }
  if (!v84) {

  }
  if (v92)
  {
    v92->_score = v80;
    v92->_routeCoordinate = (PolylineCoordinate)v103;
    v92->_locationCoordinate = v102;
  }
  if (v8) {
    v95 = (void *)v8[7];
  }
  else {
    v95 = 0;
  }
  id v96 = v95;
  uint64_t v97 = [v96 stepIndex];
  if (v92)
  {
    v92->_stepIndex = v97;

    v92->_distanceFromRoute = v19;
    v92->_maxDistance = v29;
    v92->_distanceMatchScore = v49;
    v92->_distanceWeight = 0.65;
    v92->_courseDelta = v47;
    v92->_maxCourseDelta = v31;
    v92->_courseMatchScore = v101;
    v92->_courseWeight = v79;
    v92->_distanceAlongRouteFromPreviousMatch = v77;
  }
  else
  {
  }
  -[_GEOCandidateRouteMatch setSegment:]((uint64_t)v92, v8);

  return v92;
}

- (double)_maxMatchDistance:(double)a3 routeCoordinate:(PolylineCoordinate)a4 previousRouteMatch:(id)a5 timeSinceTunnel:(double)a6
{
  id v10 = a5;
  [(GEODrivingRouteMatcher *)self _modifiedHorizontalAccuracy:a4 routeCoordinate:a3];
  double v12 = v11;
  if (v10)
  {
    if (v11 >= 0.0)
    {
      int v14 = [v10 isGoodMatch];
      double v15 = 30.0;
      if (a6 > 30.0) {
        double v15 = 0.0;
      }
      double v16 = v15 + v12 * 1.6;
      if (v14) {
        double v16 = v16 + 15.0;
      }
      double v12 = fmin(v16, 1000.0);
    }
    else
    {
      double v12 = 1000.0;
    }
  }
  else if (v11 < 0.0)
  {
    [(GEORouteMatcher *)self roadWidthForRouteCoordinate:a4];
    double v12 = v13;
  }

  return v12;
}

- (double)_courseWeightForLocation:(id)a3 accuracyType:(int64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  double v7 = 0.15;
  if (a4 == 2)
  {
    [v5 speed];
    if (v8 >= 3.0)
    {
      [v6 speed];
      double v10 = (v9 + -3.0) / 8.176;
      if (v10 < 0.0) {
        double v10 = 0.0;
      }
      if (v10 > 1.0) {
        double v10 = 1.0;
      }
      float v11 = v10;
      double v7 = v11 * 0.2 + 0.15;
    }
  }

  return v7;
}

- (double)_modifiedHorizontalAccuracy:(double)a3 routeCoordinate:(PolylineCoordinate)a4
{
  double result = -1.0;
  if (a3 >= 0.0)
  {
    -[GEORouteMatcher roadWidthForRouteCoordinate:](self, "roadWidthForRouteCoordinate:", a4, -1.0);
    return v6 + a3;
  }
  return result;
}

- (double)_modifiedCourseAccuracyForLocation:(id)a3 previousRouteMatch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 courseAccuracy];
  double v8 = -1.0;
  if (v9 >= 0.0)
  {
    [v6 courseAccuracy];
    double v8 = v10 + 10.0;
    if (v10 + 10.0 > 0.0)
    {
      if ([v7 isGoodMatch])
      {
        [v6 speed];
        if (v11 < 1.0)
        {
          [v6 timestamp];
          double v13 = v12;
          int v14 = [v7 timestamp];
          [v14 timeIntervalSinceReferenceDate];
          double v16 = v15;

          [(GEODrivingRouteMatcher *)self _courseFromLocation:v6];
          long double v18 = v17;
          [v7 matchedCourse];
          long double v20 = v19;
          double v21 = v13 - v16;
          double v22 = fmod(v18, 360.0);
          if (v22 >= 0.0) {
            double v23 = v22;
          }
          else {
            double v23 = v22 + 360.0;
          }
          double v24 = fmod(v20, 360.0);
          if (v24 < 0.0) {
            double v24 = v24 + 360.0;
          }
          double v25 = v23 - v24;
          if (v25 >= -180.0)
          {
            if (v25 > 180.0) {
              double v25 = v25 + -360.0;
            }
          }
          else
          {
            double v25 = v25 + 360.0;
          }
          double v26 = fabs(v25);
          BOOL v27 = v26 > 90.0 && v21 < 2.0;
          double v28 = fmin(v8 + v26, 180.0);
          if (v27) {
            double v8 = v28;
          }
        }
      }
    }
  }

  return v8;
}

- (double)_maxCourseDelta:(id)a3 previousRouteMatch:(id)a4 timeSinceTunnel:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  [v8 courseAccuracy];
  double v11 = v10;
  [(GEODrivingRouteMatcher *)self _modifiedCourseAccuracyForLocation:v8 previousRouteMatch:v9];
  double v13 = v12;
  if ([v8 isMatchedLocation])
  {
    if (v11 > 20.0 || v11 < 0.0) {
      double v13 = 10.0;
    }
  }
  else if (v13 >= 0.0)
  {
    if (a5 <= 30.0) {
      double v15 = 85.0;
    }
    else {
      double v15 = 40.0;
    }
    if (v9)
    {
      if ([v9 isGoodMatch])
      {
        [v8 speedAccuracy];
        if (v16 < 0.0 || ([v8 speed], v17 < 3.0)) {
          double v15 = 90.0;
        }
      }
    }
    double v13 = fmin(v13 + v15, 180.0);
  }
  else
  {
    double v13 = 180.0;
  }

  return v13;
}

- (id)_startStepForPreviousRouteMatch:(id)a3
{
  unint64_t v4 = [(GEORouteMatcher *)self targetLegIndex];
  id v5 = [(GEORouteMatcher *)self route];
  id v6 = [v5 legs];
  if (v4 >= [v6 count]) {
    unint64_t v7 = 0;
  }
  else {
    unint64_t v7 = [(GEORouteMatcher *)self targetLegIndex];
  }

  id v8 = [(GEORouteMatcher *)self route];
  id v9 = [v8 legs];
  double v10 = [v9 objectAtIndexedSubscript:v7];

  double v11 = [(GEORouteMatcher *)self route];
  double v12 = [v11 steps];
  double v13 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v10, "startStepIndex"));

  return v13;
}

- (void)_finishRouteMatch:(id)a3 previousRouteMatch:(id)a4 forLocation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v10 horizontalAccuracy];
  -[GEODrivingRouteMatcher _modifiedHorizontalAccuracy:routeCoordinate:](self, "_modifiedHorizontalAccuracy:routeCoordinate:", [v8 routeCoordinate], v11);
  objc_msgSend(v8, "setModifiedHorizontalAccuracy:");
  [(GEODrivingRouteMatcher *)self _modifiedCourseAccuracyForLocation:v10 previousRouteMatch:v9];
  objc_msgSend(v8, "setModifiedCourseAccuracy:");
  [v8 updateOffRouteProgress:v9 minDistanceToGetOnRoute:30.0];
  int v12 = [v8 isGoodMatch] ^ 1;
  if (!v9) {
    LOBYTE(v12) = 1;
  }
  if ((v12 & 1) == 0)
  {
    [v10 speedAccuracy];
    if (v13 >= 0.0)
    {
      [v10 speed];
      if (v14 > 0.0)
      {
        [v8 distanceFromRoute];
        double v16 = v15;
        [v9 distanceFromRoute];
        if (v16 > v17)
        {
          [v10 horizontalAccuracy];
          if (v18 < 50.0)
          {
            uint64_t v19 = [v9 routeCoordinate];
            uint64_t v20 = [v8 routeCoordinate];
            if (v19 == v20 && vabds_f32(*((float *)&v19 + 1), *((float *)&v20 + 1)) < 0.00000011921)
            {
              [v9 distanceTraveledOffRoute];
              objc_msgSend(v8, "setDistanceTraveledOffRoute:");
              objc_msgSend(v8, "setConsecutiveProgressionsOffRoute:", objc_msgSend(v9, "consecutiveProgressionsOffRoute") + 1);
              double v21 = (void *)MEMORY[0x1E4F1C9C8];
              [v10 timestamp];
              double v22 = objc_msgSend(v21, "dateWithTimeIntervalSinceReferenceDate:");
              double v23 = [v9 timestamp];
              [v22 timeIntervalSinceDate:v23];
              double v25 = v24;

              if (v25 > 0.0)
              {
                [v10 speed];
                double v27 = v26;
                [v8 distanceFromRoute];
                double v29 = v28;
                [v9 distanceFromRoute];
                if (v25 * v27 >= v29 - v30)
                {
                  [v8 distanceFromRoute];
                  double v34 = v33;
                  [v9 distanceFromRoute];
                  double v32 = v34 - v35;
                }
                else
                {
                  [v10 speed];
                  double v32 = v25 * v31;
                }
                [v8 distanceTraveledOffRoute];
                [v8 setDistanceTraveledOffRoute:v32 + v36];
              }
              [v8 distanceTraveledOffRoute];
              if (v37 >= 13.0)
              {
                [v8 distanceFromRoute];
                if (v38 >= 13.0 && (unint64_t)[v8 consecutiveProgressionsOffRoute] >= 3) {
                  [v8 setIsGoodMatch:0];
                }
              }
            }
          }
        }
      }
    }
  }
  v39.receiver = self;
  v39.super_class = (Class)GEODrivingRouteMatcher;
  [(GEORouteMatcher *)&v39 _finishRouteMatch:v8 previousRouteMatch:v9 forLocation:v10];
}

- (BOOL)_supportsSnapping
{
  v3 = [(GEORouteMatcher *)self route];
  if ([v3 usesZilch])
  {
    char v4 = 1;
  }
  else
  {
    id v5 = [(GEORouteMatcher *)self route];
    char v4 = [v5 usesRoutingPathPoints];
  }
  return v4;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_coordinateFromLocation:(id)a3
{
  id v4 = a3;
  if ([(GEORouteMatcher *)self useMatchedCoordinateForMatching]) {
    [v4 latLng];
  }
  else {
  id v5 = [v4 rawCoordinate];
  }
  [v5 coordinate];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- (double)_courseFromLocation:(id)a3
{
  id v4 = a3;
  if ([(GEORouteMatcher *)self useMatchedCoordinateForMatching]) {
    [v4 course];
  }
  else {
    [v4 rawCourse];
  }
  double v6 = v5;

  return v6;
}

@end