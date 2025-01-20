@interface GDKTSDataRepresentation
+ (BOOL)supportsSecureCoding;
- (GDKTSDataRepresentation)initWithCoder:(id)a3;
- (GDKTSDataRepresentation)initWithStartTime:(id)a3 endTime:(id)a4 distanceInMeters:(id)a5 elevationGainInMeters:(id)a6 distanceBuckets:(id)a7 durationInSeconds:(id)a8 expectedDurationInSecondsNoTraffic:(id)a9 distanceSpentInTrafficBuckets:(id)a10 timeSpentInTrafficBuckets:(id)a11 distanceSpentAtSpeedBuckets:(id)a12 timeSpentAtSpeedBuckets:(id)a13 distanceSpentAtRelativeSpeeds:(id)a14 timeSpentAtRelativeSpeeds:(id)a15 distancePerRoadType:(id)a16 timePerRoadType:(id)a17 distancePerWeatherType:(id)a18 timePerWeatherType:(id)a19 distancePerTerrainType:(id)a20 timePerTerrainType:(id)a21 averageSpeedInMetersPerSecond:(id)a22 score:(double)a23 usageKwh:(id)a24 optimalUsageKwh:(id)a25 numBrakingEvents:(int)a26 numAccelEvents:(int)a27 numHighSpeedEvents:(int)a28 roadDistancesInMeters:(id)a29 roadSpeedBuckets:(id)a30 roadRelativeSpeedBuckets:(id)a31 roadTimes:(id)a32 route:(id)a33 lifeEventIds:(id)a34 ktsSegmentIds:(id)a35;
- (NSArray)distanceBuckets;
- (NSArray)distancePerRoadType;
- (NSArray)distancePerTerrainType;
- (NSArray)distancePerWeatherType;
- (NSArray)distanceSpentAtRelativeSpeeds;
- (NSArray)distanceSpentAtSpeedBuckets;
- (NSArray)distanceSpentInTrafficBuckets;
- (NSArray)ktsSegmentIds;
- (NSArray)lifeEventIds;
- (NSArray)route;
- (NSArray)timePerRoadType;
- (NSArray)timePerTerrainType;
- (NSArray)timePerWeatherType;
- (NSArray)timeSpentAtRelativeSpeeds;
- (NSArray)timeSpentAtSpeedBuckets;
- (NSArray)timeSpentInTrafficBuckets;
- (NSDate)endTime;
- (NSDate)startTime;
- (NSDictionary)roadDistancesInMeters;
- (NSDictionary)roadRelativeSpeedBuckets;
- (NSDictionary)roadSpeedBuckets;
- (NSDictionary)roadTimes;
- (NSMeasurement)averageSpeedInMetersPerSecond;
- (NSMeasurement)distanceInMeters;
- (NSMeasurement)durationInSeconds;
- (NSMeasurement)elevationGainInMeters;
- (NSMeasurement)expectedDurationInSecondsNoTraffic;
- (NSMeasurement)optimalUsageKwh;
- (NSMeasurement)usageKwh;
- (double)score;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)numAccelEvents;
- (int)numBrakingEvents;
- (int)numHighSpeedEvents;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GDKTSDataRepresentation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ktsSegmentIds, 0);
  objc_storeStrong((id *)&self->_lifeEventIds, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_roadTimes, 0);
  objc_storeStrong((id *)&self->_roadRelativeSpeedBuckets, 0);
  objc_storeStrong((id *)&self->_roadSpeedBuckets, 0);
  objc_storeStrong((id *)&self->_roadDistancesInMeters, 0);
  objc_storeStrong((id *)&self->_optimalUsageKwh, 0);
  objc_storeStrong((id *)&self->_usageKwh, 0);
  objc_storeStrong((id *)&self->_averageSpeedInMetersPerSecond, 0);
  objc_storeStrong((id *)&self->_timePerTerrainType, 0);
  objc_storeStrong((id *)&self->_distancePerTerrainType, 0);
  objc_storeStrong((id *)&self->_timePerWeatherType, 0);
  objc_storeStrong((id *)&self->_distancePerWeatherType, 0);
  objc_storeStrong((id *)&self->_timePerRoadType, 0);
  objc_storeStrong((id *)&self->_distancePerRoadType, 0);
  objc_storeStrong((id *)&self->_timeSpentAtRelativeSpeeds, 0);
  objc_storeStrong((id *)&self->_distanceSpentAtRelativeSpeeds, 0);
  objc_storeStrong((id *)&self->_timeSpentAtSpeedBuckets, 0);
  objc_storeStrong((id *)&self->_distanceSpentAtSpeedBuckets, 0);
  objc_storeStrong((id *)&self->_timeSpentInTrafficBuckets, 0);
  objc_storeStrong((id *)&self->_distanceSpentInTrafficBuckets, 0);
  objc_storeStrong((id *)&self->_expectedDurationInSecondsNoTraffic, 0);
  objc_storeStrong((id *)&self->_durationInSeconds, 0);
  objc_storeStrong((id *)&self->_distanceBuckets, 0);
  objc_storeStrong((id *)&self->_elevationGainInMeters, 0);
  objc_storeStrong((id *)&self->_distanceInMeters, 0);
  objc_storeStrong((id *)&self->_endTime, 0);

  objc_storeStrong((id *)&self->_startTime, 0);
}

- (NSArray)ktsSegmentIds
{
  return self->_ktsSegmentIds;
}

- (NSArray)lifeEventIds
{
  return self->_lifeEventIds;
}

- (NSArray)route
{
  return self->_route;
}

- (NSDictionary)roadTimes
{
  return self->_roadTimes;
}

- (NSDictionary)roadRelativeSpeedBuckets
{
  return self->_roadRelativeSpeedBuckets;
}

- (NSDictionary)roadSpeedBuckets
{
  return self->_roadSpeedBuckets;
}

- (NSDictionary)roadDistancesInMeters
{
  return self->_roadDistancesInMeters;
}

- (int)numHighSpeedEvents
{
  return self->_numHighSpeedEvents;
}

- (int)numAccelEvents
{
  return self->_numAccelEvents;
}

- (int)numBrakingEvents
{
  return self->_numBrakingEvents;
}

- (NSMeasurement)optimalUsageKwh
{
  return self->_optimalUsageKwh;
}

- (NSMeasurement)usageKwh
{
  return self->_usageKwh;
}

- (double)score
{
  return self->_score;
}

- (NSMeasurement)averageSpeedInMetersPerSecond
{
  return self->_averageSpeedInMetersPerSecond;
}

- (NSArray)timePerTerrainType
{
  return self->_timePerTerrainType;
}

- (NSArray)distancePerTerrainType
{
  return self->_distancePerTerrainType;
}

- (NSArray)timePerWeatherType
{
  return self->_timePerWeatherType;
}

- (NSArray)distancePerWeatherType
{
  return self->_distancePerWeatherType;
}

- (NSArray)timePerRoadType
{
  return self->_timePerRoadType;
}

- (NSArray)distancePerRoadType
{
  return self->_distancePerRoadType;
}

- (NSArray)timeSpentAtRelativeSpeeds
{
  return self->_timeSpentAtRelativeSpeeds;
}

- (NSArray)distanceSpentAtRelativeSpeeds
{
  return self->_distanceSpentAtRelativeSpeeds;
}

- (NSArray)timeSpentAtSpeedBuckets
{
  return self->_timeSpentAtSpeedBuckets;
}

- (NSArray)distanceSpentAtSpeedBuckets
{
  return self->_distanceSpentAtSpeedBuckets;
}

- (NSArray)timeSpentInTrafficBuckets
{
  return self->_timeSpentInTrafficBuckets;
}

- (NSArray)distanceSpentInTrafficBuckets
{
  return self->_distanceSpentInTrafficBuckets;
}

- (NSMeasurement)expectedDurationInSecondsNoTraffic
{
  return self->_expectedDurationInSecondsNoTraffic;
}

- (NSMeasurement)durationInSeconds
{
  return self->_durationInSeconds;
}

- (NSArray)distanceBuckets
{
  return self->_distanceBuckets;
}

- (NSMeasurement)elevationGainInMeters
{
  return self->_elevationGainInMeters;
}

- (NSMeasurement)distanceInMeters
{
  return self->_distanceInMeters;
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v9 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  return (id)objc_msgSend_initWithStartTime_endTime_distanceInMeters_elevationGainInMeters_distanceBuckets_durationInSeconds_expectedDurationInSecondsNoTraffic_distanceSpentInTrafficBuckets_timeSpentInTrafficBuckets_distanceSpentAtSpeedBuckets_timeSpentAtSpeedBuckets_distanceSpentAtRelativeSpeeds_timeSpentAtRelativeSpeeds_distancePerRoadType_timePerRoadType_distancePerWeatherType_timePerWeatherType_distancePerTerrainType_timePerTerrainType_averageSpeedInMetersPerSecond_score_usageKwh_optimalUsageKwh_numBrakingEvents_numAccelEvents_numHighSpeedEvents_roadDistancesInMeters_roadSpeedBuckets_roadRelativeSpeedBuckets_roadTimes_route_lifeEventIds_ktsSegmentIds_(v9, v10, (uint64_t)self->_startTime, (uint64_t)self->_endTime, (uint64_t)self->_distanceInMeters, self->_elevationGainInMeters, self->_distanceBuckets, self->_durationInSeconds, self->_score, self->_expectedDurationInSecondsNoTraffic, self->_distanceSpentInTrafficBuckets, self->_timeSpentInTrafficBuckets, self->_distanceSpentAtSpeedBuckets, self->_timeSpentAtSpeedBuckets, self->_distanceSpentAtRelativeSpeeds, self->_timeSpentAtRelativeSpeeds, self->_distancePerRoadType, self->_timePerRoadType, self->_distancePerWeatherType,
               self->_timePerWeatherType,
               self->_distancePerTerrainType,
               self->_timePerTerrainType,
               self->_averageSpeedInMetersPerSecond,
               self->_usageKwh,
               self->_optimalUsageKwh,
               *(void *)&self->_numBrakingEvents,
               self->_numHighSpeedEvents,
               self->_roadDistancesInMeters,
               self->_roadSpeedBuckets,
               *(_OWORD *)&self->_roadRelativeSpeedBuckets,
               self->_route,
               self->_lifeEventIds,
               self->_ktsSegmentIds);
}

- (id)description
{
  v2 = objc_msgSend_initWithFormat_([NSString alloc], (const char *)self->_averageSpeedInMetersPerSecond, @"GDKTSDataRepresentation<startTime: %@, endTime: %@, totalDistance: %@, elevationGain: %@, distanceBuckets: %@, totalDuration: %@, expectedDuration: %@, distanceInTrafficBuckets: %@, distanceAtSpeedBuckets: %@, distanceAtRelativeSpeeds: %@, timeInTrafficBuckets: %@, timeAtSpeedBuckets: %@, timeAtRelativeSpeeds: %@, averageSpeed: %@, distancePerRoadType: %@, timePerRoadType: %@, distancePerWeatherType: %@, timePerWeatherType: %@, distancePerTerrainType: %@, timePerTerrainType: %@, score: %f, usageKwh: %@, optimalUsageKwh: %@, numBrakingEvents: %d, numAccelEvents: %d, numHighSpeedEvents: %d, roadDistancesInMeters: %@ roadSpeedBuckets: %@ roadRelativeSpeeds: %@, roadTimes: %@, route: %@, lifeEventIds: %@, ktsSegmentIds: %@>", (uint64_t)self->_usageKwh, (uint64_t)self->_optimalUsageKwh, self->_startTime, self->_endTime, self->_distanceInMeters, self->_elevationGainInMeters, self->_distanceBuckets, self->_durationInSeconds, self->_expectedDurationInSecondsNoTraffic, self->_distanceSpentInTrafficBuckets, self->_distanceSpentAtSpeedBuckets, self->_distanceSpentAtRelativeSpeeds, self->_timeSpentInTrafficBuckets, self->_timeSpentAtSpeedBuckets, self->_timeSpentAtRelativeSpeeds, self->_averageSpeedInMetersPerSecond,
                 self->_distancePerRoadType,
                 self->_timePerRoadType,
                 self->_distancePerWeatherType,
                 self->_timePerWeatherType,
                 self->_distancePerTerrainType,
                 self->_timePerTerrainType,
                 *(void *)&self->_score,
                 self->_usageKwh,
                 self->_optimalUsageKwh,
                 self->_numBrakingEvents,
                 self->_numAccelEvents,
                 self->_numHighSpeedEvents,
                 *(_OWORD *)&self->_roadDistancesInMeters,
                 *(_OWORD *)&self->_roadRelativeSpeedBuckets,
                 *(_OWORD *)&self->_route,
                 self->_ktsSegmentIds);

  return v2;
}

- (GDKTSDataRepresentation)initWithCoder:(id)a3
{
  v408[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  v5 = NSStringFromSelector(sel_startTime);
  v401 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v6, v4, (uint64_t)v5, v7);

  uint64_t v8 = objc_opt_class();
  v9 = NSStringFromSelector(sel_endTime);
  v399 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v10, v8, (uint64_t)v9, v11);

  v12 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  v18 = objc_msgSend_setWithObjects_(v12, v15, v13, v16, v17, v14, 0);
  v19 = NSStringFromSelector(sel_distanceInMeters);
  v398 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v20, (uint64_t)v18, (uint64_t)v19, v21);

  v22 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v23 = objc_opt_class();
  uint64_t v24 = objc_opt_class();
  v28 = objc_msgSend_setWithObjects_(v22, v25, v23, v26, v27, v24, 0);
  v29 = NSStringFromSelector(sel_elevationGainInMeters);
  v397 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v30, (uint64_t)v28, (uint64_t)v29, v31);

  v32 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v33 = objc_opt_class();
  uint64_t v34 = objc_opt_class();
  uint64_t v35 = objc_opt_class();
  uint64_t v36 = objc_opt_class();
  v40 = objc_msgSend_setWithObjects_(v32, v37, v33, v38, v39, v34, v35, v36, 0);
  v41 = NSStringFromSelector(sel_distanceBuckets);
  v396 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v42, (uint64_t)v40, (uint64_t)v41, v43);

  v44 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v45 = objc_opt_class();
  uint64_t v46 = objc_opt_class();
  v50 = objc_msgSend_setWithObjects_(v44, v47, v45, v48, v49, v46, 0);
  v51 = NSStringFromSelector(sel_durationInSeconds);
  v395 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v52, (uint64_t)v50, (uint64_t)v51, v53);

  v54 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v55 = objc_opt_class();
  uint64_t v56 = objc_opt_class();
  v60 = objc_msgSend_setWithObjects_(v54, v57, v55, v58, v59, v56, 0);
  v61 = NSStringFromSelector(sel_expectedDurationInSecondsNoTraffic);
  v394 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v62, (uint64_t)v60, (uint64_t)v61, v63);

  v64 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v65 = objc_opt_class();
  uint64_t v66 = objc_opt_class();
  uint64_t v67 = objc_opt_class();
  uint64_t v68 = objc_opt_class();
  v72 = objc_msgSend_setWithObjects_(v64, v69, v65, v70, v71, v66, v67, v68, 0);
  v73 = NSStringFromSelector(sel_timeSpentInTrafficBuckets);
  v393 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v74, (uint64_t)v72, (uint64_t)v73, v75);

  v76 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v77 = objc_opt_class();
  uint64_t v78 = objc_opt_class();
  uint64_t v79 = objc_opt_class();
  uint64_t v80 = objc_opt_class();
  v84 = objc_msgSend_setWithObjects_(v76, v81, v77, v82, v83, v78, v79, v80, 0);
  v85 = NSStringFromSelector(sel_distanceSpentInTrafficBuckets);
  v392 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v86, (uint64_t)v84, (uint64_t)v85, v87);

  v88 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v89 = objc_opt_class();
  uint64_t v90 = objc_opt_class();
  uint64_t v91 = objc_opt_class();
  uint64_t v92 = objc_opt_class();
  v96 = objc_msgSend_setWithObjects_(v88, v93, v89, v94, v95, v90, v91, v92, 0);
  v97 = NSStringFromSelector(sel_timeSpentAtSpeedBuckets);
  v391 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v98, (uint64_t)v96, (uint64_t)v97, v99);

  v100 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v101 = objc_opt_class();
  uint64_t v102 = objc_opt_class();
  uint64_t v103 = objc_opt_class();
  uint64_t v104 = objc_opt_class();
  v108 = objc_msgSend_setWithObjects_(v100, v105, v101, v106, v107, v102, v103, v104, 0);
  v109 = NSStringFromSelector(sel_distanceSpentAtSpeedBuckets);
  v390 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v110, (uint64_t)v108, (uint64_t)v109, v111);

  v112 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v113 = objc_opt_class();
  uint64_t v114 = objc_opt_class();
  uint64_t v115 = objc_opt_class();
  uint64_t v116 = objc_opt_class();
  v120 = objc_msgSend_setWithObjects_(v112, v117, v113, v118, v119, v114, v115, v116, 0);
  v121 = NSStringFromSelector(sel_timeSpentAtRelativeSpeeds);
  v389 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v122, (uint64_t)v120, (uint64_t)v121, v123);

  v124 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v125 = objc_opt_class();
  uint64_t v126 = objc_opt_class();
  uint64_t v127 = objc_opt_class();
  uint64_t v128 = objc_opt_class();
  v132 = objc_msgSend_setWithObjects_(v124, v129, v125, v130, v131, v126, v127, v128, 0);
  v133 = NSStringFromSelector(sel_distanceSpentAtRelativeSpeeds);
  v388 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v134, (uint64_t)v132, (uint64_t)v133, v135);

  v136 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v137 = objc_opt_class();
  uint64_t v138 = objc_opt_class();
  v142 = objc_msgSend_setWithObjects_(v136, v139, v137, v140, v141, v138, 0);
  v143 = NSStringFromSelector(sel_averageSpeedInMetersPerSecond);
  v387 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v144, (uint64_t)v142, (uint64_t)v143, v145);

  uint64_t v146 = objc_opt_class();
  v147 = NSStringFromSelector(sel_score);
  v150 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v148, v146, (uint64_t)v147, v149);
  objc_msgSend_doubleValue(v150, v151, v152, v153, v154);
  double v156 = v155;

  v157 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v158 = objc_opt_class();
  uint64_t v159 = objc_opt_class();
  v163 = objc_msgSend_setWithObjects_(v157, v160, v158, v161, v162, v159, 0);
  v164 = NSStringFromSelector(sel_usageKwh);
  v386 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v165, (uint64_t)v163, (uint64_t)v164, v166);

  v167 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v168 = objc_opt_class();
  uint64_t v169 = objc_opt_class();
  v173 = objc_msgSend_setWithObjects_(v167, v170, v168, v171, v172, v169, 0);
  v174 = NSStringFromSelector(sel_optimalUsageKwh);
  v385 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v175, (uint64_t)v173, (uint64_t)v174, v176);

  uint64_t v177 = objc_opt_class();
  v178 = NSStringFromSelector(sel_numBrakingEvents);
  v181 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v179, v177, (uint64_t)v178, v180);
  unsigned int v372 = objc_msgSend_intValue(v181, v182, v183, v184, v185);

  uint64_t v186 = objc_opt_class();
  v187 = NSStringFromSelector(sel_numAccelEvents);
  v190 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v188, v186, (uint64_t)v187, v189);
  unsigned int v371 = objc_msgSend_intValue(v190, v191, v192, v193, v194);

  uint64_t v195 = objc_opt_class();
  v196 = NSStringFromSelector(sel_numHighSpeedEvents);
  v199 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v197, v195, (uint64_t)v196, v198);
  int v370 = objc_msgSend_intValue(v199, v200, v201, v202, v203);

  v204 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v205 = objc_opt_class();
  uint64_t v206 = objc_opt_class();
  uint64_t v207 = objc_opt_class();
  v211 = objc_msgSend_setWithObjects_(v204, v208, v205, v209, v210, v206, v207, 0);
  v212 = NSStringFromSelector(sel_roadDistancesInMeters);
  v384 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v213, (uint64_t)v211, (uint64_t)v212, v214);

  uint64_t v215 = objc_opt_class();
  v216 = NSStringFromSelector(sel_roadSpeedBuckets);
  v383 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v217, v215, (uint64_t)v216, v218);

  uint64_t v219 = objc_opt_class();
  v220 = NSStringFromSelector(sel_roadRelativeSpeedBuckets);
  v382 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v221, v219, (uint64_t)v220, v222);

  v223 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v224 = objc_opt_class();
  uint64_t v225 = objc_opt_class();
  uint64_t v226 = objc_opt_class();
  v230 = objc_msgSend_setWithObjects_(v223, v227, v224, v228, v229, v225, v226, 0);
  v231 = NSStringFromSelector(sel_roadTimes);
  uint64_t v381 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v232, (uint64_t)v230, (uint64_t)v231, v233);

  v234 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v235 = objc_opt_class();
  uint64_t v236 = objc_opt_class();
  uint64_t v237 = objc_opt_class();
  uint64_t v238 = objc_opt_class();
  v242 = objc_msgSend_setWithObjects_(v234, v239, v235, v240, v241, v236, v237, v238, 0);
  v243 = NSStringFromSelector(sel_distancePerRoadType);
  uint64_t v380 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v244, (uint64_t)v242, (uint64_t)v243, v245);

  v246 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v247 = objc_opt_class();
  uint64_t v248 = objc_opt_class();
  uint64_t v249 = objc_opt_class();
  uint64_t v250 = objc_opt_class();
  v254 = objc_msgSend_setWithObjects_(v246, v251, v247, v252, v253, v248, v249, v250, 0);
  v255 = NSStringFromSelector(sel_distancePerWeatherType);
  uint64_t v379 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v256, (uint64_t)v254, (uint64_t)v255, v257);

  v258 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v259 = objc_opt_class();
  uint64_t v260 = objc_opt_class();
  uint64_t v261 = objc_opt_class();
  uint64_t v262 = objc_opt_class();
  v266 = objc_msgSend_setWithObjects_(v258, v263, v259, v264, v265, v260, v261, v262, 0);
  v267 = NSStringFromSelector(sel_distancePerTerrainType);
  uint64_t v378 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v268, (uint64_t)v266, (uint64_t)v267, v269);

  v270 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v271 = objc_opt_class();
  uint64_t v272 = objc_opt_class();
  uint64_t v273 = objc_opt_class();
  uint64_t v274 = objc_opt_class();
  v278 = objc_msgSend_setWithObjects_(v270, v275, v271, v276, v277, v272, v273, v274, 0);
  v279 = NSStringFromSelector(sel_timePerRoadType);
  uint64_t v377 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v280, (uint64_t)v278, (uint64_t)v279, v281);

  v282 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v283 = objc_opt_class();
  uint64_t v284 = objc_opt_class();
  uint64_t v285 = objc_opt_class();
  uint64_t v286 = objc_opt_class();
  v290 = objc_msgSend_setWithObjects_(v282, v287, v283, v288, v289, v284, v285, v286, 0);
  v291 = NSStringFromSelector(sel_timePerWeatherType);
  uint64_t v376 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v292, (uint64_t)v290, (uint64_t)v291, v293);

  v294 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v295 = objc_opt_class();
  uint64_t v296 = objc_opt_class();
  uint64_t v297 = objc_opt_class();
  uint64_t v298 = objc_opt_class();
  v302 = objc_msgSend_setWithObjects_(v294, v299, v295, v300, v301, v296, v297, v298, 0);
  v303 = NSStringFromSelector(sel_timePerTerrainType);
  uint64_t v375 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v304, (uint64_t)v302, (uint64_t)v303, v305);

  v306 = (void *)MEMORY[0x1E4F1CAD0];
  v408[0] = objc_opt_class();
  v408[1] = objc_opt_class();
  v309 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v307, (uint64_t)v408, 2, v308);
  v313 = objc_msgSend_setWithArray_(v306, v310, (uint64_t)v309, v311, v312);
  v314 = NSStringFromSelector(sel_route);
  v317 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v315, (uint64_t)v313, (uint64_t)v314, v316);

  v318 = (void *)MEMORY[0x1E4F1CAD0];
  v407[0] = objc_opt_class();
  v407[1] = objc_opt_class();
  v321 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v319, (uint64_t)v407, 2, v320);
  v325 = objc_msgSend_setWithArray_(v318, v322, (uint64_t)v321, v323, v324);
  v326 = NSStringFromSelector(sel_lifeEventIds);
  v329 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v327, (uint64_t)v325, (uint64_t)v326, v328);

  v330 = (void *)MEMORY[0x1E4F1CAD0];
  v406[0] = objc_opt_class();
  v406[1] = objc_opt_class();
  v333 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v331, (uint64_t)v406, 2, v332);
  v337 = objc_msgSend_setWithArray_(v330, v334, (uint64_t)v333, v335, v336);
  v338 = NSStringFromSelector(sel_ktsSegmentIds);
  v341 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v339, (uint64_t)v337, (uint64_t)v338, v340);

  v374 = v3;
  if (v401)
  {
    if (v399)
    {
      v346 = (void *)v381;
      v348 = (void *)v375;
      v347 = (void *)v376;
      v350 = (void *)v378;
      v349 = (void *)v379;
      v351 = (void *)v377;
      v352 = (void *)v380;
      self = (GDKTSDataRepresentation *)objc_retain((id)objc_msgSend_initWithStartTime_endTime_distanceInMeters_elevationGainInMeters_distanceBuckets_durationInSeconds_expectedDurationInSecondsNoTraffic_distanceSpentInTrafficBuckets_timeSpentInTrafficBuckets_distanceSpentAtSpeedBuckets_timeSpentAtSpeedBuckets_distanceSpentAtRelativeSpeeds_timeSpentAtRelativeSpeeds_distancePerRoadType_timePerRoadType_distancePerWeatherType_timePerWeatherType_distancePerTerrainType_timePerTerrainType_averageSpeedInMetersPerSecond_score_usageKwh_optimalUsageKwh_numBrakingEvents_numAccelEvents_numHighSpeedEvents_roadDistancesInMeters_roadSpeedBuckets_roadRelativeSpeedBuckets_roadTimes_route_lifeEventIds_ktsSegmentIds_(self, v342, (uint64_t)v401, (uint64_t)v399, (uint64_t)v398, v397, v396, v395, v156, v394, v392, v393, v390, v391, v388, v389, v380, v377, v379,
                                                          v376,
                                                          v378,
                                                          v375,
                                                          v387,
                                                          v386,
                                                          v385,
                                                          __PAIR64__(v371, v372),
                                                          v370,
                                                          v384,
                                                          v383,
                                                          v382,
                                                          v381,
                                                          v317,
                                                          v329,
                                                          v341));
      v373 = self;
    }
    else
    {
      v362 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v402 = *MEMORY[0x1E4F28568];
      v403 = @"Required parameter endTime is nil";
      v363 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v342, (uint64_t)&v403, (uint64_t)&v402, 1);
      v365 = objc_msgSend_errorWithDomain_code_userInfo_(v362, v364, @"GDErrorDomain", 9, (uint64_t)v363);
      objc_msgSend_failWithError_(v3, v366, (uint64_t)v365, v367, v368);

      v373 = 0;
      v352 = (void *)v380;
      v346 = (void *)v381;
      v350 = (void *)v378;
      v349 = (void *)v379;
      v347 = (void *)v376;
      v351 = (void *)v377;
      v348 = (void *)v375;
    }
  }
  else
  {
    v353 = objc_msgSend_error(v3, v342, v343, v344, v345);

    if (!v353)
    {
      v355 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v404 = *MEMORY[0x1E4F28568];
      v405 = @"Required parameter startTime is nil";
      v356 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v354, (uint64_t)&v405, (uint64_t)&v404, 1);
      v358 = objc_msgSend_errorWithDomain_code_userInfo_(v355, v357, @"GDErrorDomain", 9, (uint64_t)v356);
      objc_msgSend_failWithError_(v3, v359, (uint64_t)v358, v360, v361);
    }
    v373 = 0;
    v352 = (void *)v380;
    v346 = (void *)v381;
    v350 = (void *)v378;
    v349 = (void *)v379;
    v347 = (void *)v376;
    v351 = (void *)v377;
    v348 = (void *)v375;
  }

  return v373;
}

- (void)encodeWithCoder:(id)a3
{
  startTime = self->_startTime;
  id v5 = a3;
  v6 = NSStringFromSelector(sel_startTime);
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)startTime, (uint64_t)v6, v8);

  endTime = self->_endTime;
  v10 = NSStringFromSelector(sel_endTime);
  objc_msgSend_encodeObject_forKey_(v5, v11, (uint64_t)endTime, (uint64_t)v10, v12);

  distanceInMeters = self->_distanceInMeters;
  uint64_t v14 = NSStringFromSelector(sel_distanceInMeters);
  objc_msgSend_encodeObject_forKey_(v5, v15, (uint64_t)distanceInMeters, (uint64_t)v14, v16);

  elevationGainInMeters = self->_elevationGainInMeters;
  v18 = NSStringFromSelector(sel_elevationGainInMeters);
  objc_msgSend_encodeObject_forKey_(v5, v19, (uint64_t)elevationGainInMeters, (uint64_t)v18, v20);

  distanceBuckets = self->_distanceBuckets;
  v22 = NSStringFromSelector(sel_distanceBuckets);
  objc_msgSend_encodeObject_forKey_(v5, v23, (uint64_t)distanceBuckets, (uint64_t)v22, v24);

  durationInSeconds = self->_durationInSeconds;
  uint64_t v26 = NSStringFromSelector(sel_durationInSeconds);
  objc_msgSend_encodeObject_forKey_(v5, v27, (uint64_t)durationInSeconds, (uint64_t)v26, v28);

  expectedDurationInSecondsNoTraffic = self->_expectedDurationInSecondsNoTraffic;
  v30 = NSStringFromSelector(sel_expectedDurationInSecondsNoTraffic);
  objc_msgSend_encodeObject_forKey_(v5, v31, (uint64_t)expectedDurationInSecondsNoTraffic, (uint64_t)v30, v32);

  distanceSpentInTrafficBuckets = self->_distanceSpentInTrafficBuckets;
  uint64_t v34 = NSStringFromSelector(sel_distanceSpentInTrafficBuckets);
  objc_msgSend_encodeObject_forKey_(v5, v35, (uint64_t)distanceSpentInTrafficBuckets, (uint64_t)v34, v36);

  timeSpentInTrafficBuckets = self->_timeSpentInTrafficBuckets;
  uint64_t v38 = NSStringFromSelector(sel_timeSpentInTrafficBuckets);
  objc_msgSend_encodeObject_forKey_(v5, v39, (uint64_t)timeSpentInTrafficBuckets, (uint64_t)v38, v40);

  distanceSpentAtSpeedBuckets = self->_distanceSpentAtSpeedBuckets;
  v42 = NSStringFromSelector(sel_distanceSpentAtSpeedBuckets);
  objc_msgSend_encodeObject_forKey_(v5, v43, (uint64_t)distanceSpentAtSpeedBuckets, (uint64_t)v42, v44);

  timeSpentAtSpeedBuckets = self->_timeSpentAtSpeedBuckets;
  uint64_t v46 = NSStringFromSelector(sel_timeSpentAtSpeedBuckets);
  objc_msgSend_encodeObject_forKey_(v5, v47, (uint64_t)timeSpentAtSpeedBuckets, (uint64_t)v46, v48);

  distanceSpentAtRelativeSpeeds = self->_distanceSpentAtRelativeSpeeds;
  v50 = NSStringFromSelector(sel_distanceSpentAtRelativeSpeeds);
  objc_msgSend_encodeObject_forKey_(v5, v51, (uint64_t)distanceSpentAtRelativeSpeeds, (uint64_t)v50, v52);

  timeSpentAtRelativeSpeeds = self->_timeSpentAtRelativeSpeeds;
  v54 = NSStringFromSelector(sel_timeSpentAtRelativeSpeeds);
  objc_msgSend_encodeObject_forKey_(v5, v55, (uint64_t)timeSpentAtRelativeSpeeds, (uint64_t)v54, v56);

  averageSpeedInMetersPerSecond = self->_averageSpeedInMetersPerSecond;
  uint64_t v58 = NSStringFromSelector(sel_averageSpeedInMetersPerSecond);
  objc_msgSend_encodeObject_forKey_(v5, v59, (uint64_t)averageSpeedInMetersPerSecond, (uint64_t)v58, v60);

  uint64_t v65 = objc_msgSend_numberWithDouble_(NSNumber, v61, v62, v63, v64, self->_score);
  uint64_t v66 = NSStringFromSelector(sel_score);
  objc_msgSend_encodeObject_forKey_(v5, v67, (uint64_t)v65, (uint64_t)v66, v68);

  usageKwh = self->_usageKwh;
  uint64_t v70 = NSStringFromSelector(sel_usageKwh);
  objc_msgSend_encodeObject_forKey_(v5, v71, (uint64_t)usageKwh, (uint64_t)v70, v72);

  optimalUsageKwh = self->_optimalUsageKwh;
  v74 = NSStringFromSelector(sel_optimalUsageKwh);
  objc_msgSend_encodeObject_forKey_(v5, v75, (uint64_t)optimalUsageKwh, (uint64_t)v74, v76);

  v81 = objc_msgSend_numberWithDouble_(NSNumber, v77, v78, v79, v80, (double)self->_numBrakingEvents);
  uint64_t v82 = NSStringFromSelector(sel_numBrakingEvents);
  objc_msgSend_encodeObject_forKey_(v5, v83, (uint64_t)v81, (uint64_t)v82, v84);

  uint64_t v89 = objc_msgSend_numberWithDouble_(NSNumber, v85, v86, v87, v88, (double)self->_numAccelEvents);
  uint64_t v90 = NSStringFromSelector(sel_numAccelEvents);
  objc_msgSend_encodeObject_forKey_(v5, v91, (uint64_t)v89, (uint64_t)v90, v92);

  v97 = objc_msgSend_numberWithDouble_(NSNumber, v93, v94, v95, v96, (double)self->_numHighSpeedEvents);
  v98 = NSStringFromSelector(sel_numHighSpeedEvents);
  objc_msgSend_encodeObject_forKey_(v5, v99, (uint64_t)v97, (uint64_t)v98, v100);

  roadDistancesInMeters = self->_roadDistancesInMeters;
  uint64_t v102 = NSStringFromSelector(sel_roadDistancesInMeters);
  objc_msgSend_encodeObject_forKey_(v5, v103, (uint64_t)roadDistancesInMeters, (uint64_t)v102, v104);

  roadSpeedBuckets = self->_roadSpeedBuckets;
  uint64_t v106 = NSStringFromSelector(sel_roadSpeedBuckets);
  objc_msgSend_encodeObject_forKey_(v5, v107, (uint64_t)roadSpeedBuckets, (uint64_t)v106, v108);

  roadRelativeSpeedBuckets = self->_roadRelativeSpeedBuckets;
  v110 = NSStringFromSelector(sel_roadRelativeSpeedBuckets);
  objc_msgSend_encodeObject_forKey_(v5, v111, (uint64_t)roadRelativeSpeedBuckets, (uint64_t)v110, v112);

  roadTimes = self->_roadTimes;
  uint64_t v114 = NSStringFromSelector(sel_roadTimes);
  objc_msgSend_encodeObject_forKey_(v5, v115, (uint64_t)roadTimes, (uint64_t)v114, v116);

  distancePerRoadType = self->_distancePerRoadType;
  uint64_t v118 = NSStringFromSelector(sel_distancePerRoadType);
  objc_msgSend_encodeObject_forKey_(v5, v119, (uint64_t)distancePerRoadType, (uint64_t)v118, v120);

  distancePerWeatherType = self->_distancePerWeatherType;
  v122 = NSStringFromSelector(sel_distancePerWeatherType);
  objc_msgSend_encodeObject_forKey_(v5, v123, (uint64_t)distancePerWeatherType, (uint64_t)v122, v124);

  distancePerTerrainType = self->_distancePerTerrainType;
  uint64_t v126 = NSStringFromSelector(sel_distancePerTerrainType);
  objc_msgSend_encodeObject_forKey_(v5, v127, (uint64_t)distancePerTerrainType, (uint64_t)v126, v128);

  timePerRoadType = self->_timePerRoadType;
  uint64_t v130 = NSStringFromSelector(sel_timePerRoadType);
  objc_msgSend_encodeObject_forKey_(v5, v131, (uint64_t)timePerRoadType, (uint64_t)v130, v132);

  timePerWeatherType = self->_timePerWeatherType;
  v134 = NSStringFromSelector(sel_timePerWeatherType);
  objc_msgSend_encodeObject_forKey_(v5, v135, (uint64_t)timePerWeatherType, (uint64_t)v134, v136);

  timePerTerrainType = self->_timePerTerrainType;
  uint64_t v138 = NSStringFromSelector(sel_timePerTerrainType);
  objc_msgSend_encodeObject_forKey_(v5, v139, (uint64_t)timePerTerrainType, (uint64_t)v138, v140);

  route = self->_route;
  v142 = NSStringFromSelector(sel_route);
  objc_msgSend_encodeObject_forKey_(v5, v143, (uint64_t)route, (uint64_t)v142, v144);

  lifeEventIds = self->_lifeEventIds;
  uint64_t v146 = NSStringFromSelector(sel_lifeEventIds);
  objc_msgSend_encodeObject_forKey_(v5, v147, (uint64_t)lifeEventIds, (uint64_t)v146, v148);

  ktsSegmentIds = self->_ktsSegmentIds;
  NSStringFromSelector(sel_ktsSegmentIds);
  id v152 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v150, (uint64_t)ktsSegmentIds, (uint64_t)v152, v151);
}

- (GDKTSDataRepresentation)initWithStartTime:(id)a3 endTime:(id)a4 distanceInMeters:(id)a5 elevationGainInMeters:(id)a6 distanceBuckets:(id)a7 durationInSeconds:(id)a8 expectedDurationInSecondsNoTraffic:(id)a9 distanceSpentInTrafficBuckets:(id)a10 timeSpentInTrafficBuckets:(id)a11 distanceSpentAtSpeedBuckets:(id)a12 timeSpentAtSpeedBuckets:(id)a13 distanceSpentAtRelativeSpeeds:(id)a14 timeSpentAtRelativeSpeeds:(id)a15 distancePerRoadType:(id)a16 timePerRoadType:(id)a17 distancePerWeatherType:(id)a18 timePerWeatherType:(id)a19 distancePerTerrainType:(id)a20 timePerTerrainType:(id)a21 averageSpeedInMetersPerSecond:(id)a22 score:(double)a23 usageKwh:(id)a24 optimalUsageKwh:(id)a25 numBrakingEvents:(int)a26 numAccelEvents:(int)a27 numHighSpeedEvents:(int)a28 roadDistancesInMeters:(id)a29 roadSpeedBuckets:(id)a30 roadRelativeSpeedBuckets:(id)a31 roadTimes:(id)a32 route:(id)a33 lifeEventIds:(id)a34 ktsSegmentIds:(id)a35
{
  id v214 = a3;
  id v215 = a4;
  id obj = a5;
  id v208 = a5;
  id v203 = a6;
  id v207 = a6;
  id v224 = a7;
  id v223 = a8;
  id v222 = a9;
  id v221 = a10;
  id v220 = a11;
  id v219 = a12;
  id v218 = a13;
  id v217 = a14;
  id v216 = a15;
  id v41 = a16;
  id v42 = a17;
  id v43 = a18;
  id v44 = a19;
  id v45 = a20;
  id v46 = a21;
  id v213 = a22;
  id v206 = a24;
  id v205 = a25;
  id v212 = a29;
  id v211 = a30;
  id v210 = a31;
  id v209 = a32;
  id v47 = a33;
  id v48 = a34;
  id v49 = a35;
  v225.receiver = self;
  v225.super_class = (Class)GDKTSDataRepresentation;
  v54 = [(GDKTSDataRepresentation *)&v225 init];
  if (v54)
  {
    uint64_t v55 = objc_msgSend_copy(v214, v50, v51, v52, v53);
    startTime = v54->_startTime;
    v54->_startTime = (NSDate *)v55;

    uint64_t v61 = objc_msgSend_copy(v215, v57, v58, v59, v60);
    endTime = v54->_endTime;
    v54->_endTime = (NSDate *)v61;

    objc_storeStrong((id *)&v54->_distanceInMeters, obj);
    objc_storeStrong((id *)&v54->_elevationGainInMeters, v203);
    uint64_t v67 = objc_msgSend_copy(v224, v63, v64, v65, v66);
    distanceBuckets = v54->_distanceBuckets;
    v54->_distanceBuckets = (NSArray *)v67;

    uint64_t v73 = objc_msgSend_copy(v223, v69, v70, v71, v72);
    durationInSeconds = v54->_durationInSeconds;
    v54->_durationInSeconds = (NSMeasurement *)v73;

    uint64_t v79 = objc_msgSend_copy(v222, v75, v76, v77, v78);
    expectedDurationInSecondsNoTraffic = v54->_expectedDurationInSecondsNoTraffic;
    v54->_expectedDurationInSecondsNoTraffic = (NSMeasurement *)v79;

    uint64_t v85 = objc_msgSend_copy(v221, v81, v82, v83, v84);
    distanceSpentInTrafficBuckets = v54->_distanceSpentInTrafficBuckets;
    v54->_distanceSpentInTrafficBuckets = (NSArray *)v85;

    uint64_t v91 = objc_msgSend_copy(v220, v87, v88, v89, v90);
    timeSpentInTrafficBuckets = v54->_timeSpentInTrafficBuckets;
    v54->_timeSpentInTrafficBuckets = (NSArray *)v91;

    uint64_t v97 = objc_msgSend_copy(v219, v93, v94, v95, v96);
    distanceSpentAtSpeedBuckets = v54->_distanceSpentAtSpeedBuckets;
    v54->_distanceSpentAtSpeedBuckets = (NSArray *)v97;

    uint64_t v103 = objc_msgSend_copy(v218, v99, v100, v101, v102);
    timeSpentAtSpeedBuckets = v54->_timeSpentAtSpeedBuckets;
    v54->_timeSpentAtSpeedBuckets = (NSArray *)v103;

    uint64_t v109 = objc_msgSend_copy(v217, v105, v106, v107, v108);
    distanceSpentAtRelativeSpeeds = v54->_distanceSpentAtRelativeSpeeds;
    v54->_distanceSpentAtRelativeSpeeds = (NSArray *)v109;

    uint64_t v115 = objc_msgSend_copy(v216, v111, v112, v113, v114);
    timeSpentAtRelativeSpeeds = v54->_timeSpentAtRelativeSpeeds;
    v54->_timeSpentAtRelativeSpeeds = (NSArray *)v115;

    uint64_t v121 = objc_msgSend_copy(v213, v117, v118, v119, v120);
    averageSpeedInMetersPerSecond = v54->_averageSpeedInMetersPerSecond;
    v54->_averageSpeedInMetersPerSecond = (NSMeasurement *)v121;

    v54->_score = a23;
    objc_storeStrong((id *)&v54->_usageKwh, a24);
    objc_storeStrong((id *)&v54->_optimalUsageKwh, a25);
    v54->_numBrakingEvents = a26;
    v54->_numAccelEvents = a27;
    v54->_numHighSpeedEvents = a28;
    uint64_t v127 = objc_msgSend_copy(v212, v123, v124, v125, v126);
    roadDistancesInMeters = v54->_roadDistancesInMeters;
    v54->_roadDistancesInMeters = (NSDictionary *)v127;

    uint64_t v133 = objc_msgSend_copy(v211, v129, v130, v131, v132);
    roadSpeedBuckets = v54->_roadSpeedBuckets;
    v54->_roadSpeedBuckets = (NSDictionary *)v133;

    uint64_t v139 = objc_msgSend_copy(v210, v135, v136, v137, v138);
    roadRelativeSpeedBuckets = v54->_roadRelativeSpeedBuckets;
    v54->_roadRelativeSpeedBuckets = (NSDictionary *)v139;

    uint64_t v145 = objc_msgSend_copy(v209, v141, v142, v143, v144);
    roadTimes = v54->_roadTimes;
    v54->_roadTimes = (NSDictionary *)v145;

    uint64_t v151 = objc_msgSend_copy(v41, v147, v148, v149, v150);
    distancePerRoadType = v54->_distancePerRoadType;
    v54->_distancePerRoadType = (NSArray *)v151;

    uint64_t v157 = objc_msgSend_copy(v42, v153, v154, v155, v156);
    timePerRoadType = v54->_timePerRoadType;
    v54->_timePerRoadType = (NSArray *)v157;

    uint64_t v163 = objc_msgSend_copy(v43, v159, v160, v161, v162);
    distancePerWeatherType = v54->_distancePerWeatherType;
    v54->_distancePerWeatherType = (NSArray *)v163;

    uint64_t v169 = objc_msgSend_copy(v44, v165, v166, v167, v168);
    timePerWeatherType = v54->_timePerWeatherType;
    v54->_timePerWeatherType = (NSArray *)v169;

    uint64_t v175 = objc_msgSend_copy(v45, v171, v172, v173, v174);
    distancePerTerrainType = v54->_distancePerTerrainType;
    v54->_distancePerTerrainType = (NSArray *)v175;

    uint64_t v181 = objc_msgSend_copy(v46, v177, v178, v179, v180);
    timePerTerrainType = v54->_timePerTerrainType;
    v54->_timePerTerrainType = (NSArray *)v181;

    uint64_t v187 = objc_msgSend_copy(v47, v183, v184, v185, v186);
    route = v54->_route;
    v54->_route = (NSArray *)v187;

    uint64_t v193 = objc_msgSend_copy(v48, v189, v190, v191, v192);
    lifeEventIds = v54->_lifeEventIds;
    v54->_lifeEventIds = (NSArray *)v193;

    uint64_t v199 = objc_msgSend_copy(v49, v195, v196, v197, v198);
    ktsSegmentIds = v54->_ktsSegmentIds;
    v54->_ktsSegmentIds = (NSArray *)v199;
  }
  return v54;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end