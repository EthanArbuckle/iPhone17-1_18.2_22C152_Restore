@interface GEONavigationBicycleMapMatcher
- ($F24F406B2B787EFB06265DBA3D28CBD5)_coordinateFromLocation:(id)a3;
- (BOOL)_locationMeetsSpeedThresholdForRoadMatch:(id)a3 distanceFromRoute:(double)a4;
- (BOOL)_shouldConsiderRoadMatch:(id)a3 overRouteMatch:(id)a4 forLocation:(id)a5;
- (BOOL)useMatchedCoordinateForMatching;
- (double)_approximateMaxSpeedForRoad:(id)a3;
- (double)_courseFromLocation:(id)a3;
- (id)_routeMatcherForRoute:(id)a3;
- (id)matchLocation:(id)a3 transportType:(int)a4;
- (int)transportType;
- (void)setUseMatchedCoordinateForMatching:(BOOL)a3;
@end

@implementation GEONavigationBicycleMapMatcher

- (id)matchLocation:(id)a3 transportType:(int)a4
{
  uint64_t v207 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(GEONavigationMapMatcher *)self route];
  int v8 = [v7 transportType];
  int v9 = [(GEONavigationBicycleMapMatcher *)self transportType];

  if (v8 != v9)
  {
    v17 = +[GEONavigationMatchResult matchResultWithRawLocation:v6];
    v18 = [(GEONavigationMapMatcher *)self previousMatchResult];
    v19 = [v18 routeMatch];
    [v17 setRouteMatch:v19];

    [(GEONavigationMapMatcher *)self setPreviousMatchResult:v17];
    goto LABEL_73;
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
          v50 = [(GEONavigationMapMatcher *)self previousMatchResult];
          v51 = [v50 roadMatch];
          v52 = +[GEONavigationMatchResult matchResultWithRoadMatch:v51 location:v6];

          v15 = [(GEONavigationMapMatcher *)self previousMatchResult];
          v16 = [v15 routeMatch];
          [v52 setRouteMatch:v16];
          v14 = v52;
        }
        else
        {
          if (v13 != 2)
          {
            v17 = 0;
            goto LABEL_43;
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
LABEL_43:
      [v17 setLocationUnreliable:1];
      [(GEONavigationMapMatcher *)self setPreviousMatchResult:v17];
      goto LABEL_73;
    }
  }
  v20 = [(GEONavigationMapMatcher *)self previousMatchResult];
  v21 = [v20 routeMatch];

  v22 = [(GEONavigationMapMatcher *)self route];

  if (v22)
  {
    v23 = [(GEONavigationMapMatcher *)self routeMatcher];
    v22 = [v23 matchToRouteWithLocation:v6 previousRouteMatch:v21];

    if (!v22)
    {
      v24 = [GEORouteMatcher alloc];
      v25 = [(GEONavigationMapMatcher *)self route];
      v26 = [(GEONavigationMapMatcher *)self auditToken];
      v27 = [(GEORouteMatcher *)v24 initWithRoute:v25 auditToken:v26];

      v22 = [(GEORouteMatcher *)v27 matchToClosestPointOnRouteWithLocation:v6];
    }
  }
  v28 = [v22 detailedMatchInfo];
  if (a4 == 4)
  {
    BOOL v29 = 1;
    if (!v21)
    {
LABEL_21:
      if (v29) {
        goto LABEL_22;
      }
      goto LABEL_20;
    }
  }
  else
  {
    BOOL v29 = [(GEONavigationBicycleMapMatcher *)self transportType] == a4;
    if (!v21) {
      goto LABEL_21;
    }
  }
  if (![v21 isGoodMatch]) {
    goto LABEL_21;
  }
  v30 = [(GEONavigationMapMatcher *)self previousMatchResult];
  uint64_t v31 = [v30 type];

  if (v29 || !v31 && ([v22 isGoodMatch] & 1) != 0)
  {
LABEL_22:
    [v6 horizontalAccuracy];
    double v33 = v32;
    [v6 courseAccuracy];
    double v34 = -1.0;
    double v35 = -1.0;
    if (v36 >= 0.0)
    {
      [v6 courseAccuracy];
      double v35 = v37 + 10.0;
    }
    if (v29)
    {
      v38 = [(GEONavigationMapMatcher *)self roadMatcher];
      v39 = v38;
      if (v38 && v33 >= 0.0 && v33 <= 65.0)
      {
        [v6 course];
        double v41 = v40;

        if (v41 < 0.0) {
          goto LABEL_33;
        }
        v42 = [(GEONavigationMapMatcher *)self previousMatchResult];
        if ([v42 type] == 2)
        {
          [v22 distanceFromRoute];
          BOOL v43 = -[GEONavigationBicycleMapMatcher _locationMeetsSpeedThresholdForRoadMatch:distanceFromRoute:](self, "_locationMeetsSpeedThresholdForRoadMatch:distanceFromRoute:", v6);

          if (!v43) {
            goto LABEL_33;
          }
        }
        else
        {
        }
        v149 = [(GEONavigationMapMatcher *)self roadMatcher];
        v150 = objc_msgSend(v149, "matchLocation:forTransportType:", v6, -[GEONavigationBicycleMapMatcher transportType](self, "transportType"));

        if (v150)
        {
          if (v35 >= 0.0) {
            double v151 = v35 + 10.0;
          }
          else {
            double v151 = 10.0;
          }
          v184 = v150;
          [v150 distanceFromRoad];
          double v45 = v152;
          BOOL v153 = v152 < v33 + 20.0;
          [(GEONavigationBicycleMapMatcher *)self _courseFromLocation:v6];
          double v155 = v154;
          if (v154 >= 0.0)
          {
            [v150 courseOnRoad];
            BOOL v153 = v45 < v33 + 20.0;
            long double v158 = fmod(v157 - v155 + 180.0, 360.0);
            double v34 = fabs(fmod(v158 + 360.0, 360.0) + -180.0);
            if (v34 >= v151) {
              BOOL v153 = 0;
            }
            double v156 = 10.0;
          }
          else
          {
            double v34 = -1.0;
            double v156 = 30.0;
          }
          [v22 locationCoordinate3D];
          double v160 = v159;
          double v162 = v161;
          [v150 coordinateOnRoad];
          double v165 = GEOCalculateDistanceRadius(v160, v162, v163, v164, 6367000.0);
          [v22 matchedCourse];
          double v167 = v166;
          [v150 courseOnRoad];
          long double v169 = fmod(v168 - v167 + 180.0, 360.0);
          BOOL v170 = fabs(fmod(v169 + 360.0, 360.0) + -180.0) > 30.0 || v165 > v156;
          [v28 setDistanceFromRoad:v45];
          [v28 setRoadCourseDelta:v34];
          [v184 distanceFromJunction];
          objc_msgSend(v28, "setDistanceFromNearestJunction:");
          int v44 = v153 && v170;
          if (!v22) {
            goto LABEL_66;
          }
LABEL_34:
          int v46 = [v22 isGoodMatch];
          [v22 distanceFromRoute];
          if (v46)
          {
            double v48 = v47;
            if ([v22 routeMatchedToEnd])
            {
              [v6 speed];
              int v46 = v48 <= 5.0 && v49 <= 3.5;
            }
            else
            {
              int v46 = 1;
            }
            if ((v46 & v44) == 1)
            {
              if (![(GEONavigationBicycleMapMatcher *)self _shouldConsiderRoadMatch:v184 overRouteMatch:v22 forLocation:v6])goto LABEL_63; {
              [v22 modifiedHorizontalAccuracy];
              }
              double v54 = 0.0;
              if (v48 - v53 >= 0.0)
              {
                [v22 modifiedHorizontalAccuracy];
                double v54 = v48 - v55;
              }
              [v6 speed];
              if (v56 > 16.0)
              {
                [v6 speed];
                double v54 = v54 + v57 * -0.125;
              }
              [v6 course];
              double v59 = v58;
              [v22 matchedCourse];
              long double v61 = fmod(v60 - v59 + 180.0, 360.0);
              double v62 = fmod(v61 + 360.0, 360.0);
              [v22 modifiedCourseAccuracy];
              double v63 = v62 + -180.0;
              double v65 = v63 - v64 + -20.0;
              double v66 = 0.0;
              if (v65 >= 0.0)
              {
                objc_msgSend(v22, "modifiedCourseAccuracy", 0.0);
                double v66 = v63 - v67 + -20.0;
              }
              int v46 = v66 <= v35 + v34 && v54 <= v33 + v45;
            }
          }
          if ((v46 & 1) != 0 || !v29 || ![v6 isMatchedLocation])
          {
            if (v46)
            {
LABEL_63:
              v17 = +[GEONavigationMatchResult matchResultWithRouteMatch:v22 location:v6];
              [v17 setDetailedMatchInfo:v28];
              [(GEONavigationMapMatcher *)self setPreviousMatchResult:v17];
              v70 = GEOGetCyclingMapMatcherLog();
              if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
              {
                v181 = [v17 routeMatch];
                [v181 locationCoordinate];
                uint64_t v72 = v71;
                v179 = [v17 routeMatch];
                [v179 locationCoordinate];
                uint64_t v74 = v73;
                v177 = [v17 routeMatch];
                [v177 matchedCourse];
                uint64_t v76 = v75;
                v77 = [v17 routeMatch];
                [v77 modifiedHorizontalAccuracy];
                uint64_t v79 = v78;
                v80 = [v17 routeMatch];
                [v80 modifiedCourseAccuracy];
                uint64_t v82 = v81;
                v83 = [v6 latLng];
                uint64_t v173 = v82;
                uint64_t v175 = v79;
                uint64_t v84 = v76;
                uint64_t v85 = v74;
                uint64_t v86 = v72;
                [v83 lat];
                uint64_t v88 = v87;
                v89 = [v6 latLng];
                [v89 lng];
                uint64_t v91 = v90;
                [v6 course];
                uint64_t v93 = v92;
                [v6 horizontalAccuracy];
                uint64_t v95 = v94;
                [v6 courseAccuracy];
                uint64_t v97 = v96;
                [v6 timestamp];
                *(_DWORD *)buf = 134220544;
                uint64_t v186 = v86;
                __int16 v187 = 2048;
                uint64_t v188 = v85;
                __int16 v189 = 2048;
                uint64_t v190 = v84;
                __int16 v191 = 2048;
                uint64_t v192 = v175;
                __int16 v193 = 2048;
                uint64_t v194 = v173;
                __int16 v195 = 2048;
                uint64_t v196 = v88;
                __int16 v197 = 2048;
                uint64_t v198 = v91;
                __int16 v199 = 2048;
                uint64_t v200 = v93;
                __int16 v201 = 2048;
                uint64_t v202 = v95;
                __int16 v203 = 2048;
                uint64_t v204 = v97;
                __int16 v205 = 2048;
                uint64_t v206 = v98;
                _os_log_impl(&dword_188D96000, v70, OS_LOG_TYPE_INFO, "MapsSnapToRouteRoute,LatLng,%.8lf,%.8lf,Course,%.3lf,HorUnc,%.3lf,CourseUnc,%.3lf,InputLatLng,%.8lf,%.8lf,InputCourse,%.3lf,InputHorUnc,%.3lf,InputCourseUnc,%.3lf,Timestamp,%f", buf, 0x70u);
              }
              goto LABEL_71;
            }
          }
          else
          {
            v68 = [(GEONavigationMapMatcher *)self routeMatcher];
            v69 = [v68 matchToRouteWithLocation:v6 previousRouteMatch:v21];

            if (v69 && [v69 isGoodMatch])
            {

              v22 = v69;
              goto LABEL_63;
            }
          }
LABEL_66:
          if (v44)
          {
            v17 = +[GEONavigationMatchResult matchResultWithRoadMatch:v184 location:v6];
            [v17 setRouteMatch:v22];
            [v17 setDetailedMatchInfo:v28];
            [(GEONavigationMapMatcher *)self setPreviousMatchResult:v17];
            v70 = GEOGetCyclingMapMatcherLog();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
            {
              v182 = [v17 roadMatch];
              [v182 coordinateOnRoad];
              uint64_t v100 = v99;
              v101 = [v17 roadMatch];
              [v101 coordinateOnRoad];
              uint64_t v103 = v102;
              v104 = [v17 roadMatch];
              [v104 courseOnRoad];
              uint64_t v106 = v105;
              v107 = [v6 latLng];
              [v107 lat];
              uint64_t v109 = v108;
              v110 = [v6 latLng];
              [v110 lng];
              uint64_t v112 = v111;
              [v6 course];
              uint64_t v114 = v113;
              [v6 horizontalAccuracy];
              uint64_t v116 = v115;
              [v6 courseAccuracy];
              uint64_t v118 = v117;
              [v6 timestamp];
              *(_DWORD *)buf = 134220544;
              uint64_t v186 = v100;
              __int16 v187 = 2048;
              uint64_t v188 = v103;
              __int16 v189 = 2048;
              uint64_t v190 = v106;
              __int16 v191 = 2048;
              uint64_t v192 = 0;
              __int16 v193 = 2048;
              uint64_t v194 = 0;
              __int16 v195 = 2048;
              uint64_t v196 = v109;
              __int16 v197 = 2048;
              uint64_t v198 = v112;
              __int16 v199 = 2048;
              uint64_t v200 = v114;
              __int16 v201 = 2048;
              uint64_t v202 = v116;
              __int16 v203 = 2048;
              uint64_t v204 = v118;
              __int16 v205 = 2048;
              uint64_t v206 = v119;
              _os_log_impl(&dword_188D96000, v70, OS_LOG_TYPE_INFO, "MapsSnapToRouteRoad,LatLng,%.8lf,%.8lf,Course,%.3lf,HorUnc,%.3lf,CourseUnc,%.3lf,InputLatLng,%.8lf,%.8lf,InputCourse,%.3lf,InputHorUnc,%.3lf,InputCourseUnc,%.3lf,Timestamp,%f", buf, 0x70u);
            }
          }
          else
          {
            v17 = +[GEONavigationMatchResult matchResultWithRawLocation:v6];
            [v17 setRouteMatch:v22];
            [v17 setDetailedMatchInfo:v28];
            [(GEONavigationMapMatcher *)self setPreviousMatchResult:v17];
            v70 = GEOGetCyclingMapMatcherLog();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
            {
              v183 = [v17 rawLocation];
              v180 = [v183 latLng];
              [v180 lat];
              uint64_t v121 = v120;
              v178 = [v17 rawLocation];
              v176 = [v178 latLng];
              [v176 lng];
              uint64_t v123 = v122;
              v174 = [v17 rawLocation];
              [v174 course];
              uint64_t v125 = v124;
              v126 = [v17 rawLocation];
              [v126 horizontalAccuracy];
              uint64_t v128 = v127;
              v129 = [v17 rawLocation];
              [v129 courseAccuracy];
              uint64_t v131 = v130;
              v132 = [v6 latLng];
              uint64_t v171 = v131;
              uint64_t v172 = v128;
              uint64_t v133 = v125;
              uint64_t v134 = v123;
              uint64_t v135 = v121;
              [v132 lat];
              uint64_t v137 = v136;
              v138 = [v6 latLng];
              [v138 lng];
              uint64_t v140 = v139;
              [v6 course];
              uint64_t v142 = v141;
              [v6 horizontalAccuracy];
              uint64_t v144 = v143;
              [v6 courseAccuracy];
              uint64_t v146 = v145;
              [v6 timestamp];
              *(_DWORD *)buf = 134220544;
              uint64_t v186 = v135;
              __int16 v187 = 2048;
              uint64_t v188 = v134;
              __int16 v189 = 2048;
              uint64_t v190 = v133;
              __int16 v191 = 2048;
              uint64_t v192 = v172;
              __int16 v193 = 2048;
              uint64_t v194 = v171;
              __int16 v195 = 2048;
              uint64_t v196 = v137;
              __int16 v197 = 2048;
              uint64_t v198 = v140;
              __int16 v199 = 2048;
              uint64_t v200 = v142;
              __int16 v201 = 2048;
              uint64_t v202 = v144;
              __int16 v203 = 2048;
              uint64_t v204 = v146;
              __int16 v205 = 2048;
              uint64_t v206 = v147;
              _os_log_impl(&dword_188D96000, v70, OS_LOG_TYPE_INFO, "MapsSnapToRouteRaw,LatLng,%.8lf,%.8lf,Course,%.3lf,HorUnc,%.3lf,CourseUnc,%.3lf,InputLatLng,%.8lf,%.8lf,InputCourse,%.3lf,InputHorUnc,%.3lf,InputCourseUnc,%.3lf,Timestamp,%f", buf, 0x70u);
            }
          }
LABEL_71:

          goto LABEL_72;
        }
      }
      else
      {
      }
    }
LABEL_33:
    int v44 = 0;
    v184 = 0;
    double v45 = -1.0;
    if (!v22) {
      goto LABEL_66;
    }
    goto LABEL_34;
  }
LABEL_20:
  v17 = +[GEONavigationMatchResult matchResultWithRawLocation:v6];
  [v17 setRouteMatch:v22];
  [(GEONavigationMapMatcher *)self setPreviousMatchResult:v17];
LABEL_72:

LABEL_73:

  return v17;
}

- (int)transportType
{
  return 3;
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
  double v6 = (a4 + -10.0) / 40.0;
  if (v6 < 0.0) {
    double v6 = 0.0;
  }
  if (v6 > 1.0) {
    double v6 = 1.0;
  }
  float v7 = v6;
  return v5 >= v7 * -3.0 + 3.0;
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
      double v5 = dbl_18A63A438[v6];
    }
  }

  return v5;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_coordinateFromLocation:(id)a3
{
  id v4 = a3;
  double v5 = v4;
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
  double v5 = v4;
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
  double v5 = [GEOCyclingRouteMatcher alloc];
  double v6 = [(GEONavigationMapMatcher *)self auditToken];
  double v7 = [(GEOCyclingRouteMatcher *)v5 initWithRoute:v4 auditToken:v6];

  [(GEORouteMatcher *)v7 setUseMatchedCoordinateForMatching:self->_useMatchedCoordinateForMatching];

  return v7;
}

- (BOOL)useMatchedCoordinateForMatching
{
  return self->_useMatchedCoordinateForMatching;
}

@end