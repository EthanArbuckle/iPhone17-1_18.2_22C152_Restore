@interface GEOComposedETARoute
+ (BOOL)supportsSecureCoding;
- ($212C09783140BCCD23384160D545CE0D)startRouteCoordinate;
- (BOOL)hasValidTravelDurations;
- (BOOL)prepareForRequest:(id)a3 route:(id)a4 routeMatch:(id)a5 targetLegIndex:(unint64_t)a6 state:(int)a7;
- (BOOL)updateForResponse:(id)a3 route:(id)a4;
- (GEOComposedETARoute)initWithCoder:(id)a3;
- (GEOComposedETARoute)initWithRouteForTesting:(id)a3;
- (NSArray)legs;
- (NSDate)responseDate;
- (NSDate)serverDisplayETA;
- (NSUUID)etauResponseID;
- (NSUUID)uniqueRouteID;
- (double)_hypothesis_travelDurationFromStep:(id)a3 stepRemainingDistance:(double)a4;
- (double)_travelDurationFromStepID:(unint64_t)a3 toStepID:(unint64_t)a4 currentStepRemainingDistance:(double)a5;
- (double)historicTravelDuration;
- (double)length;
- (double)travelDuration;
- (double)travelDurationAggressiveEstimate;
- (double)travelDurationConservativeEstimate;
- (double)travelDurationToEndOfLegFromStepID:(unint64_t)a3 currentStepRemainingDistance:(double)a4;
- (double)travelDurationToEndOfRouteFromStepID:(unint64_t)a3 currentStepRemainingDistance:(double)a4;
- (id)description;
- (id)evChargingStationInfos;
- (id)evStepInfos;
- (id)geoETAWaypointRoute;
- (id)geoTrafficBannerTexts;
- (id)navigabilityInfo;
- (void)encodeWithCoder:(id)a3;
- (void)invalidateServerDisplayETA;
@end

@implementation GEOComposedETARoute

- (double)_hypothesis_travelDurationFromStep:(id)a3 stepRemainingDistance:(double)a4
{
  id v6 = a3;
  -[GEOComposedETARoute travelDurationToEndOfRouteFromStepID:currentStepRemainingDistance:](self, "travelDurationToEndOfRouteFromStepID:currentStepRemainingDistance:", [v6 stepID], a4);
  double v8 = v7;

  return v8;
}

- (BOOL)prepareForRequest:(id)a3 route:(id)a4 routeMatch:(id)a5 targetLegIndex:(unint64_t)a6 state:(int)a7
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if ([v13 usesRoutingPathPoints] & 1) != 0 || (objc_msgSend(v13, "usesZilch"))
  {
    v15 = [v13 geoWaypointRoute];

    if (v15)
    {
      v16 = [v13 legs];
      v17 = v16;
      if (a6 == 0x7FFFFFFFFFFFFFFFLL) {
        unint64_t v18 = 0;
      }
      else {
        unint64_t v18 = a6;
      }
      v19 = [v16 objectAtIndexedSubscript:v18];

      v20 = [v14 step];
      if (!v20 || [v14 legIndex] != a6)
      {
        if ([v14 legIndex] < a6)
        {
          self->_unint64_t startingStepIndex = [v19 startStepIndex];
          v24 = [v13 steps];
          v25 = [v24 objectAtIndexedSubscript:self->_startingStepIndex];

          self->_$604ECB7A8067A7300F159AE8ED6889F8 startRouteCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)[v25 startRouteCoordinate];
          uint64_t v26 = [v14 routeCoordinate];
          if (vabds_f32((float)self->_startRouteCoordinate.index + self->_startRouteCoordinate.offset, (float)v26 + *((float *)&v26 + 1)) < 0.001)
          {
LABEL_38:
            v20 = v25;
            goto LABEL_39;
          }
          v27 = GEOGetGEOComposedETARouteLog();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v28 = "Pinning route coordinate to target leg.";
LABEL_36:
            _os_log_impl(&dword_188D96000, v27, OS_LOG_TYPE_DEFAULT, v28, buf, 2u);
          }
LABEL_37:

          goto LABEL_38;
        }
        if ([v14 legIndex] > a6)
        {
          v31 = GEOGetGEOComposedETARouteLog();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v81 = [v14 legIndex];
            *(_WORD *)&v81[4] = 1024;
            *(_DWORD *)&v81[6] = a6;
            _os_log_impl(&dword_188D96000, v31, OS_LOG_TYPE_INFO, "Location has reached leg (%d) but the waypoint from leg (%d) was never passed.  Skipping update.", buf, 0xEu);
          }
          goto LABEL_45;
        }
LABEL_39:
        unsigned int index = self->_startRouteCoordinate.index;
        if (index < [v13 pointCount])
        {
          v73 = v19;
          v74 = v20;
          v37 = [v13 uniqueRouteID];
          uniqueRouteID = self->_uniqueRouteID;
          self->_uniqueRouteID = v37;

          unint64_t v39 = [v13 legIndexForStepIndex:self->_startingStepIndex];
          v40 = [v13 legs];
          uint64_t v41 = [v40 count];
          BOOL v42 = v39 < v41 - 1;
          if (v39 < v41 - 1)
          {
            if ((a7 & 0xFFFFFFFE) == 6)
            {
            }
            else
            {
              char v47 = [v74 isChargingStop];

              if ((v47 & 1) == 0)
              {
                BOOL v42 = 0;
                v19 = v73;
                goto LABEL_51;
              }
            }
            v48 = [v13 legs];
            v40 = [v48 objectAtIndexedSubscript:v39 + 1];

            self->_unint64_t startingStepIndex = [v40 startStepIndex];
            self->_$604ECB7A8067A7300F159AE8ED6889F8 startRouteCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)[v40 startRouteCoordinate];
            v49 = GEOGetGEOComposedETARouteLog();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
            {
              int v50 = [v40 legIndex];
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)v81 = v39;
              *(_WORD *)&v81[4] = 1024;
              *(_DWORD *)&v81[6] = v50;
              _os_log_impl(&dword_188D96000, v49, OS_LOG_TYPE_INFO, "Location is at end of leg (%d), creating ETAU request from leg (%d)", buf, 0xEu);
            }
          }
          v19 = v73;

LABEL_51:
          v51 = [v14 pathSegment];
          v52 = [v13 geoETAWaypointRouteFromRouteCoordinate:*(void *)&self->_startRouteCoordinate includeOriginWaypointInfo:v42 startPathSegment:v51];
          geoETAWaypointRoute = self->_geoETAWaypointRoute;
          self->_geoETAWaypointRoute = v52;

          v20 = v74;
          if (!self->_geoETAWaypointRoute)
          {
            BOOL v30 = 0;
LABEL_73:

            goto LABEL_74;
          }
          unint64_t startingStepIndex = self->_startingStepIndex;
          v55 = [v13 steps];
          if (startingStepIndex >= [v55 count])
          {
            v31 = 0;
          }
          else
          {
            v56 = [v13 steps];
            v31 = [v56 objectAtIndexedSubscript:self->_startingStepIndex];
          }
          v57 = [(GEOETATrafficUpdateWaypointRoute *)self->_geoETAWaypointRoute routeLegs];
          v58 = [v57 firstObject];
          v59 = [v58 steps];
          v60 = [v59 firstObject];

          if (!v31 || (int v61 = -[NSObject stepID](v31, "stepID"), v61 != [v60 stepID]))
          {
            id v71 = v14;
            id v72 = v12;
            v62 = GEOGetGEOComposedETARouteLog();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_188D96000, v62, OS_LOG_TYPE_DEFAULT, "Starting step index doesn't match start step on GEOETAWaypointRoute. Searching again for the correct step index.", buf, 2u);
            }

            long long v77 = 0u;
            long long v78 = 0u;
            long long v75 = 0u;
            long long v76 = 0u;
            v63 = [v13 steps];
            uint64_t v64 = [v63 countByEnumeratingWithState:&v75 objects:v79 count:16];
            if (v64)
            {
              uint64_t v65 = v64;
              uint64_t v66 = *(void *)v76;
              while (2)
              {
                for (uint64_t i = 0; i != v65; ++i)
                {
                  if (*(void *)v76 != v66) {
                    objc_enumerationMutation(v63);
                  }
                  v68 = *(void **)(*((void *)&v75 + 1) + 8 * i);
                  int v69 = objc_msgSend(v68, "stepID", v71, v72);
                  if (v69 == [v60 stepID])
                  {
                    self->_unint64_t startingStepIndex = [v68 stepIndex];
                    goto LABEL_70;
                  }
                }
                uint64_t v65 = [v63 countByEnumeratingWithState:&v75 objects:v79 count:16];
                if (v65) {
                  continue;
                }
                break;
              }
            }
LABEL_70:

            id v14 = v71;
            id v12 = v72;
          }
          objc_msgSend(v12, "setWaypointRoute:", self->_geoETAWaypointRoute, v71, v72);

          BOOL v30 = 1;
          v19 = v73;
          v20 = v74;
LABEL_72:

          goto LABEL_73;
        }
        v31 = GEOGetGEOComposedETARouteLog();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          id v43 = v14;
          unsigned int v44 = self->_startRouteCoordinate.index;
          double offset = self->_startRouteCoordinate.offset;
          v46 = [v13 uniqueRouteID];
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v81 = v44;
          id v14 = v43;
          *(_WORD *)&v81[4] = 2048;
          *(double *)&v81[6] = offset;
          __int16 v82 = 2112;
          v83 = v46;
          _os_log_impl(&dword_188D96000, v31, OS_LOG_TYPE_ERROR, "Input route coordinate [%u, %0.2f] is beyond the bounds of route (%@). Skipping update.", buf, 0x1Cu);
        }
LABEL_45:
        BOOL v30 = 0;
        goto LABEL_72;
      }
      $604ECB7A8067A7300F159AE8ED6889F8 v21 = ($604ECB7A8067A7300F159AE8ED6889F8)[v14 routeCoordinate];
      uint64_t v22 = [v20 startRouteCoordinate];
      if (v21.index == v22)
      {
        *(float *)&double v23 = v21.offset;
        if (v21.offset == *((float *)&v22 + 1) || v21.offset >= *((float *)&v22 + 1))
        {
LABEL_27:
          self->_$604ECB7A8067A7300F159AE8ED6889F8 startRouteCoordinate = v21;
          uint64_t v32 = objc_msgSend(v20, "endRouteCoordinate", v23);
          $604ECB7A8067A7300F159AE8ED6889F8 startRouteCoordinate = self->_startRouteCoordinate;
          if (startRouteCoordinate.index == v32)
          {
            LODWORD(v33) = HIDWORD(*(void *)&self->_startRouteCoordinate);
            if (startRouteCoordinate.offset == *((float *)&v32 + 1)
              || startRouteCoordinate.offset >= *((float *)&v32 + 1))
            {
LABEL_33:
              self->_$604ECB7A8067A7300F159AE8ED6889F8 startRouteCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)v32;
              self->_unint64_t startingStepIndex = objc_msgSend(v20, "stepIndex", v33);
              uint64_t v35 = [v14 routeCoordinate];
              if (vabds_f32((float)self->_startRouteCoordinate.index + self->_startRouteCoordinate.offset, (float)v35 + *((float *)&v35 + 1)) >= 0.001)
              {
                v25 = v20;
                v27 = GEOGetGEOComposedETARouteLog();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  v28 = "Pinning route coordinate to current step.";
                  goto LABEL_36;
                }
                goto LABEL_37;
              }
              goto LABEL_39;
            }
          }
          else if (startRouteCoordinate.index >= v32)
          {
            goto LABEL_33;
          }
          uint64_t v32 = (uint64_t)self->_startRouteCoordinate;
          goto LABEL_33;
        }
      }
      else if (v21.index >= v22)
      {
        goto LABEL_27;
      }
      $604ECB7A8067A7300F159AE8ED6889F8 v21 = ($604ECB7A8067A7300F159AE8ED6889F8)v22;
      goto LABEL_27;
    }
    v19 = GEOGetGEOComposedETARouteLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v19, OS_LOG_TYPE_ERROR, "Attempted to prepare an eta request without a GEOETATrafficUpdateWaypointRoute or with a deprecated GEOETARoute.", buf, 2u);
    }
  }
  else
  {
    v19 = GEOGetGEOComposedETARouteLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v29 = [v13 uniqueRouteID];
      *(_DWORD *)buf = 138412290;
      *(void *)v81 = v29;
      _os_log_impl(&dword_188D96000, v19, OS_LOG_TYPE_ERROR, "Route (%@) has no routing path points or zilch points. Unable to generate ETAU request so skipping update.", buf, 0xCu);
    }
  }
  BOOL v30 = 0;
LABEL_74:

  return v30;
}

- (BOOL)updateForResponse:(id)a3 route:(id)a4
{
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = [MEMORY[0x1E4F1C9C8] now];
  responseDate = self->_responseDate;
  self->_responseDate = v8;

  uniqueRouteID = self->_uniqueRouteID;
  if (uniqueRouteID)
  {
    v11 = [v7 uniqueRouteID];
    char v12 = [(NSUUID *)uniqueRouteID isEqual:v11];

    if ((v12 & 1) == 0)
    {
      v15 = GEOGetGEOComposedETARouteLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        double v23 = self->_uniqueRouteID;
        v24 = [v7 uniqueRouteID];
        *(_DWORD *)buf = 138412546;
        *(void *)v131 = v23;
        *(_WORD *)&v131[8] = 2112;
        *(void *)&v131[10] = v24;
        _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_ERROR, "Error updating GEOComposedETARoute from response because _uniqueRouteID (%@) does not much new route ID (%@). This probably means the route changed during an ETA update.", buf, 0x16u);
      }
      goto LABEL_15;
    }
    p_geoETAWaypointRoute = &self->_geoETAWaypointRoute;
    if (self->_geoETAWaypointRoute)
    {
      id v14 = [v6 waypointRoute];
      v15 = v14;
      if (v14)
      {
        v16 = [v14 routeLegs];
        unint64_t v17 = [v16 count];
        unint64_t v18 = [v7 legs];
        unint64_t v19 = [v18 count];

        if (v17 > v19)
        {
          v20 = GEOGetGEOComposedETARouteLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            $604ECB7A8067A7300F159AE8ED6889F8 v21 = [v7 legs];
            *(_DWORD *)buf = 138412546;
            *(void *)v131 = v6;
            *(_WORD *)&v131[8] = 1024;
            *(_DWORD *)&v131[10] = [v21 count];
            _os_log_impl(&dword_188D96000, v20, OS_LOG_TYPE_ERROR, "Number of legs in ETAU response waypointRoute %@ is greater than the original route's leg count (%d)", buf, 0x12u);
          }
          goto LABEL_60;
        }
        BOOL v30 = [(GEOETATrafficUpdateWaypointRoute *)*p_geoETAWaypointRoute routeLegs];
        uint64_t v31 = [v30 count];
        uint64_t v32 = [v15 routeLegs];
        uint64_t v33 = [v32 count];

        if (v31 == v33)
        {
          v116 = v6;
          v34 = (void *)MEMORY[0x1E4F1CA48];
          uint64_t v35 = [v15 routeLegs];
          v20 = objc_msgSend(v34, "arrayWithCapacity:", objc_msgSend(v35, "count"));

          v36 = [v7 legs];
          uint64_t v37 = [v36 count];
          v38 = [v15 routeLegs];
          uint64_t v39 = [v38 count];

          v122 = self;
          unint64_t startingStepIndex = self->_startingStepIndex;
          v40 = [v15 routeLegs];
          uint64_t v41 = [v40 count];

          if (v41)
          {
            v129 = 0;
            uint64_t v117 = v37;
            uint64_t v119 = v37 - v39;
            uint64_t v120 = v39;
            unint64_t v42 = 0;
            double v43 = 0.0;
            double v44 = 0.0;
            v124 = v15;
            id v125 = v7;
            v118 = v20;
            location = &self->_geoETAWaypointRoute;
            while (1)
            {
              v45 = [(GEOETATrafficUpdateWaypointRoute *)*p_geoETAWaypointRoute routeLegs];
              v46 = [v45 objectAtIndexedSubscript:v42];

              char v47 = [v15 routeLegs];
              unint64_t v123 = v42;
              v48 = [v47 objectAtIndexedSubscript:v42];

              v127 = v46;
              v49 = [v46 steps];
              uint64_t v50 = [v49 count];
              v51 = [v48 steps];
              uint64_t v52 = [v51 count];

              if (v50 != v52) {
                break;
              }
              v53 = (void *)MEMORY[0x1E4F1CA48];
              v54 = [v48 steps];
              v128 = objc_msgSend(v53, "arrayWithCapacity:", objc_msgSend(v54, "count"));

              v55 = [v48 steps];
              uint64_t v56 = [v55 count];

              if (v56)
              {
                unint64_t v57 = 0;
                double v58 = 0.0;
                while (1)
                {
                  v59 = [v127 steps];
                  v60 = [v59 objectAtIndexedSubscript:v57];

                  int v61 = [v48 steps];
                  v62 = [v61 objectAtIndexedSubscript:v57];

                  objc_msgSend(v62, "setDistanceCm:", objc_msgSend(v60, "distanceCm"));
                  unsigned int v63 = [v62 expectedTime];
                  unsigned int v64 = [v60 distanceCm];
                  uint64_t v65 = objc_alloc_init(GEOComposedETARouteStep);
                  -[GEOComposedETARouteStep setStepID:](v65, "setStepID:", [v62 stepID]);
                  -[GEOComposedETARouteStep setTravelDuration:](v65, "setTravelDuration:", (double)[v62 expectedTime]);
                  -[GEOComposedETARouteStep setLength:](v65, "setLength:", (float)[v60 distanceCm] * 0.01);
                  [v128 addObject:v65];
                  uint64_t v66 = [v7 steps];
                  if (startingStepIndex + v57 >= [v66 count])
                  {

                    v129 = 0;
                    goto LABEL_34;
                  }
                  v67 = [v7 steps];
                  v68 = [v67 objectAtIndexedSubscript:startingStepIndex + v57];

                  if (!v68)
                  {
                    v129 = 0;
LABEL_33:
                    id v7 = v125;
LABEL_34:
                    v73 = GEOGetGEOComposedETARouteLog();
                    if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
                    {
                      v74 = [v7 steps];
                      *(_DWORD *)buf = 138412546;
                      *(void *)v131 = v124;
                      *(_WORD *)&v131[8] = 2112;
                      *(void *)&v131[10] = v74;
                      _os_log_impl(&dword_188D96000, v73, OS_LOG_TYPE_ERROR, "Error finding associated GEOComposedRouteStep %@ | Route steps: %@", buf, 0x16u);
                    }
                    goto LABEL_37;
                  }
                  int v69 = [v68 stepID];
                  v129 = v68;
                  if ([(GEOComposedETARouteStep *)v65 stepID] != v69) {
                    goto LABEL_33;
                  }
                  uint64_t v70 = [v68 routeCoordinateRange];
                  if (v57)
                  {
                    uint64_t startRouteCoordinate = v70;
                    id v7 = v125;
                  }
                  else
                  {
                    uint64_t startRouteCoordinate = (uint64_t)v122->_startRouteCoordinate;
                    if (startRouteCoordinate == v70)
                    {
                      id v7 = v125;
                      if (*((float *)&startRouteCoordinate + 1) == *((float *)&v70 + 1)
                        || *((float *)&startRouteCoordinate + 1) >= *((float *)&v70 + 1))
                      {
                        goto LABEL_30;
                      }
LABEL_44:
                      uint64_t startRouteCoordinate = v70;
                      goto LABEL_30;
                    }
                    id v7 = v125;
                    if (startRouteCoordinate < v70) {
                      goto LABEL_44;
                    }
                  }
LABEL_30:
                  -[GEOComposedETARouteStep setRouteCoordinateRange:](v65, "setRouteCoordinateRange:", startRouteCoordinate, v71);
LABEL_37:
                  double v43 = v43 + (double)v63;
                  double v58 = v58 + (float)v64 * 0.01;

                  ++v57;
                  long long v75 = [v48 steps];
                  unint64_t v76 = [v75 count];

                  if (v57 >= v76)
                  {
                    startingStepIndex += v57;
                    v15 = v124;
                    v20 = v118;
                    goto LABEL_46;
                  }
                }
              }
              double v58 = 0.0;
LABEL_46:
              long long v77 = objc_alloc_init(GEOComposedETARouteLeg);
              unint64_t v78 = v123;
              [(GEOComposedETARouteLeg *)v77 setOriginalLegIndex:v123 + v119];
              [(GEOComposedETARouteLeg *)v77 setLength:v58];
              [(GEOComposedETARouteLeg *)v77 setSteps:v128];
              v79 = [v48 originWaypointInfo];
              [(GEOComposedETARouteLeg *)v77 setOriginWaypointInfo:v79];

              v80 = [v48 destinationWaypointInfo];
              [(GEOComposedETARouteLeg *)v77 setDestinationWaypointInfo:v80];

              v81 = [v48 destinationWaypointInfo];
              __int16 v82 = [v81 evChargingInfo];

              if (v82)
              {
                v83 = [GEOComposedRouteEVChargingStationInfo alloc];
                uint64_t v84 = [v81 evChargingInfo];
                uint64_t v85 = [v81 muid];
                v86 = [v81 name];
                uint64_t v87 = v85;
                unint64_t v78 = v123;
                v88 = [(GEOComposedRouteEVChargingStationInfo *)v83 initWithGeoEVChargingInfo:v84 muid:v87 name:v86];
                [(GEOComposedETARouteLeg *)v77 setChargingStationInfo:v88];

                id v7 = v125;
              }
              if (!v78 && v117 != v120)
              {
                v89 = [v48 originWaypointInfo];
                v90 = [v89 evChargingInfo];

                if (v90)
                {
                  v91 = objc_alloc_init(GEOComposedETARouteLeg);
                  [(GEOComposedETARouteLeg *)v91 setOriginalLegIndex:v123 + v119 - 1];
                  v92 = GEOGetGEOComposedETARouteLog();
                  if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
                  {
                    int v93 = [(GEOComposedETARouteLeg *)v91 originalLegIndex];
                    v94 = [v89 evChargingInfo];
                    v95 = [v94 formattedText];
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)v131 = v93;
                    *(_WORD *)&v131[4] = 2112;
                    *(void *)&v131[6] = v95;
                    _os_log_impl(&dword_188D96000, v92, OS_LOG_TYPE_INFO, "Inserting synthetic leg (%d) with next leg's origin waypoint info:\n%@", buf, 0x12u);
                  }
                  v96 = [GEOComposedRouteEVChargingStationInfo alloc];
                  v97 = [v89 evChargingInfo];
                  uint64_t v98 = [v89 muid];
                  v99 = [v89 name];
                  v100 = [(GEOComposedRouteEVChargingStationInfo *)v96 initWithGeoEVChargingInfo:v97 muid:v98 name:v99];
                  [(GEOComposedETARouteLeg *)v91 setChargingStationInfo:v100];

                  v20 = v118;
                  [v118 addObject:v91];

                  id v7 = v125;
                }

                unint64_t v78 = v123;
              }
              [v20 addObject:v77];

              double v44 = v44 + v58;
              unint64_t v42 = v78 + 1;
              v101 = [v15 routeLegs];
              unint64_t v102 = [v101 count];

              p_geoETAWaypointRoute = location;
              if (v42 >= v102) {
                goto LABEL_63;
              }
            }
            v113 = GEOGetGEOComposedETARouteLog();
            if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
            {
              v114 = *p_geoETAWaypointRoute;
              *(_DWORD *)buf = 138412546;
              *(void *)v131 = v15;
              *(_WORD *)&v131[8] = 2112;
              *(void *)&v131[10] = v114;
              _os_log_impl(&dword_188D96000, v113, OS_LOG_TYPE_ERROR, "Number of steps in ETAU response waypointRoute %@ does not match request %@", buf, 0x16u);
            }

            BOOL v25 = 0;
            id v6 = v116;
            v109 = v127;
          }
          else
          {
            v129 = 0;
            double v44 = 0.0;
            double v43 = 0.0;
LABEL_63:
            objc_storeStrong((id *)p_geoETAWaypointRoute, v15);
            v122->_travelDuration = v43;
            v104 = [(GEOETATrafficUpdateWaypointRoute *)v122->_geoETAWaypointRoute traversalTimes];
            v122->_historicTravelDuration = (double)[v104 historicalEstimatedSeconds];

            v105 = [(GEOETATrafficUpdateWaypointRoute *)v122->_geoETAWaypointRoute traversalTimes];
            v122->_travelDurationAggressiveEstimate = (double)[v105 aggressiveEstimatedSeconds];

            v106 = [(GEOETATrafficUpdateWaypointRoute *)v122->_geoETAWaypointRoute traversalTimes];
            v122->_travelDurationConservativeEstimate = (double)[v106 conservativeEstimatedSeconds];

            v122->_length = v44;
            objc_storeStrong((id *)&v122->_legs, v20);
            id v6 = v116;
            if ([v116 displayedEta])
            {
              uint64_t v107 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v116, "displayedEta"));
              serverDisplayETA = v122->_serverDisplayETA;
              v122->_serverDisplayETA = (NSDate *)v107;
            }
            v109 = [v116 responseId];
            if (v109)
            {
              v110 = (NSUUID *)[[NSString alloc] initWithData:v109 encoding:4];
              uint64_t v111 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v110];
              etauResponseID = v122->_etauResponseID;
              v122->_etauResponseID = (NSUUID *)v111;
            }
            else
            {
              uint64_t v115 = [MEMORY[0x1E4F29128] UUID];
              v110 = v122->_etauResponseID;
              v122->_etauResponseID = (NSUUID *)v115;
            }

            BOOL v25 = 1;
            v122->_hasValidTravelDurations = 1;
          }

          goto LABEL_61;
        }
        v20 = GEOGetGEOComposedETARouteLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v103 = *p_geoETAWaypointRoute;
          *(_DWORD *)buf = 138412546;
          *(void *)v131 = v15;
          *(_WORD *)&v131[8] = 2112;
          *(void *)&v131[10] = v103;
          v27 = "Number of legs in ETAU response waypointRoute %@ does not match request %@";
          v28 = v20;
          uint32_t v29 = 22;
          goto LABEL_59;
        }
      }
      else
      {
        v20 = GEOGetGEOComposedETARouteLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v131 = v6;
          v27 = "No waypointRoute found in ETAU response: %@";
          v28 = v20;
          uint32_t v29 = 12;
LABEL_59:
          _os_log_impl(&dword_188D96000, v28, OS_LOG_TYPE_ERROR, v27, buf, v29);
        }
      }
LABEL_60:
      BOOL v25 = 0;
LABEL_61:

      goto LABEL_16;
    }
    v15 = GEOGetGEOComposedETARouteLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v22 = "Missing GEOETATrafficUpdateWaypointRoute when updating GEOETATrafficUpdateResponse for given route.";
      goto LABEL_14;
    }
  }
  else
  {
    v15 = GEOGetGEOComposedETARouteLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v22 = "Error updating GEOComposedETARoute from response because _uniqueRouteID is nil. This probably means -prepare"
            "ForRequest: wasn't called.";
LABEL_14:
      _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_ERROR, v22, buf, 2u);
    }
  }
LABEL_15:
  BOOL v25 = 0;
LABEL_16:

  return v25;
}

- (void)invalidateServerDisplayETA
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_serverDisplayETA)
  {
    v3 = objc_opt_new();
    [v3 setDateFormat:@"h:mm:ss a"];
    v4 = GEOGetGEOComposedETARouteLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = [v3 stringFromDate:self->_serverDisplayETA];
      int v7 = 138412290;
      double v8 = v5;
      _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_DEFAULT, "Invalidating server display ETA of %@", (uint8_t *)&v7, 0xCu);
    }
    serverDisplayETA = self->_serverDisplayETA;
    self->_serverDisplayETA = 0;
  }
}

- (double)travelDurationToEndOfRouteFromStepID:(unint64_t)a3 currentStepRemainingDistance:(double)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v7 = [(NSArray *)self->_legs lastObject];
  double v8 = [v7 steps];
  uint64_t v9 = [v8 lastObject];

  if (v9)
  {
    -[GEOComposedETARoute _travelDurationFromStepID:toStepID:currentStepRemainingDistance:](self, "_travelDurationFromStepID:toStepID:currentStepRemainingDistance:", a3, [v9 stepID], a4);
    double v11 = v10;
  }
  else
  {
    char v12 = GEOGetGEOComposedETARouteLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      v15 = self;
      _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_ERROR, "Error computing travelDuration because last step on route was not found: %@", (uint8_t *)&v14, 0xCu);
    }

    double v11 = 978307200.0;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      LOWORD(v14) = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: lastStepOnRoute != ((void *)0)", (uint8_t *)&v14, 2u);
    }
  }

  return v11;
}

- (double)travelDurationToEndOfLegFromStepID:(unint64_t)a3 currentStepRemainingDistance:(double)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  int v7 = self->_legs;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v20 != v10) {
        objc_enumerationMutation(v7);
      }
      char v12 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v11), "steps", (void)v19);
      id v13 = [v12 lastObject];
      unint64_t v14 = [v13 stepID];

      if (v14 >= a3) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_11;
    }
    [(GEOComposedETARoute *)self _travelDurationFromStepID:a3 toStepID:v14 currentStepRemainingDistance:a4];
    return v17;
  }
  else
  {
LABEL_9:

LABEL_11:
    v15 = GEOGetGEOComposedETARouteLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      int v24 = -1;
      __int16 v25 = 2112;
      uint64_t v26 = self;
      _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_ERROR, "Error computing travelDuration because endStepID (%d) is not on the route: %@", buf, 0x12u);
    }

    double v16 = 978307200.0;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: endStepID != NSNotFound", buf, 2u);
    }
  }
  return v16;
}

- (id)geoTrafficBannerTexts
{
  geoETAWaypointRoute = self->_geoETAWaypointRoute;
  if (geoETAWaypointRoute)
  {
    geoETAWaypointRoute = [geoETAWaypointRoute trafficBannerTexts];
  }

  return geoETAWaypointRoute;
}

- (id)navigabilityInfo
{
  geoETAWaypointRoute = self->_geoETAWaypointRoute;
  if (geoETAWaypointRoute)
  {
    geoETAWaypointRoute = [geoETAWaypointRoute navigabilityInfo];
  }

  return geoETAWaypointRoute;
}

- (id)evStepInfos
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  geoETAWaypointRoute = self->_geoETAWaypointRoute;
  if (geoETAWaypointRoute)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = [(GEOETATrafficUpdateWaypointRoute *)geoETAWaypointRoute routeLegs];
    uint64_t v20 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    v3 = 0;
    if (v20)
    {
      uint64_t v19 = *(void *)v27;
      do
      {
        uint64_t v4 = 0;
        do
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = v4;
          v5 = *(void **)(*((void *)&v26 + 1) + 8 * v4);
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          id v6 = [v5 steps];
          uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v7)
          {
            uint64_t v8 = v7;
            uint64_t v9 = *(void *)v23;
            do
            {
              for (uint64_t i = 0; i != v8; ++i)
              {
                if (*(void *)v23 != v9) {
                  objc_enumerationMutation(v6);
                }
                uint64_t v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
                char v12 = [v11 evStateInfo];

                if (v12)
                {
                  id v13 = [GEOComposedRouteEVStepInfo alloc];
                  unint64_t v14 = [v11 evStateInfo];
                  v15 = [(GEOComposedRouteEVStepInfo *)v13 initWithEVStateInfo:v14];

                  if (!v3)
                  {
                    v3 = [MEMORY[0x1E4F1CA60] dictionary];
                  }
                  double v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v11, "stepID"));
                  [v3 setObject:v15 forKeyedSubscript:v16];
                }
              }
              uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
            }
            while (v8);
          }

          uint64_t v4 = v21 + 1;
        }
        while (v21 + 1 != v20);
        uint64_t v20 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v20);
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)evChargingStationInfos
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_geoETAWaypointRoute)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v2 = self->_legs;
    uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      v5 = 0;
      uint64_t v6 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(v2);
          }
          uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v9 = objc_msgSend(v8, "chargingStationInfo", (void)v13);

          if (v9)
          {
            if (!v5)
            {
              v5 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
            }
            uint64_t v10 = [v8 chargingStationInfo];
            uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "originalLegIndex"));
            [v5 setObject:v10 forKeyedSubscript:v11];
          }
        }
        uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v4);
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (double)_travelDurationFromStepID:(unint64_t)a3 toStepID:(unint64_t)a4 currentStepRemainingDistance:(double)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v8 = self->_legs;
  uint64_t v27 = [(NSArray *)v8 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v27)
  {
    uint64_t v9 = *(void *)v33;
    double v10 = 0.0;
    uint64_t v26 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v8);
        }
        char v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v13 = objc_msgSend(v12, "steps", v26);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v29;
          while (2)
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v29 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = *(void **)(*((void *)&v28 + 1) + 8 * j);
              if ([v18 stepID] >= a3)
              {
                uint64_t v19 = [v18 stepID];
                [v18 travelDuration];
                double v21 = v20;
                if (v19 == a3)
                {
                  [v18 length];
                  double v23 = v22;
                  long long v24 = [v18 timeCheckpoints];
                  double v21 = GEORemainingTimeForRemainingDistanceAlongStep(v24, a5, v21, v23);
                }
                double v10 = v10 + v21;
                if ([v18 stepID] == a4)
                {

                  goto LABEL_22;
                }
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v36 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }

        uint64_t v9 = v26;
      }
      uint64_t v27 = [(NSArray *)v8 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v27);
  }
  else
  {
    double v10 = 0.0;
  }
LABEL_22:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedETARoute)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)GEOComposedETARoute;
  v5 = [(GEOComposedETARoute *)&v29 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_uniqueRouteID"];
    uniqueRouteID = v5->_uniqueRouteID;
    v5->_uniqueRouteID = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_etauResponseID"];
    etauResponseID = v5->_etauResponseID;
    v5->_etauResponseID = (NSUUID *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_responseDate"];
    responseDate = v5->_responseDate;
    v5->_responseDate = (NSDate *)v10;

    uint64_t v12 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_legs"];
    legs = v5->_legs;
    v5->_legs = (NSArray *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_serverDisplayETA"];
    serverDisplayETA = v5->_serverDisplayETA;
    v5->_serverDisplayETA = (NSDate *)v14;

    v5->_hasValidTravelDurations = [v4 decodeBoolForKey:@"_hasValidTravelDurations"];
    [v4 decodeDoubleForKey:@"_travelDuration"];
    v5->_travelDuration = v16;
    [v4 decodeDoubleForKey:@"_historicTravelDuration"];
    v5->_historicTravelDuration = v17;
    [v4 decodeDoubleForKey:@"_travelDurationAggressiveEstimate"];
    v5->_travelDurationAggressiveEstimate = v18;
    [v4 decodeDoubleForKey:@"_travelDurationConservativeEstimate"];
    v5->_travelDurationConservativeEstimate = v19;
    [v4 decodeDoubleForKey:@"_length"];
    v5->_length = v20;
    unint64_t v28 = 0;
    id v21 = v4;
    double v22 = (const void *)[v21 decodeBytesForKey:@"_startRouteCoordinate" returnedLength:&v28];
    if (v28 && v22)
    {
      if (v28 >= 8) {
        size_t v23 = 8;
      }
      else {
        size_t v23 = v28;
      }
      memcpy(&v5->_startRouteCoordinate, v22, v23);
    }
    uint64_t v24 = [v21 decodeObjectOfClass:objc_opt_class() forKey:@"_geoETAWaypointRoute"];
    geoETAWaypointRoute = v5->_geoETAWaypointRoute;
    v5->_geoETAWaypointRoute = (GEOETATrafficUpdateWaypointRoute *)v24;

    uint64_t v26 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uniqueRouteID = self->_uniqueRouteID;
  id v5 = a3;
  [v5 encodeObject:uniqueRouteID forKey:@"_uniqueRouteID"];
  [v5 encodeObject:self->_etauResponseID forKey:@"_etauResponseID"];
  [v5 encodeObject:self->_responseDate forKey:@"_responseDate"];
  [v5 encodeObject:self->_legs forKey:@"_legs"];
  [v5 encodeObject:self->_serverDisplayETA forKey:@"_serverDisplayETA"];
  [v5 encodeBool:self->_hasValidTravelDurations forKey:@"_hasValidTravelDurations"];
  [v5 encodeDouble:@"_travelDuration" forKey:self->_travelDuration];
  [v5 encodeDouble:@"_historicTravelDuration" forKey:self->_historicTravelDuration];
  [v5 encodeDouble:@"_travelDurationAggressiveEstimate" forKey:self->_travelDurationAggressiveEstimate];
  [v5 encodeDouble:@"_travelDurationConservativeEstimate" forKey:self->_travelDurationConservativeEstimate];
  [v5 encodeDouble:@"_length" forKey:self->_length];
  [v5 encodeBytes:&self->_startRouteCoordinate length:8 forKey:@"_startRouteCoordinate"];
  [v5 encodeObject:self->_geoETAWaypointRoute forKey:@"_geoETAWaypointRoute"];
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] string];
  [v3 appendFormat:@"Response date: %@", self->_responseDate];
  [(NSDate *)self->_serverDisplayETA timeIntervalSinceReferenceDate];
  objc_msgSend(v3, "appendFormat:", @"Server display ETA: %u", v4);
  id v5 = [(NSArray *)self->_legs lastObject];
  uint64_t v6 = [v5 steps];
  uint64_t v7 = [v6 lastObject];
  unint64_t v8 = [v7 stepID];

  if (v8) {
    unint64_t v9 = (unint64_t)log10((double)v8) + 1;
  }
  else {
    unint64_t v9 = 1;
  }
  if ([(NSArray *)self->_legs count])
  {
    unint64_t v10 = 0;
    do
    {
      uint64_t v11 = [(NSArray *)self->_legs objectAtIndexedSubscript:v10];
      uint64_t v12 = [v11 descriptionWithPrecision:v9];
      [v3 appendFormat:@"\nLeg %d\n%@", v10, v12];

      ++v10;
    }
    while (v10 < [(NSArray *)self->_legs count]);
  }

  return v3;
}

- (NSUUID)uniqueRouteID
{
  return self->_uniqueRouteID;
}

- (NSUUID)etauResponseID
{
  return self->_etauResponseID;
}

- (NSDate)responseDate
{
  return self->_responseDate;
}

- (NSArray)legs
{
  return self->_legs;
}

- (NSDate)serverDisplayETA
{
  return self->_serverDisplayETA;
}

- (BOOL)hasValidTravelDurations
{
  return self->_hasValidTravelDurations;
}

- (double)travelDuration
{
  return self->_travelDuration;
}

- (double)historicTravelDuration
{
  return self->_historicTravelDuration;
}

- (double)travelDurationAggressiveEstimate
{
  return self->_travelDurationAggressiveEstimate;
}

- (double)travelDurationConservativeEstimate
{
  return self->_travelDurationConservativeEstimate;
}

- (double)length
{
  return self->_length;
}

- ($212C09783140BCCD23384160D545CE0D)startRouteCoordinate
{
  return ($212C09783140BCCD23384160D545CE0D)self->_startRouteCoordinate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoETAWaypointRoute, 0);
  objc_storeStrong((id *)&self->_serverDisplayETA, 0);
  objc_storeStrong((id *)&self->_legs, 0);
  objc_storeStrong((id *)&self->_responseDate, 0);
  objc_storeStrong((id *)&self->_etauResponseID, 0);

  objc_storeStrong((id *)&self->_uniqueRouteID, 0);
}

- (GEOComposedETARoute)initWithRouteForTesting:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GEOComposedETARoute;
  return [(GEOComposedETARoute *)&v4 init];
}

- (id)geoETAWaypointRoute
{
  return self->_geoETAWaypointRoute;
}

@end