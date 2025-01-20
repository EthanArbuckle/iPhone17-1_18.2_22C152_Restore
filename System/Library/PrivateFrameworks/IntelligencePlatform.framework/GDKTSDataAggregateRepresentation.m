@interface GDKTSDataAggregateRepresentation
+ (BOOL)supportsSecureCoding;
- (GDKTSDataAggregateRepresentation)initWithCoder:(id)a3;
- (GDKTSDataAggregateRepresentation)initWithStartTime:(id)a3 endTime:(id)a4 distanceInMeters:(id)a5 elevationGainInMeters:(id)a6 distanceBuckets:(id)a7 durationInSeconds:(id)a8 expectedDurationInSecondsNoTraffic:(id)a9 distanceSpentInTrafficBuckets:(id)a10 timeSpentInTrafficBuckets:(id)a11 distanceSpentAtSpeedBuckets:(id)a12 timeSpentAtSpeedBuckets:(id)a13 distanceSpentAtRelativeSpeeds:(id)a14 timeSpentAtRelativeSpeeds:(id)a15 distancePerRoadType:(id)a16 timePerRoadType:(id)a17 distancePerWeatherType:(id)a18 timePerWeatherType:(id)a19 distancePerTerrainType:(id)a20 timePerTerrainType:(id)a21 averageSpeedInMetersPerSecond:(id)a22 score:(double)a23 usageKwh:(id)a24 optimalUsageKwh:(id)a25 numBrakingEvents:(int)a26 numAccelEvents:(int)a27 numHighSpeedEvents:(int)a28 roadDistancesInMeters:(id)a29 roadSpeedBuckets:(id)a30 roadRelativeSpeedBuckets:(id)a31 roadTimes:(id)a32 route:(id)a33 lifeEventIds:(id)a34 ktsSegmentIds:(id)a35 maxTripDistanceInMeters:(id)a36 avgTripDistanceInMeters:(id)a37 maxElevationGainInMeters:(id)a38 avgElevationGainInMeters:(id)a39 percentTimeSpentAtSpeedBuckets:(id)a40 percentTimeSpentAtTrafficBuckets:(id)a41 percentTimeSpentAtRelativeSpeeds:(id)a42 percentTimeSpentAtRoadTypes:(id)a43 percentTimeSpentInWeatherTypes:(id)a44 percentTimeSpentInTerrainTypes:(id)a45 percentDistanceTraveledAtSpeedBuckets:(id)a46 percentDistanceTraveledAtTrafficBuckets:(id)a47 percentDistanceTraveledAtRelativeSpeeds:(id)a48 percentDistanceTraveledForRoadTypes:(id)a49 percentDistanceTraveledInWeatherTypes:(id)a50 percentDistanceTraveledInTerrainTypes:(id)a51 scorePerSpeedBucket:(id)a52 scorePerTrafficBucket:(id)a53 scorePerRelativeSpeed:(id)a54 scorePerRoadType:(id)a55 scorePerWeatherType:(id)a56 scorePerTerrainType:(id)a57 avgNumBrakingEvents:(double)a58 avgNumAccelEvents:(double)a59 avgNumHighSpeedEvents:(double)a60 mostEfficientDriveScore:(double)a61 routeHeatMap:(id)a62;
- (NSArray)percentDistanceTraveledAtRelativeSpeeds;
- (NSArray)percentDistanceTraveledAtSpeedBuckets;
- (NSArray)percentDistanceTraveledAtTrafficBuckets;
- (NSArray)percentDistanceTraveledForRoadTypes;
- (NSArray)percentDistanceTraveledInTerrainTypes;
- (NSArray)percentDistanceTraveledInWeatherTypes;
- (NSArray)percentTimeSpentAtRelativeSpeeds;
- (NSArray)percentTimeSpentAtRoadTypes;
- (NSArray)percentTimeSpentAtSpeedBuckets;
- (NSArray)percentTimeSpentAtTrafficBuckets;
- (NSArray)percentTimeSpentInTerrainTypes;
- (NSArray)percentTimeSpentInWeatherTypes;
- (NSArray)scorePerRelativeSpeed;
- (NSArray)scorePerRoadType;
- (NSArray)scorePerSpeedBucket;
- (NSArray)scorePerTerrainType;
- (NSArray)scorePerTrafficBucket;
- (NSArray)scorePerWeatherType;
- (NSDictionary)routeHeatMap;
- (NSMeasurement)avgElevationGainInMeters;
- (NSMeasurement)avgTripDistanceInMeters;
- (NSMeasurement)maxElevationGainInMeters;
- (NSMeasurement)maxTripDistanceInMeters;
- (double)avgNumAccelEvents;
- (double)avgNumBrakingEvents;
- (double)avgNumHighSpeedEvents;
- (double)mostEfficientDriveScore;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)numTrips;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GDKTSDataAggregateRepresentation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeHeatMap, 0);
  objc_storeStrong((id *)&self->_scorePerTerrainType, 0);
  objc_storeStrong((id *)&self->_scorePerWeatherType, 0);
  objc_storeStrong((id *)&self->_scorePerRoadType, 0);
  objc_storeStrong((id *)&self->_scorePerRelativeSpeed, 0);
  objc_storeStrong((id *)&self->_scorePerTrafficBucket, 0);
  objc_storeStrong((id *)&self->_scorePerSpeedBucket, 0);
  objc_storeStrong((id *)&self->_percentDistanceTraveledInTerrainTypes, 0);
  objc_storeStrong((id *)&self->_percentDistanceTraveledInWeatherTypes, 0);
  objc_storeStrong((id *)&self->_percentDistanceTraveledForRoadTypes, 0);
  objc_storeStrong((id *)&self->_percentDistanceTraveledAtRelativeSpeeds, 0);
  objc_storeStrong((id *)&self->_percentDistanceTraveledAtTrafficBuckets, 0);
  objc_storeStrong((id *)&self->_percentDistanceTraveledAtSpeedBuckets, 0);
  objc_storeStrong((id *)&self->_percentTimeSpentInTerrainTypes, 0);
  objc_storeStrong((id *)&self->_percentTimeSpentInWeatherTypes, 0);
  objc_storeStrong((id *)&self->_percentTimeSpentAtRoadTypes, 0);
  objc_storeStrong((id *)&self->_percentTimeSpentAtRelativeSpeeds, 0);
  objc_storeStrong((id *)&self->_percentTimeSpentAtTrafficBuckets, 0);
  objc_storeStrong((id *)&self->_percentTimeSpentAtSpeedBuckets, 0);
  objc_storeStrong((id *)&self->_avgElevationGainInMeters, 0);
  objc_storeStrong((id *)&self->_maxElevationGainInMeters, 0);
  objc_storeStrong((id *)&self->_avgTripDistanceInMeters, 0);

  objc_storeStrong((id *)&self->_maxTripDistanceInMeters, 0);
}

- (NSDictionary)routeHeatMap
{
  return self->_routeHeatMap;
}

- (double)mostEfficientDriveScore
{
  return self->_mostEfficientDriveScore;
}

- (double)avgNumHighSpeedEvents
{
  return self->_avgNumHighSpeedEvents;
}

- (double)avgNumAccelEvents
{
  return self->_avgNumAccelEvents;
}

- (double)avgNumBrakingEvents
{
  return self->_avgNumBrakingEvents;
}

- (NSArray)scorePerTerrainType
{
  return self->_scorePerTerrainType;
}

- (NSArray)scorePerWeatherType
{
  return self->_scorePerWeatherType;
}

- (NSArray)scorePerRoadType
{
  return self->_scorePerRoadType;
}

- (NSArray)scorePerRelativeSpeed
{
  return self->_scorePerRelativeSpeed;
}

- (NSArray)scorePerTrafficBucket
{
  return self->_scorePerTrafficBucket;
}

- (NSArray)scorePerSpeedBucket
{
  return self->_scorePerSpeedBucket;
}

- (NSArray)percentDistanceTraveledInTerrainTypes
{
  return self->_percentDistanceTraveledInTerrainTypes;
}

- (NSArray)percentDistanceTraveledInWeatherTypes
{
  return self->_percentDistanceTraveledInWeatherTypes;
}

- (NSArray)percentDistanceTraveledForRoadTypes
{
  return self->_percentDistanceTraveledForRoadTypes;
}

- (NSArray)percentDistanceTraveledAtRelativeSpeeds
{
  return self->_percentDistanceTraveledAtRelativeSpeeds;
}

- (NSArray)percentDistanceTraveledAtTrafficBuckets
{
  return self->_percentDistanceTraveledAtTrafficBuckets;
}

- (NSArray)percentDistanceTraveledAtSpeedBuckets
{
  return self->_percentDistanceTraveledAtSpeedBuckets;
}

- (NSArray)percentTimeSpentInTerrainTypes
{
  return self->_percentTimeSpentInTerrainTypes;
}

- (NSArray)percentTimeSpentInWeatherTypes
{
  return self->_percentTimeSpentInWeatherTypes;
}

- (NSArray)percentTimeSpentAtRoadTypes
{
  return self->_percentTimeSpentAtRoadTypes;
}

- (NSArray)percentTimeSpentAtRelativeSpeeds
{
  return self->_percentTimeSpentAtRelativeSpeeds;
}

- (NSArray)percentTimeSpentAtTrafficBuckets
{
  return self->_percentTimeSpentAtTrafficBuckets;
}

- (NSArray)percentTimeSpentAtSpeedBuckets
{
  return self->_percentTimeSpentAtSpeedBuckets;
}

- (NSMeasurement)avgElevationGainInMeters
{
  return self->_avgElevationGainInMeters;
}

- (NSMeasurement)maxElevationGainInMeters
{
  return self->_maxElevationGainInMeters;
}

- (NSMeasurement)avgTripDistanceInMeters
{
  return self->_avgTripDistanceInMeters;
}

- (NSMeasurement)maxTripDistanceInMeters
{
  return self->_maxTripDistanceInMeters;
}

- (int)numTrips
{
  return self->_numTrips;
}

- (id)description
{
  v15.receiver = self;
  v15.super_class = (Class)GDKTSDataAggregateRepresentation;
  v3 = [(GDKTSDataRepresentation *)&v15 description];
  uint64_t v8 = objc_msgSend_length(v3, v4, v5, v6, v7);
  v12 = objc_msgSend_substringToIndex_(v3, v9, v8 - 2, v10, v11);
  objc_msgSend_stringByAppendingFormat_(v12, (const char *)self->_percentDistanceTraveledAtSpeedBuckets, @", \nnumTrips: %d, \nmaxDistance: %@, \navgDistance: %@, \nmaxElevationGain: %@, \navgElevationGain: %@, \npercentTimeAtSpeedBuckets: %@, \npercentTimeAtTrafficBuckets: %@, \npercentTimeAtRelativeSpeeds: %@, \npercentTimeSpentAtRoadTypes: %@, \npercentTimeSpentInWeatherTypes: %@, \npercentTimeSpentInTerrainTypes: %@, \npercentDistanceTraveledAtSpeedBuckets: %@, \npercentDistanceTraveledAtTrafficBuckets: %@, \npercentDistanceTraveledAtRelativeSpeeds: %@, \npercentDistanceTraveledForRoadTypes: %@, \npercentDistanceTraveledInWeatherTypes: %@, \npercentDistanceTraveledInTerrainTypes: %@, \nscorePerSpeedBucket: %@, \nscorePerTrafficBucket: %@, \nscorePerRelativeSpeed: %@, \nscorePerRoadType: %@, \nscorePerWeatherType: %@, \nscorePerTerrainType: %@, \navgNumBrakingEvents: %lf, \navgNumHighSpeedEvents: %lf, \navgNumAccelEvents: %lf, \nmostEfficientDriveScore: %lf>", (uint64_t)self->_percentDistanceTraveledAtRelativeSpeeds, (uint64_t)self->_percentDistanceTraveledForRoadTypes, self->_numTrips, self->_maxTripDistanceInMeters, self->_avgTripDistanceInMeters, self->_maxElevationGainInMeters, self->_avgElevationGainInMeters, self->_percentTimeSpentAtSpeedBuckets, self->_percentTimeSpentAtTrafficBuckets, self->_percentTimeSpentAtRelativeSpeeds, self->_percentTimeSpentAtRoadTypes, self->_percentTimeSpentInWeatherTypes, self->_percentTimeSpentInTerrainTypes, self->_percentDistanceTraveledAtSpeedBuckets, self->_percentDistanceTraveledAtTrafficBuckets, self->_percentDistanceTraveledAtRelativeSpeeds,
    self->_percentDistanceTraveledForRoadTypes,
    self->_percentDistanceTraveledInWeatherTypes,
    self->_percentDistanceTraveledInTerrainTypes,
    self->_scorePerSpeedBucket,
    self->_scorePerTrafficBucket,
    self->_scorePerRelativeSpeed,
    self->_scorePerRoadType,
    self->_scorePerWeatherType,
    self->_scorePerTerrainType,
    *(void *)&self->_avgNumBrakingEvents,
    *(void *)&self->_avgNumAccelEvents,
    *(void *)&self->_avgNumHighSpeedEvents,
  v13 = *(void *)&self->_mostEfficientDriveScore);

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v137.receiver = self;
  v137.super_class = (Class)GDKTSDataAggregateRepresentation;
  uint64_t v5 = -[GDKTSDataRepresentation copyWithZone:](&v137, sel_copyWithZone_);
  uint64_t v9 = objc_msgSend_copyWithZone_(self->_maxTripDistanceInMeters, v6, (uint64_t)a3, v7, v8);
  uint64_t v10 = (void *)v5[34];
  v5[34] = v9;

  uint64_t v14 = objc_msgSend_copyWithZone_(self->_avgTripDistanceInMeters, v11, (uint64_t)a3, v12, v13);
  objc_super v15 = (void *)v5[35];
  v5[35] = v14;

  uint64_t v19 = objc_msgSend_copyWithZone_(self->_maxElevationGainInMeters, v16, (uint64_t)a3, v17, v18);
  v20 = (void *)v5[36];
  v5[36] = v19;

  uint64_t v24 = objc_msgSend_copyWithZone_(self->_avgElevationGainInMeters, v21, (uint64_t)a3, v22, v23);
  v25 = (void *)v5[37];
  v5[37] = v24;

  uint64_t v29 = objc_msgSend_copyWithZone_(self->_percentTimeSpentAtSpeedBuckets, v26, (uint64_t)a3, v27, v28);
  v30 = (void *)v5[38];
  v5[38] = v29;

  uint64_t v34 = objc_msgSend_copyWithZone_(self->_percentTimeSpentAtTrafficBuckets, v31, (uint64_t)a3, v32, v33);
  v35 = (void *)v5[39];
  v5[39] = v34;

  uint64_t v39 = objc_msgSend_copyWithZone_(self->_percentTimeSpentAtRelativeSpeeds, v36, (uint64_t)a3, v37, v38);
  v40 = (void *)v5[40];
  v5[40] = v39;

  uint64_t v44 = objc_msgSend_copyWithZone_(self->_percentTimeSpentAtSpeedBuckets, v41, (uint64_t)a3, v42, v43);
  v45 = (void *)v5[38];
  v5[38] = v44;

  uint64_t v49 = objc_msgSend_copyWithZone_(self->_percentTimeSpentAtTrafficBuckets, v46, (uint64_t)a3, v47, v48);
  v50 = (void *)v5[39];
  v5[39] = v49;

  uint64_t v54 = objc_msgSend_copyWithZone_(self->_percentTimeSpentAtRelativeSpeeds, v51, (uint64_t)a3, v52, v53);
  v55 = (void *)v5[40];
  v5[40] = v54;

  uint64_t v59 = objc_msgSend_copyWithZone_(self->_percentTimeSpentAtRoadTypes, v56, (uint64_t)a3, v57, v58);
  v60 = (void *)v5[41];
  v5[41] = v59;

  uint64_t v64 = objc_msgSend_copyWithZone_(self->_percentTimeSpentInWeatherTypes, v61, (uint64_t)a3, v62, v63);
  v65 = (void *)v5[42];
  v5[42] = v64;

  uint64_t v69 = objc_msgSend_copyWithZone_(self->_percentTimeSpentInTerrainTypes, v66, (uint64_t)a3, v67, v68);
  v70 = (void *)v5[43];
  v5[43] = v69;

  uint64_t v74 = objc_msgSend_copyWithZone_(self->_percentDistanceTraveledAtSpeedBuckets, v71, (uint64_t)a3, v72, v73);
  v75 = (void *)v5[44];
  v5[44] = v74;

  uint64_t v79 = objc_msgSend_copyWithZone_(self->_percentDistanceTraveledAtTrafficBuckets, v76, (uint64_t)a3, v77, v78);
  v80 = (void *)v5[45];
  v5[45] = v79;

  uint64_t v84 = objc_msgSend_copyWithZone_(self->_percentDistanceTraveledAtRelativeSpeeds, v81, (uint64_t)a3, v82, v83);
  v85 = (void *)v5[46];
  v5[46] = v84;

  uint64_t v89 = objc_msgSend_copyWithZone_(self->_percentDistanceTraveledForRoadTypes, v86, (uint64_t)a3, v87, v88);
  v90 = (void *)v5[47];
  v5[47] = v89;

  uint64_t v94 = objc_msgSend_copyWithZone_(self->_percentDistanceTraveledInWeatherTypes, v91, (uint64_t)a3, v92, v93);
  v95 = (void *)v5[48];
  v5[48] = v94;

  uint64_t v99 = objc_msgSend_copyWithZone_(self->_percentDistanceTraveledInTerrainTypes, v96, (uint64_t)a3, v97, v98);
  v100 = (void *)v5[49];
  v5[49] = v99;

  uint64_t v104 = objc_msgSend_copyWithZone_(self->_scorePerSpeedBucket, v101, (uint64_t)a3, v102, v103);
  v105 = (void *)v5[50];
  v5[50] = v104;

  uint64_t v109 = objc_msgSend_copyWithZone_(self->_scorePerTrafficBucket, v106, (uint64_t)a3, v107, v108);
  v110 = (void *)v5[51];
  v5[51] = v109;

  uint64_t v114 = objc_msgSend_copyWithZone_(self->_scorePerRelativeSpeed, v111, (uint64_t)a3, v112, v113);
  v115 = (void *)v5[52];
  v5[52] = v114;

  uint64_t v119 = objc_msgSend_copyWithZone_(self->_scorePerRoadType, v116, (uint64_t)a3, v117, v118);
  v120 = (void *)v5[53];
  v5[53] = v119;

  uint64_t v124 = objc_msgSend_copyWithZone_(self->_scorePerWeatherType, v121, (uint64_t)a3, v122, v123);
  v125 = (void *)v5[54];
  v5[54] = v124;

  uint64_t v129 = objc_msgSend_copyWithZone_(self->_scorePerTerrainType, v126, (uint64_t)a3, v127, v128);
  v130 = (void *)v5[55];
  v5[55] = v129;

  v5[56] = *(void *)&self->_avgNumBrakingEvents;
  v5[57] = *(void *)&self->_avgNumAccelEvents;
  v5[58] = *(void *)&self->_avgNumHighSpeedEvents;
  v5[59] = *(void *)&self->_mostEfficientDriveScore;
  uint64_t v134 = objc_msgSend_copyWithZone_(self->_routeHeatMap, v131, (uint64_t)a3, v132, v133);
  v135 = (void *)v5[60];
  v5[60] = v134;

  return v5;
}

- (GDKTSDataAggregateRepresentation)initWithCoder:(id)a3
{
  v146[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v145.receiver = self;
  v145.super_class = (Class)GDKTSDataAggregateRepresentation;
  uint64_t v5 = [(GDKTSDataRepresentation *)&v145 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = NSStringFromSelector(sel_numTrips);
    uint64_t v10 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v6, (uint64_t)v7, v9);
    v5->_numTrips = objc_msgSend_intValue(v10, v11, v12, v13, v14);

    objc_super v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    v21 = objc_msgSend_setWithObjects_(v15, v18, v16, v19, v20, v17, 0);
    uint64_t v22 = NSStringFromSelector(sel_maxTripDistanceInMeters);
    uint64_t v25 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v23, (uint64_t)v21, (uint64_t)v22, v24);
    maxTripDistanceInMeters = v5->_maxTripDistanceInMeters;
    v5->_maxTripDistanceInMeters = (NSMeasurement *)v25;

    uint64_t v27 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v28 = objc_opt_class();
    uint64_t v29 = objc_opt_class();
    uint64_t v33 = objc_msgSend_setWithObjects_(v27, v30, v28, v31, v32, v29, 0);
    uint64_t v34 = NSStringFromSelector(sel_avgTripDistanceInMeters);
    uint64_t v37 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v35, (uint64_t)v33, (uint64_t)v34, v36);
    avgTripDistanceInMeters = v5->_avgTripDistanceInMeters;
    v5->_avgTripDistanceInMeters = (NSMeasurement *)v37;

    uint64_t v39 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v40 = objc_opt_class();
    uint64_t v41 = objc_opt_class();
    v45 = objc_msgSend_setWithObjects_(v39, v42, v40, v43, v44, v41, 0);
    v46 = NSStringFromSelector(sel_maxElevationGainInMeters);
    uint64_t v49 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v47, (uint64_t)v45, (uint64_t)v46, v48);
    maxElevationGainInMeters = v5->_maxElevationGainInMeters;
    v5->_maxElevationGainInMeters = (NSMeasurement *)v49;

    v51 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v52 = objc_opt_class();
    uint64_t v53 = objc_opt_class();
    uint64_t v57 = objc_msgSend_setWithObjects_(v51, v54, v52, v55, v56, v53, 0);
    uint64_t v58 = NSStringFromSelector(sel_avgElevationGainInMeters);
    uint64_t v61 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v59, (uint64_t)v57, (uint64_t)v58, v60);
    avgElevationGainInMeters = v5->_avgElevationGainInMeters;
    v5->_avgElevationGainInMeters = (NSMeasurement *)v61;

    uint64_t v63 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v64 = objc_opt_class();
    uint64_t v65 = objc_opt_class();
    uint64_t v66 = objc_opt_class();
    uint64_t v67 = objc_opt_class();
    v71 = objc_msgSend_setWithObjects_(v63, v68, v64, v69, v70, v65, v66, v67, 0);
    uint64_t v72 = NSStringFromSelector(sel_percentTimeSpentAtSpeedBuckets);
    uint64_t v75 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v73, (uint64_t)v71, (uint64_t)v72, v74);
    percentTimeSpentAtSpeedBuckets = v5->_percentTimeSpentAtSpeedBuckets;
    v5->_percentTimeSpentAtSpeedBuckets = (NSArray *)v75;

    uint64_t v77 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v78 = objc_opt_class();
    uint64_t v79 = objc_opt_class();
    uint64_t v80 = objc_opt_class();
    uint64_t v81 = objc_opt_class();
    v85 = objc_msgSend_setWithObjects_(v77, v82, v78, v83, v84, v79, v80, v81, 0);
    v86 = NSStringFromSelector(sel_percentTimeSpentAtRelativeSpeeds);
    uint64_t v89 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v87, (uint64_t)v85, (uint64_t)v86, v88);
    percentTimeSpentAtRelativeSpeeds = v5->_percentTimeSpentAtRelativeSpeeds;
    v5->_percentTimeSpentAtRelativeSpeeds = (NSArray *)v89;

    uint64_t v91 = objc_opt_class();
    uint64_t v92 = NSStringFromSelector(sel_avgNumBrakingEvents);
    v95 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v93, v91, (uint64_t)v92, v94);
    objc_msgSend_doubleValue(v95, v96, v97, v98, v99);
    v5->_avgNumBrakingEvents = v100;

    uint64_t v101 = objc_opt_class();
    uint64_t v102 = NSStringFromSelector(sel_avgNumAccelEvents);
    v105 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v103, v101, (uint64_t)v102, v104);
    objc_msgSend_doubleValue(v105, v106, v107, v108, v109);
    v5->_avgNumAccelEvents = v110;

    uint64_t v111 = objc_opt_class();
    uint64_t v112 = NSStringFromSelector(sel_avgNumHighSpeedEvents);
    v115 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v113, v111, (uint64_t)v112, v114);
    objc_msgSend_doubleValue(v115, v116, v117, v118, v119);
    v5->_avgNumHighSpeedEvents = v120;

    uint64_t v121 = objc_opt_class();
    uint64_t v122 = NSStringFromSelector(sel_mostEfficientDriveScore);
    v125 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v123, v121, (uint64_t)v122, v124);
    objc_msgSend_doubleValue(v125, v126, v127, v128, v129);
    v5->_mostEfficientDriveScore = v130;

    v131 = (void *)MEMORY[0x1E4F1CAD0];
    v146[0] = objc_opt_class();
    v146[1] = objc_opt_class();
    v146[2] = objc_opt_class();
    uint64_t v134 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v132, (uint64_t)v146, 3, v133);
    v138 = objc_msgSend_setWithArray_(v131, v135, (uint64_t)v134, v136, v137);
    v139 = NSStringFromSelector(sel_routeHeatMap);
    uint64_t v142 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v140, (uint64_t)v138, (uint64_t)v139, v141);
    routeHeatMap = v5->_routeHeatMap;
    v5->_routeHeatMap = (NSDictionary *)v142;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  percentTimeSpentAtSpeedBuckets = self->_percentTimeSpentAtSpeedBuckets;
  id v5 = a3;
  uint64_t v6 = NSStringFromSelector(sel_percentTimeSpentAtSpeedBuckets);
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)percentTimeSpentAtSpeedBuckets, (uint64_t)v6, v8);

  percentTimeSpentAtRelativeSpeeds = self->_percentTimeSpentAtRelativeSpeeds;
  uint64_t v10 = NSStringFromSelector(sel_percentTimeSpentAtRelativeSpeeds);
  objc_msgSend_encodeObject_forKey_(v5, v11, (uint64_t)percentTimeSpentAtRelativeSpeeds, (uint64_t)v10, v12);

  routeHeatMap = self->_routeHeatMap;
  uint64_t v14 = NSStringFromSelector(sel_routeHeatMap);
  objc_msgSend_encodeObject_forKey_(v5, v15, (uint64_t)routeHeatMap, (uint64_t)v14, v16);

  uint64_t v20 = objc_msgSend_numberWithInteger_(NSNumber, v17, self->_numTrips, v18, v19);
  v21 = NSStringFromSelector(sel_numTrips);
  objc_msgSend_encodeObject_forKey_(v5, v22, (uint64_t)v20, (uint64_t)v21, v23);

  maxTripDistanceInMeters = self->_maxTripDistanceInMeters;
  uint64_t v25 = NSStringFromSelector(sel_maxTripDistanceInMeters);
  objc_msgSend_encodeObject_forKey_(v5, v26, (uint64_t)maxTripDistanceInMeters, (uint64_t)v25, v27);

  avgTripDistanceInMeters = self->_avgTripDistanceInMeters;
  uint64_t v29 = NSStringFromSelector(sel_avgTripDistanceInMeters);
  objc_msgSend_encodeObject_forKey_(v5, v30, (uint64_t)avgTripDistanceInMeters, (uint64_t)v29, v31);

  maxElevationGainInMeters = self->_maxElevationGainInMeters;
  uint64_t v33 = NSStringFromSelector(sel_maxElevationGainInMeters);
  objc_msgSend_encodeObject_forKey_(v5, v34, (uint64_t)maxElevationGainInMeters, (uint64_t)v33, v35);

  avgElevationGainInMeters = self->_avgElevationGainInMeters;
  uint64_t v37 = NSStringFromSelector(sel_avgElevationGainInMeters);
  objc_msgSend_encodeObject_forKey_(v5, v38, (uint64_t)avgElevationGainInMeters, (uint64_t)v37, v39);

  uint64_t v44 = objc_msgSend_numberWithDouble_(NSNumber, v40, v41, v42, v43, self->_avgNumBrakingEvents);
  v45 = NSStringFromSelector(sel_avgNumBrakingEvents);
  objc_msgSend_encodeObject_forKey_(v5, v46, (uint64_t)v44, (uint64_t)v45, v47);

  uint64_t v52 = objc_msgSend_numberWithDouble_(NSNumber, v48, v49, v50, v51, self->_avgNumAccelEvents);
  uint64_t v53 = NSStringFromSelector(sel_avgNumAccelEvents);
  objc_msgSend_encodeObject_forKey_(v5, v54, (uint64_t)v52, (uint64_t)v53, v55);

  uint64_t v60 = objc_msgSend_numberWithDouble_(NSNumber, v56, v57, v58, v59, self->_avgNumHighSpeedEvents);
  uint64_t v61 = NSStringFromSelector(sel_avgNumHighSpeedEvents);
  objc_msgSend_encodeObject_forKey_(v5, v62, (uint64_t)v60, (uint64_t)v61, v63);

  uint64_t v68 = objc_msgSend_numberWithDouble_(NSNumber, v64, v65, v66, v67, self->_mostEfficientDriveScore);
  uint64_t v69 = NSStringFromSelector(sel_mostEfficientDriveScore);
  objc_msgSend_encodeObject_forKey_(v5, v70, (uint64_t)v68, (uint64_t)v69, v71);

  v72.receiver = self;
  v72.super_class = (Class)GDKTSDataAggregateRepresentation;
  [(GDKTSDataRepresentation *)&v72 encodeWithCoder:v5];
}

- (GDKTSDataAggregateRepresentation)initWithStartTime:(id)a3 endTime:(id)a4 distanceInMeters:(id)a5 elevationGainInMeters:(id)a6 distanceBuckets:(id)a7 durationInSeconds:(id)a8 expectedDurationInSecondsNoTraffic:(id)a9 distanceSpentInTrafficBuckets:(id)a10 timeSpentInTrafficBuckets:(id)a11 distanceSpentAtSpeedBuckets:(id)a12 timeSpentAtSpeedBuckets:(id)a13 distanceSpentAtRelativeSpeeds:(id)a14 timeSpentAtRelativeSpeeds:(id)a15 distancePerRoadType:(id)a16 timePerRoadType:(id)a17 distancePerWeatherType:(id)a18 timePerWeatherType:(id)a19 distancePerTerrainType:(id)a20 timePerTerrainType:(id)a21 averageSpeedInMetersPerSecond:(id)a22 score:(double)a23 usageKwh:(id)a24 optimalUsageKwh:(id)a25 numBrakingEvents:(int)a26 numAccelEvents:(int)a27 numHighSpeedEvents:(int)a28 roadDistancesInMeters:(id)a29 roadSpeedBuckets:(id)a30 roadRelativeSpeedBuckets:(id)a31 roadTimes:(id)a32 route:(id)a33 lifeEventIds:(id)a34 ktsSegmentIds:(id)a35 maxTripDistanceInMeters:(id)a36 avgTripDistanceInMeters:(id)a37 maxElevationGainInMeters:(id)a38 avgElevationGainInMeters:(id)a39 percentTimeSpentAtSpeedBuckets:(id)a40 percentTimeSpentAtTrafficBuckets:(id)a41 percentTimeSpentAtRelativeSpeeds:(id)a42 percentTimeSpentAtRoadTypes:(id)a43 percentTimeSpentInWeatherTypes:(id)a44 percentTimeSpentInTerrainTypes:(id)a45 percentDistanceTraveledAtSpeedBuckets:(id)a46 percentDistanceTraveledAtTrafficBuckets:(id)a47 percentDistanceTraveledAtRelativeSpeeds:(id)a48 percentDistanceTraveledForRoadTypes:(id)a49 percentDistanceTraveledInWeatherTypes:(id)a50 percentDistanceTraveledInTerrainTypes:(id)a51 scorePerSpeedBucket:(id)a52 scorePerTrafficBucket:(id)a53 scorePerRelativeSpeed:(id)a54 scorePerRoadType:(id)a55 scorePerWeatherType:(id)a56 scorePerTerrainType:(id)a57 avgNumBrakingEvents:(double)a58 avgNumAccelEvents:(double)a59 avgNumHighSpeedEvents:(double)a60 mostEfficientDriveScore:(double)a61 routeHeatMap:(id)a62
{
  id v67 = a34;
  id v224 = a36;
  id v223 = a37;
  id v222 = a38;
  id v221 = a39;
  id v68 = a40;
  id v69 = a41;
  id v70 = a42;
  id v71 = a43;
  id v235 = a44;
  id v236 = a45;
  id v72 = a46;
  id v73 = a47;
  id v74 = a48;
  id v75 = a49;
  id v233 = a50;
  id v232 = a51;
  id v231 = a52;
  id v230 = a53;
  id v229 = a54;
  id v228 = a55;
  id v227 = a56;
  id v226 = a57;
  id v225 = a62;
  v237.receiver = self;
  v237.super_class = (Class)GDKTSDataAggregateRepresentation;
  uint64_t v80 = -[GDKTSDataRepresentation initWithStartTime:endTime:distanceInMeters:elevationGainInMeters:distanceBuckets:durationInSeconds:expectedDurationInSecondsNoTraffic:distanceSpentInTrafficBuckets:timeSpentInTrafficBuckets:distanceSpentAtSpeedBuckets:timeSpentAtSpeedBuckets:distanceSpentAtRelativeSpeeds:timeSpentAtRelativeSpeeds:distancePerRoadType:timePerRoadType:distancePerWeatherType:timePerWeatherType:distancePerTerrainType:timePerTerrainType:averageSpeedInMetersPerSecond:score:usageKwh:optimalUsageKwh:numBrakingEvents:numAccelEvents:numHighSpeedEvents:roadDistancesInMeters:roadSpeedBuckets:roadRelativeSpeedBuckets:roadTimes:route:lifeEventIds:ktsSegmentIds:](&v237, sel_initWithStartTime_endTime_distanceInMeters_elevationGainInMeters_distanceBuckets_durationInSeconds_expectedDurationInSecondsNoTraffic_distanceSpentInTrafficBuckets_timeSpentInTrafficBuckets_distanceSpentAtSpeedBuckets_timeSpentAtSpeedBuckets_distanceSpentAtRelativeSpeeds_timeSpentAtRelativeSpeeds_distancePerRoadType_timePerRoadType_distancePerWeatherType_timePerWeatherType_distancePerTerrainType_timePerTerrainType_averageSpeedInMetersPerSecond_score_usageKwh_optimalUsageKwh_numBrakingEvents_numAccelEvents_numHighSpeedEvents_roadDistancesInMeters_roadSpeedBuckets_roadRelativeSpeedBuckets_roadTimes_route_lifeEventIds_ktsSegmentIds_, a3, a4, a5, a6, a7, a8, a23, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18,
          a19,
          a20,
          a21,
          a22,
          a24,
          a25,
          *(void *)&a26,
          a28,
          a29,
          a30,
          a31,
          a32,
          a33,
          v67,
          a35);
  if (v80)
  {
    v80->_numTrips = objc_msgSend_count(v67, v76, v77, v78, v79);
    objc_storeStrong((id *)&v80->_maxTripDistanceInMeters, a36);
    objc_storeStrong((id *)&v80->_avgTripDistanceInMeters, a37);
    objc_storeStrong((id *)&v80->_maxElevationGainInMeters, a38);
    objc_storeStrong((id *)&v80->_avgElevationGainInMeters, a39);
    uint64_t v85 = objc_msgSend_copy(v68, v81, v82, v83, v84);
    percentTimeSpentAtSpeedBuckets = v80->_percentTimeSpentAtSpeedBuckets;
    v80->_percentTimeSpentAtSpeedBuckets = (NSArray *)v85;

    uint64_t v91 = objc_msgSend_copy(v69, v87, v88, v89, v90);
    percentTimeSpentAtTrafficBuckets = v80->_percentTimeSpentAtTrafficBuckets;
    v80->_percentTimeSpentAtTrafficBuckets = (NSArray *)v91;

    uint64_t v97 = objc_msgSend_copy(v70, v93, v94, v95, v96);
    percentTimeSpentAtRelativeSpeeds = v80->_percentTimeSpentAtRelativeSpeeds;
    v80->_percentTimeSpentAtRelativeSpeeds = (NSArray *)v97;

    uint64_t v103 = objc_msgSend_copy(v68, v99, v100, v101, v102);
    uint64_t v104 = v80->_percentTimeSpentAtSpeedBuckets;
    v80->_percentTimeSpentAtSpeedBuckets = (NSArray *)v103;

    uint64_t v109 = objc_msgSend_copy(v69, v105, v106, v107, v108);
    double v110 = v80->_percentTimeSpentAtTrafficBuckets;
    v80->_percentTimeSpentAtTrafficBuckets = (NSArray *)v109;

    uint64_t v115 = objc_msgSend_copy(v70, v111, v112, v113, v114);
    v116 = v80->_percentTimeSpentAtRelativeSpeeds;
    v80->_percentTimeSpentAtRelativeSpeeds = (NSArray *)v115;

    uint64_t v121 = objc_msgSend_copy(v71, v117, v118, v119, v120);
    percentTimeSpentAtRoadTypes = v80->_percentTimeSpentAtRoadTypes;
    v80->_percentTimeSpentAtRoadTypes = (NSArray *)v121;

    uint64_t v127 = objc_msgSend_copy(v235, v123, v124, v125, v126);
    percentTimeSpentInWeatherTypes = v80->_percentTimeSpentInWeatherTypes;
    v80->_percentTimeSpentInWeatherTypes = (NSArray *)v127;

    uint64_t v133 = objc_msgSend_copy(v236, v129, v130, v131, v132);
    percentTimeSpentInTerrainTypes = v80->_percentTimeSpentInTerrainTypes;
    v80->_percentTimeSpentInTerrainTypes = (NSArray *)v133;

    uint64_t v139 = objc_msgSend_copy(v72, v135, v136, v137, v138);
    percentDistanceTraveledAtSpeedBuckets = v80->_percentDistanceTraveledAtSpeedBuckets;
    v80->_percentDistanceTraveledAtSpeedBuckets = (NSArray *)v139;

    uint64_t v145 = objc_msgSend_copy(v73, v141, v142, v143, v144);
    percentDistanceTraveledAtTrafficBuckets = v80->_percentDistanceTraveledAtTrafficBuckets;
    v80->_percentDistanceTraveledAtTrafficBuckets = (NSArray *)v145;

    uint64_t v151 = objc_msgSend_copy(v74, v147, v148, v149, v150);
    percentDistanceTraveledAtRelativeSpeeds = v80->_percentDistanceTraveledAtRelativeSpeeds;
    v80->_percentDistanceTraveledAtRelativeSpeeds = (NSArray *)v151;

    uint64_t v157 = objc_msgSend_copy(v75, v153, v154, v155, v156);
    percentDistanceTraveledForRoadTypes = v80->_percentDistanceTraveledForRoadTypes;
    v80->_percentDistanceTraveledForRoadTypes = (NSArray *)v157;

    uint64_t v163 = objc_msgSend_copy(v233, v159, v160, v161, v162);
    percentDistanceTraveledInWeatherTypes = v80->_percentDistanceTraveledInWeatherTypes;
    v80->_percentDistanceTraveledInWeatherTypes = (NSArray *)v163;

    uint64_t v169 = objc_msgSend_copy(v232, v165, v166, v167, v168);
    percentDistanceTraveledInTerrainTypes = v80->_percentDistanceTraveledInTerrainTypes;
    v80->_percentDistanceTraveledInTerrainTypes = (NSArray *)v169;

    uint64_t v175 = objc_msgSend_copy(v231, v171, v172, v173, v174);
    scorePerSpeedBucket = v80->_scorePerSpeedBucket;
    v80->_scorePerSpeedBucket = (NSArray *)v175;

    uint64_t v181 = objc_msgSend_copy(v230, v177, v178, v179, v180);
    scorePerTrafficBucket = v80->_scorePerTrafficBucket;
    v80->_scorePerTrafficBucket = (NSArray *)v181;

    uint64_t v187 = objc_msgSend_copy(v229, v183, v184, v185, v186);
    scorePerRelativeSpeed = v80->_scorePerRelativeSpeed;
    v80->_scorePerRelativeSpeed = (NSArray *)v187;

    uint64_t v193 = objc_msgSend_copy(v228, v189, v190, v191, v192);
    scorePerRoadType = v80->_scorePerRoadType;
    v80->_scorePerRoadType = (NSArray *)v193;

    uint64_t v199 = objc_msgSend_copy(v227, v195, v196, v197, v198);
    scorePerWeatherType = v80->_scorePerWeatherType;
    v80->_scorePerWeatherType = (NSArray *)v199;

    uint64_t v205 = objc_msgSend_copy(v226, v201, v202, v203, v204);
    scorePerTerrainType = v80->_scorePerTerrainType;
    v80->_scorePerTerrainType = (NSArray *)v205;

    v80->_avgNumBrakingEvents = a58;
    v80->_avgNumAccelEvents = a59;
    v80->_avgNumHighSpeedEvents = a60;
    v80->_mostEfficientDriveScore = a61;
    uint64_t v211 = objc_msgSend_copy(v225, v207, v208, v209, v210);
    routeHeatMap = v80->_routeHeatMap;
    v80->_routeHeatMap = (NSDictionary *)v211;
  }
  return v80;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end