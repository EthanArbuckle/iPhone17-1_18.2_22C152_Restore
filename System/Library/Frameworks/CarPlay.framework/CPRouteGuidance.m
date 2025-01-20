@interface CPRouteGuidance
+ (BOOL)supportsSecureCoding;
+ (NSArray)accNavParameters;
+ (NSDictionary)accNavParameterKeysIndexed;
+ (NSDictionary)accNavParametersIndexed;
- (BOOL)beingShownInApp;
- (BOOL)isEqual:(id)a3;
- (BOOL)laneGuidanceShowing;
- (BOOL)sourceSupportsRouteGuidance;
- (CPElectricVehicleWaypoint)electricVehicleDestination;
- (CPLaneGuidance)currentLaneGuidance;
- (CPRouteGuidance)init;
- (CPRouteGuidance)initWithCoder:(id)a3;
- (CPRouteGuidance)routeGuidanceWithComponent:(id)a3;
- (CPTravelEstimates)maneuverTravelEstimates;
- (CPTravelEstimates)tripTravelEstimates;
- (NSArray)currentManeuverIndexes;
- (NSArray)currentManeuvers;
- (NSArray)currentRoadNameVariants;
- (NSArray)destinationNameVariants;
- (NSDate)estimatedTimeOfArrival;
- (NSMeasurement)distanceRemaining;
- (NSMeasurement)distanceRemainingDisplay;
- (NSMeasurement)distanceRemainingToNextManeuver;
- (NSMeasurement)distanceRemainingToNextManeuverDisplay;
- (NSString)description;
- (NSString)sourceName;
- (double)timeRemaining;
- (double)timeRemainingToNextManeuver;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)maneuverState;
- (signed)destinationTimeZoneOffsetMinutes;
- (unsigned)componentID;
- (unsigned)currentLaneGuidanceIndex;
- (unsigned)guidanceState;
- (unsigned)stopType;
- (unsigned)totalLaneGuidanceCount;
- (unsigned)totalManeuverCount;
- (void)clearValueForKey:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBeingShownInApp:(BOOL)a3;
- (void)setComponentID:(unsigned __int16)a3;
- (void)setCurrentLaneGuidance:(id)a3;
- (void)setCurrentLaneGuidanceIndex:(unsigned __int16)a3;
- (void)setCurrentManeuverIndexes:(id)a3;
- (void)setCurrentManeuvers:(id)a3;
- (void)setCurrentRoadNameVariants:(id)a3;
- (void)setDestinationNameVariants:(id)a3;
- (void)setDestinationTimeZoneOffsetMinutes:(signed __int16)a3;
- (void)setDistanceRemaining:(id)a3;
- (void)setDistanceRemainingDisplay:(id)a3;
- (void)setDistanceRemainingToNextManeuver:(id)a3;
- (void)setDistanceRemainingToNextManeuverDisplay:(id)a3;
- (void)setElectricVehicleDestination:(id)a3;
- (void)setEstimatedTimeOfArrival:(id)a3;
- (void)setGuidanceState:(unsigned __int8)a3;
- (void)setLaneGuidanceShowing:(BOOL)a3;
- (void)setManeuverState:(int64_t)a3;
- (void)setSourceName:(id)a3;
- (void)setSourceSupportsRouteGuidance:(BOOL)a3;
- (void)setStopType:(unsigned __int8)a3;
- (void)setTimeRemaining:(double)a3;
- (void)setTimeRemainingToNextManeuver:(double)a3;
- (void)setTotalLaneGuidanceCount:(unsigned __int16)a3;
- (void)setTotalManeuverCount:(unsigned __int16)a3;
@end

@implementation CPRouteGuidance

- (CPRouteGuidance)init
{
  v4.receiver = self;
  v4.super_class = (Class)CPRouteGuidance;
  v2 = [(CPRouteGuidance *)&v4 init];
  if (v2) {
    +[CPAccNavUpdate resetUpdate:v2];
  }
  return v2;
}

- (CPRouteGuidance)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPRouteGuidance;
  v5 = [(CPRouteGuidance *)&v8 init];
  if (v5)
  {
    +[CPAccNavUpdate decodeUpdate:v5 withCoder:v4];
    [v4 decodeDoubleForKey:@"kCPRouteGuidanceTimeRemainingToNextManeuver"];
    v5->_timeRemainingToNextManeuver = v6;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  +[CPAccNavUpdate encodeUpdate:self withCoder:v4];
  [(CPRouteGuidance *)self timeRemainingToNextManeuver];
  objc_msgSend(v4, "encodeDouble:forKey:", @"kCPRouteGuidanceTimeRemainingToNextManeuver");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return +[CPAccNavUpdate copyUpdate:self];
}

- (BOOL)isEqual:(id)a3
{
  return +[CPAccNavUpdate isUpdate:self equalTo:a3];
}

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CPRouteGuidance;
  id v4 = [(CPRouteGuidance *)&v8 description];
  v5 = +[CPAccNavUpdate description:self];
  double v6 = [v3 stringWithFormat:@"%@ {\n%@\n}", v4, v5];

  return (NSString *)v6;
}

- (void)setCurrentManeuvers:(id)a3
{
  id v4 = (NSArray *)a3;
  v5 = [(NSArray *)v4 valueForKey:@"index"];
  currentManeuverIndexes = self->_currentManeuverIndexes;
  self->_currentManeuverIndexes = v5;

  currentManeuvers = self->_currentManeuvers;
  self->_currentManeuvers = v4;
}

- (void)setCurrentManeuverIndexes:(id)a3
{
  objc_storeStrong((id *)&self->_currentManeuverIndexes, a3);
  id v6 = a3;
  currentManeuvers = self->_currentManeuvers;
  self->_currentManeuvers = 0;
}

- (void)setCurrentLaneGuidance:(id)a3
{
  id v4 = (CPLaneGuidance *)a3;
  self->_currentLaneGuidanceIndex = [(CPLaneGuidance *)v4 index];
  currentLaneGuidance = self->_currentLaneGuidance;
  self->_currentLaneGuidance = v4;
}

- (void)setCurrentLaneGuidanceIndex:(unsigned __int16)a3
{
  self->_currentLaneGuidanceIndex = a3;
  self->_currentLaneGuidance = 0;
  MEMORY[0x270F9A758]();
}

- (CPTravelEstimates)maneuverTravelEstimates
{
  v3 = [CPTravelEstimates alloc];
  id v4 = [(CPRouteGuidance *)self distanceRemainingToNextManeuver];
  v5 = [(CPRouteGuidance *)self distanceRemainingToNextManeuverDisplay];
  [(CPRouteGuidance *)self timeRemainingToNextManeuver];
  id v6 = -[CPTravelEstimates initWithDistanceRemaining:distanceRemainingToDisplay:timeRemaining:](v3, "initWithDistanceRemaining:distanceRemainingToDisplay:timeRemaining:", v4, v5);

  return v6;
}

- (CPTravelEstimates)tripTravelEstimates
{
  v3 = [CPTravelEstimates alloc];
  id v4 = [(CPRouteGuidance *)self distanceRemaining];
  v5 = [(CPRouteGuidance *)self distanceRemainingDisplay];
  [(CPRouteGuidance *)self timeRemaining];
  id v6 = -[CPTravelEstimates initWithDistanceRemaining:distanceRemainingToDisplay:timeRemaining:](v3, "initWithDistanceRemaining:distanceRemainingToDisplay:timeRemaining:", v4, v5);

  return v6;
}

- (unsigned)guidanceState
{
  return self->_guidanceState;
}

- (void)setGuidanceState:(unsigned __int8)a3
{
  self->_guidanceState = a3;
}

- (int64_t)maneuverState
{
  return self->_maneuverState;
}

- (void)setManeuverState:(int64_t)a3
{
  self->_maneuverState = a3;
}

- (NSArray)currentRoadNameVariants
{
  return self->_currentRoadNameVariants;
}

- (void)setCurrentRoadNameVariants:(id)a3
{
}

- (NSArray)destinationNameVariants
{
  return self->_destinationNameVariants;
}

- (void)setDestinationNameVariants:(id)a3
{
}

- (unsigned)stopType
{
  return self->_stopType;
}

- (void)setStopType:(unsigned __int8)a3
{
  self->_stopType = a3;
}

- (NSDate)estimatedTimeOfArrival
{
  return self->_estimatedTimeOfArrival;
}

- (void)setEstimatedTimeOfArrival:(id)a3
{
}

- (double)timeRemaining
{
  return self->_timeRemaining;
}

- (void)setTimeRemaining:(double)a3
{
  self->_timeRemaining = a3;
}

- (NSMeasurement)distanceRemaining
{
  return self->_distanceRemaining;
}

- (void)setDistanceRemaining:(id)a3
{
}

- (NSMeasurement)distanceRemainingDisplay
{
  return self->_distanceRemainingDisplay;
}

- (void)setDistanceRemainingDisplay:(id)a3
{
}

- (double)timeRemainingToNextManeuver
{
  return self->_timeRemainingToNextManeuver;
}

- (void)setTimeRemainingToNextManeuver:(double)a3
{
  self->_timeRemainingToNextManeuver = a3;
}

- (NSMeasurement)distanceRemainingToNextManeuver
{
  return self->_distanceRemainingToNextManeuver;
}

- (void)setDistanceRemainingToNextManeuver:(id)a3
{
}

- (NSMeasurement)distanceRemainingToNextManeuverDisplay
{
  return self->_distanceRemainingToNextManeuverDisplay;
}

- (void)setDistanceRemainingToNextManeuverDisplay:(id)a3
{
}

- (NSArray)currentManeuvers
{
  return self->_currentManeuvers;
}

- (unsigned)totalManeuverCount
{
  return self->_totalManeuverCount;
}

- (void)setTotalManeuverCount:(unsigned __int16)a3
{
  self->_totalManeuverCount = a3;
}

- (BOOL)beingShownInApp
{
  return self->_beingShownInApp;
}

- (void)setBeingShownInApp:(BOOL)a3
{
  self->_beingShownInApp = a3;
}

- (CPLaneGuidance)currentLaneGuidance
{
  return self->_currentLaneGuidance;
}

- (unsigned)totalLaneGuidanceCount
{
  return self->_totalLaneGuidanceCount;
}

- (void)setTotalLaneGuidanceCount:(unsigned __int16)a3
{
  self->_totalLaneGuidanceCount = a3;
}

- (BOOL)laneGuidanceShowing
{
  return self->_laneGuidanceShowing;
}

- (void)setLaneGuidanceShowing:(BOOL)a3
{
  self->_laneGuidanceShowing = a3;
}

- (NSString)sourceName
{
  return self->_sourceName;
}

- (void)setSourceName:(id)a3
{
}

- (BOOL)sourceSupportsRouteGuidance
{
  return self->_sourceSupportsRouteGuidance;
}

- (void)setSourceSupportsRouteGuidance:(BOOL)a3
{
  self->_sourceSupportsRouteGuidance = a3;
}

- (signed)destinationTimeZoneOffsetMinutes
{
  return self->_destinationTimeZoneOffsetMinutes;
}

- (void)setDestinationTimeZoneOffsetMinutes:(signed __int16)a3
{
  self->_destinationTimeZoneOffsetMinutes = a3;
}

- (unsigned)componentID
{
  return self->_componentID;
}

- (void)setComponentID:(unsigned __int16)a3
{
  self->_componentID = a3;
}

- (NSArray)currentManeuverIndexes
{
  return self->_currentManeuverIndexes;
}

- (unsigned)currentLaneGuidanceIndex
{
  return self->_currentLaneGuidanceIndex;
}

- (CPElectricVehicleWaypoint)electricVehicleDestination
{
  return self->_electricVehicleDestination;
}

- (void)setElectricVehicleDestination:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_electricVehicleDestination, 0);
  objc_storeStrong((id *)&self->_currentManeuverIndexes, 0);
  objc_storeStrong((id *)&self->_sourceName, 0);
  objc_storeStrong((id *)&self->_currentLaneGuidance, 0);
  objc_storeStrong((id *)&self->_currentManeuvers, 0);
  objc_storeStrong((id *)&self->_distanceRemainingToNextManeuverDisplay, 0);
  objc_storeStrong((id *)&self->_distanceRemainingToNextManeuver, 0);
  objc_storeStrong((id *)&self->_distanceRemainingDisplay, 0);
  objc_storeStrong((id *)&self->_distanceRemaining, 0);
  objc_storeStrong((id *)&self->_estimatedTimeOfArrival, 0);
  objc_storeStrong((id *)&self->_destinationNameVariants, 0);

  objc_storeStrong((id *)&self->_currentRoadNameVariants, 0);
}

+ (NSArray)accNavParameters
{
  if (accNavParameters_onceToken_2 != -1) {
    dispatch_once(&accNavParameters_onceToken_2, &__block_literal_global_15);
  }
  v2 = (void *)accNavParameters__accNavParameters_2;

  return (NSArray *)v2;
}

void __51__CPRouteGuidance_CPAccNavUpdate__accNavParameters__block_invoke()
{
  v147[22] = *MEMORY[0x263EF8340];
  v122 = NSStringFromSelector(sel_componentID);
  v124 = +[CPAccNavParamKey paramKey:0];
  v123 = (void *)[v124 copySettingIsIntegerValue:1];
  v146 = v123;
  v121 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v146 count:1];
  v120 = +[CPAccNavParam paramWithProperty:v122 keys:v121];
  v147[0] = v120;
  v117 = NSStringFromSelector(sel_guidanceState);
  v119 = +[CPAccNavParamKey paramKey:1];
  v118 = (void *)[v119 copySettingEnumType:6];
  v145 = v118;
  v116 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v145 count:1];
  v115 = +[CPAccNavParam paramWithProperty:v117 keys:v116];
  v147[1] = v115;
  v112 = NSStringFromSelector(sel_maneuverState);
  v114 = +[CPAccNavParamKey paramKey:2];
  v113 = (void *)[v114 copySettingEnumType:7];
  v144 = v113;
  v111 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v144 count:1];
  v110 = +[CPAccNavParam paramWithProperty:v112 keys:v111];
  v147[2] = v110;
  v107 = NSStringFromSelector(sel_currentRoadNameVariants);
  v109 = +[CPAccNavParamKey paramKey:3];
  v108 = (void *)[v109 copySettingHasVariants:1];
  v143 = v108;
  v106 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v143 count:1];
  v105 = +[CPAccNavParam paramWithProperty:v107 keys:v106];
  v104 = (void *)[v105 copySettingCollectionGeneric:objc_opt_class()];
  v147[3] = v104;
  v101 = NSStringFromSelector(sel_destinationNameVariants);
  v103 = +[CPAccNavParamKey paramKey:4];
  v102 = (void *)[v103 copySettingHasVariants:1];
  v142 = v102;
  v100 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v142 count:1];
  v99 = +[CPAccNavParam paramWithProperty:v101 keys:v100];
  v98 = (void *)[v99 copySettingCollectionGeneric:objc_opt_class()];
  v147[4] = v98;
  v96 = NSStringFromSelector(sel_estimatedTimeOfArrival);
  v97 = +[CPAccNavParamKey paramKey:5];
  v141 = v97;
  v95 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v141 count:1];
  v94 = +[CPAccNavParam paramWithProperty:v96 keys:v95];
  v147[5] = v94;
  v91 = NSStringFromSelector(sel_timeRemaining);
  v93 = +[CPAccNavParamKey paramKey:6];
  v92 = (void *)[v93 copySettingIsTimeIntervalValue:1];
  v140 = v92;
  v90 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v140 count:1];
  v89 = +[CPAccNavParam paramWithProperty:v91 keys:v90];
  v147[6] = v89;
  v86 = NSStringFromSelector(sel_distanceRemaining);
  v88 = +[CPAccNavParamKey paramKey:7];
  v87 = [MEMORY[0x263F08CE8] meters];
  v85 = (void *)[v88 copySettingDimension:v87];
  v139 = v85;
  v84 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v139 count:1];
  v83 = +[CPAccNavParam paramWithProperty:v86 keys:v84];
  v147[7] = v83;
  v79 = NSStringFromSelector(sel_distanceRemainingDisplay);
  v82 = +[CPAccNavParamKey paramKey:8];
  v138[0] = v82;
  v81 = +[CPAccNavParamKey paramKey:9];
  v80 = (void *)[v81 copySettingEnumType:5];
  v138[1] = v80;
  v78 = [MEMORY[0x263EFF8C0] arrayWithObjects:v138 count:2];
  v77 = +[CPAccNavParam paramWithProperty:v79 keys:v78];
  v147[8] = v77;
  v74 = NSStringFromSelector(sel_distanceRemainingToNextManeuver);
  v76 = +[CPAccNavParamKey paramKey:10];
  v75 = [MEMORY[0x263F08CE8] meters];
  v73 = (void *)[v76 copySettingDimension:v75];
  v137 = v73;
  v72 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v137 count:1];
  v71 = +[CPAccNavParam paramWithProperty:v74 keys:v72];
  v147[9] = v71;
  v68 = NSStringFromSelector(sel_distanceRemainingToNextManeuverDisplay);
  v70 = +[CPAccNavParamKey paramKey:11];
  v136[0] = v70;
  v69 = +[CPAccNavParamKey paramKey:12];
  v67 = (void *)[v69 copySettingEnumType:5];
  v136[1] = v67;
  v66 = [MEMORY[0x263EFF8C0] arrayWithObjects:v136 count:2];
  v65 = +[CPAccNavParam paramWithProperty:v68 keys:v66];
  v147[10] = v65;
  v62 = NSStringFromSelector(sel_currentManeuverIndexes);
  v64 = +[CPAccNavParamKey paramKey:13];
  v63 = (void *)[v64 copySettingAccNavType:9];
  v135 = v63;
  v61 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v135 count:1];
  v60 = +[CPAccNavParam paramWithProperty:v62 keys:v61];
  v59 = (void *)[v60 copySettingCollectionGeneric:objc_opt_class()];
  v147[11] = v59;
  v56 = NSStringFromSelector(sel_totalManeuverCount);
  v58 = +[CPAccNavParamKey paramKey:14];
  v57 = (void *)[v58 copySettingIsIntegerValue:1];
  v134 = v57;
  v55 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v134 count:1];
  v54 = +[CPAccNavParam paramWithProperty:v56 keys:v55];
  v147[12] = v54;
  v51 = NSStringFromSelector(sel_beingShownInApp);
  v53 = +[CPAccNavParamKey paramKey:15];
  v52 = (void *)[v53 copySettingIsBoolValue:1];
  v133 = v52;
  v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v133 count:1];
  v49 = +[CPAccNavParam paramWithProperty:v51 keys:v50];
  v147[13] = v49;
  v46 = NSStringFromSelector(sel_currentLaneGuidanceIndex);
  v48 = +[CPAccNavParamKey paramKey:16];
  v47 = (void *)[v48 copySettingIsIntegerValue:1];
  v132 = v47;
  v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v132 count:1];
  v44 = +[CPAccNavParam paramWithProperty:v46 keys:v45];
  v147[14] = v44;
  v41 = NSStringFromSelector(sel_totalLaneGuidanceCount);
  v43 = +[CPAccNavParamKey paramKey:17];
  v42 = (void *)[v43 copySettingIsIntegerValue:1];
  v131 = v42;
  v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v131 count:1];
  v39 = +[CPAccNavParam paramWithProperty:v41 keys:v40];
  v147[15] = v39;
  v36 = NSStringFromSelector(sel_laneGuidanceShowing);
  v38 = +[CPAccNavParamKey paramKey:18];
  v37 = (void *)[v38 copySettingIsBoolValue:1];
  v130 = v37;
  v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v130 count:1];
  v34 = +[CPAccNavParam paramWithProperty:v36 keys:v35];
  v147[16] = v34;
  v32 = NSStringFromSelector(sel_sourceName);
  v33 = +[CPAccNavParamKey paramKey:19];
  v129 = v33;
  v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v129 count:1];
  v30 = +[CPAccNavParam paramWithProperty:v32 keys:v31];
  v147[17] = v30;
  v27 = NSStringFromSelector(sel_sourceSupportsRouteGuidance);
  v29 = +[CPAccNavParamKey paramKey:20];
  v28 = (void *)[v29 copySettingIsBoolValue:1];
  v128 = v28;
  v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v128 count:1];
  v25 = +[CPAccNavParam paramWithProperty:v27 keys:v26];
  v147[18] = v25;
  v22 = NSStringFromSelector(sel_destinationTimeZoneOffsetMinutes);
  v24 = +[CPAccNavParamKey paramKey:21];
  v23 = (void *)[v24 copySettingIsIntegerValue:1];
  v127 = v23;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v127 count:1];
  v20 = +[CPAccNavParam paramWithProperty:v22 keys:v21];
  v147[19] = v20;
  v17 = NSStringFromSelector(sel_stopType);
  v19 = +[CPAccNavParamKey paramKey:22];
  v18 = (void *)[v19 copySettingEnumType:8];
  v126 = v18;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v126 count:1];
  v15 = +[CPAccNavParam paramWithProperty:v17 keys:v16];
  v147[20] = v15;
  v11 = NSStringFromSelector(sel_electricVehicleDestination);
  v14 = +[CPAccNavParamKey paramKey:23];
  v125[0] = v14;
  v13 = +[CPAccNavParamKey paramKey:24];
  v12 = [MEMORY[0x263F08CC0] wattHours];
  v0 = (void *)[v13 copySettingDimension:v12];
  v125[1] = v0;
  v1 = +[CPAccNavParamKey paramKey:25];
  v2 = [MEMORY[0x263F08CC0] wattHours];
  v3 = (void *)[v1 copySettingDimension:v2];
  v125[2] = v3;
  id v4 = +[CPAccNavParamKey paramKey:26];
  v5 = [MEMORY[0x263F08CC0] wattHours];
  id v6 = (void *)[v4 copySettingDimension:v5];
  v125[3] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v125 count:4];
  objc_super v8 = +[CPAccNavParam paramWithProperty:v11 keys:v7];
  v147[21] = v8;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v147 count:22];
  v10 = (void *)accNavParameters__accNavParameters_2;
  accNavParameters__accNavParameters_2 = v9;
}

+ (NSDictionary)accNavParametersIndexed
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__CPRouteGuidance_CPAccNavUpdate__accNavParametersIndexed__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (accNavParametersIndexed_onceToken_2 != -1) {
    dispatch_once(&accNavParametersIndexed_onceToken_2, block);
  }
  v2 = (void *)accNavParametersIndexed__accNavParametersIndexed_2;

  return (NSDictionary *)v2;
}

uint64_t __58__CPRouteGuidance_CPAccNavUpdate__accNavParametersIndexed__block_invoke(uint64_t a1)
{
  accNavParametersIndexed__accNavParametersIndexed_2 = +[CPAccNavUpdate accNavParametersIndexedForUpdate:*(void *)(a1 + 32)];

  return MEMORY[0x270F9A758]();
}

+ (NSDictionary)accNavParameterKeysIndexed
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__CPRouteGuidance_CPAccNavUpdate__accNavParameterKeysIndexed__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (accNavParameterKeysIndexed_onceToken_2 != -1) {
    dispatch_once(&accNavParameterKeysIndexed_onceToken_2, block);
  }
  v2 = (void *)accNavParameterKeysIndexed__accNavParameterKeysIndexed_2;

  return (NSDictionary *)v2;
}

uint64_t __61__CPRouteGuidance_CPAccNavUpdate__accNavParameterKeysIndexed__block_invoke(uint64_t a1)
{
  accNavParameterKeysIndexed__accNavParameterKeysIndexed_2 = +[CPAccNavUpdate accNavParameterKeysIndexedForUpdate:*(void *)(a1 + 32)];

  return MEMORY[0x270F9A758]();
}

- (void)clearValueForKey:(id)a3
{
}

- (CPRouteGuidance)routeGuidanceWithComponent:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F22EA8];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = [v5 component];
  objc_super v8 = (void *)[v6 initWithRouteGuidance:self component:v7];

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F30ED0]) initWithComponent:v5 accNavInfo:v8];

  return (CPRouteGuidance *)v9;
}

@end