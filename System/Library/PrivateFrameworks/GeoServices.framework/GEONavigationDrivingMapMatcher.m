@interface GEONavigationDrivingMapMatcher
- ($F24F406B2B787EFB06265DBA3D28CBD5)_coordinateFromLocation:(id)a3;
- (BOOL)_locationMeetsSpeedThresholdForRoadMatch:(id)a3 distanceFromRoute:(double)a4;
- (BOOL)_shouldConsiderRoadMatch:(id)a3 overRouteMatch:(id)a4 forLocation:(id)a5;
- (BOOL)useMatchedCoordinateForMatching;
- (double)_approximateMaxSpeedForRoad:(id)a3;
- (double)_courseFromLocation:(id)a3;
- (id)_effectiveLocationForLocation:(id)a3;
- (id)_routeMatcherForRoute:(id)a3;
- (id)matchLocation:(id)a3 transportType:(int)a4;
- (int)transportType;
- (void)setUseMatchedCoordinateForMatching:(BOOL)a3;
@end

@implementation GEONavigationDrivingMapMatcher

- (id)matchLocation:(id)a3 transportType:(int)a4
{
  id v6 = a3;
  v7 = [(GEONavigationMapMatcher *)self route];
  int v8 = [v7 transportType];
  int v9 = [(GEONavigationDrivingMapMatcher *)self transportType];

  if (v8 != v9)
  {
    v17 = +[GEONavigationMatchResult matchResultWithRawLocation:v6];
    v18 = [(GEONavigationMapMatcher *)self previousMatchResult];
    v19 = [v18 routeMatch];
    [v17 setRouteMatch:v19];

    [(GEONavigationMapMatcher *)self setPreviousMatchResult:v17];
    goto LABEL_72;
  }
  [v6 horizontalAccuracy];
  if (v10 > 200.0)
  {
    v11 = [(GEONavigationMapMatcher *)self previousMatchResult];

    if (v11)
    {
      v12 = [(GEONavigationMapMatcher *)self previousMatchResult];
      uint64_t v13 = [v12 type];

      if (v13)
      {
        if (v13 == 1)
        {
          v52 = [(GEONavigationMapMatcher *)self previousMatchResult];
          v53 = [v52 roadMatch];
          v54 = +[GEONavigationMatchResult matchResultWithRoadMatch:v53 location:v6];

          v15 = [(GEONavigationMapMatcher *)self previousMatchResult];
          v16 = [v15 routeMatch];
          [v54 setRouteMatch:v16];
          v14 = v54;
        }
        else
        {
          if (v13 != 2)
          {
            v17 = 0;
            goto LABEL_44;
          }
          v14 = +[GEONavigationMatchResult matchResultWithRawLocation:v6];
          v15 = [(GEONavigationMapMatcher *)self previousMatchResult];
          v16 = [v15 routeMatch];
          [v14 setRouteMatch:v16];
        }
      }
      else
      {
        v15 = [(GEONavigationMapMatcher *)self previousMatchResult];
        v16 = [v15 routeMatch];
        v14 = +[GEONavigationMatchResult matchResultWithRouteMatch:v16 location:v6];
      }

      v17 = v14;
LABEL_44:
      [v17 setLocationUnreliable:1];
      [(GEONavigationMapMatcher *)self setPreviousMatchResult:v17];
      goto LABEL_72;
    }
  }
  v20 = [(GEONavigationDrivingMapMatcher *)self _effectiveLocationForLocation:v6];
  v21 = [(GEONavigationMapMatcher *)self previousMatchResult];
  v22 = [v21 routeMatch];

  v23 = [(GEONavigationMapMatcher *)self route];

  if (v23)
  {
    v24 = [(GEONavigationMapMatcher *)self routeMatcher];
    v23 = [v24 matchToRouteWithLocation:v20 previousRouteMatch:v22];

    if (!v23)
    {
      v25 = [GEORouteMatcher alloc];
      v26 = [(GEONavigationMapMatcher *)self route];
      v27 = [(GEONavigationMapMatcher *)self auditToken];
      v28 = [(GEORouteMatcher *)v25 initWithRoute:v26 auditToken:v27];

      v23 = [(GEORouteMatcher *)v28 matchToClosestPointOnRouteWithLocation:v20];
    }
  }
  v29 = [v23 detailedMatchInfo];
  if (a4 == 4)
  {
    BOOL v30 = 1;
    if (!v22)
    {
LABEL_21:
      if (v30) {
        goto LABEL_22;
      }
      goto LABEL_20;
    }
  }
  else
  {
    BOOL v30 = [(GEONavigationDrivingMapMatcher *)self transportType] == a4;
    if (!v22) {
      goto LABEL_21;
    }
  }
  if (![v22 isGoodMatch]) {
    goto LABEL_21;
  }
  v31 = [(GEONavigationMapMatcher *)self previousMatchResult];
  uint64_t v32 = [v31 type];

  if (v30 || !v32 && ([v23 isGoodMatch] & 1) != 0)
  {
LABEL_22:
    [v20 horizontalAccuracy];
    double v34 = v33;
    [v20 courseAccuracy];
    double v35 = -1.0;
    double v36 = -1.0;
    if (v37 >= 0.0)
    {
      [v20 courseAccuracy];
      double v36 = v38 + 10.0;
    }
    if (v30)
    {
      v39 = [(GEONavigationMapMatcher *)self roadMatcher];
      v40 = v39;
      if (v39 && v34 >= 0.0 && v34 <= 65.0)
      {
        [v20 course];
        double v42 = v41;

        if (v42 >= 0.0)
        {
          v43 = [(GEONavigationMapMatcher *)self previousMatchResult];
          if ([v43 type] != 2)
          {

            goto LABEL_76;
          }
          [v23 distanceFromRoute];
          BOOL v44 = -[GEONavigationDrivingMapMatcher _locationMeetsSpeedThresholdForRoadMatch:distanceFromRoute:](self, "_locationMeetsSpeedThresholdForRoadMatch:distanceFromRoute:", v20);

          if (v44)
          {
LABEL_76:
            v73 = [(GEONavigationMapMatcher *)self roadMatcher];
            v45 = objc_msgSend(v73, "matchLocation:forTransportType:", v20, -[GEONavigationDrivingMapMatcher transportType](self, "transportType"));

            if (v45)
            {
              if (v36 >= 0.0) {
                double v74 = v36 + 10.0;
              }
              else {
                double v74 = 10.0;
              }
              [v45 distanceFromRoad];
              double v35 = v75;
              BOOL v76 = v75 < v34 + 20.0;
              [(GEONavigationDrivingMapMatcher *)self _courseFromLocation:v20];
              double v78 = v77;
              if (v77 >= 0.0)
              {
                [v45 courseOnRoad];
                BOOL v76 = v35 < v34 + 20.0;
                long double v81 = fmod(v80 - v78 + 180.0, 360.0);
                double v47 = fabs(fmod(v81 + 360.0, 360.0) + -180.0);
                if (v47 >= v74) {
                  BOOL v76 = 0;
                }
                double v79 = 10.0;
              }
              else
              {
                double v79 = 30.0;
                double v47 = -1.0;
              }
              [v23 locationCoordinate3D];
              double v83 = v82;
              double v85 = v84;
              [v45 coordinateOnRoad];
              double v88 = GEOCalculateDistanceRadius(v83, v85, v86, v87, 6367000.0);
              [v23 matchedCourse];
              double v90 = v89;
              [v45 courseOnRoad];
              long double v92 = fmod(v91 - v90 + 180.0, 360.0);
              BOOL v93 = fabs(fmod(v92 + 360.0, 360.0) + -180.0) > 30.0 || v88 > v79;
              [v29 setDistanceFromRoad:v35];
              [v29 setRoadCourseDelta:v47];
              [v45 distanceFromJunction];
              objc_msgSend(v29, "setDistanceFromNearestJunction:");
              int v46 = v76 && v93;
              if (!v23) {
                goto LABEL_66;
              }
LABEL_35:
              int v48 = [v23 isGoodMatch];
              [v23 distanceFromRoute];
              if (v48)
              {
                double v50 = v49;
                if ([v23 routeMatchedToEnd])
                {
                  [v20 speed];
                  int v48 = v50 <= 5.0 && v51 <= 3.5;
                }
                else
                {
                  int v48 = 1;
                }
                if ((v48 & v46) == 1)
                {
                  if (![(GEONavigationDrivingMapMatcher *)self _shouldConsiderRoadMatch:v45 overRouteMatch:v23 forLocation:v20])
                  {
LABEL_64:
                    v17 = +[GEONavigationMatchResult matchResultWithRouteMatch:v23 location:v20];
                    [v17 setDetailedMatchInfo:v29];
                    [(GEONavigationMapMatcher *)self setPreviousMatchResult:v17];
LABEL_70:

                    goto LABEL_71;
                  }
                  [v23 modifiedHorizontalAccuracy];
                  double v56 = 0.0;
                  if (v50 - v55 >= 0.0)
                  {
                    [v23 modifiedHorizontalAccuracy];
                    double v56 = v50 - v57;
                  }
                  [v20 speed];
                  if (v58 > 16.0)
                  {
                    [v20 speed];
                    double v56 = v56 + v59 * -0.125;
                  }
                  [v20 course];
                  double v61 = v60;
                  [v23 matchedCourse];
                  long double v63 = fmod(v62 - v61 + 180.0, 360.0);
                  double v64 = fmod(v63 + 360.0, 360.0);
                  [v23 modifiedCourseAccuracy];
                  double v65 = v64 + -180.0;
                  double v67 = v65 - v66 + -20.0;
                  double v68 = 0.0;
                  if (v67 >= 0.0)
                  {
                    objc_msgSend(v23, "modifiedCourseAccuracy", 0.0);
                    double v68 = v65 - v69 + -20.0;
                  }
                  int v48 = v68 <= v36 + v47 && v56 <= v34 + v35;
                }
              }
              if ((v48 & 1) != 0 || !v30 || ![v20 isMatchedLocation])
              {
                if (v48) {
                  goto LABEL_64;
                }
              }
              else
              {
                v70 = [(GEONavigationMapMatcher *)self routeMatcher];
                v71 = [v70 matchToRouteWithLocation:v20 previousRouteMatch:v22];

                if (v71 && [v71 isGoodMatch])
                {

                  v23 = v71;
                  goto LABEL_64;
                }
              }
LABEL_66:
              if (v46) {
                +[GEONavigationMatchResult matchResultWithRoadMatch:v45 location:v20];
              }
              else {
              v17 = +[GEONavigationMatchResult matchResultWithRawLocation:v20];
              }
              [v17 setRouteMatch:v23];
              [v17 setDetailedMatchInfo:v29];
              [(GEONavigationMapMatcher *)self setPreviousMatchResult:v17];
              goto LABEL_70;
            }
LABEL_34:
            int v46 = 0;
            double v47 = -1.0;
            if (!v23) {
              goto LABEL_66;
            }
            goto LABEL_35;
          }
        }
      }
      else
      {
      }
    }
    v45 = 0;
    goto LABEL_34;
  }
LABEL_20:
  v17 = +[GEONavigationMatchResult matchResultWithRawLocation:v20];
  [v17 setRouteMatch:v23];
  [(GEONavigationMapMatcher *)self setPreviousMatchResult:v17];
LABEL_71:

LABEL_72:

  return v17;
}

- (int)transportType
{
  return 0;
}

- (void)setUseMatchedCoordinateForMatching:(BOOL)a3
{
  BOOL v3 = a3;
  self->_useMatchedCoordinateForMatching = a3;
  id v5 = [(GEONavigationMapMatcher *)self routeMatcher];
  [v5 setUseMatchedCoordinateForMatching:v3];

  id v6 = [(GEONavigationMapMatcher *)self roadMatcher];
  [v6 setUseRawLocations:v3 ^ 1];
}

- (BOOL)_locationMeetsSpeedThresholdForRoadMatch:(id)a3 distanceFromRoute:(double)a4
{
  [a3 speed];
  double v6 = (a4 + -10.0) / 90.0;
  if (v6 < 0.0) {
    double v6 = 0.0;
  }
  if (v6 > 1.0) {
    double v6 = 1.0;
  }
  float v7 = v6;
  return v5 >= v7 * -6.0 + 6.0;
}

- (BOOL)_shouldConsiderRoadMatch:(id)a3 overRouteMatch:(id)a4 forLocation:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  [v9 horizontalAccuracy];
  if (v10 < 0.0
    || ([v9 courseAccuracy], v11 < 0.0)
    || ([v9 courseAccuracy], v12 >= 180.0))
  {
    BOOL v24 = 0;
  }
  else
  {
    [v7 distanceFromJunction];
    double v14 = v13;
    [v9 horizontalAccuracy];
    double v16 = v15;
    [v8 distanceFromRoute];
    double v18 = v17;
    [v8 modifiedHorizontalAccuracy];
    double v20 = v19;
    [v7 junctionRadius];
    BOOL v22 = v18 - v20 > v21 + 8.0 || v14 - v16 > 8.0;
    if ([v9 isMatchedLocation])
    {
      BOOL v23 = 1;
    }
    else
    {
      [v9 horizontalAccuracy];
      BOOL v23 = v26 < 25.0;
    }
    BOOL v24 = v22 && v23;
  }

  return v24;
}

- (double)_approximateMaxSpeedForRoad:(id)a3
{
  id v3 = a3;
  v4 = v3;
  double v5 = 8.5;
  if (v3)
  {
    unsigned int v6 = [v3 roadClass];
    if (v6 < 7) {
      double v5 = dbl_18A632D00[v6];
    }
  }

  return v5;
}

- (id)_effectiveLocationForLocation:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unsigned int v6 = [(GEONavigationMapMatcher *)self previousMatchResult];
  if (!v6
    || ([(GEONavigationMapMatcher *)self previousMatchResult],
        id v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 type],
        v7,
        v6,
        v8))
  {
LABEL_3:
    id v9 = v5;
    goto LABEL_4;
  }
  p_lastAccurateCourseLocation = &self->_lastAccurateCourseLocation;
  if (!self->_lastAccurateCourseLocation)
  {
    if ([v5 hasAccurateCourse]) {
      objc_storeStrong((id *)&self->_lastAccurateCourseLocation, a3);
    }
    goto LABEL_3;
  }
  id v9 = v5;
  [(GEONavigationDrivingMapMatcher *)self _courseFromLocation:*p_lastAccurateCourseLocation];
  long double v13 = v12;
  [(GEONavigationDrivingMapMatcher *)self _courseFromLocation:v9];
  long double v15 = v14;
  double v16 = fmod(v13, 360.0);
  if (v16 >= 0.0) {
    double v17 = v16;
  }
  else {
    double v17 = v16 + 360.0;
  }
  double v18 = fmod(v15, 360.0);
  if (v18 < 0.0) {
    double v18 = v18 + 360.0;
  }
  double v19 = v17 - v18;
  if (v19 >= -180.0)
  {
    if (v19 > 180.0) {
      double v19 = v19 + -360.0;
    }
  }
  else
  {
    double v19 = v19 + 360.0;
  }
  [v9 courseAccuracy];
  if (v20 >= 0.0
    && ([v9 courseAccuracy], fabs(v19) >= 160.0)
    && v21 < 180.0
    && (([v9 timestamp],
         double v23 = v22,
         [(GEOLocation *)*p_lastAccurateCourseLocation timestamp],
         self->_isCorrectingCourseSwing)
     || v23 - v24 <= 3.0))
  {
    v25 = (void *)[v9 copy];

    [v25 setCourseAccuracy:180.0];
    if (self->_isCorrectingCourseSwing)
    {
      double v26 = GEOGetMapMatchingLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        [v9 timestamp];
        uint64_t v28 = v27;
        [(GEONavigationDrivingMapMatcher *)self _courseFromLocation:v9];
        uint64_t v30 = v29;
        [v9 courseAccuracy];
        int v45 = 134218496;
        uint64_t v46 = v28;
        __int16 v47 = 2048;
        uint64_t v48 = v30;
        __int16 v49 = 2048;
        uint64_t v50 = v31;
        _os_log_impl(&dword_188D96000, v26, OS_LOG_TYPE_DEFAULT, "Continuing to correct for 180° course swing by modifying course accuracy. Current location timestamp: %0.1f, course: %0.1f°, accuracy: ±%0.1f°", (uint8_t *)&v45, 0x20u);
      }
    }
    else
    {
      uint64_t v32 = [(GEONavigationMapMatcher *)self previousMatchResult];
      double v26 = [v32 rawLocation];

      double v33 = GEOGetMapMatchingLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        [v26 timestamp];
        uint64_t v35 = v34;
        [(GEONavigationDrivingMapMatcher *)self _courseFromLocation:v26];
        uint64_t v37 = v36;
        [v26 courseAccuracy];
        uint64_t v39 = v38;
        [v9 timestamp];
        uint64_t v41 = v40;
        [(GEONavigationDrivingMapMatcher *)self _courseFromLocation:v9];
        uint64_t v43 = v42;
        [v9 courseAccuracy];
        int v45 = 134219264;
        uint64_t v46 = v35;
        __int16 v47 = 2048;
        uint64_t v48 = v37;
        __int16 v49 = 2048;
        uint64_t v50 = v39;
        __int16 v51 = 2048;
        uint64_t v52 = v41;
        __int16 v53 = 2048;
        uint64_t v54 = v43;
        __int16 v55 = 2048;
        uint64_t v56 = v44;
        _os_log_impl(&dword_188D96000, v33, OS_LOG_TYPE_DEFAULT, "Attempting to correct for 180° course swing by modifying course accuracy. Last good location timestamp: %0.1f, course: %0.1f°, accuracy: ±%0.1f°. Current location timestamp: %0.1f, course: %0.1f°, accuracy: ±%0.1f°", (uint8_t *)&v45, 0x3Eu);
      }
    }
    self->_isCorrectingCourseSwing = 1;
    id v9 = v25;
  }
  else
  {
    if ([v9 hasAccurateCourse]) {
      objc_storeStrong((id *)&self->_lastAccurateCourseLocation, a3);
    }
    self->_isCorrectingCourseSwing = 0;
  }
LABEL_4:

  return v9;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_coordinateFromLocation:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_useMatchedCoordinateForMatching) {
    [v4 latLng];
  }
  else {
  unsigned int v6 = [v4 rawCoordinate];
  }
  [v6 coordinate];
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

- (double)_courseFromLocation:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_useMatchedCoordinateForMatching) {
    [v4 course];
  }
  else {
    [v4 rawCourse];
  }
  double v7 = v6;

  return v7;
}

- (id)_routeMatcherForRoute:(id)a3
{
  id v4 = a3;
  id v5 = [GEODrivingRouteMatcher alloc];
  double v6 = [(GEONavigationMapMatcher *)self auditToken];
  double v7 = [(GEODrivingRouteMatcher *)v5 initWithRoute:v4 auditToken:v6];

  [(GEORouteMatcher *)v7 setUseMatchedCoordinateForMatching:self->_useMatchedCoordinateForMatching];

  return v7;
}

- (BOOL)useMatchedCoordinateForMatching
{
  return self->_useMatchedCoordinateForMatching;
}

- (void).cxx_destruct
{
}

@end