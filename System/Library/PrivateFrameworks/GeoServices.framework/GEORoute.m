@interface GEORoute
+ (BOOL)isValid:(id)a3;
+ (Class)advisoryNoticeType;
+ (Class)basicPointsType;
+ (Class)endingRouteInstructionType;
+ (Class)enrouteNoticeType;
+ (Class)guidanceEventType;
+ (Class)incidentOnRouteInfoType;
+ (Class)laneWidthType;
+ (Class)restrictedZoneIdsType;
+ (Class)roadComplexityType;
+ (Class)routeCameraInputInfoType;
+ (Class)routeDescriptionType;
+ (Class)routeLineStyleInfoType;
+ (Class)routeNameType;
+ (Class)startingRouteInstructionType;
+ (Class)stepGroupType;
+ (Class)stepType;
+ (Class)trafficColorInfoType;
+ (Class)updateLocationType;
+ (Class)zilchPointsType;
- ($1AB5FA073B851C12C2339EC22442E995)coordinateAt:(unsigned int)a3;
- (BOOL)avoidsHighways;
- (BOOL)avoidsTolls;
- (BOOL)avoidsTraffic;
- (BOOL)hasAlertNonRecommendedRouteText;
- (BOOL)hasArrivalParameterIndex;
- (BOOL)hasArrivalRouteID;
- (BOOL)hasArrivalStepID;
- (BOOL)hasAvoidsHighways;
- (BOOL)hasAvoidsTolls;
- (BOOL)hasAvoidsTraffic;
- (BOOL)hasClickableAdvisory;
- (BOOL)hasDepartureRouteID;
- (BOOL)hasDepartureStepID;
- (BOOL)hasDestinationListInstruction;
- (BOOL)hasDestinationWaypointInfo;
- (BOOL)hasDistance;
- (BOOL)hasDrivingSide;
- (BOOL)hasElevationProfile;
- (BOOL)hasEnvironmentalCongestionZoneImpact;
- (BOOL)hasExpectedTime;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasHistoricTravelTime;
- (BOOL)hasInfrastructureDescription;
- (BOOL)hasLaunchAndGoCardText;
- (BOOL)hasLicensePlateRestrictionImpact;
- (BOOL)hasName;
- (BOOL)hasOriginListInstruction;
- (BOOL)hasOriginWaypointInfo;
- (BOOL)hasPathLeg;
- (BOOL)hasPathMapMatcherInstructions;
- (BOOL)hasPhoneticName;
- (BOOL)hasRouteID;
- (BOOL)hasRouteLabelDetailText;
- (BOOL)hasRoutePlanningDescription;
- (BOOL)hasRouteType;
- (BOOL)hasStaticTravelTime;
- (BOOL)hasTollCongestionZoneImpact;
- (BOOL)hasTrafficDescription;
- (BOOL)hasTrafficDescriptionLong;
- (BOOL)hasTransportType;
- (BOOL)hasTravelTimeAggressiveEstimate;
- (BOOL)hasTravelTimeConservativeEstimate;
- (BOOL)hasUnpackedLatLngVertices;
- (BOOL)isContingentRoute;
- (BOOL)isContingentRouteFor:(id)a3 afterPoint:(unsigned int)a4 mainRoutes:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMainOrAlternateRoute;
- (BOOL)readFrom:(id)a3;
- (BOOL)unpackBasicPoints;
- (BOOL)unpackLatLngVertices;
- (BOOL)unpackZilchPoints;
- (GEOAlertNonRecommendedRouteText)alertNonRecommendedRouteText;
- (GEOClickableAdvisory)clickableAdvisory;
- (GEODrivingWalkingInstruction)destinationListInstruction;
- (GEODrivingWalkingInstruction)originListInstruction;
- (GEOElevationProfile)elevationProfile;
- (GEOFormattedString)infrastructureDescription;
- (GEOFormattedString)routeLabelDetailText;
- (GEOLaunchAndGoCardText)launchAndGoCardText;
- (GEOPathMapMatcherInstructions)pathMapMatcherInstructions;
- (GEORoute)init;
- (GEORoute)initWithData:(id)a3;
- (GEORoute)initWithDictionary:(id)a3;
- (GEORoute)initWithJSON:(id)a3;
- (GEORouteInformation)routePlanningDescription;
- (GEOWaypointInfo)destinationWaypointInfo;
- (GEOWaypointInfo)originWaypointInfo;
- (NSData)arrivalRouteID;
- (NSData)departureRouteID;
- (NSData)pathLeg;
- (NSData)routeID;
- (NSData)unpackedLatLngVertices;
- (NSMutableArray)advisoryNotices;
- (NSMutableArray)basicPoints;
- (NSMutableArray)endingRouteInstructions;
- (NSMutableArray)enrouteNotices;
- (NSMutableArray)guidanceEvents;
- (NSMutableArray)incidentOnRouteInfos;
- (NSMutableArray)laneWidths;
- (NSMutableArray)restrictedZoneIds;
- (NSMutableArray)roadComplexitys;
- (NSMutableArray)routeCameraInputInfos;
- (NSMutableArray)routeDescriptions;
- (NSMutableArray)routeLineStyleInfos;
- (NSMutableArray)routeNames;
- (NSMutableArray)startingRouteInstructions;
- (NSMutableArray)stepGroups;
- (NSMutableArray)steps;
- (NSMutableArray)trafficColorInfos;
- (NSMutableArray)updateLocations;
- (NSMutableArray)zilchPoints;
- (NSString)name;
- (NSString)phoneticName;
- (NSString)trafficDescription;
- (NSString)trafficDescriptionLong;
- (PBUnknownFields)unknownFields;
- (double)distanceFromStepIndex:(unint64_t)a3 toStepIndex:(unint64_t)a4;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithDictionary:isJSON:;
- (id)advisoryNoticeAtIndex:(unint64_t)a3;
- (id)basicPointsAtIndex:(unint64_t)a3;
- (id)cellularCoveragesAsString:(int)a3;
- (id)convertToFullRoute:(id)a3 includeDepartureRoutes:(BOOL)a4 uniquePointRange:(_NSRange *)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)dictionaryRepresentation;
- (id)drivingSideAsString:(int)a3;
- (id)endingRouteInstructionAtIndex:(unint64_t)a3;
- (id)enrouteNoticeAtIndex:(unint64_t)a3;
- (id)environmentalCongestionZoneImpactAsString:(int)a3;
- (id)guidanceEventAtIndex:(unint64_t)a3;
- (id)incidentOnRouteInfoAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)laneWidthAtIndex:(unint64_t)a3;
- (id)licensePlateRestrictionImpactAsString:(int)a3;
- (id)newETARoute;
- (id)newETARouteFromStepIndex:(unint64_t)a3 stepPercentRemaining:(double)a4;
- (id)restrictedZoneIdsAtIndex:(unint64_t)a3;
- (id)roadComplexityAtIndex:(unint64_t)a3;
- (id)routeCameraInputInfoAtIndex:(unint64_t)a3;
- (id)routeDescriptionAtIndex:(unint64_t)a3;
- (id)routeLineStyleInfoAtIndex:(unint64_t)a3;
- (id)routeNameAtIndex:(unint64_t)a3;
- (id)routeTypeAsString:(int)a3;
- (id)simplifiedDescription;
- (id)startingRouteInstructionAtIndex:(unint64_t)a3;
- (id)stepAtIndex:(unint64_t)a3;
- (id)stepGroupAtIndex:(unint64_t)a3;
- (id)tollCongestionZoneImpactAsString:(int)a3;
- (id)trafficColorInfoAtIndex:(unint64_t)a3;
- (id)transportTypeAsString:(int)a3;
- (id)updateLocationAtIndex:(unint64_t)a3;
- (id)zilchPointsAtIndex:(unint64_t)a3;
- (int)StringAsCellularCoverages:(id)a3;
- (int)StringAsDrivingSide:(id)a3;
- (int)StringAsEnvironmentalCongestionZoneImpact:(id)a3;
- (int)StringAsLicensePlateRestrictionImpact:(id)a3;
- (int)StringAsRouteType:(id)a3;
- (int)StringAsTollCongestionZoneImpact:(id)a3;
- (int)StringAsTransportType:(id)a3;
- (int)cellularCoverageAtIndex:(unint64_t)a3;
- (int)cellularCoverages;
- (int)drivingSide;
- (int)environmentalCongestionZoneImpact;
- (int)licensePlateRestrictionImpact;
- (int)routeType;
- (int)tollCongestionZoneImpact;
- (int)transportType;
- (int)transportTypeForStep:(id)a3;
- (unint64_t)advisoryNoticesCount;
- (unint64_t)basicPointsCount;
- (unint64_t)cellularCoverageOffsetsCount;
- (unint64_t)cellularCoveragesCount;
- (unint64_t)endingRouteInstructionsCount;
- (unint64_t)enrouteNoticesCount;
- (unint64_t)guidanceEventsCount;
- (unint64_t)hash;
- (unint64_t)incidentEndOffsetsInRoutesCount;
- (unint64_t)incidentIndicesCount;
- (unint64_t)incidentOnRouteInfosCount;
- (unint64_t)indexForStepID:(unint64_t)a3;
- (unint64_t)laneWidthsCount;
- (unint64_t)restrictedZoneIdsCount;
- (unint64_t)roadComplexitysCount;
- (unint64_t)routeCameraInputInfosCount;
- (unint64_t)routeDescriptionsCount;
- (unint64_t)routeLineStyleInfosCount;
- (unint64_t)routeNamesCount;
- (unint64_t)startingRouteInstructionsCount;
- (unint64_t)stepGroupsCount;
- (unint64_t)stepIndexForPointIndex:(unsigned int)a3;
- (unint64_t)stepsCount;
- (unint64_t)trafficColorInfosCount;
- (unint64_t)trafficColorOffsetsCount;
- (unint64_t)trafficColorsCount;
- (unint64_t)updateLocationsCount;
- (unint64_t)zilchPointsCount;
- (unsigned)arrivalParameterIndex;
- (unsigned)arrivalStepID;
- (unsigned)cellularCoverageOffsetAtIndex:(unint64_t)a3;
- (unsigned)cellularCoverageOffsets;
- (unsigned)departureStepID;
- (unsigned)distance;
- (unsigned)expectedTime;
- (unsigned)historicTravelTime;
- (unsigned)incidentEndOffsetsInRouteAtIndex:(unint64_t)a3;
- (unsigned)incidentEndOffsetsInRoutes;
- (unsigned)incidentIndices;
- (unsigned)incidentIndicesAtIndex:(unint64_t)a3;
- (unsigned)pointCount;
- (unsigned)staticTravelTime;
- (unsigned)trafficColorAtIndex:(unint64_t)a3;
- (unsigned)trafficColorOffsetAtIndex:(unint64_t)a3;
- (unsigned)trafficColorOffsets;
- (unsigned)trafficColors;
- (unsigned)travelTimeAggressiveEstimate;
- (unsigned)travelTimeConservativeEstimate;
- (void)_addNoFlagsAdvisoryNotice:(uint64_t)a1;
- (void)_addNoFlagsBasicPoints:(uint64_t)a1;
- (void)_addNoFlagsEndingRouteInstruction:(uint64_t)a1;
- (void)_addNoFlagsEnrouteNotice:(uint64_t)a1;
- (void)_addNoFlagsGuidanceEvent:(uint64_t)a1;
- (void)_addNoFlagsIncidentOnRouteInfo:(uint64_t)a1;
- (void)_addNoFlagsLaneWidth:(uint64_t)a1;
- (void)_addNoFlagsRestrictedZoneIds:(uint64_t)a1;
- (void)_addNoFlagsRoadComplexity:(uint64_t)a1;
- (void)_addNoFlagsRouteCameraInputInfo:(uint64_t)a1;
- (void)_addNoFlagsRouteDescription:(uint64_t)a1;
- (void)_addNoFlagsRouteLineStyleInfo:(uint64_t)a1;
- (void)_addNoFlagsRouteName:(uint64_t)a1;
- (void)_addNoFlagsStartingRouteInstruction:(uint64_t)a1;
- (void)_addNoFlagsStep:(uint64_t)a1;
- (void)_addNoFlagsStepGroup:(uint64_t)a1;
- (void)_addNoFlagsTrafficColorInfo:(uint64_t)a1;
- (void)_addNoFlagsUpdateLocation:(uint64_t)a1;
- (void)_addNoFlagsZilchPoints:(uint64_t)a1;
- (void)_readAdvisoryNotices;
- (void)_readAlertNonRecommendedRouteText;
- (void)_readArrivalRouteID;
- (void)_readBasicPoints;
- (void)_readCellularCoverageOffsets;
- (void)_readCellularCoverages;
- (void)_readClickableAdvisory;
- (void)_readDepartureRouteID;
- (void)_readDestinationListInstruction;
- (void)_readDestinationWaypointInfo;
- (void)_readElevationProfile;
- (void)_readEndingRouteInstructions;
- (void)_readEnrouteNotices;
- (void)_readGuidanceEvents;
- (void)_readIncidentEndOffsetsInRoutes;
- (void)_readIncidentIndices;
- (void)_readIncidentOnRouteInfos;
- (void)_readInfrastructureDescription;
- (void)_readLaneWidths;
- (void)_readLaunchAndGoCardText;
- (void)_readName;
- (void)_readOriginListInstruction;
- (void)_readOriginWaypointInfo;
- (void)_readPathLeg;
- (void)_readPathMapMatcherInstructions;
- (void)_readPhoneticName;
- (void)_readRestrictedZoneIds;
- (void)_readRoadComplexitys;
- (void)_readRouteCameraInputInfos;
- (void)_readRouteDescriptions;
- (void)_readRouteID;
- (void)_readRouteLabelDetailText;
- (void)_readRouteLineStyleInfos;
- (void)_readRouteNames;
- (void)_readRoutePlanningDescription;
- (void)_readStartingRouteInstructions;
- (void)_readStepGroups;
- (void)_readSteps;
- (void)_readTrafficColorInfos;
- (void)_readTrafficColorOffsets;
- (void)_readTrafficColors;
- (void)_readTrafficDescription;
- (void)_readTrafficDescriptionLong;
- (void)_readUnpackedLatLngVertices;
- (void)_readUpdateLocations;
- (void)_readZilchPoints;
- (void)addAdvisoryNotice:(id)a3;
- (void)addBasicPoints:(id)a3;
- (void)addCellularCoverage:(int)a3;
- (void)addCellularCoverageOffset:(unsigned int)a3;
- (void)addEndingRouteInstruction:(id)a3;
- (void)addEnrouteNotice:(id)a3;
- (void)addGuidanceEvent:(id)a3;
- (void)addIncidentEndOffsetsInRoute:(unsigned int)a3;
- (void)addIncidentIndices:(unsigned int)a3;
- (void)addIncidentOnRouteInfo:(id)a3;
- (void)addLaneWidth:(id)a3;
- (void)addRestrictedZoneIds:(id)a3;
- (void)addRoadComplexity:(id)a3;
- (void)addRouteCameraInputInfo:(id)a3;
- (void)addRouteDescription:(id)a3;
- (void)addRouteLineStyleInfo:(id)a3;
- (void)addRouteName:(id)a3;
- (void)addStartingRouteInstruction:(id)a3;
- (void)addStep:(id)a3;
- (void)addStepGroup:(id)a3;
- (void)addTrafficColor:(unsigned int)a3;
- (void)addTrafficColorInfo:(id)a3;
- (void)addTrafficColorOffset:(unsigned int)a3;
- (void)addUpdateLocation:(id)a3;
- (void)addZilchPoints:(id)a3;
- (void)clearAdvisoryNotices;
- (void)clearBasicPoints;
- (void)clearCellularCoverageOffsets;
- (void)clearCellularCoverages;
- (void)clearEndingRouteInstructions;
- (void)clearEnrouteNotices;
- (void)clearGuidanceEvents;
- (void)clearIncidentEndOffsetsInRoutes;
- (void)clearIncidentIndices;
- (void)clearIncidentOnRouteInfos;
- (void)clearLaneWidths;
- (void)clearRestrictedZoneIds;
- (void)clearRoadComplexitys;
- (void)clearRouteCameraInputInfos;
- (void)clearRouteDescriptions;
- (void)clearRouteLineStyleInfos;
- (void)clearRouteNames;
- (void)clearStartingRouteInstructions;
- (void)clearStepGroups;
- (void)clearSteps;
- (void)clearTrafficColorInfos;
- (void)clearTrafficColorOffsets;
- (void)clearTrafficColors;
- (void)clearUnknownFields:(BOOL)a3;
- (void)clearUpdateLocations;
- (void)clearZilchPoints;
- (void)controlPoints;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAdvisoryNotices:(id)a3;
- (void)setAlertNonRecommendedRouteText:(id)a3;
- (void)setArrivalParameterIndex:(unsigned int)a3;
- (void)setArrivalRouteID:(id)a3;
- (void)setArrivalStepID:(unsigned int)a3;
- (void)setAvoidsHighways:(BOOL)a3;
- (void)setAvoidsTolls:(BOOL)a3;
- (void)setAvoidsTraffic:(BOOL)a3;
- (void)setBasicPoints:(id)a3;
- (void)setCellularCoverageOffsets:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setCellularCoverages:(int *)a3 count:(unint64_t)a4;
- (void)setClickableAdvisory:(id)a3;
- (void)setDepartureRouteID:(id)a3;
- (void)setDepartureStepID:(unsigned int)a3;
- (void)setDestinationListInstruction:(id)a3;
- (void)setDestinationWaypointInfo:(id)a3;
- (void)setDistance:(unsigned int)a3;
- (void)setDrivingSide:(int)a3;
- (void)setElevationProfile:(id)a3;
- (void)setEndingRouteInstructions:(id)a3;
- (void)setEnrouteNotices:(id)a3;
- (void)setEnvironmentalCongestionZoneImpact:(int)a3;
- (void)setExpectedTime:(unsigned int)a3;
- (void)setGuidanceEvents:(id)a3;
- (void)setHasArrivalParameterIndex:(BOOL)a3;
- (void)setHasArrivalStepID:(BOOL)a3;
- (void)setHasAvoidsHighways:(BOOL)a3;
- (void)setHasAvoidsTolls:(BOOL)a3;
- (void)setHasAvoidsTraffic:(BOOL)a3;
- (void)setHasDepartureStepID:(BOOL)a3;
- (void)setHasDistance:(BOOL)a3;
- (void)setHasDrivingSide:(BOOL)a3;
- (void)setHasEnvironmentalCongestionZoneImpact:(BOOL)a3;
- (void)setHasExpectedTime:(BOOL)a3;
- (void)setHasHistoricTravelTime:(BOOL)a3;
- (void)setHasLicensePlateRestrictionImpact:(BOOL)a3;
- (void)setHasRouteType:(BOOL)a3;
- (void)setHasStaticTravelTime:(BOOL)a3;
- (void)setHasTollCongestionZoneImpact:(BOOL)a3;
- (void)setHasTransportType:(BOOL)a3;
- (void)setHasTravelTimeAggressiveEstimate:(BOOL)a3;
- (void)setHasTravelTimeConservativeEstimate:(BOOL)a3;
- (void)setHistoricTravelTime:(unsigned int)a3;
- (void)setIncidentEndOffsetsInRoutes:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setIncidentIndices:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setIncidentOnRouteInfos:(id)a3;
- (void)setInfrastructureDescription:(id)a3;
- (void)setLaneWidths:(id)a3;
- (void)setLaunchAndGoCardText:(id)a3;
- (void)setLicensePlateRestrictionImpact:(int)a3;
- (void)setName:(id)a3;
- (void)setOriginListInstruction:(id)a3;
- (void)setOriginWaypointInfo:(id)a3;
- (void)setPathLeg:(id)a3;
- (void)setPathMapMatcherInstructions:(id)a3;
- (void)setPhoneticName:(id)a3;
- (void)setRestrictedZoneIds:(id)a3;
- (void)setRoadComplexitys:(id)a3;
- (void)setRouteCameraInputInfos:(id)a3;
- (void)setRouteDescriptions:(id)a3;
- (void)setRouteID:(id)a3;
- (void)setRouteLabelDetailText:(id)a3;
- (void)setRouteLineStyleInfos:(id)a3;
- (void)setRouteNames:(id)a3;
- (void)setRoutePlanningDescription:(id)a3;
- (void)setRouteType:(int)a3;
- (void)setStartingRouteInstructions:(id)a3;
- (void)setStaticTravelTime:(unsigned int)a3;
- (void)setStepGroups:(id)a3;
- (void)setSteps:(id)a3;
- (void)setTollCongestionZoneImpact:(int)a3;
- (void)setTrafficColorInfos:(id)a3;
- (void)setTrafficColorOffsets:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setTrafficColors:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setTrafficDescription:(id)a3;
- (void)setTrafficDescriptionLong:(id)a3;
- (void)setTransportType:(int)a3;
- (void)setTravelTimeAggressiveEstimate:(unsigned int)a3;
- (void)setTravelTimeConservativeEstimate:(unsigned int)a3;
- (void)setUnpackedLatLngVertices:(id)a3;
- (void)setUpdateLocations:(id)a3;
- (void)setZilchPoints:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORoute

- (GEORoute)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORoute;
  v2 = [(GEORoute *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORoute)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORoute;
  v3 = [(GEORoute *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEORoute;
  [(GEORoute *)&v3 dealloc];
}

- (int)transportType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x1000) != 0) {
    return self->_transportType;
  }
  else {
    return 0;
  }
}

- (void)setTransportType:(int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 2;
  *(void *)&self->_flags |= 0x1000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_transportType = a3;
}

- (void)setHasTransportType:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 4096;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFEFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 2;
}

- (BOOL)hasTransportType
{
  return (*(void *)&self->_flags >> 12) & 1;
}

- (id)transportTypeAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E0868[a3];
  }

  return v3;
}

- (int)StringAsTransportType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AUTOMOBILE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TRANSIT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WALKING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BICYCLE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FERRY"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RIDESHARE"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readSteps
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x400000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readSteps_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (NSMutableArray)steps
{
  -[GEORoute _readSteps]((uint64_t)self);
  steps = self->_steps;

  return steps;
}

- (void)setSteps:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x400000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;
  steps = self->_steps;
  self->_steps = v4;
}

- (void)clearSteps
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x400000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;
  steps = self->_steps;

  [(NSMutableArray *)steps removeAllObjects];
}

- (void)addStep:(id)a3
{
  id v4 = a3;
  -[GEORoute _readSteps]((uint64_t)self);
  -[GEORoute _addNoFlagsStep:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEORoute *)((char *)self + 564);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x400000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 2u;
}

- (void)_addNoFlagsStep:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 432);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 432);
      *(void *)(a1 + 432) = v5;

      id v4 = *(void **)(a1 + 432);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)stepsCount
{
  -[GEORoute _readSteps]((uint64_t)self);
  steps = self->_steps;

  return [(NSMutableArray *)steps count];
}

- (id)stepAtIndex:(unint64_t)a3
{
  -[GEORoute _readSteps]((uint64_t)self);
  steps = self->_steps;

  return (id)[(NSMutableArray *)steps objectAtIndex:a3];
}

+ (Class)stepType
{
  return (Class)objc_opt_class();
}

- (void)_readName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x20000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readName_tags_6);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (NSString)name
{
  -[GEORoute _readName]((uint64_t)self);
  name = self->_name;

  return name;
}

- (void)setName:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 2;
  *(void *)&self->_flags |= 0x20000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)_readPhoneticName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x400000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readPhoneticName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (BOOL)hasPhoneticName
{
  return self->_phoneticName != 0;
}

- (NSString)phoneticName
{
  -[GEORoute _readPhoneticName]((uint64_t)self);
  phoneticName = self->_phoneticName;

  return phoneticName;
}

- (void)setPhoneticName:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 2;
  *(void *)&self->_flags |= 0x400000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_phoneticName, a3);
}

- (unsigned)distance
{
  return self->_distance;
}

- (void)setDistance:(unsigned int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 2;
  *(void *)&self->_flags |= 8uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_distance = a3;
}

- (void)setHasDistance:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 8;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFFF7 | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 2;
}

- (BOOL)hasDistance
{
  return (*(void *)&self->_flags >> 3) & 1;
}

- (unsigned)expectedTime
{
  return self->_expectedTime;
}

- (void)setExpectedTime:(unsigned int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 2;
  *(void *)&self->_flags |= 0x40uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_expectedTime = a3;
}

- (void)setHasExpectedTime:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 64;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFFBFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 2;
}

- (BOOL)hasExpectedTime
{
  return (*(void *)&self->_flags >> 6) & 1;
}

- (void)_readRouteID
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x2000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readRouteID_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (BOOL)hasRouteID
{
  return self->_routeID != 0;
}

- (NSData)routeID
{
  -[GEORoute _readRouteID]((uint64_t)self);
  routeID = self->_routeID;

  return routeID;
}

- (void)setRouteID:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 2;
  *(void *)&self->_flags |= 0x2000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_routeID, a3);
}

- (int)routeType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x200) != 0) {
    return self->_routeType;
  }
  else {
    return 0;
  }
}

- (void)setRouteType:(int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 2;
  *(void *)&self->_flags |= 0x200uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_routeType = a3;
}

- (void)setHasRouteType:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 512;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFDFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 2;
}

- (BOOL)hasRouteType
{
  return (*(void *)&self->_flags >> 9) & 1;
}

- (id)routeTypeAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E08A0[a3];
  }

  return v3;
}

- (int)StringAsRouteType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"MAIN_ROUTE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ALTERNATE_ROUTE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CONTINGENCY_ROUTE_ALTERNATE_ORIGIN"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CONTINGENCY_ROUTE_MIDDLE_OF_ROUTE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MAIN_NON_RECOMMENDED_ROUTE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ALTERNATE_NON_RECOMMENDED_ROUTE"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readZilchPoints
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(unsigned char *)(a1 + 572) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readZilchPoints_tags_5102);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (NSMutableArray)zilchPoints
{
  -[GEORoute _readZilchPoints]((uint64_t)self);
  zilchPoints = self->_zilchPoints;

  return zilchPoints;
}

- (void)setZilchPoints:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *((unsigned char *)&self->_flags + 8) |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;
  zilchPoints = self->_zilchPoints;
  self->_zilchPoints = v4;
}

- (void)clearZilchPoints
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((unsigned char *)&self->_flags + 8) |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;
  zilchPoints = self->_zilchPoints;

  [(NSMutableArray *)zilchPoints removeAllObjects];
}

- (void)addZilchPoints:(id)a3
{
  id v4 = a3;
  -[GEORoute _readZilchPoints]((uint64_t)self);
  -[GEORoute _addNoFlagsZilchPoints:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEORoute *)((char *)self + 564);
  LOBYTE(self->_reader) |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 2u;
}

- (void)_addNoFlagsZilchPoints:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 480);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 480);
      *(void *)(a1 + 480) = v5;

      id v4 = *(void **)(a1 + 480);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)zilchPointsCount
{
  -[GEORoute _readZilchPoints]((uint64_t)self);
  zilchPoints = self->_zilchPoints;

  return [(NSMutableArray *)zilchPoints count];
}

- (id)zilchPointsAtIndex:(unint64_t)a3
{
  -[GEORoute _readZilchPoints]((uint64_t)self);
  zilchPoints = self->_zilchPoints;

  return (id)[(NSMutableArray *)zilchPoints objectAtIndex:a3];
}

+ (Class)zilchPointsType
{
  return (Class)objc_opt_class();
}

- (void)_readBasicPoints
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x10000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readBasicPoints_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (NSMutableArray)basicPoints
{
  -[GEORoute _readBasicPoints]((uint64_t)self);
  basicPoints = self->_basicPoints;

  return basicPoints;
}

- (void)setBasicPoints:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x10000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;
  basicPoints = self->_basicPoints;
  self->_basicPoints = v4;
}

- (void)clearBasicPoints
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x10000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;
  basicPoints = self->_basicPoints;

  [(NSMutableArray *)basicPoints removeAllObjects];
}

- (void)addBasicPoints:(id)a3
{
  id v4 = a3;
  -[GEORoute _readBasicPoints]((uint64_t)self);
  -[GEORoute _addNoFlagsBasicPoints:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEORoute *)((char *)self + 564);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x10000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 2u;
}

- (void)_addNoFlagsBasicPoints:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 192);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 192);
      *(void *)(a1 + 192) = v5;

      id v4 = *(void **)(a1 + 192);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)basicPointsCount
{
  -[GEORoute _readBasicPoints]((uint64_t)self);
  basicPoints = self->_basicPoints;

  return [(NSMutableArray *)basicPoints count];
}

- (id)basicPointsAtIndex:(unint64_t)a3
{
  -[GEORoute _readBasicPoints]((uint64_t)self);
  basicPoints = self->_basicPoints;

  return (id)[(NSMutableArray *)basicPoints objectAtIndex:a3];
}

+ (Class)basicPointsType
{
  return (Class)objc_opt_class();
}

- (void)_readPathLeg
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x100000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readPathLeg_tags_5103);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (BOOL)hasPathLeg
{
  return self->_pathLeg != 0;
}

- (NSData)pathLeg
{
  -[GEORoute _readPathLeg]((uint64_t)self);
  pathLeg = self->_pathLeg;

  return pathLeg;
}

- (void)setPathLeg:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 2;
  *(void *)&self->_flags |= 0x100000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_pathLeg, a3);
}

- (void)_readPathMapMatcherInstructions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x200000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readPathMapMatcherInstructions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (BOOL)hasPathMapMatcherInstructions
{
  return self->_pathMapMatcherInstructions != 0;
}

- (GEOPathMapMatcherInstructions)pathMapMatcherInstructions
{
  -[GEORoute _readPathMapMatcherInstructions]((uint64_t)self);
  pathMapMatcherInstructions = self->_pathMapMatcherInstructions;

  return pathMapMatcherInstructions;
}

- (void)setPathMapMatcherInstructions:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 2;
  *(void *)&self->_flags |= 0x200000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_pathMapMatcherInstructions, a3);
}

- (int)drivingSide
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x10) != 0) {
    return self->_drivingSide;
  }
  else {
    return 0;
  }
}

- (void)setDrivingSide:(int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 2;
  *(void *)&self->_flags |= 0x10uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_drivingSide = a3;
}

- (void)setHasDrivingSide:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 16;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFFEFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 2;
}

- (BOOL)hasDrivingSide
{
  return (*(void *)&self->_flags >> 4) & 1;
}

- (id)drivingSideAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      uint64_t v4 = @"LEFT_SIDE";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v4 = @"RIGHT_SIDE";
  }
  return v4;
}

- (int)StringAsDrivingSide:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RIGHT_SIDE"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"LEFT_SIDE"];
  }

  return v4;
}

- (void)_readDepartureRouteID
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x40000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readDepartureRouteID_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (BOOL)hasDepartureRouteID
{
  return self->_departureRouteID != 0;
}

- (NSData)departureRouteID
{
  -[GEORoute _readDepartureRouteID]((uint64_t)self);
  departureRouteID = self->_departureRouteID;

  return departureRouteID;
}

- (void)setDepartureRouteID:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 2;
  *(void *)&self->_flags |= 0x40000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_departureRouteID, a3);
}

- (unsigned)departureStepID
{
  return self->_departureStepID;
}

- (void)setDepartureStepID:(unsigned int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 2;
  *(void *)&self->_flags |= 4uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_departureStepID = a3;
}

- (void)setHasDepartureStepID:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 4;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFFFBLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 2;
}

- (BOOL)hasDepartureStepID
{
  return (*(void *)&self->_flags >> 2) & 1;
}

- (void)_readArrivalRouteID
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x8000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readArrivalRouteID_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (BOOL)hasArrivalRouteID
{
  return self->_arrivalRouteID != 0;
}

- (NSData)arrivalRouteID
{
  -[GEORoute _readArrivalRouteID]((uint64_t)self);
  arrivalRouteID = self->_arrivalRouteID;

  return arrivalRouteID;
}

- (void)setArrivalRouteID:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 2;
  *(void *)&self->_flags |= 0x8000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_arrivalRouteID, a3);
}

- (unsigned)arrivalStepID
{
  return self->_arrivalStepID;
}

- (void)setArrivalStepID:(unsigned int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 2;
  *(void *)&self->_flags |= 1uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_arrivalStepID = a3;
}

- (void)setHasArrivalStepID:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 2;
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3;
  *((unsigned char *)&self->_flags + 8) = v3;
}

- (BOOL)hasArrivalStepID
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)_readTrafficColors
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x1000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readTrafficColors_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (unint64_t)trafficColorsCount
{
  return self->_trafficColors.count;
}

- (unsigned)trafficColors
{
  return self->_trafficColors.list;
}

- (void)clearTrafficColors
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;

  PBRepeatedUInt32Clear();
}

- (void)addTrafficColor:(unsigned int)a3
{
  -[GEORoute _readTrafficColors]((uint64_t)self);
  if (self) {
    PBRepeatedUInt32Add();
  }
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_uint64_t flags = &self->_flags;
  *(void *)p_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)p_flags + 8) |= 2u;
}

- (unsigned)trafficColorAtIndex:(unint64_t)a3
{
  -[GEORoute _readTrafficColors]((uint64_t)self);
  p_trafficColors = &self->_trafficColors;
  unint64_t count = self->_trafficColors.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_trafficColors->list[a3];
}

- (void)setTrafficColors:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;

  MEMORY[0x1F4147400](&self->_trafficColors, a3, a4);
}

- (void)_readTrafficColorOffsets
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x800000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readTrafficColorOffsets_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (unint64_t)trafficColorOffsetsCount
{
  return self->_trafficColorOffsets.count;
}

- (unsigned)trafficColorOffsets
{
  return self->_trafficColorOffsets.list;
}

- (void)clearTrafficColorOffsets
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;

  PBRepeatedUInt32Clear();
}

- (void)addTrafficColorOffset:(unsigned int)a3
{
  -[GEORoute _readTrafficColorOffsets]((uint64_t)self);
  if (self) {
    PBRepeatedUInt32Add();
  }
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_uint64_t flags = &self->_flags;
  *(void *)p_flags |= 0x800000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)p_flags + 8) |= 2u;
}

- (unsigned)trafficColorOffsetAtIndex:(unint64_t)a3
{
  -[GEORoute _readTrafficColorOffsets]((uint64_t)self);
  p_trafficColorOffsets = &self->_trafficColorOffsets;
  unint64_t count = self->_trafficColorOffsets.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_trafficColorOffsets->list[a3];
}

- (void)setTrafficColorOffsets:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;

  MEMORY[0x1F4147400](&self->_trafficColorOffsets, a3, a4);
}

- (void)_readRouteLineStyleInfos
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x40000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readRouteLineStyleInfos_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (NSMutableArray)routeLineStyleInfos
{
  -[GEORoute _readRouteLineStyleInfos]((uint64_t)self);
  routeLineStyleInfos = self->_routeLineStyleInfos;

  return routeLineStyleInfos;
}

- (void)setRouteLineStyleInfos:(id)a3
{
  uint64_t v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x40000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;
  routeLineStyleInfos = self->_routeLineStyleInfos;
  self->_routeLineStyleInfos = v4;
}

- (void)clearRouteLineStyleInfos
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x40000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;
  routeLineStyleInfos = self->_routeLineStyleInfos;

  [(NSMutableArray *)routeLineStyleInfos removeAllObjects];
}

- (void)addRouteLineStyleInfo:(id)a3
{
  id v4 = a3;
  -[GEORoute _readRouteLineStyleInfos]((uint64_t)self);
  -[GEORoute _addNoFlagsRouteLineStyleInfo:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEORoute *)((char *)self + 564);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x40000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 2u;
}

- (void)_addNoFlagsRouteLineStyleInfo:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 400);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 400);
      *(void *)(a1 + 400) = v5;

      id v4 = *(void **)(a1 + 400);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)routeLineStyleInfosCount
{
  -[GEORoute _readRouteLineStyleInfos]((uint64_t)self);
  routeLineStyleInfos = self->_routeLineStyleInfos;

  return [(NSMutableArray *)routeLineStyleInfos count];
}

- (id)routeLineStyleInfoAtIndex:(unint64_t)a3
{
  -[GEORoute _readRouteLineStyleInfos]((uint64_t)self);
  routeLineStyleInfos = self->_routeLineStyleInfos;

  return (id)[(NSMutableArray *)routeLineStyleInfos objectAtIndex:a3];
}

+ (Class)routeLineStyleInfoType
{
  return (Class)objc_opt_class();
}

- (void)_readRouteCameraInputInfos
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x8000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readRouteCameraInputInfos_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (NSMutableArray)routeCameraInputInfos
{
  -[GEORoute _readRouteCameraInputInfos]((uint64_t)self);
  routeCameraInputInfos = self->_routeCameraInputInfos;

  return routeCameraInputInfos;
}

- (void)setRouteCameraInputInfos:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x8000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;
  routeCameraInputInfos = self->_routeCameraInputInfos;
  self->_routeCameraInputInfos = v4;
}

- (void)clearRouteCameraInputInfos
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x8000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;
  routeCameraInputInfos = self->_routeCameraInputInfos;

  [(NSMutableArray *)routeCameraInputInfos removeAllObjects];
}

- (void)addRouteCameraInputInfo:(id)a3
{
  id v4 = a3;
  -[GEORoute _readRouteCameraInputInfos]((uint64_t)self);
  -[GEORoute _addNoFlagsRouteCameraInputInfo:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEORoute *)((char *)self + 564);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x8000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 2u;
}

- (void)_addNoFlagsRouteCameraInputInfo:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 376);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 376);
      *(void *)(a1 + 376) = v5;

      id v4 = *(void **)(a1 + 376);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)routeCameraInputInfosCount
{
  -[GEORoute _readRouteCameraInputInfos]((uint64_t)self);
  routeCameraInputInfos = self->_routeCameraInputInfos;

  return [(NSMutableArray *)routeCameraInputInfos count];
}

- (id)routeCameraInputInfoAtIndex:(unint64_t)a3
{
  -[GEORoute _readRouteCameraInputInfos]((uint64_t)self);
  routeCameraInputInfos = self->_routeCameraInputInfos;

  return (id)[(NSMutableArray *)routeCameraInputInfos objectAtIndex:a3];
}

+ (Class)routeCameraInputInfoType
{
  return (Class)objc_opt_class();
}

- (void)_readTrafficColorInfos
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x800000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readTrafficColorInfos_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (NSMutableArray)trafficColorInfos
{
  -[GEORoute _readTrafficColorInfos]((uint64_t)self);
  trafficColorInfos = self->_trafficColorInfos;

  return trafficColorInfos;
}

- (void)setTrafficColorInfos:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;
  trafficColorInfos = self->_trafficColorInfos;
  self->_trafficColorInfos = v4;
}

- (void)clearTrafficColorInfos
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;
  trafficColorInfos = self->_trafficColorInfos;

  [(NSMutableArray *)trafficColorInfos removeAllObjects];
}

- (void)addTrafficColorInfo:(id)a3
{
  id v4 = a3;
  -[GEORoute _readTrafficColorInfos]((uint64_t)self);
  -[GEORoute _addNoFlagsTrafficColorInfo:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEORoute *)((char *)self + 564);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x800000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 2u;
}

- (void)_addNoFlagsTrafficColorInfo:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 440);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 440);
      *(void *)(a1 + 440) = v5;

      id v4 = *(void **)(a1 + 440);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)trafficColorInfosCount
{
  -[GEORoute _readTrafficColorInfos]((uint64_t)self);
  trafficColorInfos = self->_trafficColorInfos;

  return [(NSMutableArray *)trafficColorInfos count];
}

- (id)trafficColorInfoAtIndex:(unint64_t)a3
{
  -[GEORoute _readTrafficColorInfos]((uint64_t)self);
  trafficColorInfos = self->_trafficColorInfos;

  return (id)[(NSMutableArray *)trafficColorInfos objectAtIndex:a3];
}

+ (Class)trafficColorInfoType
{
  return (Class)objc_opt_class();
}

- (void)_readRouteNames
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x4000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readRouteNames_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (NSMutableArray)routeNames
{
  -[GEORoute _readRouteNames]((uint64_t)self);
  routeNames = self->_routeNames;

  return routeNames;
}

- (void)setRouteNames:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x4000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;
  routeNames = self->_routeNames;
  self->_routeNames = v4;
}

- (void)clearRouteNames
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x4000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;
  routeNames = self->_routeNames;

  [(NSMutableArray *)routeNames removeAllObjects];
}

- (void)addRouteName:(id)a3
{
  id v4 = a3;
  -[GEORoute _readRouteNames]((uint64_t)self);
  -[GEORoute _addNoFlagsRouteName:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEORoute *)((char *)self + 564);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x4000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 2u;
}

- (void)_addNoFlagsRouteName:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 368);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 368);
      *(void *)(a1 + 368) = v5;

      id v4 = *(void **)(a1 + 368);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)routeNamesCount
{
  -[GEORoute _readRouteNames]((uint64_t)self);
  routeNames = self->_routeNames;

  return [(NSMutableArray *)routeNames count];
}

- (id)routeNameAtIndex:(unint64_t)a3
{
  -[GEORoute _readRouteNames]((uint64_t)self);
  routeNames = self->_routeNames;

  return (id)[(NSMutableArray *)routeNames objectAtIndex:a3];
}

+ (Class)routeNameType
{
  return (Class)objc_opt_class();
}

- (unsigned)historicTravelTime
{
  return self->_historicTravelTime;
}

- (void)setHistoricTravelTime:(unsigned int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 2;
  *(void *)&self->_flags |= 0x80uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_historicTravelTime = a3;
}

- (void)setHasHistoricTravelTime:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 128;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFF7FLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 2;
}

- (BOOL)hasHistoricTravelTime
{
  return (*(void *)&self->_flags >> 7) & 1;
}

- (void)_readAdvisoryNotices
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x2000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readAdvisoryNotices_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (NSMutableArray)advisoryNotices
{
  -[GEORoute _readAdvisoryNotices]((uint64_t)self);
  advisoryNotices = self->_advisoryNotices;

  return advisoryNotices;
}

- (void)setAdvisoryNotices:(id)a3
{
  uint64_t v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x2000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;
  advisoryNotices = self->_advisoryNotices;
  self->_advisoryNotices = v4;
}

- (void)clearAdvisoryNotices
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x2000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;
  advisoryNotices = self->_advisoryNotices;

  [(NSMutableArray *)advisoryNotices removeAllObjects];
}

- (void)addAdvisoryNotice:(id)a3
{
  id v4 = a3;
  -[GEORoute _readAdvisoryNotices]((uint64_t)self);
  -[GEORoute _addNoFlagsAdvisoryNotice:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEORoute *)((char *)self + 564);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x2000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 2u;
}

- (void)_addNoFlagsAdvisoryNotice:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 168);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 168);
      *(void *)(a1 + 168) = v5;

      id v4 = *(void **)(a1 + 168);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)advisoryNoticesCount
{
  -[GEORoute _readAdvisoryNotices]((uint64_t)self);
  advisoryNotices = self->_advisoryNotices;

  return [(NSMutableArray *)advisoryNotices count];
}

- (id)advisoryNoticeAtIndex:(unint64_t)a3
{
  -[GEORoute _readAdvisoryNotices]((uint64_t)self);
  advisoryNotices = self->_advisoryNotices;

  return (id)[(NSMutableArray *)advisoryNotices objectAtIndex:a3];
}

+ (Class)advisoryNoticeType
{
  return (Class)objc_opt_class();
}

- (void)_readRouteLabelDetailText
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x20000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readRouteLabelDetailText_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (BOOL)hasRouteLabelDetailText
{
  return self->_routeLabelDetailText != 0;
}

- (GEOFormattedString)routeLabelDetailText
{
  -[GEORoute _readRouteLabelDetailText]((uint64_t)self);
  routeLabelDetailText = self->_routeLabelDetailText;

  return routeLabelDetailText;
}

- (void)setRouteLabelDetailText:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 2;
  *(void *)&self->_flags |= 0x20000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_routeLabelDetailText, a3);
}

- (void)_readInfrastructureDescription
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x4000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readInfrastructureDescription_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (BOOL)hasInfrastructureDescription
{
  return self->_infrastructureDescription != 0;
}

- (GEOFormattedString)infrastructureDescription
{
  -[GEORoute _readInfrastructureDescription]((uint64_t)self);
  infrastructureDescription = self->_infrastructureDescription;

  return infrastructureDescription;
}

- (void)setInfrastructureDescription:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 2;
  *(void *)&self->_flags |= 0x4000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_infrastructureDescription, a3);
}

- (void)_readClickableAdvisory
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x20000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readClickableAdvisory_tags_5107);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (BOOL)hasClickableAdvisory
{
  return self->_clickableAdvisory != 0;
}

- (GEOClickableAdvisory)clickableAdvisory
{
  -[GEORoute _readClickableAdvisory]((uint64_t)self);
  clickableAdvisory = self->_clickableAdvisory;

  return clickableAdvisory;
}

- (void)setClickableAdvisory:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 2;
  *(void *)&self->_flags |= 0x20000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_clickableAdvisory, a3);
}

- (unsigned)travelTimeAggressiveEstimate
{
  return self->_travelTimeAggressiveEstimate;
}

- (void)setTravelTimeAggressiveEstimate:(unsigned int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 2;
  *(void *)&self->_flags |= 0x2000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_travelTimeAggressiveEstimate = a3;
}

- (void)setHasTravelTimeAggressiveEstimate:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x2000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFDFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 2;
}

- (BOOL)hasTravelTimeAggressiveEstimate
{
  return (*(void *)&self->_flags >> 13) & 1;
}

- (unsigned)travelTimeConservativeEstimate
{
  return self->_travelTimeConservativeEstimate;
}

- (void)setTravelTimeConservativeEstimate:(unsigned int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 2;
  *(void *)&self->_flags |= 0x4000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_travelTimeConservativeEstimate = a3;
}

- (void)setHasTravelTimeConservativeEstimate:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x4000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFBFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 2;
}

- (BOOL)hasTravelTimeConservativeEstimate
{
  return (*(void *)&self->_flags >> 14) & 1;
}

- (unsigned)staticTravelTime
{
  return self->_staticTravelTime;
}

- (void)setStaticTravelTime:(unsigned int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 2;
  *(void *)&self->_flags |= 0x400uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_staticTravelTime = a3;
}

- (void)setHasStaticTravelTime:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 1024;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFBFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 2;
}

- (BOOL)hasStaticTravelTime
{
  return (*(void *)&self->_flags >> 10) & 1;
}

- (BOOL)avoidsTolls
{
  return self->_avoidsTolls;
}

- (void)setAvoidsTolls:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 2;
  *(void *)&self->_flags |= 0x10000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_avoidsTolls = a3;
}

- (void)setHasAvoidsTolls:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x10000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFEFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 2;
}

- (BOOL)hasAvoidsTolls
{
  return (*(void *)&self->_flags >> 16) & 1;
}

- (BOOL)avoidsHighways
{
  return self->_avoidsHighways;
}

- (void)setAvoidsHighways:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 2;
  *(void *)&self->_flags |= 0x8000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_avoidsHighways = a3;
}

- (void)setHasAvoidsHighways:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x8000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFF7FFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 2;
}

- (BOOL)hasAvoidsHighways
{
  return (*(void *)&self->_flags >> 15) & 1;
}

- (BOOL)avoidsTraffic
{
  return self->_avoidsTraffic;
}

- (void)setAvoidsTraffic:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 2;
  *(void *)&self->_flags |= 0x20000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_avoidsTraffic = a3;
}

- (void)setHasAvoidsTraffic:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x20000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFDFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 2;
}

- (BOOL)hasAvoidsTraffic
{
  return (*(void *)&self->_flags >> 17) & 1;
}

- (void)_readEnrouteNotices
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x800000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readEnrouteNotices_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (NSMutableArray)enrouteNotices
{
  -[GEORoute _readEnrouteNotices]((uint64_t)self);
  enrouteNotices = self->_enrouteNotices;

  return enrouteNotices;
}

- (void)setEnrouteNotices:(id)a3
{
  uint64_t v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;
  enrouteNotices = self->_enrouteNotices;
  self->_enrouteNotices = v4;
}

- (void)clearEnrouteNotices
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;
  enrouteNotices = self->_enrouteNotices;

  [(NSMutableArray *)enrouteNotices removeAllObjects];
}

- (void)addEnrouteNotice:(id)a3
{
  id v4 = a3;
  -[GEORoute _readEnrouteNotices]((uint64_t)self);
  -[GEORoute _addNoFlagsEnrouteNotice:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEORoute *)((char *)self + 564);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x800000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 2u;
}

- (void)_addNoFlagsEnrouteNotice:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 248);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 248);
      *(void *)(a1 + 248) = v5;

      id v4 = *(void **)(a1 + 248);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)enrouteNoticesCount
{
  -[GEORoute _readEnrouteNotices]((uint64_t)self);
  enrouteNotices = self->_enrouteNotices;

  return [(NSMutableArray *)enrouteNotices count];
}

- (id)enrouteNoticeAtIndex:(unint64_t)a3
{
  -[GEORoute _readEnrouteNotices]((uint64_t)self);
  enrouteNotices = self->_enrouteNotices;

  return (id)[(NSMutableArray *)enrouteNotices objectAtIndex:a3];
}

+ (Class)enrouteNoticeType
{
  return (Class)objc_opt_class();
}

- (void)_readUnpackedLatLngVertices
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x4000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readUnpackedLatLngVertices_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (BOOL)hasUnpackedLatLngVertices
{
  return self->_unpackedLatLngVertices != 0;
}

- (NSData)unpackedLatLngVertices
{
  -[GEORoute _readUnpackedLatLngVertices]((uint64_t)self);
  unpackedLatLngVertices = self->_unpackedLatLngVertices;

  return unpackedLatLngVertices;
}

- (void)setUnpackedLatLngVertices:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 2;
  *(void *)&self->_flags |= 0x4000000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_unpackedLatLngVertices, a3);
}

- (void)_readIncidentIndices
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x400000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readIncidentIndices_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (unint64_t)incidentIndicesCount
{
  return self->_incidentIndices.count;
}

- (unsigned)incidentIndices
{
  return self->_incidentIndices.list;
}

- (void)clearIncidentIndices
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x400000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;

  PBRepeatedUInt32Clear();
}

- (void)addIncidentIndices:(unsigned int)a3
{
  -[GEORoute _readIncidentIndices]((uint64_t)self);
  if (self) {
    PBRepeatedUInt32Add();
  }
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_uint64_t flags = &self->_flags;
  *(void *)p_flags |= 0x400000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)p_flags + 8) |= 2u;
}

- (unsigned)incidentIndicesAtIndex:(unint64_t)a3
{
  -[GEORoute _readIncidentIndices]((uint64_t)self);
  p_incidentIndices = &self->_incidentIndices;
  unint64_t count = self->_incidentIndices.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_incidentIndices->list[a3];
}

- (void)setIncidentIndices:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x400000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;

  MEMORY[0x1F4147400](&self->_incidentIndices, a3, a4);
}

- (void)_readIncidentEndOffsetsInRoutes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x200000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readIncidentEndOffsetsInRoutes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (unint64_t)incidentEndOffsetsInRoutesCount
{
  return self->_incidentEndOffsetsInRoutes.count;
}

- (unsigned)incidentEndOffsetsInRoutes
{
  return self->_incidentEndOffsetsInRoutes.list;
}

- (void)clearIncidentEndOffsetsInRoutes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x200000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;

  PBRepeatedUInt32Clear();
}

- (void)addIncidentEndOffsetsInRoute:(unsigned int)a3
{
  -[GEORoute _readIncidentEndOffsetsInRoutes]((uint64_t)self);
  if (self) {
    PBRepeatedUInt32Add();
  }
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_uint64_t flags = &self->_flags;
  *(void *)p_flags |= 0x200000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)p_flags + 8) |= 2u;
}

- (unsigned)incidentEndOffsetsInRouteAtIndex:(unint64_t)a3
{
  -[GEORoute _readIncidentEndOffsetsInRoutes]((uint64_t)self);
  p_incidentEndOffsetsInRoutes = &self->_incidentEndOffsetsInRoutes;
  unint64_t count = self->_incidentEndOffsetsInRoutes.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_incidentEndOffsetsInRoutes->list[a3];
}

- (void)setIncidentEndOffsetsInRoutes:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x200000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;

  MEMORY[0x1F4147400](&self->_incidentEndOffsetsInRoutes, a3, a4);
}

- (void)_readIncidentOnRouteInfos
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x2000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readIncidentOnRouteInfos_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (NSMutableArray)incidentOnRouteInfos
{
  -[GEORoute _readIncidentOnRouteInfos]((uint64_t)self);
  incidentOnRouteInfos = self->_incidentOnRouteInfos;

  return incidentOnRouteInfos;
}

- (void)setIncidentOnRouteInfos:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x2000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;
  incidentOnRouteInfos = self->_incidentOnRouteInfos;
  self->_incidentOnRouteInfos = v4;
}

- (void)clearIncidentOnRouteInfos
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x2000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;
  incidentOnRouteInfos = self->_incidentOnRouteInfos;

  [(NSMutableArray *)incidentOnRouteInfos removeAllObjects];
}

- (void)addIncidentOnRouteInfo:(id)a3
{
  id v4 = a3;
  -[GEORoute _readIncidentOnRouteInfos]((uint64_t)self);
  -[GEORoute _addNoFlagsIncidentOnRouteInfo:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEORoute *)((char *)self + 564);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x2000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 2u;
}

- (void)_addNoFlagsIncidentOnRouteInfo:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 264);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 264);
      *(void *)(a1 + 264) = v5;

      id v4 = *(void **)(a1 + 264);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)incidentOnRouteInfosCount
{
  -[GEORoute _readIncidentOnRouteInfos]((uint64_t)self);
  incidentOnRouteInfos = self->_incidentOnRouteInfos;

  return [(NSMutableArray *)incidentOnRouteInfos count];
}

- (id)incidentOnRouteInfoAtIndex:(unint64_t)a3
{
  -[GEORoute _readIncidentOnRouteInfos]((uint64_t)self);
  incidentOnRouteInfos = self->_incidentOnRouteInfos;

  return (id)[(NSMutableArray *)incidentOnRouteInfos objectAtIndex:a3];
}

+ (Class)incidentOnRouteInfoType
{
  return (Class)objc_opt_class();
}

- (void)_readRoutePlanningDescription
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x80000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readRoutePlanningDescription_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (BOOL)hasRoutePlanningDescription
{
  return self->_routePlanningDescription != 0;
}

- (GEORouteInformation)routePlanningDescription
{
  -[GEORoute _readRoutePlanningDescription]((uint64_t)self);
  routePlanningDescription = self->_routePlanningDescription;

  return routePlanningDescription;
}

- (void)setRoutePlanningDescription:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 2;
  *(void *)&self->_flags |= 0x80000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_routePlanningDescription, a3);
}

- (void)_readRouteDescriptions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x10000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readRouteDescriptions_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (NSMutableArray)routeDescriptions
{
  -[GEORoute _readRouteDescriptions]((uint64_t)self);
  routeDescriptions = self->_routeDescriptions;

  return routeDescriptions;
}

- (void)setRouteDescriptions:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x10000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;
  routeDescriptions = self->_routeDescriptions;
  self->_routeDescriptions = v4;
}

- (void)clearRouteDescriptions
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x10000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;
  routeDescriptions = self->_routeDescriptions;

  [(NSMutableArray *)routeDescriptions removeAllObjects];
}

- (void)addRouteDescription:(id)a3
{
  id v4 = a3;
  -[GEORoute _readRouteDescriptions]((uint64_t)self);
  -[GEORoute _addNoFlagsRouteDescription:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEORoute *)((char *)self + 564);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x10000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 2u;
}

- (void)_addNoFlagsRouteDescription:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 384);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 384);
      *(void *)(a1 + 384) = v5;

      id v4 = *(void **)(a1 + 384);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)routeDescriptionsCount
{
  -[GEORoute _readRouteDescriptions]((uint64_t)self);
  routeDescriptions = self->_routeDescriptions;

  return [(NSMutableArray *)routeDescriptions count];
}

- (id)routeDescriptionAtIndex:(unint64_t)a3
{
  -[GEORoute _readRouteDescriptions]((uint64_t)self);
  routeDescriptions = self->_routeDescriptions;

  return (id)[(NSMutableArray *)routeDescriptions objectAtIndex:a3];
}

+ (Class)routeDescriptionType
{
  return (Class)objc_opt_class();
}

- (void)_readStartingRouteInstructions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x100000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readStartingRouteInstructions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (NSMutableArray)startingRouteInstructions
{
  -[GEORoute _readStartingRouteInstructions]((uint64_t)self);
  startingRouteInstructions = self->_startingRouteInstructions;

  return startingRouteInstructions;
}

- (void)setStartingRouteInstructions:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x100000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;
  startingRouteInstructions = self->_startingRouteInstructions;
  self->_startingRouteInstructions = v4;
}

- (void)clearStartingRouteInstructions
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x100000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;
  startingRouteInstructions = self->_startingRouteInstructions;

  [(NSMutableArray *)startingRouteInstructions removeAllObjects];
}

- (void)addStartingRouteInstruction:(id)a3
{
  id v4 = a3;
  -[GEORoute _readStartingRouteInstructions]((uint64_t)self);
  -[GEORoute _addNoFlagsStartingRouteInstruction:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEORoute *)((char *)self + 564);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x100000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 2u;
}

- (void)_addNoFlagsStartingRouteInstruction:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 416);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 416);
      *(void *)(a1 + 416) = v5;

      id v4 = *(void **)(a1 + 416);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)startingRouteInstructionsCount
{
  -[GEORoute _readStartingRouteInstructions]((uint64_t)self);
  startingRouteInstructions = self->_startingRouteInstructions;

  return [(NSMutableArray *)startingRouteInstructions count];
}

- (id)startingRouteInstructionAtIndex:(unint64_t)a3
{
  -[GEORoute _readStartingRouteInstructions]((uint64_t)self);
  startingRouteInstructions = self->_startingRouteInstructions;

  return (id)[(NSMutableArray *)startingRouteInstructions objectAtIndex:a3];
}

+ (Class)startingRouteInstructionType
{
  return (Class)objc_opt_class();
}

- (void)_readEndingRouteInstructions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x400000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readEndingRouteInstructions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (NSMutableArray)endingRouteInstructions
{
  -[GEORoute _readEndingRouteInstructions]((uint64_t)self);
  endingRouteInstructions = self->_endingRouteInstructions;

  return endingRouteInstructions;
}

- (void)setEndingRouteInstructions:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x400000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;
  endingRouteInstructions = self->_endingRouteInstructions;
  self->_endingRouteInstructions = v4;
}

- (void)clearEndingRouteInstructions
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x400000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;
  endingRouteInstructions = self->_endingRouteInstructions;

  [(NSMutableArray *)endingRouteInstructions removeAllObjects];
}

- (void)addEndingRouteInstruction:(id)a3
{
  id v4 = a3;
  -[GEORoute _readEndingRouteInstructions]((uint64_t)self);
  -[GEORoute _addNoFlagsEndingRouteInstruction:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEORoute *)((char *)self + 564);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x400000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 2u;
}

- (void)_addNoFlagsEndingRouteInstruction:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 240);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 240);
      *(void *)(a1 + 240) = v5;

      id v4 = *(void **)(a1 + 240);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)endingRouteInstructionsCount
{
  -[GEORoute _readEndingRouteInstructions]((uint64_t)self);
  endingRouteInstructions = self->_endingRouteInstructions;

  return [(NSMutableArray *)endingRouteInstructions count];
}

- (id)endingRouteInstructionAtIndex:(unint64_t)a3
{
  -[GEORoute _readEndingRouteInstructions]((uint64_t)self);
  endingRouteInstructions = self->_endingRouteInstructions;

  return (id)[(NSMutableArray *)endingRouteInstructions objectAtIndex:a3];
}

+ (Class)endingRouteInstructionType
{
  return (Class)objc_opt_class();
}

- (void)_readTrafficDescription
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x2000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readTrafficDescription_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (BOOL)hasTrafficDescription
{
  return self->_trafficDescription != 0;
}

- (NSString)trafficDescription
{
  -[GEORoute _readTrafficDescription]((uint64_t)self);
  trafficDescription = self->_trafficDescription;

  return trafficDescription;
}

- (void)setTrafficDescription:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 2;
  *(void *)&self->_flags |= 0x2000000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_trafficDescription, a3);
}

- (void)_readTrafficDescriptionLong
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x1000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readTrafficDescriptionLong_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (BOOL)hasTrafficDescriptionLong
{
  return self->_trafficDescriptionLong != 0;
}

- (NSString)trafficDescriptionLong
{
  -[GEORoute _readTrafficDescriptionLong]((uint64_t)self);
  trafficDescriptionLong = self->_trafficDescriptionLong;

  return trafficDescriptionLong;
}

- (void)setTrafficDescriptionLong:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 2;
  *(void *)&self->_flags |= 0x1000000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_trafficDescriptionLong, a3);
}

- (void)_readAlertNonRecommendedRouteText
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x4000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readAlertNonRecommendedRouteText_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (BOOL)hasAlertNonRecommendedRouteText
{
  return self->_alertNonRecommendedRouteText != 0;
}

- (GEOAlertNonRecommendedRouteText)alertNonRecommendedRouteText
{
  -[GEORoute _readAlertNonRecommendedRouteText]((uint64_t)self);
  alertNonRecommendedRouteText = self->_alertNonRecommendedRouteText;

  return alertNonRecommendedRouteText;
}

- (void)setAlertNonRecommendedRouteText:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 2;
  *(void *)&self->_flags |= 0x4000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_alertNonRecommendedRouteText, a3);
}

- (void)_readGuidanceEvents
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x1000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readGuidanceEvents_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (NSMutableArray)guidanceEvents
{
  -[GEORoute _readGuidanceEvents]((uint64_t)self);
  guidanceEvents = self->_guidanceEvents;

  return guidanceEvents;
}

- (void)setGuidanceEvents:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;
  guidanceEvents = self->_guidanceEvents;
  self->_guidanceEvents = v4;
}

- (void)clearGuidanceEvents
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;
  guidanceEvents = self->_guidanceEvents;

  [(NSMutableArray *)guidanceEvents removeAllObjects];
}

- (void)addGuidanceEvent:(id)a3
{
  id v4 = a3;
  -[GEORoute _readGuidanceEvents]((uint64_t)self);
  -[GEORoute _addNoFlagsGuidanceEvent:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEORoute *)((char *)self + 564);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x1000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 2u;
}

- (void)_addNoFlagsGuidanceEvent:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 256);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 256);
      *(void *)(a1 + 256) = v5;

      id v4 = *(void **)(a1 + 256);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)guidanceEventsCount
{
  -[GEORoute _readGuidanceEvents]((uint64_t)self);
  guidanceEvents = self->_guidanceEvents;

  return [(NSMutableArray *)guidanceEvents count];
}

- (id)guidanceEventAtIndex:(unint64_t)a3
{
  -[GEORoute _readGuidanceEvents]((uint64_t)self);
  guidanceEvents = self->_guidanceEvents;

  return (id)[(NSMutableArray *)guidanceEvents objectAtIndex:a3];
}

+ (Class)guidanceEventType
{
  return (Class)objc_opt_class();
}

- (void)_readLaunchAndGoCardText
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x10000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readLaunchAndGoCardText_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (BOOL)hasLaunchAndGoCardText
{
  return self->_launchAndGoCardText != 0;
}

- (GEOLaunchAndGoCardText)launchAndGoCardText
{
  -[GEORoute _readLaunchAndGoCardText]((uint64_t)self);
  launchAndGoCardText = self->_launchAndGoCardText;

  return launchAndGoCardText;
}

- (void)setLaunchAndGoCardText:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 2;
  *(void *)&self->_flags |= 0x10000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_launchAndGoCardText, a3);
}

- (void)_readRoadComplexitys
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x1000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readRoadComplexitys_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (NSMutableArray)roadComplexitys
{
  -[GEORoute _readRoadComplexitys]((uint64_t)self);
  roadComplexitys = self->_roadComplexitys;

  return roadComplexitys;
}

- (void)setRoadComplexitys:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;
  roadComplexitys = self->_roadComplexitys;
  self->_roadComplexitys = v4;
}

- (void)clearRoadComplexitys
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;
  roadComplexitys = self->_roadComplexitys;

  [(NSMutableArray *)roadComplexitys removeAllObjects];
}

- (void)addRoadComplexity:(id)a3
{
  id v4 = a3;
  -[GEORoute _readRoadComplexitys]((uint64_t)self);
  -[GEORoute _addNoFlagsRoadComplexity:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEORoute *)((char *)self + 564);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x1000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 2u;
}

- (void)_addNoFlagsRoadComplexity:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 352);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 352);
      *(void *)(a1 + 352) = v5;

      id v4 = *(void **)(a1 + 352);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)roadComplexitysCount
{
  -[GEORoute _readRoadComplexitys]((uint64_t)self);
  roadComplexitys = self->_roadComplexitys;

  return [(NSMutableArray *)roadComplexitys count];
}

- (id)roadComplexityAtIndex:(unint64_t)a3
{
  -[GEORoute _readRoadComplexitys]((uint64_t)self);
  roadComplexitys = self->_roadComplexitys;

  return (id)[(NSMutableArray *)roadComplexitys objectAtIndex:a3];
}

+ (Class)roadComplexityType
{
  return (Class)objc_opt_class();
}

- (void)_readLaneWidths
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x8000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readLaneWidths_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (NSMutableArray)laneWidths
{
  -[GEORoute _readLaneWidths]((uint64_t)self);
  laneWidths = self->_laneWidths;

  return laneWidths;
}

- (void)setLaneWidths:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x8000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;
  laneWidths = self->_laneWidths;
  self->_laneWidths = v4;
}

- (void)clearLaneWidths
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x8000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;
  laneWidths = self->_laneWidths;

  [(NSMutableArray *)laneWidths removeAllObjects];
}

- (void)addLaneWidth:(id)a3
{
  id v4 = a3;
  -[GEORoute _readLaneWidths]((uint64_t)self);
  -[GEORoute _addNoFlagsLaneWidth:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEORoute *)((char *)self + 564);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x8000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 2u;
}

- (void)_addNoFlagsLaneWidth:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 280);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 280);
      *(void *)(a1 + 280) = v5;

      id v4 = *(void **)(a1 + 280);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)laneWidthsCount
{
  -[GEORoute _readLaneWidths]((uint64_t)self);
  laneWidths = self->_laneWidths;

  return [(NSMutableArray *)laneWidths count];
}

- (id)laneWidthAtIndex:(unint64_t)a3
{
  -[GEORoute _readLaneWidths]((uint64_t)self);
  laneWidths = self->_laneWidths;

  return (id)[(NSMutableArray *)laneWidths objectAtIndex:a3];
}

+ (Class)laneWidthType
{
  return (Class)objc_opt_class();
}

- (void)_readElevationProfile
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x200000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readElevationProfile_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (BOOL)hasElevationProfile
{
  return self->_elevationProfile != 0;
}

- (GEOElevationProfile)elevationProfile
{
  -[GEORoute _readElevationProfile]((uint64_t)self);
  elevationProfile = self->_elevationProfile;

  return elevationProfile;
}

- (void)setElevationProfile:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 2;
  *(void *)&self->_flags |= 0x200000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_elevationProfile, a3);
}

- (unsigned)arrivalParameterIndex
{
  return self->_arrivalParameterIndex;
}

- (void)setArrivalParameterIndex:(unsigned int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 2;
  *(void *)&self->_flags |= 2uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_arrivalParameterIndex = a3;
}

- (void)setHasArrivalParameterIndex:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 2;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFFFDLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 2;
}

- (BOOL)hasArrivalParameterIndex
{
  return (*(void *)&self->_flags >> 1) & 1;
}

- (void)_readRestrictedZoneIds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x800000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readRestrictedZoneIds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (NSMutableArray)restrictedZoneIds
{
  -[GEORoute _readRestrictedZoneIds]((uint64_t)self);
  restrictedZoneIds = self->_restrictedZoneIds;

  return restrictedZoneIds;
}

- (void)setRestrictedZoneIds:(id)a3
{
  uint64_t v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;
  restrictedZoneIds = self->_restrictedZoneIds;
  self->_restrictedZoneIds = v4;
}

- (void)clearRestrictedZoneIds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;
  restrictedZoneIds = self->_restrictedZoneIds;

  [(NSMutableArray *)restrictedZoneIds removeAllObjects];
}

- (void)addRestrictedZoneIds:(id)a3
{
  id v4 = a3;
  -[GEORoute _readRestrictedZoneIds]((uint64_t)self);
  -[GEORoute _addNoFlagsRestrictedZoneIds:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEORoute *)((char *)self + 564);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x800000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 2u;
}

- (void)_addNoFlagsRestrictedZoneIds:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 344);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 344);
      *(void *)(a1 + 344) = v5;

      id v4 = *(void **)(a1 + 344);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)restrictedZoneIdsCount
{
  -[GEORoute _readRestrictedZoneIds]((uint64_t)self);
  restrictedZoneIds = self->_restrictedZoneIds;

  return [(NSMutableArray *)restrictedZoneIds count];
}

- (id)restrictedZoneIdsAtIndex:(unint64_t)a3
{
  -[GEORoute _readRestrictedZoneIds]((uint64_t)self);
  restrictedZoneIds = self->_restrictedZoneIds;

  return (id)[(NSMutableArray *)restrictedZoneIds objectAtIndex:a3];
}

+ (Class)restrictedZoneIdsType
{
  return (Class)objc_opt_class();
}

- (int)licensePlateRestrictionImpact
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x100) != 0) {
    return self->_licensePlateRestrictionImpact;
  }
  else {
    return 0;
  }
}

- (void)setLicensePlateRestrictionImpact:(int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 2;
  *(void *)&self->_flags |= 0x100uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_licensePlateRestrictionImpact = a3;
}

- (void)setHasLicensePlateRestrictionImpact:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 256;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFEFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 2;
}

- (BOOL)hasLicensePlateRestrictionImpact
{
  return (*(void *)&self->_flags >> 8) & 1;
}

- (id)licensePlateRestrictionImpactAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E0508[a3];
  }

  return v3;
}

- (int)StringAsLicensePlateRestrictionImpact:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_NOT_AFFECTED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_AVOIDS_RESTRICTION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_POTENTIALLY_AFFECTED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_ORIGIN_IN"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_DESTINATION_IN"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_ORIGIN_DESTINATION_IN"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_CUT_THROUGH"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)environmentalCongestionZoneImpact
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x20) != 0) {
    return self->_environmentalCongestionZoneImpact;
  }
  else {
    return 0;
  }
}

- (void)setEnvironmentalCongestionZoneImpact:(int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 2;
  *(void *)&self->_flags |= 0x20uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_environmentalCongestionZoneImpact = a3;
}

- (void)setHasEnvironmentalCongestionZoneImpact:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 32;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFFDFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 2;
}

- (BOOL)hasEnvironmentalCongestionZoneImpact
{
  return (*(void *)&self->_flags >> 5) & 1;
}

- (id)environmentalCongestionZoneImpactAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E0508[a3];
  }

  return v3;
}

- (int)StringAsEnvironmentalCongestionZoneImpact:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_NOT_AFFECTED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_AVOIDS_RESTRICTION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_POTENTIALLY_AFFECTED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_ORIGIN_IN"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_DESTINATION_IN"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_ORIGIN_DESTINATION_IN"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_CUT_THROUGH"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)tollCongestionZoneImpact
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x800) != 0) {
    return self->_tollCongestionZoneImpact;
  }
  else {
    return 0;
  }
}

- (void)setTollCongestionZoneImpact:(int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 2;
  *(void *)&self->_flags |= 0x800uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_tollCongestionZoneImpact = a3;
}

- (void)setHasTollCongestionZoneImpact:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 2048;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFF7FFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 2;
}

- (BOOL)hasTollCongestionZoneImpact
{
  return (*(void *)&self->_flags >> 11) & 1;
}

- (id)tollCongestionZoneImpactAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E0508[a3];
  }

  return v3;
}

- (int)StringAsTollCongestionZoneImpact:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_NOT_AFFECTED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_AVOIDS_RESTRICTION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_POTENTIALLY_AFFECTED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_ORIGIN_IN"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_DESTINATION_IN"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_ORIGIN_DESTINATION_IN"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_CUT_THROUGH"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readStepGroups
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x200000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readStepGroups_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (NSMutableArray)stepGroups
{
  -[GEORoute _readStepGroups]((uint64_t)self);
  stepGroups = self->_stepGroups;

  return stepGroups;
}

- (void)setStepGroups:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x200000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;
  stepGroups = self->_stepGroups;
  self->_stepGroups = v4;
}

- (void)clearStepGroups
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x200000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;
  stepGroups = self->_stepGroups;

  [(NSMutableArray *)stepGroups removeAllObjects];
}

- (void)addStepGroup:(id)a3
{
  id v4 = a3;
  -[GEORoute _readStepGroups]((uint64_t)self);
  -[GEORoute _addNoFlagsStepGroup:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEORoute *)((char *)self + 564);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x200000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 2u;
}

- (void)_addNoFlagsStepGroup:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 424);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 424);
      *(void *)(a1 + 424) = v5;

      id v4 = *(void **)(a1 + 424);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)stepGroupsCount
{
  -[GEORoute _readStepGroups]((uint64_t)self);
  stepGroups = self->_stepGroups;

  return [(NSMutableArray *)stepGroups count];
}

- (id)stepGroupAtIndex:(unint64_t)a3
{
  -[GEORoute _readStepGroups]((uint64_t)self);
  stepGroups = self->_stepGroups;

  return (id)[(NSMutableArray *)stepGroups objectAtIndex:a3];
}

+ (Class)stepGroupType
{
  return (Class)objc_opt_class();
}

- (void)_readUpdateLocations
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x8000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readUpdateLocations_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (NSMutableArray)updateLocations
{
  -[GEORoute _readUpdateLocations]((uint64_t)self);
  updateLocations = self->_updateLocations;

  return updateLocations;
}

- (void)setUpdateLocations:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x8000000000000000;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;
  updateLocations = self->_updateLocations;
  self->_updateLocations = v4;
}

- (void)clearUpdateLocations
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x8000000000000000;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;
  updateLocations = self->_updateLocations;

  [(NSMutableArray *)updateLocations removeAllObjects];
}

- (void)addUpdateLocation:(id)a3
{
  id v4 = a3;
  -[GEORoute _readUpdateLocations]((uint64_t)self);
  -[GEORoute _addNoFlagsUpdateLocation:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEORoute *)((char *)self + 564);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x8000000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 2u;
}

- (void)_addNoFlagsUpdateLocation:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 472);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 472);
      *(void *)(a1 + 472) = v5;

      id v4 = *(void **)(a1 + 472);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)updateLocationsCount
{
  -[GEORoute _readUpdateLocations]((uint64_t)self);
  updateLocations = self->_updateLocations;

  return [(NSMutableArray *)updateLocations count];
}

- (id)updateLocationAtIndex:(unint64_t)a3
{
  -[GEORoute _readUpdateLocations]((uint64_t)self);
  updateLocations = self->_updateLocations;

  return (id)[(NSMutableArray *)updateLocations objectAtIndex:a3];
}

+ (Class)updateLocationType
{
  return (Class)objc_opt_class();
}

- (void)_readOriginWaypointInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x80000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readOriginWaypointInfo_tags_5114);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (BOOL)hasOriginWaypointInfo
{
  return self->_originWaypointInfo != 0;
}

- (GEOWaypointInfo)originWaypointInfo
{
  -[GEORoute _readOriginWaypointInfo]((uint64_t)self);
  originWaypointInfo = self->_originWaypointInfo;

  return originWaypointInfo;
}

- (void)setOriginWaypointInfo:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 2;
  *(void *)&self->_flags |= 0x80000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_originWaypointInfo, a3);
}

- (void)_readDestinationWaypointInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x100000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readDestinationWaypointInfo_tags_5115);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (BOOL)hasDestinationWaypointInfo
{
  return self->_destinationWaypointInfo != 0;
}

- (GEOWaypointInfo)destinationWaypointInfo
{
  -[GEORoute _readDestinationWaypointInfo]((uint64_t)self);
  destinationWaypointInfo = self->_destinationWaypointInfo;

  return destinationWaypointInfo;
}

- (void)setDestinationWaypointInfo:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 2;
  *(void *)&self->_flags |= 0x100000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_destinationWaypointInfo, a3);
}

- (void)_readCellularCoverages
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x100000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readCellularCoverages_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (unint64_t)cellularCoveragesCount
{
  return self->_cellularCoverages.count;
}

- (int)cellularCoverages
{
  return self->_cellularCoverages.list;
}

- (void)clearCellularCoverages
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x100000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;

  PBRepeatedInt32Clear();
}

- (void)addCellularCoverage:(int)a3
{
  -[GEORoute _readCellularCoverages]((uint64_t)self);
  if (self) {
    PBRepeatedInt32Add();
  }
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_uint64_t flags = &self->_flags;
  *(void *)p_flags |= 0x100000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)p_flags + 8) |= 2u;
}

- (int)cellularCoverageAtIndex:(unint64_t)a3
{
  -[GEORoute _readCellularCoverages]((uint64_t)self);
  p_cellularCoverages = &self->_cellularCoverages;
  unint64_t count = self->_cellularCoverages.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_cellularCoverages->list[a3];
}

- (void)setCellularCoverages:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x100000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;

  MEMORY[0x1F4147390](&self->_cellularCoverages, a3, a4);
}

- (id)cellularCoveragesAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53E0548[a3];
  }

  return v3;
}

- (int)StringAsCellularCoverages:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CELLULAR_COVERAGE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CELLULAR_COVERAGE_AVAILABLE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CELLULAR_COVERAGE_UNAVAILABLE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readCellularCoverageOffsets
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x80000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readCellularCoverageOffsets_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (unint64_t)cellularCoverageOffsetsCount
{
  return self->_cellularCoverageOffsets.count;
}

- (unsigned)cellularCoverageOffsets
{
  return self->_cellularCoverageOffsets.list;
}

- (void)clearCellularCoverageOffsets
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x80000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;

  PBRepeatedUInt32Clear();
}

- (void)addCellularCoverageOffset:(unsigned int)a3
{
  -[GEORoute _readCellularCoverageOffsets]((uint64_t)self);
  if (self) {
    PBRepeatedUInt32Add();
  }
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_uint64_t flags = &self->_flags;
  *(void *)p_flags |= 0x80000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)p_flags + 8) |= 2u;
}

- (unsigned)cellularCoverageOffsetAtIndex:(unint64_t)a3
{
  -[GEORoute _readCellularCoverageOffsets]((uint64_t)self);
  p_cellularCoverageOffsets = &self->_cellularCoverageOffsets;
  unint64_t count = self->_cellularCoverageOffsets.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_cellularCoverageOffsets->list[a3];
}

- (void)setCellularCoverageOffsets:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x80000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 2u;

  MEMORY[0x1F4147400](&self->_cellularCoverageOffsets, a3, a4);
}

- (void)_readOriginListInstruction
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x40000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readOriginListInstruction_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (BOOL)hasOriginListInstruction
{
  return self->_originListInstruction != 0;
}

- (GEODrivingWalkingInstruction)originListInstruction
{
  -[GEORoute _readOriginListInstruction]((uint64_t)self);
  originListInstruction = self->_originListInstruction;

  return originListInstruction;
}

- (void)setOriginListInstruction:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 2;
  *(void *)&self->_flags |= 0x40000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_originListInstruction, a3);
}

- (void)_readDestinationListInstruction
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 496));
    if ((*(void *)(a1 + 564) & 0x80000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readDestinationListInstruction_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 496));
  }
}

- (BOOL)hasDestinationListInstruction
{
  return self->_destinationListInstruction != 0;
}

- (GEODrivingWalkingInstruction)destinationListInstruction
{
  -[GEORoute _readDestinationListInstruction]((uint64_t)self);
  destinationListInstruction = self->_destinationListInstruction;

  return destinationListInstruction;
}

- (void)setDestinationListInstruction:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 2;
  *(void *)&self->_flags |= 0x80000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_destinationListInstruction, a3);
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORoute;
  int v4 = [(GEORoute *)&v8 description];
  id v5 = [(GEORoute *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORoute _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v397 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v303 = 0;
    goto LABEL_472;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(void *)(a1 + 564) & 0x1000) != 0)
  {
    uint64_t v5 = *(int *)(a1 + 548);
    if (v5 >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 548));
      objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v6 = off_1E53E0868[v5];
    }
    [v4 setObject:v6 forKey:@"transportType"];
  }
  if ([*(id *)(a1 + 432) count])
  {
    id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 432), "count"));
    long long v375 = 0u;
    long long v376 = 0u;
    long long v377 = 0u;
    long long v378 = 0u;
    id v8 = *(id *)(a1 + 432);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v375 objects:v396 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v376;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v376 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v375 + 1) + 8 * i);
          if (a2) {
            [v13 jsonRepresentation];
          }
          else {
          id v14 = [v13 dictionaryRepresentation];
          }

          [v7 addObject:v14];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v375 objects:v396 count:16];
      }
      while (v10);
    }

    [v4 setObject:v7 forKey:@"step"];
  }
  v15 = [(id)a1 name];
  if (v15) {
    [v4 setObject:v15 forKey:@"name"];
  }

  v16 = [(id)a1 phoneticName];
  if (v16) {
    [v4 setObject:v16 forKey:@"phoneticName"];
  }

  uint64_t v17 = *(void *)(a1 + 564);
  if ((v17 & 8) != 0)
  {
    v18 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 512)];
    [v4 setObject:v18 forKey:@"distance"];

    uint64_t v17 = *(void *)(a1 + 564);
  }
  if ((v17 & 0x40) != 0)
  {
    v19 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 524)];
    [v4 setObject:v19 forKey:@"expectedTime"];
  }
  v20 = [(id)a1 routeID];
  v21 = v20;
  if (v20)
  {
    if (a2)
    {
      v22 = [v20 base64EncodedStringWithOptions:0];
      [v4 setObject:v22 forKey:@"routeID"];
    }
    else
    {
      [v4 setObject:v20 forKey:@"routeID"];
    }
  }

  if ((*(void *)(a1 + 564) & 0x200) != 0)
  {
    uint64_t v23 = *(int *)(a1 + 536);
    if (v23 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 536));
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = off_1E53E08A0[v23];
    }
    [v4 setObject:v24 forKey:@"routeType"];
  }
  if (*(void *)(a1 + 480))
  {
    if (!a2)
    {
      v43 = [(id)a1 zilchPoints];
      [v4 setObject:v43 forKey:@"zilchPoints"];

      if (!*(void *)(a1 + 192)) {
        goto LABEL_59;
      }
      goto LABEL_57;
    }
    v25 = (void *)MEMORY[0x1E4F1CA48];
    v26 = [(id)a1 zilchPoints];
    v27 = objc_msgSend(v25, "arrayWithCapacity:", objc_msgSend(v26, "count"));

    long long v373 = 0u;
    long long v374 = 0u;
    long long v371 = 0u;
    long long v372 = 0u;
    v28 = [(id)a1 zilchPoints];
    uint64_t v29 = [v28 countByEnumeratingWithState:&v371 objects:v395 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v372;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v372 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = [*(id *)(*((void *)&v371 + 1) + 8 * j) base64EncodedStringWithOptions:0];
          [v27 addObject:v33];
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v371 objects:v395 count:16];
      }
      while (v30);
    }

    [v4 setObject:v27 forKey:@"zilchPoints"];
  }
  if (!*(void *)(a1 + 192)) {
    goto LABEL_59;
  }
  if (a2)
  {
    v34 = (void *)MEMORY[0x1E4F1CA48];
    v35 = [(id)a1 basicPoints];
    v36 = objc_msgSend(v34, "arrayWithCapacity:", objc_msgSend(v35, "count"));

    long long v369 = 0u;
    long long v370 = 0u;
    long long v367 = 0u;
    long long v368 = 0u;
    v37 = [(id)a1 basicPoints];
    uint64_t v38 = [v37 countByEnumeratingWithState:&v367 objects:v394 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v368;
      do
      {
        for (uint64_t k = 0; k != v39; ++k)
        {
          if (*(void *)v368 != v40) {
            objc_enumerationMutation(v37);
          }
          v42 = [*(id *)(*((void *)&v367 + 1) + 8 * k) base64EncodedStringWithOptions:0];
          [v36 addObject:v42];
        }
        uint64_t v39 = [v37 countByEnumeratingWithState:&v367 objects:v394 count:16];
      }
      while (v39);
    }

    goto LABEL_58;
  }
LABEL_57:
  v36 = [(id)a1 basicPoints];
LABEL_58:
  [v4 setObject:v36 forKey:@"basicPoints"];

LABEL_59:
  v44 = [(id)a1 pathLeg];
  v45 = v44;
  if (v44)
  {
    if (a2)
    {
      v46 = [v44 base64EncodedStringWithOptions:0];
      [v4 setObject:v46 forKey:@"pathLeg"];
    }
    else
    {
      [v4 setObject:v44 forKey:@"path_leg"];
    }
  }

  v47 = [(id)a1 pathMapMatcherInstructions];
  v48 = v47;
  if (v47)
  {
    if (a2)
    {
      v49 = [v47 jsonRepresentation];
      v50 = @"pathMapMatcherInstructions";
    }
    else
    {
      v49 = [v47 dictionaryRepresentation];
      v50 = @"path_map_matcher_instructions";
    }
    id v51 = v49;

    [v4 setObject:v51 forKey:v50];
  }

  if ((*(void *)(a1 + 564) & 0x10) != 0)
  {
    int v52 = *(_DWORD *)(a1 + 516);
    if (v52)
    {
      if (v52 == 1)
      {
        v53 = @"LEFT_SIDE";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 516));
        v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v53 = @"RIGHT_SIDE";
    }
    [v4 setObject:v53 forKey:@"drivingSide"];
  }
  v54 = [(id)a1 departureRouteID];
  v55 = v54;
  if (v54)
  {
    if (a2)
    {
      v56 = [v54 base64EncodedStringWithOptions:0];
      [v4 setObject:v56 forKey:@"departureRouteID"];
    }
    else
    {
      [v4 setObject:v54 forKey:@"departureRouteID"];
    }
  }

  if ((*(void *)(a1 + 564) & 4) != 0)
  {
    v57 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 508)];
    [v4 setObject:v57 forKey:@"departureStepID"];
  }
  v58 = [(id)a1 arrivalRouteID];
  v59 = v58;
  if (v58)
  {
    if (a2)
    {
      v60 = [v58 base64EncodedStringWithOptions:0];
      [v4 setObject:v60 forKey:@"arrivalRouteID"];
    }
    else
    {
      [v4 setObject:v58 forKey:@"arrivalRouteID"];
    }
  }

  if (*(void *)(a1 + 564))
  {
    v61 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 500)];
    [v4 setObject:v61 forKey:@"arrivalStepID"];
  }
  if (*(void *)(a1 + 152))
  {
    v62 = PBRepeatedUInt32NSArray();
    [v4 setObject:v62 forKey:@"trafficColor"];
  }
  if (*(void *)(a1 + 128))
  {
    v63 = PBRepeatedUInt32NSArray();
    [v4 setObject:v63 forKey:@"trafficColorOffset"];
  }
  if ([*(id *)(a1 + 400) count])
  {
    v64 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 400), "count"));
    long long v363 = 0u;
    long long v364 = 0u;
    long long v365 = 0u;
    long long v366 = 0u;
    id v65 = *(id *)(a1 + 400);
    uint64_t v66 = [v65 countByEnumeratingWithState:&v363 objects:v393 count:16];
    if (v66)
    {
      uint64_t v67 = v66;
      uint64_t v68 = *(void *)v364;
      do
      {
        for (uint64_t m = 0; m != v67; ++m)
        {
          if (*(void *)v364 != v68) {
            objc_enumerationMutation(v65);
          }
          v70 = *(void **)(*((void *)&v363 + 1) + 8 * m);
          if (a2) {
            [v70 jsonRepresentation];
          }
          else {
          id v71 = [v70 dictionaryRepresentation];
          }

          [v64 addObject:v71];
        }
        uint64_t v67 = [v65 countByEnumeratingWithState:&v363 objects:v393 count:16];
      }
      while (v67);
    }

    if (a2) {
      v72 = @"routeLineStyleInfo";
    }
    else {
      v72 = @"route_line_style_info";
    }
    [v4 setObject:v64 forKey:v72];
  }
  if ([*(id *)(a1 + 376) count])
  {
    v73 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 376), "count"));
    long long v359 = 0u;
    long long v360 = 0u;
    long long v361 = 0u;
    long long v362 = 0u;
    id v74 = *(id *)(a1 + 376);
    uint64_t v75 = [v74 countByEnumeratingWithState:&v359 objects:v392 count:16];
    if (v75)
    {
      uint64_t v76 = v75;
      uint64_t v77 = *(void *)v360;
      do
      {
        for (uint64_t n = 0; n != v76; ++n)
        {
          if (*(void *)v360 != v77) {
            objc_enumerationMutation(v74);
          }
          v79 = *(void **)(*((void *)&v359 + 1) + 8 * n);
          if (a2) {
            [v79 jsonRepresentation];
          }
          else {
          id v80 = [v79 dictionaryRepresentation];
          }

          [v73 addObject:v80];
        }
        uint64_t v76 = [v74 countByEnumeratingWithState:&v359 objects:v392 count:16];
      }
      while (v76);
    }

    if (a2) {
      v81 = @"routeCameraInputInfo";
    }
    else {
      v81 = @"route_camera_input_info";
    }
    [v4 setObject:v73 forKey:v81];
  }
  if ([*(id *)(a1 + 440) count])
  {
    v82 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 440), "count"));
    long long v355 = 0u;
    long long v356 = 0u;
    long long v357 = 0u;
    long long v358 = 0u;
    id v83 = *(id *)(a1 + 440);
    uint64_t v84 = [v83 countByEnumeratingWithState:&v355 objects:v391 count:16];
    if (v84)
    {
      uint64_t v85 = v84;
      uint64_t v86 = *(void *)v356;
      do
      {
        for (iuint64_t i = 0; ii != v85; ++ii)
        {
          if (*(void *)v356 != v86) {
            objc_enumerationMutation(v83);
          }
          v88 = *(void **)(*((void *)&v355 + 1) + 8 * ii);
          if (a2) {
            [v88 jsonRepresentation];
          }
          else {
          id v89 = [v88 dictionaryRepresentation];
          }

          [v82 addObject:v89];
        }
        uint64_t v85 = [v83 countByEnumeratingWithState:&v355 objects:v391 count:16];
      }
      while (v85);
    }

    if (a2) {
      v90 = @"trafficColorInfo";
    }
    else {
      v90 = @"traffic_color_info";
    }
    [v4 setObject:v82 forKey:v90];
  }
  if ([*(id *)(a1 + 368) count])
  {
    v91 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 368), "count"));
    long long v351 = 0u;
    long long v352 = 0u;
    long long v353 = 0u;
    long long v354 = 0u;
    id v92 = *(id *)(a1 + 368);
    uint64_t v93 = [v92 countByEnumeratingWithState:&v351 objects:v390 count:16];
    if (v93)
    {
      uint64_t v94 = v93;
      uint64_t v95 = *(void *)v352;
      do
      {
        for (juint64_t j = 0; jj != v94; ++jj)
        {
          if (*(void *)v352 != v95) {
            objc_enumerationMutation(v92);
          }
          v97 = *(void **)(*((void *)&v351 + 1) + 8 * jj);
          if (a2) {
            [v97 jsonRepresentation];
          }
          else {
          id v98 = [v97 dictionaryRepresentation];
          }

          [v91 addObject:v98];
        }
        uint64_t v94 = [v92 countByEnumeratingWithState:&v351 objects:v390 count:16];
      }
      while (v94);
    }

    [v4 setObject:v91 forKey:@"routeName"];
  }
  if ((*(void *)(a1 + 564) & 0x80) != 0)
  {
    v99 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 528)];
    [v4 setObject:v99 forKey:@"historicTravelTime"];
  }
  if (*(void *)(a1 + 168))
  {
    v100 = [(id)a1 advisoryNotices];
    [v4 setObject:v100 forKey:@"advisoryNotice"];
  }
  v101 = [(id)a1 routeLabelDetailText];
  v102 = v101;
  if (v101)
  {
    if (a2)
    {
      v103 = [v101 jsonRepresentation];
      v104 = @"routeLabelDetailText";
    }
    else
    {
      v103 = [v101 dictionaryRepresentation];
      v104 = @"route_label_detail_text";
    }
    id v105 = v103;

    [v4 setObject:v105 forKey:v104];
  }

  v106 = [(id)a1 infrastructureDescription];
  v107 = v106;
  if (v106)
  {
    if (a2)
    {
      v108 = [v106 jsonRepresentation];
      v109 = @"infrastructureDescription";
    }
    else
    {
      v108 = [v106 dictionaryRepresentation];
      v109 = @"infrastructure_description";
    }
    id v110 = v108;

    [v4 setObject:v110 forKey:v109];
  }

  v111 = [(id)a1 clickableAdvisory];
  v112 = v111;
  if (v111)
  {
    if (a2)
    {
      v113 = [v111 jsonRepresentation];
      v114 = @"clickableAdvisory";
    }
    else
    {
      v113 = [v111 dictionaryRepresentation];
      v114 = @"clickable_advisory";
    }
    id v115 = v113;

    [v4 setObject:v115 forKey:v114];
  }

  uint64_t v116 = *(void *)(a1 + 564);
  if ((v116 & 0x2000) != 0)
  {
    v131 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 552)];
    if (a2) {
      v132 = @"travelTimeAggressiveEstimate";
    }
    else {
      v132 = @"travel_time_aggressive_estimate";
    }
    [v4 setObject:v131 forKey:v132];

    uint64_t v116 = *(void *)(a1 + 564);
    if ((v116 & 0x4000) == 0)
    {
LABEL_169:
      if ((v116 & 0x400) == 0) {
        goto LABEL_170;
      }
      goto LABEL_203;
    }
  }
  else if ((v116 & 0x4000) == 0)
  {
    goto LABEL_169;
  }
  v133 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 556)];
  if (a2) {
    v134 = @"travelTimeConservativeEstimate";
  }
  else {
    v134 = @"travel_time_conservative_estimate";
  }
  [v4 setObject:v133 forKey:v134];

  uint64_t v116 = *(void *)(a1 + 564);
  if ((v116 & 0x400) == 0)
  {
LABEL_170:
    if ((v116 & 0x10000) == 0) {
      goto LABEL_171;
    }
    goto LABEL_207;
  }
LABEL_203:
  v135 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 540)];
  if (a2) {
    v136 = @"staticTravelTime";
  }
  else {
    v136 = @"static_travel_time";
  }
  [v4 setObject:v135 forKey:v136];

  uint64_t v116 = *(void *)(a1 + 564);
  if ((v116 & 0x10000) == 0)
  {
LABEL_171:
    if ((v116 & 0x8000) == 0) {
      goto LABEL_172;
    }
    goto LABEL_211;
  }
LABEL_207:
  v137 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 561)];
  if (a2) {
    v138 = @"avoidsTolls";
  }
  else {
    v138 = @"avoids_tolls";
  }
  [v4 setObject:v137 forKey:v138];

  uint64_t v116 = *(void *)(a1 + 564);
  if ((v116 & 0x8000) == 0)
  {
LABEL_172:
    if ((v116 & 0x20000) == 0) {
      goto LABEL_177;
    }
    goto LABEL_173;
  }
LABEL_211:
  v139 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 560)];
  if (a2) {
    v140 = @"avoidsHighways";
  }
  else {
    v140 = @"avoids_highways";
  }
  [v4 setObject:v139 forKey:v140];

  if ((*(void *)(a1 + 564) & 0x20000) != 0)
  {
LABEL_173:
    v117 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 562)];
    if (a2) {
      v118 = @"avoidsTraffic";
    }
    else {
      v118 = @"avoids_traffic";
    }
    [v4 setObject:v117 forKey:v118];
  }
LABEL_177:
  if ([*(id *)(a1 + 248) count])
  {
    v119 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 248), "count"));
    long long v347 = 0u;
    long long v348 = 0u;
    long long v349 = 0u;
    long long v350 = 0u;
    id v120 = *(id *)(a1 + 248);
    uint64_t v121 = [v120 countByEnumeratingWithState:&v347 objects:v389 count:16];
    if (v121)
    {
      uint64_t v122 = v121;
      uint64_t v123 = *(void *)v348;
      do
      {
        for (kuint64_t k = 0; kk != v122; ++kk)
        {
          if (*(void *)v348 != v123) {
            objc_enumerationMutation(v120);
          }
          v125 = *(void **)(*((void *)&v347 + 1) + 8 * kk);
          if (a2) {
            [v125 jsonRepresentation];
          }
          else {
          id v126 = [v125 dictionaryRepresentation];
          }

          [v119 addObject:v126];
        }
        uint64_t v122 = [v120 countByEnumeratingWithState:&v347 objects:v389 count:16];
      }
      while (v122);
    }

    if (a2) {
      v127 = @"enrouteNotice";
    }
    else {
      v127 = @"enroute_notice";
    }
    [v4 setObject:v119 forKey:v127];
  }
  v128 = [(id)a1 unpackedLatLngVertices];
  v129 = v128;
  if (v128)
  {
    if (a2)
    {
      v130 = [v128 base64EncodedStringWithOptions:0];
      [v4 setObject:v130 forKey:@"unpackedLatLngVertices"];
    }
    else
    {
      [v4 setObject:v128 forKey:@"unpackedLatLngVertices"];
    }
  }

  if (*(void *)(a1 + 104))
  {
    v141 = PBRepeatedUInt32NSArray();
    [v4 setObject:v141 forKey:@"incidentIndices"];
  }
  if (*(void *)(a1 + 80))
  {
    v142 = PBRepeatedUInt32NSArray();
    [v4 setObject:v142 forKey:@"incidentEndOffsetsInRoute"];
  }
  if ([*(id *)(a1 + 264) count])
  {
    v143 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 264), "count"));
    long long v343 = 0u;
    long long v344 = 0u;
    long long v345 = 0u;
    long long v346 = 0u;
    id v144 = *(id *)(a1 + 264);
    uint64_t v145 = [v144 countByEnumeratingWithState:&v343 objects:v388 count:16];
    if (v145)
    {
      uint64_t v146 = v145;
      uint64_t v147 = *(void *)v344;
      do
      {
        for (muint64_t m = 0; mm != v146; ++mm)
        {
          if (*(void *)v344 != v147) {
            objc_enumerationMutation(v144);
          }
          v149 = *(void **)(*((void *)&v343 + 1) + 8 * mm);
          if (a2) {
            [v149 jsonRepresentation];
          }
          else {
          id v150 = [v149 dictionaryRepresentation];
          }

          [v143 addObject:v150];
        }
        uint64_t v146 = [v144 countByEnumeratingWithState:&v343 objects:v388 count:16];
      }
      while (v146);
    }

    if (a2) {
      v151 = @"incidentOnRouteInfo";
    }
    else {
      v151 = @"incident_on_route_info";
    }
    [v4 setObject:v143 forKey:v151];
  }
  v152 = [(id)a1 routePlanningDescription];
  v153 = v152;
  if (v152)
  {
    if (a2)
    {
      v154 = [v152 jsonRepresentation];
      v155 = @"routePlanningDescription";
    }
    else
    {
      v154 = [v152 dictionaryRepresentation];
      v155 = @"route_planning_description";
    }
    id v156 = v154;

    [v4 setObject:v156 forKey:v155];
  }

  if ([*(id *)(a1 + 384) count])
  {
    v157 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 384), "count"));
    long long v339 = 0u;
    long long v340 = 0u;
    long long v341 = 0u;
    long long v342 = 0u;
    id v158 = *(id *)(a1 + 384);
    uint64_t v159 = [v158 countByEnumeratingWithState:&v339 objects:v387 count:16];
    if (v159)
    {
      uint64_t v160 = v159;
      uint64_t v161 = *(void *)v340;
      do
      {
        for (nuint64_t n = 0; nn != v160; ++nn)
        {
          if (*(void *)v340 != v161) {
            objc_enumerationMutation(v158);
          }
          v163 = *(void **)(*((void *)&v339 + 1) + 8 * nn);
          if (a2) {
            [v163 jsonRepresentation];
          }
          else {
          id v164 = [v163 dictionaryRepresentation];
          }

          [v157 addObject:v164];
        }
        uint64_t v160 = [v158 countByEnumeratingWithState:&v339 objects:v387 count:16];
      }
      while (v160);
    }

    if (a2) {
      v165 = @"routeDescription";
    }
    else {
      v165 = @"route_description";
    }
    [v4 setObject:v157 forKey:v165];
  }
  if ([*(id *)(a1 + 416) count])
  {
    v166 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 416), "count"));
    long long v335 = 0u;
    long long v336 = 0u;
    long long v337 = 0u;
    long long v338 = 0u;
    id v167 = *(id *)(a1 + 416);
    uint64_t v168 = [v167 countByEnumeratingWithState:&v335 objects:v386 count:16];
    if (v168)
    {
      uint64_t v169 = v168;
      uint64_t v170 = *(void *)v336;
      do
      {
        for (uint64_t i1 = 0; i1 != v169; ++i1)
        {
          if (*(void *)v336 != v170) {
            objc_enumerationMutation(v167);
          }
          v172 = *(void **)(*((void *)&v335 + 1) + 8 * i1);
          if (a2) {
            [v172 jsonRepresentation];
          }
          else {
          id v173 = [v172 dictionaryRepresentation];
          }

          [v166 addObject:v173];
        }
        uint64_t v169 = [v167 countByEnumeratingWithState:&v335 objects:v386 count:16];
      }
      while (v169);
    }

    if (a2) {
      v174 = @"startingRouteInstruction";
    }
    else {
      v174 = @"starting_route_instruction";
    }
    [v4 setObject:v166 forKey:v174];
  }
  if ([*(id *)(a1 + 240) count])
  {
    v175 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 240), "count"));
    long long v331 = 0u;
    long long v332 = 0u;
    long long v333 = 0u;
    long long v334 = 0u;
    id v176 = *(id *)(a1 + 240);
    uint64_t v177 = [v176 countByEnumeratingWithState:&v331 objects:v385 count:16];
    if (v177)
    {
      uint64_t v178 = v177;
      uint64_t v179 = *(void *)v332;
      do
      {
        for (uint64_t i2 = 0; i2 != v178; ++i2)
        {
          if (*(void *)v332 != v179) {
            objc_enumerationMutation(v176);
          }
          v181 = *(void **)(*((void *)&v331 + 1) + 8 * i2);
          if (a2) {
            [v181 jsonRepresentation];
          }
          else {
          id v182 = [v181 dictionaryRepresentation];
          }

          [v175 addObject:v182];
        }
        uint64_t v178 = [v176 countByEnumeratingWithState:&v331 objects:v385 count:16];
      }
      while (v178);
    }

    if (a2) {
      v183 = @"endingRouteInstruction";
    }
    else {
      v183 = @"ending_route_instruction";
    }
    [v4 setObject:v175 forKey:v183];
  }
  v184 = [(id)a1 trafficDescription];
  if (v184)
  {
    if (a2) {
      v185 = @"trafficDescription";
    }
    else {
      v185 = @"traffic_description";
    }
    [v4 setObject:v184 forKey:v185];
  }

  v186 = [(id)a1 trafficDescriptionLong];
  if (v186)
  {
    if (a2) {
      v187 = @"trafficDescriptionLong";
    }
    else {
      v187 = @"traffic_description_long";
    }
    [v4 setObject:v186 forKey:v187];
  }

  v188 = [(id)a1 alertNonRecommendedRouteText];
  v189 = v188;
  if (v188)
  {
    if (a2)
    {
      v190 = [v188 jsonRepresentation];
      v191 = @"alertNonRecommendedRouteText";
    }
    else
    {
      v190 = [v188 dictionaryRepresentation];
      v191 = @"alert_non_recommended_route_text";
    }
    id v192 = v190;

    [v4 setObject:v192 forKey:v191];
  }

  if ([*(id *)(a1 + 256) count])
  {
    v193 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 256), "count"));
    long long v327 = 0u;
    long long v328 = 0u;
    long long v329 = 0u;
    long long v330 = 0u;
    id v194 = *(id *)(a1 + 256);
    uint64_t v195 = [v194 countByEnumeratingWithState:&v327 objects:v384 count:16];
    if (v195)
    {
      uint64_t v196 = v195;
      uint64_t v197 = *(void *)v328;
      do
      {
        for (uint64_t i3 = 0; i3 != v196; ++i3)
        {
          if (*(void *)v328 != v197) {
            objc_enumerationMutation(v194);
          }
          v199 = *(void **)(*((void *)&v327 + 1) + 8 * i3);
          if (a2) {
            [v199 jsonRepresentation];
          }
          else {
          id v200 = [v199 dictionaryRepresentation];
          }

          [v193 addObject:v200];
        }
        uint64_t v196 = [v194 countByEnumeratingWithState:&v327 objects:v384 count:16];
      }
      while (v196);
    }

    if (a2) {
      v201 = @"guidanceEvent";
    }
    else {
      v201 = @"guidance_event";
    }
    [v4 setObject:v193 forKey:v201];
  }
  v202 = [(id)a1 launchAndGoCardText];
  v203 = v202;
  if (v202)
  {
    if (a2)
    {
      v204 = [v202 jsonRepresentation];
      v205 = @"launchAndGoCardText";
    }
    else
    {
      v204 = [v202 dictionaryRepresentation];
      v205 = @"launch_and_go_card_text";
    }
    id v206 = v204;

    [v4 setObject:v206 forKey:v205];
  }

  if ([*(id *)(a1 + 352) count])
  {
    v207 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 352), "count"));
    long long v323 = 0u;
    long long v324 = 0u;
    long long v325 = 0u;
    long long v326 = 0u;
    id v208 = *(id *)(a1 + 352);
    uint64_t v209 = [v208 countByEnumeratingWithState:&v323 objects:v383 count:16];
    if (v209)
    {
      uint64_t v210 = v209;
      uint64_t v211 = *(void *)v324;
      do
      {
        for (uint64_t i4 = 0; i4 != v210; ++i4)
        {
          if (*(void *)v324 != v211) {
            objc_enumerationMutation(v208);
          }
          v213 = *(void **)(*((void *)&v323 + 1) + 8 * i4);
          if (a2) {
            [v213 jsonRepresentation];
          }
          else {
          id v214 = [v213 dictionaryRepresentation];
          }

          [v207 addObject:v214];
        }
        uint64_t v210 = [v208 countByEnumeratingWithState:&v323 objects:v383 count:16];
      }
      while (v210);
    }

    if (a2) {
      v215 = @"roadComplexity";
    }
    else {
      v215 = @"road_complexity";
    }
    [v4 setObject:v207 forKey:v215];
  }
  if ([*(id *)(a1 + 280) count])
  {
    v216 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 280), "count"));
    long long v319 = 0u;
    long long v320 = 0u;
    long long v321 = 0u;
    long long v322 = 0u;
    id v217 = *(id *)(a1 + 280);
    uint64_t v218 = [v217 countByEnumeratingWithState:&v319 objects:v382 count:16];
    if (v218)
    {
      uint64_t v219 = v218;
      uint64_t v220 = *(void *)v320;
      do
      {
        for (uint64_t i5 = 0; i5 != v219; ++i5)
        {
          if (*(void *)v320 != v220) {
            objc_enumerationMutation(v217);
          }
          v222 = *(void **)(*((void *)&v319 + 1) + 8 * i5);
          if (a2) {
            [v222 jsonRepresentation];
          }
          else {
          id v223 = [v222 dictionaryRepresentation];
          }

          [v216 addObject:v223];
        }
        uint64_t v219 = [v217 countByEnumeratingWithState:&v319 objects:v382 count:16];
      }
      while (v219);
    }

    if (a2) {
      v224 = @"laneWidth";
    }
    else {
      v224 = @"lane_width";
    }
    [v4 setObject:v216 forKey:v224];
  }
  v225 = [(id)a1 elevationProfile];
  v226 = v225;
  if (v225)
  {
    if (a2)
    {
      v227 = [v225 jsonRepresentation];
      v228 = @"elevationProfile";
    }
    else
    {
      v227 = [v225 dictionaryRepresentation];
      v228 = @"elevation_profile";
    }
    id v229 = v227;

    [v4 setObject:v229 forKey:v228];
  }

  if ((*(void *)(a1 + 564) & 2) != 0)
  {
    v230 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 504)];
    if (a2) {
      v231 = @"arrivalParameterIndex";
    }
    else {
      v231 = @"arrival_parameter_index";
    }
    [v4 setObject:v230 forKey:v231];
  }
  if ([*(id *)(a1 + 344) count])
  {
    v232 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 344), "count"));
    long long v315 = 0u;
    long long v316 = 0u;
    long long v317 = 0u;
    long long v318 = 0u;
    id v233 = *(id *)(a1 + 344);
    uint64_t v234 = [v233 countByEnumeratingWithState:&v315 objects:v381 count:16];
    if (v234)
    {
      uint64_t v235 = v234;
      uint64_t v236 = *(void *)v316;
      do
      {
        for (uint64_t i6 = 0; i6 != v235; ++i6)
        {
          if (*(void *)v316 != v236) {
            objc_enumerationMutation(v233);
          }
          v238 = *(void **)(*((void *)&v315 + 1) + 8 * i6);
          if (a2) {
            [v238 jsonRepresentation];
          }
          else {
          id v239 = [v238 dictionaryRepresentation];
          }

          [v232 addObject:v239];
        }
        uint64_t v235 = [v233 countByEnumeratingWithState:&v315 objects:v381 count:16];
      }
      while (v235);
    }

    if (a2) {
      v240 = @"restrictedZoneIds";
    }
    else {
      v240 = @"restricted_zone_ids";
    }
    [v4 setObject:v232 forKey:v240];
  }
  uint64_t v241 = *(void *)(a1 + 564);
  if ((v241 & 0x100) == 0)
  {
    if ((v241 & 0x20) == 0) {
      goto LABEL_378;
    }
LABEL_387:
    uint64_t v245 = *(int *)(a1 + 520);
    if (v245 >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 520));
      v246 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v246 = off_1E53E0508[v245];
    }
    if (a2) {
      v247 = @"environmentalCongestionZoneImpact";
    }
    else {
      v247 = @"environmental_congestion_zone_impact";
    }
    [v4 setObject:v246 forKey:v247];

    if ((*(void *)(a1 + 564) & 0x800) == 0) {
      goto LABEL_401;
    }
    goto LABEL_394;
  }
  uint64_t v242 = *(int *)(a1 + 532);
  if (v242 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 532));
    v243 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v243 = off_1E53E0508[v242];
  }
  if (a2) {
    v244 = @"licensePlateRestrictionImpact";
  }
  else {
    v244 = @"license_plate_restriction_impact";
  }
  [v4 setObject:v243 forKey:v244];

  uint64_t v241 = *(void *)(a1 + 564);
  if ((v241 & 0x20) != 0) {
    goto LABEL_387;
  }
LABEL_378:
  if ((v241 & 0x800) != 0)
  {
LABEL_394:
    uint64_t v248 = *(int *)(a1 + 544);
    if (v248 >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 544));
      v249 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v249 = off_1E53E0508[v248];
    }
    if (a2) {
      v250 = @"tollCongestionZoneImpact";
    }
    else {
      v250 = @"toll_congestion_zone_impact";
    }
    [v4 setObject:v249 forKey:v250];
  }
LABEL_401:
  if ([*(id *)(a1 + 424) count])
  {
    v251 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 424), "count"));
    long long v311 = 0u;
    long long v312 = 0u;
    long long v313 = 0u;
    long long v314 = 0u;
    id v252 = *(id *)(a1 + 424);
    uint64_t v253 = [v252 countByEnumeratingWithState:&v311 objects:v380 count:16];
    if (v253)
    {
      uint64_t v254 = v253;
      uint64_t v255 = *(void *)v312;
      do
      {
        for (uint64_t i7 = 0; i7 != v254; ++i7)
        {
          if (*(void *)v312 != v255) {
            objc_enumerationMutation(v252);
          }
          v257 = *(void **)(*((void *)&v311 + 1) + 8 * i7);
          if (a2) {
            [v257 jsonRepresentation];
          }
          else {
          id v258 = [v257 dictionaryRepresentation];
          }

          [v251 addObject:v258];
        }
        uint64_t v254 = [v252 countByEnumeratingWithState:&v311 objects:v380 count:16];
      }
      while (v254);
    }

    if (a2) {
      v259 = @"stepGroup";
    }
    else {
      v259 = @"step_group";
    }
    [v4 setObject:v251 forKey:v259];
  }
  if ([*(id *)(a1 + 472) count])
  {
    v260 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 472), "count"));
    long long v307 = 0u;
    long long v308 = 0u;
    long long v309 = 0u;
    long long v310 = 0u;
    id v261 = *(id *)(a1 + 472);
    uint64_t v262 = [v261 countByEnumeratingWithState:&v307 objects:v379 count:16];
    if (v262)
    {
      uint64_t v263 = v262;
      uint64_t v264 = *(void *)v308;
      do
      {
        for (uint64_t i8 = 0; i8 != v263; ++i8)
        {
          if (*(void *)v308 != v264) {
            objc_enumerationMutation(v261);
          }
          v266 = *(void **)(*((void *)&v307 + 1) + 8 * i8);
          if (a2) {
            [v266 jsonRepresentation];
          }
          else {
          id v267 = [v266 dictionaryRepresentation];
          }

          [v260 addObject:v267];
        }
        uint64_t v263 = [v261 countByEnumeratingWithState:&v307 objects:v379 count:16];
      }
      while (v263);
    }

    if (a2) {
      v268 = @"updateLocation";
    }
    else {
      v268 = @"update_location";
    }
    [v4 setObject:v260 forKey:v268];
  }
  v269 = [(id)a1 originWaypointInfo];
  v270 = v269;
  if (v269)
  {
    if (a2)
    {
      v271 = [v269 jsonRepresentation];
      v272 = @"originWaypointInfo";
    }
    else
    {
      v271 = [v269 dictionaryRepresentation];
      v272 = @"origin_waypoint_info";
    }
    id v273 = v271;

    [v4 setObject:v273 forKey:v272];
  }

  v274 = [(id)a1 destinationWaypointInfo];
  v275 = v274;
  if (v274)
  {
    if (a2)
    {
      v276 = [v274 jsonRepresentation];
      v277 = @"destinationWaypointInfo";
    }
    else
    {
      v276 = [v274 dictionaryRepresentation];
      v277 = @"destination_waypoint_info";
    }
    id v278 = v276;

    [v4 setObject:v278 forKey:v277];
  }

  if (*(void *)(a1 + 56))
  {
    v279 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    v280 = (void *)(a1 + 48);
    if (*(void *)(a1 + 56))
    {
      unint64_t v281 = 0;
      do
      {
        uint64_t v282 = *(int *)(*v280 + 4 * v281);
        if (v282 >= 3)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v282);
          v283 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v283 = off_1E53E0548[v282];
        }
        [v279 addObject:v283];

        ++v281;
        v280 = (void *)(a1 + 48);
      }
      while (v281 < *(void *)(a1 + 56));
    }
    if (a2) {
      v284 = @"cellularCoverage";
    }
    else {
      v284 = @"cellular_coverage";
    }
    [v4 setObject:v279 forKey:v284];
  }
  if (*(void *)(a1 + 32))
  {
    v285 = PBRepeatedUInt32NSArray();
    if (a2) {
      v286 = @"cellularCoverageOffset";
    }
    else {
      v286 = @"cellular_coverage_offset";
    }
    [v4 setObject:v285 forKey:v286];
  }
  v287 = [(id)a1 originListInstruction];
  v288 = v287;
  if (v287)
  {
    if (a2)
    {
      v289 = [v287 jsonRepresentation];
      v290 = @"originListInstruction";
    }
    else
    {
      v289 = [v287 dictionaryRepresentation];
      v290 = @"origin_list_instruction";
    }
    id v291 = v289;

    [v4 setObject:v291 forKey:v290];
  }

  v292 = [(id)a1 destinationListInstruction];
  v293 = v292;
  if (v292)
  {
    if (a2)
    {
      v294 = [v292 jsonRepresentation];
      v295 = @"destinationListInstruction";
    }
    else
    {
      v294 = [v292 dictionaryRepresentation];
      v295 = @"destination_list_instruction";
    }
    id v296 = v294;

    [v4 setObject:v296 forKey:v295];
  }

  v297 = *(void **)(a1 + 16);
  if (v297)
  {
    v298 = [v297 dictionaryRepresentation];
    v299 = v298;
    if (a2)
    {
      v300 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v298, "count"));
      v305[0] = MEMORY[0x1E4F143A8];
      v305[1] = 3221225472;
      v305[2] = __38__GEORoute__dictionaryRepresentation___block_invoke;
      v305[3] = &unk_1E53D8860;
      id v301 = v300;
      id v306 = v301;
      [v299 enumerateKeysAndObjectsUsingBlock:v305];
      id v302 = v301;

      v299 = v302;
    }
    [v4 setObject:v299 forKey:@"Unknown Fields"];
  }
  id v303 = v4;

LABEL_472:

  return v303;
}

- (id)jsonRepresentation
{
  return -[GEORoute _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __38__GEORoute__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    id v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEORoute)initWithDictionary:(id)a3
{
  return (GEORoute *)-[GEORoute _initWithDictionary:isJSON:]();
}

- (id)_initWithDictionary:isJSON:
{
  uint64_t v0 = MEMORY[0x1F4188790]();
  int v2 = v1;
  id v3 = (id)v0;
  uint64_t v512 = *MEMORY[0x1E4F143B8];
  id v5 = v4;
  if (!v3) {
    goto LABEL_672;
  }
  id v6 = (id)[v3 init];

  if (!v6)
  {
    id v3 = 0;
    goto LABEL_672;
  }
  id v7 = [v5 objectForKeyedSubscript:@"transportType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"AUTOMOBILE"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"TRANSIT"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"WALKING"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"BICYCLE"])
    {
      uint64_t v9 = 3;
    }
    else if ([v8 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
    {
      uint64_t v9 = 4;
    }
    else if ([v8 isEqualToString:@"FERRY"])
    {
      uint64_t v9 = 5;
    }
    else if ([v8 isEqualToString:@"RIDESHARE"])
    {
      uint64_t v9 = 6;
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_24;
    }
    uint64_t v9 = [v7 intValue];
  }
  [v6 setTransportType:v9];
LABEL_24:

  id v10 = [v5 objectForKeyedSubscript:@"step"];
  objc_opt_class();
  id v386 = v5;
  if (objc_opt_isKindOfClass())
  {
    long long v486 = 0u;
    long long v485 = 0u;
    long long v484 = 0u;
    long long v483 = 0u;
    long long v370 = v10;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v483 objects:v511 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v484;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v484 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v483 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v17 = [GEOStep alloc];
            if (v2) {
              uint64_t v18 = [(GEOStep *)v17 initWithJSON:v16];
            }
            else {
              uint64_t v18 = [(GEOStep *)v17 initWithDictionary:v16];
            }
            v19 = (void *)v18;
            objc_msgSend(v6, "addStep:", v18, v370);
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v483 objects:v511 count:16];
      }
      while (v13);
    }

    id v10 = v370;
  }

  v20 = [v5 objectForKeyedSubscript:@"name"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v21 = (void *)[v20 copy];
    [v6 setName:v21];
  }
  v22 = [v5 objectForKeyedSubscript:@"phoneticName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v23 = (void *)[v22 copy];
    [v6 setPhoneticName:v23];
  }
  v24 = [v5 objectForKeyedSubscript:@"distance"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setDistance:", objc_msgSend(v24, "unsignedIntValue"));
  }

  v25 = [v5 objectForKeyedSubscript:@"expectedTime"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setExpectedTime:", objc_msgSend(v25, "unsignedIntValue"));
  }

  v26 = [v5 objectForKeyedSubscript:@"routeID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v27 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v26 options:0];
    [v6 setRouteID:v27];
  }
  v28 = [v5 objectForKeyedSubscript:@"routeType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v29 = v28;
    if ([v29 isEqualToString:@"MAIN_ROUTE"])
    {
      uint64_t v30 = 0;
    }
    else if ([v29 isEqualToString:@"ALTERNATE_ROUTE"])
    {
      uint64_t v30 = 1;
    }
    else if ([v29 isEqualToString:@"CONTINGENCY_ROUTE_ALTERNATE_ORIGIN"])
    {
      uint64_t v30 = 2;
    }
    else if ([v29 isEqualToString:@"CONTINGENCY_ROUTE_MIDDLE_OF_ROUTE"])
    {
      uint64_t v30 = 3;
    }
    else if ([v29 isEqualToString:@"MAIN_NON_RECOMMENDED_ROUTE"])
    {
      uint64_t v30 = 4;
    }
    else if ([v29 isEqualToString:@"ALTERNATE_NON_RECOMMENDED_ROUTE"])
    {
      uint64_t v30 = 5;
    }
    else
    {
      uint64_t v30 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_66;
    }
    uint64_t v30 = [v28 intValue];
  }
  objc_msgSend(v6, "setRouteType:", v30, v370);
LABEL_66:

  uint64_t v31 = [v5 objectForKeyedSubscript:@"zilchPoints"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v482 = 0u;
    long long v481 = 0u;
    long long v480 = 0u;
    long long v479 = 0u;
    long long v370 = v31;
    id v32 = v31;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v479 objects:v510 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v480;
      do
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v480 != v35) {
            objc_enumerationMutation(v32);
          }
          uint64_t v37 = *(void *)(*((void *)&v479 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v38 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v37 options:0];
            [v6 addZilchPoints:v38];
          }
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v479 objects:v510 count:16];
      }
      while (v34);
    }

    uint64_t v31 = v370;
  }

  uint64_t v39 = [v5 objectForKeyedSubscript:@"basicPoints"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v478 = 0u;
    long long v477 = 0u;
    long long v476 = 0u;
    long long v475 = 0u;
    long long v370 = v39;
    id v40 = v39;
    uint64_t v41 = [v40 countByEnumeratingWithState:&v475 objects:v509 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v476;
      do
      {
        for (uint64_t k = 0; k != v42; ++k)
        {
          if (*(void *)v476 != v43) {
            objc_enumerationMutation(v40);
          }
          uint64_t v45 = *(void *)(*((void *)&v475 + 1) + 8 * k);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v46 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v45 options:0];
            [v6 addBasicPoints:v46];
          }
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v475 objects:v509 count:16];
      }
      while (v42);
    }

    uint64_t v39 = v370;
  }

  if (v2) {
    v47 = @"pathLeg";
  }
  else {
    v47 = @"path_leg";
  }
  v48 = objc_msgSend(v5, "objectForKeyedSubscript:", v47, v370);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v49 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v48 options:0];
    [v6 setPathLeg:v49];
  }
  if (v2) {
    v50 = @"pathMapMatcherInstructions";
  }
  else {
    v50 = @"path_map_matcher_instructions";
  }
  id v51 = [v5 objectForKeyedSubscript:v50];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v52 = [GEOPathMapMatcherInstructions alloc];
    if (v2) {
      uint64_t v53 = [(GEOPathMapMatcherInstructions *)v52 initWithJSON:v51];
    }
    else {
      uint64_t v53 = [(GEOPathMapMatcherInstructions *)v52 initWithDictionary:v51];
    }
    v54 = (void *)v53;
    [v6 setPathMapMatcherInstructions:v53];
  }
  v55 = [v5 objectForKeyedSubscript:@"drivingSide"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v56 = v55;
    if ([v56 isEqualToString:@"RIGHT_SIDE"]) {
      uint64_t v57 = 0;
    }
    else {
      uint64_t v57 = [v56 isEqualToString:@"LEFT_SIDE"];
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_109;
    }
    uint64_t v57 = [v55 intValue];
  }
  [v6 setDrivingSide:v57];
LABEL_109:

  v58 = [v5 objectForKeyedSubscript:@"departureRouteID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v59 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v58 options:0];
    [v6 setDepartureRouteID:v59];
  }
  v60 = [v5 objectForKeyedSubscript:@"departureStepID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setDepartureStepID:", objc_msgSend(v60, "unsignedIntValue"));
  }

  v61 = [v5 objectForKeyedSubscript:@"arrivalRouteID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v62 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v61 options:0];
    [v6 setArrivalRouteID:v62];
  }
  v63 = [v5 objectForKeyedSubscript:@"arrivalStepID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setArrivalStepID:", objc_msgSend(v63, "unsignedIntValue"));
  }

  v64 = [v5 objectForKeyedSubscript:@"trafficColor"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v474 = 0u;
    long long v473 = 0u;
    long long v472 = 0u;
    long long v471 = 0u;
    id v65 = v64;
    uint64_t v66 = [v65 countByEnumeratingWithState:&v471 objects:v508 count:16];
    if (v66)
    {
      uint64_t v67 = v66;
      uint64_t v68 = *(void *)v472;
      do
      {
        for (uint64_t m = 0; m != v67; ++m)
        {
          if (*(void *)v472 != v68) {
            objc_enumerationMutation(v65);
          }
          v70 = *(void **)(*((void *)&v471 + 1) + 8 * m);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend(v6, "addTrafficColor:", objc_msgSend(v70, "unsignedIntValue"));
          }
        }
        uint64_t v67 = [v65 countByEnumeratingWithState:&v471 objects:v508 count:16];
      }
      while (v67);
    }
  }
  id v71 = [v5 objectForKeyedSubscript:@"trafficColorOffset"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v470 = 0u;
    long long v469 = 0u;
    long long v468 = 0u;
    long long v467 = 0u;
    id v72 = v71;
    uint64_t v73 = [v72 countByEnumeratingWithState:&v467 objects:v507 count:16];
    if (v73)
    {
      uint64_t v74 = v73;
      uint64_t v75 = *(void *)v468;
      do
      {
        for (uint64_t n = 0; n != v74; ++n)
        {
          if (*(void *)v468 != v75) {
            objc_enumerationMutation(v72);
          }
          uint64_t v77 = *(void **)(*((void *)&v467 + 1) + 8 * n);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend(v6, "addTrafficColorOffset:", objc_msgSend(v77, "unsignedIntValue"));
          }
        }
        uint64_t v74 = [v72 countByEnumeratingWithState:&v467 objects:v507 count:16];
      }
      while (v74);
    }
  }
  if (v2) {
    v78 = @"routeLineStyleInfo";
  }
  else {
    v78 = @"route_line_style_info";
  }
  v79 = [v5 objectForKeyedSubscript:v78];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v466 = 0u;
    long long v465 = 0u;
    long long v464 = 0u;
    long long v463 = 0u;
    long long v371 = v79;
    id v80 = v79;
    uint64_t v81 = [v80 countByEnumeratingWithState:&v463 objects:v506 count:16];
    if (v81)
    {
      uint64_t v82 = v81;
      uint64_t v83 = *(void *)v464;
      do
      {
        for (iuint64_t i = 0; ii != v82; ++ii)
        {
          if (*(void *)v464 != v83) {
            objc_enumerationMutation(v80);
          }
          uint64_t v85 = *(void *)(*((void *)&v463 + 1) + 8 * ii);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v86 = [GEORouteLineStyleInfo alloc];
            if (v2) {
              uint64_t v87 = [(GEORouteLineStyleInfo *)v86 initWithJSON:v85];
            }
            else {
              uint64_t v87 = [(GEORouteLineStyleInfo *)v86 initWithDictionary:v85];
            }
            v88 = (void *)v87;
            objc_msgSend(v6, "addRouteLineStyleInfo:", v87, v371);
          }
        }
        uint64_t v82 = [v80 countByEnumeratingWithState:&v463 objects:v506 count:16];
      }
      while (v82);
    }

    v79 = v371;
  }

  if (v2) {
    id v89 = @"routeCameraInputInfo";
  }
  else {
    id v89 = @"route_camera_input_info";
  }
  v90 = objc_msgSend(v5, "objectForKeyedSubscript:", v89, v371);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v462 = 0u;
    long long v461 = 0u;
    long long v460 = 0u;
    long long v459 = 0u;
    long long v372 = v90;
    id v91 = v90;
    uint64_t v92 = [v91 countByEnumeratingWithState:&v459 objects:v505 count:16];
    if (v92)
    {
      uint64_t v93 = v92;
      uint64_t v94 = *(void *)v460;
      do
      {
        for (juint64_t j = 0; jj != v93; ++jj)
        {
          if (*(void *)v460 != v94) {
            objc_enumerationMutation(v91);
          }
          uint64_t v96 = *(void *)(*((void *)&v459 + 1) + 8 * jj);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v97 = [GEORouteLineStyleInfo alloc];
            if (v2) {
              uint64_t v98 = [(GEORouteLineStyleInfo *)v97 initWithJSON:v96];
            }
            else {
              uint64_t v98 = [(GEORouteLineStyleInfo *)v97 initWithDictionary:v96];
            }
            v99 = (void *)v98;
            objc_msgSend(v6, "addRouteCameraInputInfo:", v98, v372);
          }
        }
        uint64_t v93 = [v91 countByEnumeratingWithState:&v459 objects:v505 count:16];
      }
      while (v93);
    }

    v90 = v372;
  }

  if (v2) {
    v100 = @"trafficColorInfo";
  }
  else {
    v100 = @"traffic_color_info";
  }
  v101 = objc_msgSend(v5, "objectForKeyedSubscript:", v100, v372);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v458 = 0u;
    long long v457 = 0u;
    long long v456 = 0u;
    long long v455 = 0u;
    long long v373 = v101;
    id v102 = v101;
    uint64_t v103 = [v102 countByEnumeratingWithState:&v455 objects:v504 count:16];
    if (v103)
    {
      uint64_t v104 = v103;
      uint64_t v105 = *(void *)v456;
      do
      {
        for (kuint64_t k = 0; kk != v104; ++kk)
        {
          if (*(void *)v456 != v105) {
            objc_enumerationMutation(v102);
          }
          uint64_t v107 = *(void *)(*((void *)&v455 + 1) + 8 * kk);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v108 = [GEOTrafficColorInfo alloc];
            if (v2) {
              uint64_t v109 = [(GEOTrafficColorInfo *)v108 initWithJSON:v107];
            }
            else {
              uint64_t v109 = [(GEOTrafficColorInfo *)v108 initWithDictionary:v107];
            }
            id v110 = (void *)v109;
            objc_msgSend(v6, "addTrafficColorInfo:", v109, v373);
          }
        }
        uint64_t v104 = [v102 countByEnumeratingWithState:&v455 objects:v504 count:16];
      }
      while (v104);
    }

    v101 = v373;
  }

  v111 = [v5 objectForKeyedSubscript:@"routeName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v454 = 0u;
    long long v453 = 0u;
    long long v452 = 0u;
    long long v451 = 0u;
    long long v373 = v111;
    id v112 = v111;
    uint64_t v113 = [v112 countByEnumeratingWithState:&v451 objects:v503 count:16];
    if (v113)
    {
      uint64_t v114 = v113;
      uint64_t v115 = *(void *)v452;
      do
      {
        for (muint64_t m = 0; mm != v114; ++mm)
        {
          if (*(void *)v452 != v115) {
            objc_enumerationMutation(v112);
          }
          uint64_t v117 = *(void *)(*((void *)&v451 + 1) + 8 * mm);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v118 = [GEORouteName alloc];
            if (v2) {
              uint64_t v119 = [(GEORouteName *)v118 initWithJSON:v117];
            }
            else {
              uint64_t v119 = [(GEORouteName *)v118 initWithDictionary:v117];
            }
            id v120 = (void *)v119;
            objc_msgSend(v6, "addRouteName:", v119, v373);
          }
        }
        uint64_t v114 = [v112 countByEnumeratingWithState:&v451 objects:v503 count:16];
      }
      while (v114);
    }

    v111 = v373;
  }

  uint64_t v121 = [v5 objectForKeyedSubscript:@"historicTravelTime"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setHistoricTravelTime:", objc_msgSend(v121, "unsignedIntValue"));
  }

  uint64_t v122 = [v5 objectForKeyedSubscript:@"advisoryNotice"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v449 = 0u;
    long long v450 = 0u;
    long long v447 = 0u;
    long long v448 = 0u;
    id v123 = v122;
    uint64_t v124 = [v123 countByEnumeratingWithState:&v447 objects:v502 count:16];
    if (v124)
    {
      uint64_t v125 = v124;
      uint64_t v126 = *(void *)v448;
      do
      {
        for (nuint64_t n = 0; nn != v125; ++nn)
        {
          if (*(void *)v448 != v126) {
            objc_enumerationMutation(v123);
          }
          v128 = *(void **)(*((void *)&v447 + 1) + 8 * nn);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v129 = (void *)[v128 copy];
            [v6 addAdvisoryNotice:v129];
          }
        }
        uint64_t v125 = [v123 countByEnumeratingWithState:&v447 objects:v502 count:16];
      }
      while (v125);
    }
  }
  if (v2) {
    v130 = @"routeLabelDetailText";
  }
  else {
    v130 = @"route_label_detail_text";
  }
  v131 = objc_msgSend(v5, "objectForKeyedSubscript:", v130, v373);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v132 = [GEOFormattedString alloc];
    if (v2) {
      uint64_t v133 = [(GEOFormattedString *)v132 initWithJSON:v131];
    }
    else {
      uint64_t v133 = [(GEOFormattedString *)v132 initWithDictionary:v131];
    }
    v134 = (void *)v133;
    [v6 setRouteLabelDetailText:v133];
  }
  if (v2) {
    v135 = @"infrastructureDescription";
  }
  else {
    v135 = @"infrastructure_description";
  }
  v136 = [v5 objectForKeyedSubscript:v135];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v137 = [GEOFormattedString alloc];
    if (v2) {
      uint64_t v138 = [(GEOFormattedString *)v137 initWithJSON:v136];
    }
    else {
      uint64_t v138 = [(GEOFormattedString *)v137 initWithDictionary:v136];
    }
    v139 = (void *)v138;
    [v6 setInfrastructureDescription:v138];
  }
  if (v2) {
    v140 = @"clickableAdvisory";
  }
  else {
    v140 = @"clickable_advisory";
  }
  v141 = [v5 objectForKeyedSubscript:v140];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v142 = [GEOClickableAdvisory alloc];
    if (v2) {
      uint64_t v143 = [(GEOClickableAdvisory *)v142 initWithJSON:v141];
    }
    else {
      uint64_t v143 = [(GEOClickableAdvisory *)v142 initWithDictionary:v141];
    }
    id v144 = (void *)v143;
    [v6 setClickableAdvisory:v143];
  }
  if (v2) {
    uint64_t v145 = @"travelTimeAggressiveEstimate";
  }
  else {
    uint64_t v145 = @"travel_time_aggressive_estimate";
  }
  uint64_t v146 = [v5 objectForKeyedSubscript:v145];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setTravelTimeAggressiveEstimate:", objc_msgSend(v146, "unsignedIntValue"));
  }

  if (v2) {
    uint64_t v147 = @"travelTimeConservativeEstimate";
  }
  else {
    uint64_t v147 = @"travel_time_conservative_estimate";
  }
  v148 = [v5 objectForKeyedSubscript:v147];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setTravelTimeConservativeEstimate:", objc_msgSend(v148, "unsignedIntValue"));
  }

  if (v2) {
    v149 = @"staticTravelTime";
  }
  else {
    v149 = @"static_travel_time";
  }
  id v150 = [v5 objectForKeyedSubscript:v149];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setStaticTravelTime:", objc_msgSend(v150, "unsignedIntValue"));
  }

  if (v2) {
    v151 = @"avoidsTolls";
  }
  else {
    v151 = @"avoids_tolls";
  }
  v152 = [v5 objectForKeyedSubscript:v151];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setAvoidsTolls:", objc_msgSend(v152, "BOOLValue"));
  }

  if (v2) {
    v153 = @"avoidsHighways";
  }
  else {
    v153 = @"avoids_highways";
  }
  v154 = [v5 objectForKeyedSubscript:v153];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setAvoidsHighways:", objc_msgSend(v154, "BOOLValue"));
  }

  if (v2) {
    v155 = @"avoidsTraffic";
  }
  else {
    v155 = @"avoids_traffic";
  }
  id v156 = [v5 objectForKeyedSubscript:v155];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setAvoidsTraffic:", objc_msgSend(v156, "BOOLValue"));
  }

  if (v2) {
    v157 = @"enrouteNotice";
  }
  else {
    v157 = @"enroute_notice";
  }
  id v158 = [v5 objectForKeyedSubscript:v157];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v445 = 0u;
    long long v446 = 0u;
    long long v443 = 0u;
    long long v444 = 0u;
    long long v374 = v158;
    id v159 = v158;
    uint64_t v160 = [v159 countByEnumeratingWithState:&v443 objects:v501 count:16];
    if (v160)
    {
      uint64_t v161 = v160;
      uint64_t v162 = *(void *)v444;
      do
      {
        for (uint64_t i1 = 0; i1 != v161; ++i1)
        {
          if (*(void *)v444 != v162) {
            objc_enumerationMutation(v159);
          }
          uint64_t v164 = *(void *)(*((void *)&v443 + 1) + 8 * i1);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v165 = [GEOEnrouteNotice alloc];
            if (v2) {
              uint64_t v166 = [(GEOEnrouteNotice *)v165 initWithJSON:v164];
            }
            else {
              uint64_t v166 = [(GEOEnrouteNotice *)v165 initWithDictionary:v164];
            }
            id v167 = (void *)v166;
            objc_msgSend(v6, "addEnrouteNotice:", v166, v374);
          }
        }
        uint64_t v161 = [v159 countByEnumeratingWithState:&v443 objects:v501 count:16];
      }
      while (v161);
    }

    id v158 = v374;
  }

  uint64_t v168 = [v5 objectForKeyedSubscript:@"unpackedLatLngVertices"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v169 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v168 options:0];
    [v6 setUnpackedLatLngVertices:v169];
  }
  uint64_t v170 = [v5 objectForKeyedSubscript:@"incidentIndices"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v441 = 0u;
    long long v442 = 0u;
    long long v439 = 0u;
    long long v440 = 0u;
    id v171 = v170;
    uint64_t v172 = [v171 countByEnumeratingWithState:&v439 objects:v500 count:16];
    if (v172)
    {
      uint64_t v173 = v172;
      uint64_t v174 = *(void *)v440;
      do
      {
        for (uint64_t i2 = 0; i2 != v173; ++i2)
        {
          if (*(void *)v440 != v174) {
            objc_enumerationMutation(v171);
          }
          id v176 = *(void **)(*((void *)&v439 + 1) + 8 * i2);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend(v6, "addIncidentIndices:", objc_msgSend(v176, "unsignedIntValue"));
          }
        }
        uint64_t v173 = [v171 countByEnumeratingWithState:&v439 objects:v500 count:16];
      }
      while (v173);
    }
  }
  uint64_t v177 = [v5 objectForKeyedSubscript:@"incidentEndOffsetsInRoute"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v437 = 0u;
    long long v438 = 0u;
    long long v435 = 0u;
    long long v436 = 0u;
    id v178 = v177;
    uint64_t v179 = [v178 countByEnumeratingWithState:&v435 objects:v499 count:16];
    if (v179)
    {
      uint64_t v180 = v179;
      uint64_t v181 = *(void *)v436;
      do
      {
        for (uint64_t i3 = 0; i3 != v180; ++i3)
        {
          if (*(void *)v436 != v181) {
            objc_enumerationMutation(v178);
          }
          v183 = *(void **)(*((void *)&v435 + 1) + 8 * i3);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend(v6, "addIncidentEndOffsetsInRoute:", objc_msgSend(v183, "unsignedIntValue"));
          }
        }
        uint64_t v180 = [v178 countByEnumeratingWithState:&v435 objects:v499 count:16];
      }
      while (v180);
    }
  }
  if (v2) {
    v184 = @"incidentOnRouteInfo";
  }
  else {
    v184 = @"incident_on_route_info";
  }
  v185 = objc_msgSend(v5, "objectForKeyedSubscript:", v184, v374);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v433 = 0u;
    long long v434 = 0u;
    long long v431 = 0u;
    long long v432 = 0u;
    long long v375 = v185;
    id v186 = v185;
    uint64_t v187 = [v186 countByEnumeratingWithState:&v431 objects:v498 count:16];
    if (v187)
    {
      uint64_t v188 = v187;
      uint64_t v189 = *(void *)v432;
      do
      {
        for (uint64_t i4 = 0; i4 != v188; ++i4)
        {
          if (*(void *)v432 != v189) {
            objc_enumerationMutation(v186);
          }
          uint64_t v191 = *(void *)(*((void *)&v431 + 1) + 8 * i4);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v192 = [GEOIncidentOnRouteInfo alloc];
            if (v2) {
              uint64_t v193 = [(GEOIncidentOnRouteInfo *)v192 initWithJSON:v191];
            }
            else {
              uint64_t v193 = [(GEOIncidentOnRouteInfo *)v192 initWithDictionary:v191];
            }
            id v194 = (void *)v193;
            objc_msgSend(v6, "addIncidentOnRouteInfo:", v193, v375);
          }
        }
        uint64_t v188 = [v186 countByEnumeratingWithState:&v431 objects:v498 count:16];
      }
      while (v188);
    }

    v185 = v375;
  }

  if (v2) {
    uint64_t v195 = @"routePlanningDescription";
  }
  else {
    uint64_t v195 = @"route_planning_description";
  }
  uint64_t v196 = objc_msgSend(v5, "objectForKeyedSubscript:", v195, v375);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v197 = [GEORouteInformation alloc];
    if (v197) {
      v198 = (void *)-[GEORouteInformation _initWithDictionary:isJSON:](v197, v196, v2);
    }
    else {
      v198 = 0;
    }
    [v6 setRoutePlanningDescription:v198];
  }
  if (v2) {
    v199 = @"routeDescription";
  }
  else {
    v199 = @"route_description";
  }
  id v200 = [v5 objectForKeyedSubscript:v199];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v429 = 0u;
    long long v430 = 0u;
    long long v427 = 0u;
    long long v428 = 0u;
    long long v376 = v200;
    id v201 = v200;
    uint64_t v202 = [v201 countByEnumeratingWithState:&v427 objects:v497 count:16];
    if (v202)
    {
      uint64_t v203 = v202;
      uint64_t v204 = *(void *)v428;
      do
      {
        for (uint64_t i5 = 0; i5 != v203; ++i5)
        {
          if (*(void *)v428 != v204) {
            objc_enumerationMutation(v201);
          }
          uint64_t v206 = *(void *)(*((void *)&v427 + 1) + 8 * i5);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v207 = [GEOFormattedString alloc];
            if (v2) {
              uint64_t v208 = [(GEOFormattedString *)v207 initWithJSON:v206];
            }
            else {
              uint64_t v208 = [(GEOFormattedString *)v207 initWithDictionary:v206];
            }
            uint64_t v209 = (void *)v208;
            objc_msgSend(v6, "addRouteDescription:", v208, v376);
          }
        }
        uint64_t v203 = [v201 countByEnumeratingWithState:&v427 objects:v497 count:16];
      }
      while (v203);
    }

    id v200 = v376;
  }

  if (v2) {
    uint64_t v210 = @"startingRouteInstruction";
  }
  else {
    uint64_t v210 = @"starting_route_instruction";
  }
  uint64_t v211 = objc_msgSend(v5, "objectForKeyedSubscript:", v210, v376);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v425 = 0u;
    long long v426 = 0u;
    long long v423 = 0u;
    long long v424 = 0u;
    long long v377 = v211;
    id v212 = v211;
    uint64_t v213 = [v212 countByEnumeratingWithState:&v423 objects:v496 count:16];
    if (v213)
    {
      uint64_t v214 = v213;
      uint64_t v215 = *(void *)v424;
      do
      {
        for (uint64_t i6 = 0; i6 != v214; ++i6)
        {
          if (*(void *)v424 != v215) {
            objc_enumerationMutation(v212);
          }
          uint64_t v217 = *(void *)(*((void *)&v423 + 1) + 8 * i6);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v218 = [GEOFormattedString alloc];
            if (v2) {
              uint64_t v219 = [(GEOFormattedString *)v218 initWithJSON:v217];
            }
            else {
              uint64_t v219 = [(GEOFormattedString *)v218 initWithDictionary:v217];
            }
            uint64_t v220 = (void *)v219;
            objc_msgSend(v6, "addStartingRouteInstruction:", v219, v377);
          }
        }
        uint64_t v214 = [v212 countByEnumeratingWithState:&v423 objects:v496 count:16];
      }
      while (v214);
    }

    uint64_t v211 = v377;
  }

  if (v2) {
    v221 = @"endingRouteInstruction";
  }
  else {
    v221 = @"ending_route_instruction";
  }
  v222 = objc_msgSend(v5, "objectForKeyedSubscript:", v221, v377);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v421 = 0u;
    long long v422 = 0u;
    long long v419 = 0u;
    long long v420 = 0u;
    long long v378 = v222;
    id v223 = v222;
    uint64_t v224 = [v223 countByEnumeratingWithState:&v419 objects:v495 count:16];
    if (v224)
    {
      uint64_t v225 = v224;
      uint64_t v226 = *(void *)v420;
      do
      {
        for (uint64_t i7 = 0; i7 != v225; ++i7)
        {
          if (*(void *)v420 != v226) {
            objc_enumerationMutation(v223);
          }
          uint64_t v228 = *(void *)(*((void *)&v419 + 1) + 8 * i7);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v229 = [GEOFormattedString alloc];
            if (v2) {
              uint64_t v230 = [(GEOFormattedString *)v229 initWithJSON:v228];
            }
            else {
              uint64_t v230 = [(GEOFormattedString *)v229 initWithDictionary:v228];
            }
            v231 = (void *)v230;
            objc_msgSend(v6, "addEndingRouteInstruction:", v230, v378);
          }
        }
        uint64_t v225 = [v223 countByEnumeratingWithState:&v419 objects:v495 count:16];
      }
      while (v225);
    }

    v222 = v378;
  }

  if (v2) {
    v232 = @"trafficDescription";
  }
  else {
    v232 = @"traffic_description";
  }
  id v233 = objc_msgSend(v5, "objectForKeyedSubscript:", v232, v378);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v234 = (void *)[v233 copy];
    [v6 setTrafficDescription:v234];
  }
  if (v2) {
    uint64_t v235 = @"trafficDescriptionLong";
  }
  else {
    uint64_t v235 = @"traffic_description_long";
  }
  uint64_t v236 = [v5 objectForKeyedSubscript:v235];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v237 = (void *)[v236 copy];
    [v6 setTrafficDescriptionLong:v237];
  }
  if (v2) {
    v238 = @"alertNonRecommendedRouteText";
  }
  else {
    v238 = @"alert_non_recommended_route_text";
  }
  id v239 = [v5 objectForKeyedSubscript:v238];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v240 = [GEOAlertNonRecommendedRouteText alloc];
    if (v2) {
      uint64_t v241 = [(GEOAlertNonRecommendedRouteText *)v240 initWithJSON:v239];
    }
    else {
      uint64_t v241 = [(GEOAlertNonRecommendedRouteText *)v240 initWithDictionary:v239];
    }
    uint64_t v242 = (void *)v241;
    [v6 setAlertNonRecommendedRouteText:v241];
  }
  if (v2) {
    v243 = @"guidanceEvent";
  }
  else {
    v243 = @"guidance_event";
  }
  v244 = [v5 objectForKeyedSubscript:v243];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v417 = 0u;
    long long v418 = 0u;
    long long v415 = 0u;
    long long v416 = 0u;
    v379 = v244;
    id v245 = v244;
    uint64_t v246 = [v245 countByEnumeratingWithState:&v415 objects:v494 count:16];
    if (v246)
    {
      uint64_t v247 = v246;
      uint64_t v248 = *(void *)v416;
      do
      {
        for (uint64_t i8 = 0; i8 != v247; ++i8)
        {
          if (*(void *)v416 != v248) {
            objc_enumerationMutation(v245);
          }
          uint64_t v250 = *(void *)(*((void *)&v415 + 1) + 8 * i8);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v251 = [GEOGuidanceEvent alloc];
            if (v2) {
              uint64_t v252 = [(GEOGuidanceEvent *)v251 initWithJSON:v250];
            }
            else {
              uint64_t v252 = [(GEOGuidanceEvent *)v251 initWithDictionary:v250];
            }
            uint64_t v253 = (void *)v252;
            objc_msgSend(v6, "addGuidanceEvent:", v252, v379);
          }
        }
        uint64_t v247 = [v245 countByEnumeratingWithState:&v415 objects:v494 count:16];
      }
      while (v247);
    }

    v244 = v379;
  }

  if (v2) {
    uint64_t v254 = @"launchAndGoCardText";
  }
  else {
    uint64_t v254 = @"launch_and_go_card_text";
  }
  uint64_t v255 = objc_msgSend(v5, "objectForKeyedSubscript:", v254, v379);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v256 = [GEOLaunchAndGoCardText alloc];
    if (v2) {
      uint64_t v257 = [(GEOLaunchAndGoCardText *)v256 initWithJSON:v255];
    }
    else {
      uint64_t v257 = [(GEOLaunchAndGoCardText *)v256 initWithDictionary:v255];
    }
    id v258 = (void *)v257;
    [v6 setLaunchAndGoCardText:v257];
  }
  if (v2) {
    v259 = @"roadComplexity";
  }
  else {
    v259 = @"road_complexity";
  }
  v260 = [v5 objectForKeyedSubscript:v259];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v413 = 0u;
    long long v414 = 0u;
    long long v411 = 0u;
    long long v412 = 0u;
    v380 = v260;
    id v261 = v260;
    uint64_t v262 = [v261 countByEnumeratingWithState:&v411 objects:v493 count:16];
    if (v262)
    {
      uint64_t v263 = v262;
      uint64_t v264 = *(void *)v412;
      do
      {
        for (uint64_t i9 = 0; i9 != v263; ++i9)
        {
          if (*(void *)v412 != v264) {
            objc_enumerationMutation(v261);
          }
          uint64_t v266 = *(void *)(*((void *)&v411 + 1) + 8 * i9);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v267 = [GEORoadComplexity alloc];
            if (v2) {
              uint64_t v268 = [(GEORoadComplexity *)v267 initWithJSON:v266];
            }
            else {
              uint64_t v268 = [(GEORoadComplexity *)v267 initWithDictionary:v266];
            }
            v269 = (void *)v268;
            objc_msgSend(v6, "addRoadComplexity:", v268, v380);
          }
        }
        uint64_t v263 = [v261 countByEnumeratingWithState:&v411 objects:v493 count:16];
      }
      while (v263);
    }

    v260 = v380;
  }

  if (v2) {
    v270 = @"laneWidth";
  }
  else {
    v270 = @"lane_width";
  }
  v271 = objc_msgSend(v5, "objectForKeyedSubscript:", v270, v380);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v409 = 0u;
    long long v410 = 0u;
    long long v407 = 0u;
    long long v408 = 0u;
    v381 = v271;
    id v272 = v271;
    uint64_t v273 = [v272 countByEnumeratingWithState:&v407 objects:v492 count:16];
    if (v273)
    {
      uint64_t v274 = v273;
      uint64_t v275 = *(void *)v408;
      do
      {
        for (uint64_t i10 = 0; i10 != v274; ++i10)
        {
          if (*(void *)v408 != v275) {
            objc_enumerationMutation(v272);
          }
          uint64_t v277 = *(void *)(*((void *)&v407 + 1) + 8 * i10);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v278 = [GEOLaneWidth alloc];
            if (v2) {
              uint64_t v279 = [(GEOLaneWidth *)v278 initWithJSON:v277];
            }
            else {
              uint64_t v279 = [(GEOLaneWidth *)v278 initWithDictionary:v277];
            }
            v280 = (void *)v279;
            objc_msgSend(v6, "addLaneWidth:", v279, v381);
          }
        }
        uint64_t v274 = [v272 countByEnumeratingWithState:&v407 objects:v492 count:16];
      }
      while (v274);
    }

    v271 = v381;
  }

  if (v2) {
    unint64_t v281 = @"elevationProfile";
  }
  else {
    unint64_t v281 = @"elevation_profile";
  }
  uint64_t v282 = objc_msgSend(v5, "objectForKeyedSubscript:", v281, v381);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v283 = [GEOElevationProfile alloc];
    if (v2) {
      uint64_t v284 = [(GEOElevationProfile *)v283 initWithJSON:v282];
    }
    else {
      uint64_t v284 = [(GEOElevationProfile *)v283 initWithDictionary:v282];
    }
    v285 = (void *)v284;
    [v6 setElevationProfile:v284];
  }
  if (v2) {
    v286 = @"arrivalParameterIndex";
  }
  else {
    v286 = @"arrival_parameter_index";
  }
  v287 = [v5 objectForKeyedSubscript:v286];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setArrivalParameterIndex:", objc_msgSend(v287, "unsignedIntValue"));
  }

  if (v2) {
    v288 = @"restrictedZoneIds";
  }
  else {
    v288 = @"restricted_zone_ids";
  }
  v289 = [v5 objectForKeyedSubscript:v288];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v405 = 0u;
    long long v406 = 0u;
    long long v403 = 0u;
    long long v404 = 0u;
    v382 = v289;
    id v290 = v289;
    uint64_t v291 = [v290 countByEnumeratingWithState:&v403 objects:v491 count:16];
    if (v291)
    {
      uint64_t v292 = v291;
      uint64_t v293 = *(void *)v404;
      do
      {
        for (uint64_t i11 = 0; i11 != v292; ++i11)
        {
          if (*(void *)v404 != v293) {
            objc_enumerationMutation(v290);
          }
          uint64_t v295 = *(void *)(*((void *)&v403 + 1) + 8 * i11);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v296 = [GEORestrictedZoneId alloc];
            if (v2) {
              uint64_t v297 = [(GEORestrictedZoneId *)v296 initWithJSON:v295];
            }
            else {
              uint64_t v297 = [(GEORestrictedZoneId *)v296 initWithDictionary:v295];
            }
            v298 = (void *)v297;
            objc_msgSend(v6, "addRestrictedZoneIds:", v297, v382);
          }
        }
        uint64_t v292 = [v290 countByEnumeratingWithState:&v403 objects:v491 count:16];
      }
      while (v292);
    }

    v289 = v382;
  }

  if (v2) {
    v299 = @"licensePlateRestrictionImpact";
  }
  else {
    v299 = @"license_plate_restriction_impact";
  }
  v300 = objc_msgSend(v5, "objectForKeyedSubscript:", v299, v382);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v301 = v300;
    if ([v301 isEqualToString:@"RESTRICTION_ZONE_IMPACT_UNKNOWN"])
    {
      uint64_t v302 = 0;
    }
    else if ([v301 isEqualToString:@"RESTRICTION_ZONE_IMPACT_NOT_AFFECTED"])
    {
      uint64_t v302 = 1;
    }
    else if ([v301 isEqualToString:@"RESTRICTION_ZONE_IMPACT_AVOIDS_RESTRICTION"])
    {
      uint64_t v302 = 2;
    }
    else if ([v301 isEqualToString:@"RESTRICTION_ZONE_IMPACT_POTENTIALLY_AFFECTED"])
    {
      uint64_t v302 = 3;
    }
    else if ([v301 isEqualToString:@"RESTRICTION_ZONE_IMPACT_ORIGIN_IN"])
    {
      uint64_t v302 = 4;
    }
    else if ([v301 isEqualToString:@"RESTRICTION_ZONE_IMPACT_DESTINATION_IN"])
    {
      uint64_t v302 = 5;
    }
    else if ([v301 isEqualToString:@"RESTRICTION_ZONE_IMPACT_ORIGIN_DESTINATION_IN"])
    {
      uint64_t v302 = 6;
    }
    else if ([v301 isEqualToString:@"RESTRICTION_ZONE_IMPACT_CUT_THROUGH"])
    {
      uint64_t v302 = 7;
    }
    else
    {
      uint64_t v302 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_519;
    }
    uint64_t v302 = [v300 intValue];
  }
  [v6 setLicensePlateRestrictionImpact:v302];
LABEL_519:

  if (v2) {
    id v303 = @"environmentalCongestionZoneImpact";
  }
  else {
    id v303 = @"environmental_congestion_zone_impact";
  }
  v304 = [v5 objectForKeyedSubscript:v303];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v305 = v304;
    if ([v305 isEqualToString:@"RESTRICTION_ZONE_IMPACT_UNKNOWN"])
    {
      uint64_t v306 = 0;
    }
    else if ([v305 isEqualToString:@"RESTRICTION_ZONE_IMPACT_NOT_AFFECTED"])
    {
      uint64_t v306 = 1;
    }
    else if ([v305 isEqualToString:@"RESTRICTION_ZONE_IMPACT_AVOIDS_RESTRICTION"])
    {
      uint64_t v306 = 2;
    }
    else if ([v305 isEqualToString:@"RESTRICTION_ZONE_IMPACT_POTENTIALLY_AFFECTED"])
    {
      uint64_t v306 = 3;
    }
    else if ([v305 isEqualToString:@"RESTRICTION_ZONE_IMPACT_ORIGIN_IN"])
    {
      uint64_t v306 = 4;
    }
    else if ([v305 isEqualToString:@"RESTRICTION_ZONE_IMPACT_DESTINATION_IN"])
    {
      uint64_t v306 = 5;
    }
    else if ([v305 isEqualToString:@"RESTRICTION_ZONE_IMPACT_ORIGIN_DESTINATION_IN"])
    {
      uint64_t v306 = 6;
    }
    else if ([v305 isEqualToString:@"RESTRICTION_ZONE_IMPACT_CUT_THROUGH"])
    {
      uint64_t v306 = 7;
    }
    else
    {
      uint64_t v306 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_544;
    }
    uint64_t v306 = [v304 intValue];
  }
  [v6 setEnvironmentalCongestionZoneImpact:v306];
LABEL_544:

  if (v2) {
    long long v307 = @"tollCongestionZoneImpact";
  }
  else {
    long long v307 = @"toll_congestion_zone_impact";
  }
  long long v308 = [v5 objectForKeyedSubscript:v307];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v309 = v308;
    if ([v309 isEqualToString:@"RESTRICTION_ZONE_IMPACT_UNKNOWN"])
    {
      uint64_t v310 = 0;
    }
    else if ([v309 isEqualToString:@"RESTRICTION_ZONE_IMPACT_NOT_AFFECTED"])
    {
      uint64_t v310 = 1;
    }
    else if ([v309 isEqualToString:@"RESTRICTION_ZONE_IMPACT_AVOIDS_RESTRICTION"])
    {
      uint64_t v310 = 2;
    }
    else if ([v309 isEqualToString:@"RESTRICTION_ZONE_IMPACT_POTENTIALLY_AFFECTED"])
    {
      uint64_t v310 = 3;
    }
    else if ([v309 isEqualToString:@"RESTRICTION_ZONE_IMPACT_ORIGIN_IN"])
    {
      uint64_t v310 = 4;
    }
    else if ([v309 isEqualToString:@"RESTRICTION_ZONE_IMPACT_DESTINATION_IN"])
    {
      uint64_t v310 = 5;
    }
    else if ([v309 isEqualToString:@"RESTRICTION_ZONE_IMPACT_ORIGIN_DESTINATION_IN"])
    {
      uint64_t v310 = 6;
    }
    else if ([v309 isEqualToString:@"RESTRICTION_ZONE_IMPACT_CUT_THROUGH"])
    {
      uint64_t v310 = 7;
    }
    else
    {
      uint64_t v310 = 0;
    }

    goto LABEL_568;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v310 = [v308 intValue];
LABEL_568:
    [v6 setTollCongestionZoneImpact:v310];
  }

  if (v2) {
    long long v311 = @"stepGroup";
  }
  else {
    long long v311 = @"step_group";
  }
  long long v312 = [v5 objectForKeyedSubscript:v311];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v401 = 0u;
    long long v402 = 0u;
    long long v399 = 0u;
    long long v400 = 0u;
    v383 = v312;
    id v313 = v312;
    uint64_t v314 = [v313 countByEnumeratingWithState:&v399 objects:v490 count:16];
    if (v314)
    {
      uint64_t v315 = v314;
      uint64_t v316 = *(void *)v400;
      do
      {
        for (uint64_t i12 = 0; i12 != v315; ++i12)
        {
          if (*(void *)v400 != v316) {
            objc_enumerationMutation(v313);
          }
          uint64_t v318 = *(void *)(*((void *)&v399 + 1) + 8 * i12);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v319 = [GEOStepGroup alloc];
            if (v2) {
              uint64_t v320 = [(GEOStepGroup *)v319 initWithJSON:v318];
            }
            else {
              uint64_t v320 = [(GEOStepGroup *)v319 initWithDictionary:v318];
            }
            long long v321 = (void *)v320;
            objc_msgSend(v6, "addStepGroup:", v320, v383);
          }
        }
        uint64_t v315 = [v313 countByEnumeratingWithState:&v399 objects:v490 count:16];
      }
      while (v315);
    }

    long long v312 = v383;
  }

  if (v2) {
    long long v322 = @"updateLocation";
  }
  else {
    long long v322 = @"update_location";
  }
  long long v323 = objc_msgSend(v5, "objectForKeyedSubscript:", v322, v383);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v397 = 0u;
    long long v398 = 0u;
    long long v395 = 0u;
    long long v396 = 0u;
    v384 = v323;
    id v324 = v323;
    uint64_t v325 = [v324 countByEnumeratingWithState:&v395 objects:v489 count:16];
    if (v325)
    {
      uint64_t v326 = v325;
      uint64_t v327 = *(void *)v396;
      do
      {
        for (uint64_t i13 = 0; i13 != v326; ++i13)
        {
          if (*(void *)v396 != v327) {
            objc_enumerationMutation(v324);
          }
          uint64_t v329 = *(void *)(*((void *)&v395 + 1) + 8 * i13);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v330 = [GEOUpdateLocation alloc];
            if (v2) {
              uint64_t v331 = [(GEOUpdateLocation *)v330 initWithJSON:v329];
            }
            else {
              uint64_t v331 = [(GEOUpdateLocation *)v330 initWithDictionary:v329];
            }
            long long v332 = (void *)v331;
            objc_msgSend(v6, "addUpdateLocation:", v331, v384);
          }
        }
        uint64_t v326 = [v324 countByEnumeratingWithState:&v395 objects:v489 count:16];
      }
      while (v326);
    }

    long long v323 = v384;
  }

  if (v2) {
    long long v333 = @"originWaypointInfo";
  }
  else {
    long long v333 = @"origin_waypoint_info";
  }
  long long v334 = objc_msgSend(v5, "objectForKeyedSubscript:", v333, v384);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v335 = [GEOWaypointInfo alloc];
    if (v2) {
      uint64_t v336 = [(GEOWaypointInfo *)v335 initWithJSON:v334];
    }
    else {
      uint64_t v336 = [(GEOWaypointInfo *)v335 initWithDictionary:v334];
    }
    long long v337 = (void *)v336;
    [v6 setOriginWaypointInfo:v336];
  }
  if (v2) {
    long long v338 = @"destinationWaypointInfo";
  }
  else {
    long long v338 = @"destination_waypoint_info";
  }
  long long v339 = [v5 objectForKeyedSubscript:v338];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v340 = [GEOWaypointInfo alloc];
    if (v2) {
      uint64_t v341 = [(GEOWaypointInfo *)v340 initWithJSON:v339];
    }
    else {
      uint64_t v341 = [(GEOWaypointInfo *)v340 initWithDictionary:v339];
    }
    long long v342 = (void *)v341;
    [v6 setDestinationWaypointInfo:v341];
  }
  if (v2) {
    long long v343 = @"cellularCoverage";
  }
  else {
    long long v343 = @"cellular_coverage";
  }
  long long v344 = [v5 objectForKeyedSubscript:v343];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v393 = 0u;
    long long v394 = 0u;
    long long v391 = 0u;
    long long v392 = 0u;
    v385 = v344;
    id v345 = v344;
    uint64_t v346 = [v345 countByEnumeratingWithState:&v391 objects:v488 count:16];
    if (!v346) {
      goto LABEL_642;
    }
    uint64_t v347 = v346;
    uint64_t v348 = *(void *)v392;
    while (1)
    {
      for (uint64_t i14 = 0; i14 != v347; ++i14)
      {
        if (*(void *)v392 != v348) {
          objc_enumerationMutation(v345);
        }
        long long v350 = *(void **)(*((void *)&v391 + 1) + 8 * i14);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v351 = v350;
          if ([v351 isEqualToString:@"CELLULAR_COVERAGE_UNKNOWN"])
          {
            uint64_t v352 = 0;
          }
          else if ([v351 isEqualToString:@"CELLULAR_COVERAGE_AVAILABLE"])
          {
            uint64_t v352 = 1;
          }
          else if ([v351 isEqualToString:@"CELLULAR_COVERAGE_UNAVAILABLE"])
          {
            uint64_t v352 = 2;
          }
          else
          {
            uint64_t v352 = 0;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          uint64_t v352 = [v350 intValue];
        }
        objc_msgSend(v6, "addCellularCoverage:", v352, v385);
      }
      uint64_t v347 = [v345 countByEnumeratingWithState:&v391 objects:v488 count:16];
      if (!v347)
      {
LABEL_642:

        long long v344 = v385;
        id v5 = v386;
        break;
      }
    }
  }

  if (v2) {
    long long v353 = @"cellularCoverageOffset";
  }
  else {
    long long v353 = @"cellular_coverage_offset";
  }
  long long v354 = objc_msgSend(v5, "objectForKeyedSubscript:", v353, v385);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v389 = 0u;
    long long v390 = 0u;
    long long v387 = 0u;
    long long v388 = 0u;
    id v355 = v354;
    uint64_t v356 = [v355 countByEnumeratingWithState:&v387 objects:v487 count:16];
    if (v356)
    {
      uint64_t v357 = v356;
      uint64_t v358 = *(void *)v388;
      do
      {
        for (uint64_t i15 = 0; i15 != v357; ++i15)
        {
          if (*(void *)v388 != v358) {
            objc_enumerationMutation(v355);
          }
          long long v360 = *(void **)(*((void *)&v387 + 1) + 8 * i15);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend(v6, "addCellularCoverageOffset:", objc_msgSend(v360, "unsignedIntValue"));
          }
        }
        uint64_t v357 = [v355 countByEnumeratingWithState:&v387 objects:v487 count:16];
      }
      while (v357);
    }
  }
  if (v2) {
    long long v361 = @"originListInstruction";
  }
  else {
    long long v361 = @"origin_list_instruction";
  }
  long long v362 = [v5 objectForKeyedSubscript:v361];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v363 = [GEODrivingWalkingInstruction alloc];
    if (v363) {
      long long v364 = (void *)-[GEODrivingWalkingInstruction _initWithDictionary:isJSON:](v363, v362, v2);
    }
    else {
      long long v364 = 0;
    }
    [v6 setOriginListInstruction:v364];
  }
  if (v2) {
    long long v365 = @"destinationListInstruction";
  }
  else {
    long long v365 = @"destination_list_instruction";
  }
  long long v366 = [v5 objectForKeyedSubscript:v365];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v367 = [GEODrivingWalkingInstruction alloc];
    if (v367) {
      long long v368 = (void *)-[GEODrivingWalkingInstruction _initWithDictionary:isJSON:](v367, v366, v2);
    }
    else {
      long long v368 = 0;
    }
    [v6 setDestinationListInstruction:v368];
  }
  id v3 = v6;

LABEL_672:
  return v3;
}

- (GEORoute)initWithJSON:(id)a3
{
  return (GEORoute *)-[GEORoute _initWithDictionary:isJSON:]();
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_5366;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_5367;
    }
    GEORouteReadSpecified((uint64_t)self, (char *)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORouteCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORouteIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORouteReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v189 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORouteIsDirty((uint64_t)self) & 1) == 0)
  {
    id v91 = self->_reader;
    objc_sync_enter(v91);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v92 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v92];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v91);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORoute *)self readAll:0];
    if ((*(void *)&self->_flags & 0x1000) != 0) {
      PBDataWriterWriteInt32Field();
    }
    long long v169 = 0u;
    long long v168 = 0u;
    long long v167 = 0u;
    long long v166 = 0u;
    id v6 = self->_steps;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v166 objects:v188 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v167;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v167 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v166 objects:v188 count:16];
      }
      while (v7);
    }

    if (self->_name) {
      PBDataWriterWriteStringField();
    }
    if (self->_phoneticName) {
      PBDataWriterWriteStringField();
    }
    uint64_t flags = (uint64_t)self->_flags;
    if ((flags & 8) != 0)
    {
      PBDataWriterWriteUint32Field();
      uint64_t flags = (uint64_t)self->_flags;
    }
    if ((flags & 0x40) != 0) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_routeID) {
      PBDataWriterWriteDataField();
    }
    if ((*(void *)&self->_flags & 0x200) != 0) {
      PBDataWriterWriteInt32Field();
    }
    long long v165 = 0u;
    long long v164 = 0u;
    long long v163 = 0u;
    long long v162 = 0u;
    id v11 = self->_zilchPoints;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v162 objects:v187 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v163;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v163 != v13) {
            objc_enumerationMutation(v11);
          }
          PBDataWriterWriteDataField();
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v162 objects:v187 count:16];
      }
      while (v12);
    }

    long long v161 = 0u;
    long long v160 = 0u;
    long long v159 = 0u;
    long long v158 = 0u;
    v15 = self->_basicPoints;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v158 objects:v186 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v159;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v159 != v17) {
            objc_enumerationMutation(v15);
          }
          PBDataWriterWriteDataField();
          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v158 objects:v186 count:16];
      }
      while (v16);
    }

    if (self->_pathLeg) {
      PBDataWriterWriteDataField();
    }
    if (self->_pathMapMatcherInstructions) {
      PBDataWriterWriteSubmessage();
    }
    if ((*(void *)&self->_flags & 0x10) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_departureRouteID) {
      PBDataWriterWriteDataField();
    }
    if ((*(void *)&self->_flags & 4) != 0) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_arrivalRouteID) {
      PBDataWriterWriteDataField();
    }
    if (*(void *)&self->_flags) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_trafficColors.count)
    {
      uint64_t v157 = 0;
      PBDataWriterPlaceMark();
      if (self->_trafficColors.count)
      {
        unint64_t v19 = 0;
        do
        {
          PBDataWriterWriteUint32Field();
          ++v19;
        }
        while (v19 < self->_trafficColors.count);
      }
      PBDataWriterRecallMark();
    }
    if (self->_trafficColorOffsets.count)
    {
      uint64_t v157 = 0;
      PBDataWriterPlaceMark();
      if (self->_trafficColorOffsets.count)
      {
        unint64_t v20 = 0;
        do
        {
          PBDataWriterWriteUint32Field();
          ++v20;
        }
        while (v20 < self->_trafficColorOffsets.count);
      }
      PBDataWriterRecallMark();
    }
    long long v155 = 0u;
    long long v156 = 0u;
    long long v153 = 0u;
    long long v154 = 0u;
    v21 = self->_routeLineStyleInfos;
    uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v153 objects:v185 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v154;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v154 != v23) {
            objc_enumerationMutation(v21);
          }
          PBDataWriterWriteSubmessage();
          ++v24;
        }
        while (v22 != v24);
        uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v153 objects:v185 count:16];
      }
      while (v22);
    }

    long long v151 = 0u;
    long long v152 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    v25 = self->_routeCameraInputInfos;
    uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v149 objects:v184 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v150;
      do
      {
        uint64_t v28 = 0;
        do
        {
          if (*(void *)v150 != v27) {
            objc_enumerationMutation(v25);
          }
          PBDataWriterWriteSubmessage();
          ++v28;
        }
        while (v26 != v28);
        uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v149 objects:v184 count:16];
      }
      while (v26);
    }

    long long v147 = 0u;
    long long v148 = 0u;
    long long v145 = 0u;
    long long v146 = 0u;
    id v29 = self->_trafficColorInfos;
    uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v145 objects:v183 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v146;
      do
      {
        uint64_t v32 = 0;
        do
        {
          if (*(void *)v146 != v31) {
            objc_enumerationMutation(v29);
          }
          PBDataWriterWriteSubmessage();
          ++v32;
        }
        while (v30 != v32);
        uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v145 objects:v183 count:16];
      }
      while (v30);
    }

    long long v143 = 0u;
    long long v144 = 0u;
    long long v141 = 0u;
    long long v142 = 0u;
    uint64_t v33 = self->_routeNames;
    uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v141 objects:v182 count:16];
    if (v34)
    {
      uint64_t v35 = *(void *)v142;
      do
      {
        uint64_t v36 = 0;
        do
        {
          if (*(void *)v142 != v35) {
            objc_enumerationMutation(v33);
          }
          PBDataWriterWriteSubmessage();
          ++v36;
        }
        while (v34 != v36);
        uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v141 objects:v182 count:16];
      }
      while (v34);
    }

    if ((*(void *)&self->_flags & 0x80) != 0) {
      PBDataWriterWriteUint32Field();
    }
    long long v139 = 0u;
    long long v140 = 0u;
    long long v137 = 0u;
    long long v138 = 0u;
    uint64_t v37 = self->_advisoryNotices;
    uint64_t v38 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v137 objects:v181 count:16];
    if (v38)
    {
      uint64_t v39 = *(void *)v138;
      do
      {
        uint64_t v40 = 0;
        do
        {
          if (*(void *)v138 != v39) {
            objc_enumerationMutation(v37);
          }
          PBDataWriterWriteStringField();
          ++v40;
        }
        while (v38 != v40);
        uint64_t v38 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v137 objects:v181 count:16];
      }
      while (v38);
    }

    if (self->_routeLabelDetailText) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_infrastructureDescription) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_clickableAdvisory) {
      PBDataWriterWriteSubmessage();
    }
    uint64_t v41 = (uint64_t)self->_flags;
    if ((v41 & 0x2000) != 0)
    {
      PBDataWriterWriteUint32Field();
      uint64_t v41 = (uint64_t)self->_flags;
    }
    if ((v41 & 0x4000) != 0)
    {
      PBDataWriterWriteUint32Field();
      uint64_t v41 = (uint64_t)self->_flags;
    }
    if ((v41 & 0x400) != 0)
    {
      PBDataWriterWriteUint32Field();
      uint64_t v41 = (uint64_t)self->_flags;
    }
    if ((v41 & 0x10000) != 0)
    {
      PBDataWriterWriteBOOLField();
      uint64_t v41 = (uint64_t)self->_flags;
    }
    if ((v41 & 0x8000) != 0)
    {
      PBDataWriterWriteBOOLField();
      uint64_t v41 = (uint64_t)self->_flags;
    }
    if ((v41 & 0x20000) != 0) {
      PBDataWriterWriteBOOLField();
    }
    long long v135 = 0u;
    long long v136 = 0u;
    long long v133 = 0u;
    long long v134 = 0u;
    uint64_t v42 = self->_enrouteNotices;
    uint64_t v43 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v133 objects:v180 count:16];
    if (v43)
    {
      uint64_t v44 = *(void *)v134;
      do
      {
        uint64_t v45 = 0;
        do
        {
          if (*(void *)v134 != v44) {
            objc_enumerationMutation(v42);
          }
          PBDataWriterWriteSubmessage();
          ++v45;
        }
        while (v43 != v45);
        uint64_t v43 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v133 objects:v180 count:16];
      }
      while (v43);
    }

    if (self->_unpackedLatLngVertices) {
      PBDataWriterWriteDataField();
    }
    if (self->_incidentIndices.count)
    {
      uint64_t v157 = 0;
      PBDataWriterPlaceMark();
      if (self->_incidentIndices.count)
      {
        unint64_t v46 = 0;
        do
        {
          PBDataWriterWriteUint32Field();
          ++v46;
        }
        while (v46 < self->_incidentIndices.count);
      }
      PBDataWriterRecallMark();
    }
    if (self->_incidentEndOffsetsInRoutes.count)
    {
      uint64_t v157 = 0;
      PBDataWriterPlaceMark();
      if (self->_incidentEndOffsetsInRoutes.count)
      {
        unint64_t v47 = 0;
        do
        {
          PBDataWriterWriteUint32Field();
          ++v47;
        }
        while (v47 < self->_incidentEndOffsetsInRoutes.count);
      }
      PBDataWriterRecallMark();
    }
    long long v131 = 0u;
    long long v132 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    v48 = self->_incidentOnRouteInfos;
    uint64_t v49 = [(NSMutableArray *)v48 countByEnumeratingWithState:&v129 objects:v179 count:16];
    if (v49)
    {
      uint64_t v50 = *(void *)v130;
      do
      {
        uint64_t v51 = 0;
        do
        {
          if (*(void *)v130 != v50) {
            objc_enumerationMutation(v48);
          }
          PBDataWriterWriteSubmessage();
          ++v51;
        }
        while (v49 != v51);
        uint64_t v49 = [(NSMutableArray *)v48 countByEnumeratingWithState:&v129 objects:v179 count:16];
      }
      while (v49);
    }

    if (self->_routePlanningDescription) {
      PBDataWriterWriteSubmessage();
    }
    long long v127 = 0u;
    long long v128 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    int v52 = self->_routeDescriptions;
    uint64_t v53 = [(NSMutableArray *)v52 countByEnumeratingWithState:&v125 objects:v178 count:16];
    if (v53)
    {
      uint64_t v54 = *(void *)v126;
      do
      {
        uint64_t v55 = 0;
        do
        {
          if (*(void *)v126 != v54) {
            objc_enumerationMutation(v52);
          }
          PBDataWriterWriteSubmessage();
          ++v55;
        }
        while (v53 != v55);
        uint64_t v53 = [(NSMutableArray *)v52 countByEnumeratingWithState:&v125 objects:v178 count:16];
      }
      while (v53);
    }

    long long v123 = 0u;
    long long v124 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    id v56 = self->_startingRouteInstructions;
    uint64_t v57 = [(NSMutableArray *)v56 countByEnumeratingWithState:&v121 objects:v177 count:16];
    if (v57)
    {
      uint64_t v58 = *(void *)v122;
      do
      {
        uint64_t v59 = 0;
        do
        {
          if (*(void *)v122 != v58) {
            objc_enumerationMutation(v56);
          }
          PBDataWriterWriteSubmessage();
          ++v59;
        }
        while (v57 != v59);
        uint64_t v57 = [(NSMutableArray *)v56 countByEnumeratingWithState:&v121 objects:v177 count:16];
      }
      while (v57);
    }

    long long v119 = 0u;
    long long v120 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    v60 = self->_endingRouteInstructions;
    uint64_t v61 = [(NSMutableArray *)v60 countByEnumeratingWithState:&v117 objects:v176 count:16];
    if (v61)
    {
      uint64_t v62 = *(void *)v118;
      do
      {
        uint64_t v63 = 0;
        do
        {
          if (*(void *)v118 != v62) {
            objc_enumerationMutation(v60);
          }
          PBDataWriterWriteSubmessage();
          ++v63;
        }
        while (v61 != v63);
        uint64_t v61 = [(NSMutableArray *)v60 countByEnumeratingWithState:&v117 objects:v176 count:16];
      }
      while (v61);
    }

    if (self->_trafficDescription) {
      PBDataWriterWriteStringField();
    }
    if (self->_trafficDescriptionLong) {
      PBDataWriterWriteStringField();
    }
    if (self->_alertNonRecommendedRouteText) {
      PBDataWriterWriteSubmessage();
    }
    long long v115 = 0u;
    long long v116 = 0u;
    long long v113 = 0u;
    long long v114 = 0u;
    v64 = self->_guidanceEvents;
    uint64_t v65 = [(NSMutableArray *)v64 countByEnumeratingWithState:&v113 objects:v175 count:16];
    if (v65)
    {
      uint64_t v66 = *(void *)v114;
      do
      {
        uint64_t v67 = 0;
        do
        {
          if (*(void *)v114 != v66) {
            objc_enumerationMutation(v64);
          }
          PBDataWriterWriteSubmessage();
          ++v67;
        }
        while (v65 != v67);
        uint64_t v65 = [(NSMutableArray *)v64 countByEnumeratingWithState:&v113 objects:v175 count:16];
      }
      while (v65);
    }

    if (self->_launchAndGoCardText) {
      PBDataWriterWriteSubmessage();
    }
    long long v111 = 0u;
    long long v112 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    uint64_t v68 = self->_roadComplexitys;
    uint64_t v69 = [(NSMutableArray *)v68 countByEnumeratingWithState:&v109 objects:v174 count:16];
    if (v69)
    {
      uint64_t v70 = *(void *)v110;
      do
      {
        uint64_t v71 = 0;
        do
        {
          if (*(void *)v110 != v70) {
            objc_enumerationMutation(v68);
          }
          PBDataWriterWriteSubmessage();
          ++v71;
        }
        while (v69 != v71);
        uint64_t v69 = [(NSMutableArray *)v68 countByEnumeratingWithState:&v109 objects:v174 count:16];
      }
      while (v69);
    }

    long long v107 = 0u;
    long long v108 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    id v72 = self->_laneWidths;
    uint64_t v73 = [(NSMutableArray *)v72 countByEnumeratingWithState:&v105 objects:v173 count:16];
    if (v73)
    {
      uint64_t v74 = *(void *)v106;
      do
      {
        uint64_t v75 = 0;
        do
        {
          if (*(void *)v106 != v74) {
            objc_enumerationMutation(v72);
          }
          PBDataWriterWriteSubmessage();
          ++v75;
        }
        while (v73 != v75);
        uint64_t v73 = [(NSMutableArray *)v72 countByEnumeratingWithState:&v105 objects:v173 count:16];
      }
      while (v73);
    }

    if (self->_elevationProfile) {
      PBDataWriterWriteSubmessage();
    }
    if ((*(void *)&self->_flags & 2) != 0) {
      PBDataWriterWriteUint32Field();
    }
    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    uint64_t v76 = self->_restrictedZoneIds;
    uint64_t v77 = [(NSMutableArray *)v76 countByEnumeratingWithState:&v101 objects:v172 count:16];
    if (v77)
    {
      uint64_t v78 = *(void *)v102;
      do
      {
        uint64_t v79 = 0;
        do
        {
          if (*(void *)v102 != v78) {
            objc_enumerationMutation(v76);
          }
          PBDataWriterWriteSubmessage();
          ++v79;
        }
        while (v77 != v79);
        uint64_t v77 = [(NSMutableArray *)v76 countByEnumeratingWithState:&v101 objects:v172 count:16];
      }
      while (v77);
    }

    uint64_t v80 = (uint64_t)self->_flags;
    if ((v80 & 0x100) != 0)
    {
      PBDataWriterWriteInt32Field();
      uint64_t v80 = (uint64_t)self->_flags;
    }
    if ((v80 & 0x20) != 0)
    {
      PBDataWriterWriteInt32Field();
      uint64_t v80 = (uint64_t)self->_flags;
    }
    if ((v80 & 0x800) != 0) {
      PBDataWriterWriteInt32Field();
    }
    long long v99 = 0u;
    long long v100 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    uint64_t v81 = self->_stepGroups;
    uint64_t v82 = [(NSMutableArray *)v81 countByEnumeratingWithState:&v97 objects:v171 count:16];
    if (v82)
    {
      uint64_t v83 = *(void *)v98;
      do
      {
        uint64_t v84 = 0;
        do
        {
          if (*(void *)v98 != v83) {
            objc_enumerationMutation(v81);
          }
          PBDataWriterWriteSubmessage();
          ++v84;
        }
        while (v82 != v84);
        uint64_t v82 = [(NSMutableArray *)v81 countByEnumeratingWithState:&v97 objects:v171 count:16];
      }
      while (v82);
    }

    long long v95 = 0u;
    long long v96 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    uint64_t v85 = self->_updateLocations;
    uint64_t v86 = [(NSMutableArray *)v85 countByEnumeratingWithState:&v93 objects:v170 count:16];
    if (v86)
    {
      uint64_t v87 = *(void *)v94;
      do
      {
        uint64_t v88 = 0;
        do
        {
          if (*(void *)v94 != v87) {
            objc_enumerationMutation(v85);
          }
          PBDataWriterWriteSubmessage();
          ++v88;
        }
        while (v86 != v88);
        uint64_t v86 = [(NSMutableArray *)v85 countByEnumeratingWithState:&v93 objects:v170 count:16];
      }
      while (v86);
    }

    if (self->_originWaypointInfo) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_destinationWaypointInfo) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_cellularCoverages.count)
    {
      uint64_t v157 = 0;
      PBDataWriterPlaceMark();
      if (self->_cellularCoverages.count)
      {
        unint64_t v89 = 0;
        do
        {
          PBDataWriterWriteInt32Field();
          ++v89;
        }
        while (v89 < self->_cellularCoverages.count);
      }
      PBDataWriterRecallMark();
    }
    if (self->_cellularCoverageOffsets.count)
    {
      uint64_t v157 = 0;
      PBDataWriterPlaceMark();
      if (self->_cellularCoverageOffsets.count)
      {
        unint64_t v90 = 0;
        do
        {
          PBDataWriterWriteUint32Field();
          ++v90;
        }
        while (v90 < self->_cellularCoverageOffsets.count);
      }
      PBDataWriterRecallMark();
    }
    if (self->_originListInstruction) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_destinationListInstruction) {
      PBDataWriterWriteSubmessage();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v93);
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  -[GEORoute _readDestinationWaypointInfo]((uint64_t)self);
  if (![(GEOWaypointInfo *)self->_destinationWaypointInfo hasGreenTeaWithValue:v3])
  {
    -[GEORoute _readOriginWaypointInfo]((uint64_t)self);
    if (![(GEOWaypointInfo *)self->_originWaypointInfo hasGreenTeaWithValue:v3])
    {
      -[GEORoute _readRestrictedZoneIds]((uint64_t)self);
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v6 = self->_restrictedZoneIds;
      uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v21;
LABEL_6:
        uint64_t v10 = 0;
        while (1)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          if ([*(id *)(*((void *)&v20 + 1) + 8 * v10) hasGreenTeaWithValue:v3]) {
            break;
          }
          if (v8 == ++v10)
          {
            uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
            if (v8) {
              goto LABEL_6;
            }
            goto LABEL_12;
          }
        }
      }
      else
      {
LABEL_12:

        -[GEORoute _readSteps]((uint64_t)self);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        id v6 = self->_steps;
        uint64_t v11 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (!v11)
        {
LABEL_20:
          BOOL v5 = 0;
LABEL_22:

          return v5;
        }
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v17;
LABEL_14:
        uint64_t v14 = 0;
        while (1)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v6);
          }
          if (objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v14), "hasGreenTeaWithValue:", v3, (void)v16)) {
            break;
          }
          if (v12 == ++v14)
          {
            uint64_t v12 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
            if (v12) {
              goto LABEL_14;
            }
            goto LABEL_20;
          }
        }
      }
      BOOL v5 = 1;
      goto LABEL_22;
    }
  }
  return 1;
}

- (void)copyTo:(id)a3
{
  long long v107 = (char *)a3;
  [(GEORoute *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)v107 + 1, self->_reader);
  *((_DWORD *)v107 + 122) = self->_readerMarkPos;
  *((_DWORD *)v107 + 123) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(void *)&self->_flags & 0x1000) != 0)
  {
    *((_DWORD *)v107 + 137) = self->_transportType;
    *(void *)(v107 + 564) |= 0x1000uLL;
  }
  if ([(GEORoute *)self stepsCount])
  {
    [v107 clearSteps];
    unint64_t v4 = [(GEORoute *)self stepsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORoute *)self stepAtIndex:i];
        [v107 addStep:v7];
      }
    }
  }
  if (self->_name) {
    objc_msgSend(v107, "setName:");
  }
  uint64_t v8 = v107;
  if (self->_phoneticName)
  {
    objc_msgSend(v107, "setPhoneticName:");
    uint64_t v8 = v107;
  }
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 8) != 0)
  {
    *((_DWORD *)v8 + 128) = self->_distance;
    *(void *)(v8 + 564) |= 8uLL;
    uint64_t flags = (uint64_t)self->_flags;
  }
  if ((flags & 0x40) != 0)
  {
    *((_DWORD *)v8 + 131) = self->_expectedTime;
    *(void *)(v8 + 564) |= 0x40uLL;
  }
  if (self->_routeID)
  {
    objc_msgSend(v107, "setRouteID:");
    uint64_t v8 = v107;
  }
  if ((*(void *)&self->_flags & 0x200) != 0)
  {
    *((_DWORD *)v8 + 134) = self->_routeType;
    *(void *)(v8 + 564) |= 0x200uLL;
  }
  if ([(GEORoute *)self zilchPointsCount])
  {
    [v107 clearZilchPoints];
    unint64_t v10 = [(GEORoute *)self zilchPointsCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        uint64_t v13 = [(GEORoute *)self zilchPointsAtIndex:j];
        [v107 addZilchPoints:v13];
      }
    }
  }
  if ([(GEORoute *)self basicPointsCount])
  {
    [v107 clearBasicPoints];
    unint64_t v14 = [(GEORoute *)self basicPointsCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t k = 0; k != v15; ++k)
      {
        long long v17 = [(GEORoute *)self basicPointsAtIndex:k];
        [v107 addBasicPoints:v17];
      }
    }
  }
  if (self->_pathLeg) {
    objc_msgSend(v107, "setPathLeg:");
  }
  long long v18 = v107;
  if (self->_pathMapMatcherInstructions)
  {
    objc_msgSend(v107, "setPathMapMatcherInstructions:");
    long long v18 = v107;
  }
  if ((*(void *)&self->_flags & 0x10) != 0)
  {
    *((_DWORD *)v18 + 129) = self->_drivingSide;
    *(void *)(v18 + 564) |= 0x10uLL;
  }
  if (self->_departureRouteID)
  {
    objc_msgSend(v107, "setDepartureRouteID:");
    long long v18 = v107;
  }
  if ((*(void *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v18 + 127) = self->_departureStepID;
    *(void *)(v18 + 564) |= 4uLL;
  }
  if (self->_arrivalRouteID)
  {
    objc_msgSend(v107, "setArrivalRouteID:");
    long long v18 = v107;
  }
  if (*(void *)&self->_flags)
  {
    *((_DWORD *)v18 + 125) = self->_arrivalStepID;
    *(void *)(v18 + 564) |= 1uLL;
  }
  if ([(GEORoute *)self trafficColorsCount])
  {
    [v107 clearTrafficColors];
    unint64_t v19 = [(GEORoute *)self trafficColorsCount];
    if (v19)
    {
      unint64_t v20 = v19;
      for (uint64_t m = 0; m != v20; ++m)
        objc_msgSend(v107, "addTrafficColor:", -[GEORoute trafficColorAtIndex:](self, "trafficColorAtIndex:", m));
    }
  }
  if ([(GEORoute *)self trafficColorOffsetsCount])
  {
    [v107 clearTrafficColorOffsets];
    unint64_t v22 = [(GEORoute *)self trafficColorOffsetsCount];
    if (v22)
    {
      unint64_t v23 = v22;
      for (uint64_t n = 0; n != v23; ++n)
        objc_msgSend(v107, "addTrafficColorOffset:", -[GEORoute trafficColorOffsetAtIndex:](self, "trafficColorOffsetAtIndex:", n));
    }
  }
  if ([(GEORoute *)self routeLineStyleInfosCount])
  {
    [v107 clearRouteLineStyleInfos];
    unint64_t v25 = [(GEORoute *)self routeLineStyleInfosCount];
    if (v25)
    {
      unint64_t v26 = v25;
      for (iuint64_t i = 0; ii != v26; ++ii)
      {
        uint64_t v28 = [(GEORoute *)self routeLineStyleInfoAtIndex:ii];
        [v107 addRouteLineStyleInfo:v28];
      }
    }
  }
  if ([(GEORoute *)self routeCameraInputInfosCount])
  {
    [v107 clearRouteCameraInputInfos];
    unint64_t v29 = [(GEORoute *)self routeCameraInputInfosCount];
    if (v29)
    {
      unint64_t v30 = v29;
      for (juint64_t j = 0; jj != v30; ++jj)
      {
        uint64_t v32 = [(GEORoute *)self routeCameraInputInfoAtIndex:jj];
        [v107 addRouteCameraInputInfo:v32];
      }
    }
  }
  if ([(GEORoute *)self trafficColorInfosCount])
  {
    [v107 clearTrafficColorInfos];
    unint64_t v33 = [(GEORoute *)self trafficColorInfosCount];
    if (v33)
    {
      unint64_t v34 = v33;
      for (kuint64_t k = 0; kk != v34; ++kk)
      {
        uint64_t v36 = [(GEORoute *)self trafficColorInfoAtIndex:kk];
        [v107 addTrafficColorInfo:v36];
      }
    }
  }
  if ([(GEORoute *)self routeNamesCount])
  {
    [v107 clearRouteNames];
    unint64_t v37 = [(GEORoute *)self routeNamesCount];
    if (v37)
    {
      unint64_t v38 = v37;
      for (muint64_t m = 0; mm != v38; ++mm)
      {
        uint64_t v40 = [(GEORoute *)self routeNameAtIndex:mm];
        [v107 addRouteName:v40];
      }
    }
  }
  if ((*(void *)&self->_flags & 0x80) != 0)
  {
    *((_DWORD *)v107 + 132) = self->_historicTravelTime;
    *(void *)(v107 + 564) |= 0x80uLL;
  }
  if ([(GEORoute *)self advisoryNoticesCount])
  {
    [v107 clearAdvisoryNotices];
    unint64_t v41 = [(GEORoute *)self advisoryNoticesCount];
    if (v41)
    {
      unint64_t v42 = v41;
      for (nuint64_t n = 0; nn != v42; ++nn)
      {
        uint64_t v44 = [(GEORoute *)self advisoryNoticeAtIndex:nn];
        [v107 addAdvisoryNotice:v44];
      }
    }
  }
  if (self->_routeLabelDetailText) {
    objc_msgSend(v107, "setRouteLabelDetailText:");
  }
  uint64_t v45 = v107;
  if (self->_infrastructureDescription)
  {
    objc_msgSend(v107, "setInfrastructureDescription:");
    uint64_t v45 = v107;
  }
  if (self->_clickableAdvisory)
  {
    objc_msgSend(v107, "setClickableAdvisory:");
    uint64_t v45 = v107;
  }
  p_uint64_t flags = &self->_flags;
  uint64_t v47 = (uint64_t)self->_flags;
  if ((v47 & 0x2000) != 0)
  {
    *((_DWORD *)v45 + 138) = self->_travelTimeAggressiveEstimate;
    *(void *)(v45 + 564) |= 0x2000uLL;
    uint64_t v47 = *(void *)p_flags;
    if ((*(void *)p_flags & 0x4000) == 0)
    {
LABEL_79:
      if ((v47 & 0x400) == 0) {
        goto LABEL_80;
      }
      goto LABEL_177;
    }
  }
  else if ((v47 & 0x4000) == 0)
  {
    goto LABEL_79;
  }
  *((_DWORD *)v45 + 139) = self->_travelTimeConservativeEstimate;
  *(void *)(v45 + 564) |= 0x4000uLL;
  uint64_t v47 = (uint64_t)self->_flags;
  if ((v47 & 0x400) == 0)
  {
LABEL_80:
    if ((v47 & 0x10000) == 0) {
      goto LABEL_81;
    }
    goto LABEL_178;
  }
LABEL_177:
  *((_DWORD *)v45 + 135) = self->_staticTravelTime;
  *(void *)(v45 + 564) |= 0x400uLL;
  uint64_t v47 = (uint64_t)self->_flags;
  if ((v47 & 0x10000) == 0)
  {
LABEL_81:
    if ((v47 & 0x8000) == 0) {
      goto LABEL_82;
    }
LABEL_179:
    v45[560] = self->_avoidsHighways;
    *(void *)(v45 + 564) |= 0x8000uLL;
    if ((*(void *)&self->_flags & 0x20000) == 0) {
      goto LABEL_84;
    }
    goto LABEL_83;
  }
LABEL_178:
  v45[561] = self->_avoidsTolls;
  *(void *)(v45 + 564) |= 0x10000uLL;
  uint64_t v47 = (uint64_t)self->_flags;
  if ((v47 & 0x8000) != 0) {
    goto LABEL_179;
  }
LABEL_82:
  if ((v47 & 0x20000) != 0)
  {
LABEL_83:
    v45[562] = self->_avoidsTraffic;
    *(void *)(v45 + 564) |= 0x20000uLL;
  }
LABEL_84:
  if ([(GEORoute *)self enrouteNoticesCount])
  {
    [v107 clearEnrouteNotices];
    unint64_t v48 = [(GEORoute *)self enrouteNoticesCount];
    if (v48)
    {
      unint64_t v49 = v48;
      for (uint64_t i1 = 0; i1 != v49; ++i1)
      {
        uint64_t v51 = [(GEORoute *)self enrouteNoticeAtIndex:i1];
        [v107 addEnrouteNotice:v51];
      }
    }
  }
  if (self->_unpackedLatLngVertices) {
    objc_msgSend(v107, "setUnpackedLatLngVertices:");
  }
  if ([(GEORoute *)self incidentIndicesCount])
  {
    [v107 clearIncidentIndices];
    unint64_t v52 = [(GEORoute *)self incidentIndicesCount];
    if (v52)
    {
      unint64_t v53 = v52;
      for (uint64_t i2 = 0; i2 != v53; ++i2)
        objc_msgSend(v107, "addIncidentIndices:", -[GEORoute incidentIndicesAtIndex:](self, "incidentIndicesAtIndex:", i2));
    }
  }
  if ([(GEORoute *)self incidentEndOffsetsInRoutesCount])
  {
    [v107 clearIncidentEndOffsetsInRoutes];
    unint64_t v55 = [(GEORoute *)self incidentEndOffsetsInRoutesCount];
    if (v55)
    {
      unint64_t v56 = v55;
      for (uint64_t i3 = 0; i3 != v56; ++i3)
        objc_msgSend(v107, "addIncidentEndOffsetsInRoute:", -[GEORoute incidentEndOffsetsInRouteAtIndex:](self, "incidentEndOffsetsInRouteAtIndex:", i3));
    }
  }
  if ([(GEORoute *)self incidentOnRouteInfosCount])
  {
    [v107 clearIncidentOnRouteInfos];
    unint64_t v58 = [(GEORoute *)self incidentOnRouteInfosCount];
    if (v58)
    {
      unint64_t v59 = v58;
      for (uint64_t i4 = 0; i4 != v59; ++i4)
      {
        uint64_t v61 = [(GEORoute *)self incidentOnRouteInfoAtIndex:i4];
        [v107 addIncidentOnRouteInfo:v61];
      }
    }
  }
  if (self->_routePlanningDescription) {
    objc_msgSend(v107, "setRoutePlanningDescription:");
  }
  if ([(GEORoute *)self routeDescriptionsCount])
  {
    [v107 clearRouteDescriptions];
    unint64_t v62 = [(GEORoute *)self routeDescriptionsCount];
    if (v62)
    {
      unint64_t v63 = v62;
      for (uint64_t i5 = 0; i5 != v63; ++i5)
      {
        uint64_t v65 = [(GEORoute *)self routeDescriptionAtIndex:i5];
        [v107 addRouteDescription:v65];
      }
    }
  }
  if ([(GEORoute *)self startingRouteInstructionsCount])
  {
    [v107 clearStartingRouteInstructions];
    unint64_t v66 = [(GEORoute *)self startingRouteInstructionsCount];
    if (v66)
    {
      unint64_t v67 = v66;
      for (uint64_t i6 = 0; i6 != v67; ++i6)
      {
        uint64_t v69 = [(GEORoute *)self startingRouteInstructionAtIndex:i6];
        [v107 addStartingRouteInstruction:v69];
      }
    }
  }
  if ([(GEORoute *)self endingRouteInstructionsCount])
  {
    [v107 clearEndingRouteInstructions];
    unint64_t v70 = [(GEORoute *)self endingRouteInstructionsCount];
    if (v70)
    {
      unint64_t v71 = v70;
      for (uint64_t i7 = 0; i7 != v71; ++i7)
      {
        uint64_t v73 = [(GEORoute *)self endingRouteInstructionAtIndex:i7];
        [v107 addEndingRouteInstruction:v73];
      }
    }
  }
  if (self->_trafficDescription) {
    objc_msgSend(v107, "setTrafficDescription:");
  }
  if (self->_trafficDescriptionLong) {
    objc_msgSend(v107, "setTrafficDescriptionLong:");
  }
  if (self->_alertNonRecommendedRouteText) {
    objc_msgSend(v107, "setAlertNonRecommendedRouteText:");
  }
  if ([(GEORoute *)self guidanceEventsCount])
  {
    [v107 clearGuidanceEvents];
    unint64_t v74 = [(GEORoute *)self guidanceEventsCount];
    if (v74)
    {
      unint64_t v75 = v74;
      for (uint64_t i8 = 0; i8 != v75; ++i8)
      {
        uint64_t v77 = [(GEORoute *)self guidanceEventAtIndex:i8];
        [v107 addGuidanceEvent:v77];
      }
    }
  }
  if (self->_launchAndGoCardText) {
    objc_msgSend(v107, "setLaunchAndGoCardText:");
  }
  if ([(GEORoute *)self roadComplexitysCount])
  {
    [v107 clearRoadComplexitys];
    unint64_t v78 = [(GEORoute *)self roadComplexitysCount];
    if (v78)
    {
      unint64_t v79 = v78;
      for (uint64_t i9 = 0; i9 != v79; ++i9)
      {
        uint64_t v81 = [(GEORoute *)self roadComplexityAtIndex:i9];
        [v107 addRoadComplexity:v81];
      }
    }
  }
  if ([(GEORoute *)self laneWidthsCount])
  {
    [v107 clearLaneWidths];
    unint64_t v82 = [(GEORoute *)self laneWidthsCount];
    if (v82)
    {
      unint64_t v83 = v82;
      for (uint64_t i10 = 0; i10 != v83; ++i10)
      {
        uint64_t v85 = [(GEORoute *)self laneWidthAtIndex:i10];
        [v107 addLaneWidth:v85];
      }
    }
  }
  if (self->_elevationProfile) {
    objc_msgSend(v107, "setElevationProfile:");
  }
  if ((*(void *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v107 + 126) = self->_arrivalParameterIndex;
    *(void *)(v107 + 564) |= 2uLL;
  }
  if ([(GEORoute *)self restrictedZoneIdsCount])
  {
    [v107 clearRestrictedZoneIds];
    unint64_t v86 = [(GEORoute *)self restrictedZoneIdsCount];
    if (v86)
    {
      unint64_t v87 = v86;
      for (uint64_t i11 = 0; i11 != v87; ++i11)
      {
        unint64_t v89 = [(GEORoute *)self restrictedZoneIdsAtIndex:i11];
        [v107 addRestrictedZoneIds:v89];
      }
    }
  }
  unint64_t v90 = &self->_flags;
  uint64_t v91 = (uint64_t)self->_flags;
  if ((v91 & 0x100) == 0)
  {
    if ((v91 & 0x20) == 0) {
      goto LABEL_146;
    }
LABEL_182:
    *((_DWORD *)v107 + 130) = self->_environmentalCongestionZoneImpact;
    *(void *)(v107 + 564) |= 0x20uLL;
    if ((*(void *)&self->_flags & 0x800) == 0) {
      goto LABEL_148;
    }
    goto LABEL_147;
  }
  *((_DWORD *)v107 + 133) = self->_licensePlateRestrictionImpact;
  *(void *)(v107 + 564) |= 0x100uLL;
  uint64_t v91 = *(void *)v90;
  if ((*(void *)v90 & 0x20) != 0) {
    goto LABEL_182;
  }
LABEL_146:
  if ((v91 & 0x800) != 0)
  {
LABEL_147:
    *((_DWORD *)v107 + 136) = self->_tollCongestionZoneImpact;
    *(void *)(v107 + 564) |= 0x800uLL;
  }
LABEL_148:
  if ([(GEORoute *)self stepGroupsCount])
  {
    [v107 clearStepGroups];
    unint64_t v92 = [(GEORoute *)self stepGroupsCount];
    if (v92)
    {
      unint64_t v93 = v92;
      for (uint64_t i12 = 0; i12 != v93; ++i12)
      {
        long long v95 = [(GEORoute *)self stepGroupAtIndex:i12];
        [v107 addStepGroup:v95];
      }
    }
  }
  if ([(GEORoute *)self updateLocationsCount])
  {
    [v107 clearUpdateLocations];
    unint64_t v96 = [(GEORoute *)self updateLocationsCount];
    if (v96)
    {
      unint64_t v97 = v96;
      for (uint64_t i13 = 0; i13 != v97; ++i13)
      {
        long long v99 = [(GEORoute *)self updateLocationAtIndex:i13];
        [v107 addUpdateLocation:v99];
      }
    }
  }
  if (self->_originWaypointInfo) {
    objc_msgSend(v107, "setOriginWaypointInfo:");
  }
  if (self->_destinationWaypointInfo) {
    objc_msgSend(v107, "setDestinationWaypointInfo:");
  }
  if ([(GEORoute *)self cellularCoveragesCount])
  {
    [v107 clearCellularCoverages];
    unint64_t v100 = [(GEORoute *)self cellularCoveragesCount];
    if (v100)
    {
      unint64_t v101 = v100;
      for (uint64_t i14 = 0; i14 != v101; ++i14)
        objc_msgSend(v107, "addCellularCoverage:", -[GEORoute cellularCoverageAtIndex:](self, "cellularCoverageAtIndex:", i14));
    }
  }
  if ([(GEORoute *)self cellularCoverageOffsetsCount])
  {
    [v107 clearCellularCoverageOffsets];
    unint64_t v103 = [(GEORoute *)self cellularCoverageOffsetsCount];
    if (v103)
    {
      unint64_t v104 = v103;
      for (uint64_t i15 = 0; i15 != v104; ++i15)
        objc_msgSend(v107, "addCellularCoverageOffset:", -[GEORoute cellularCoverageOffsetAtIndex:](self, "cellularCoverageOffsetAtIndex:", i15));
    }
  }
  if (self->_originListInstruction) {
    objc_msgSend(v107, "setOriginListInstruction:");
  }
  long long v106 = v107;
  if (self->_destinationListInstruction)
  {
    objc_msgSend(v107, "setDestinationListInstruction:");
    long long v106 = v107;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v248 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 8) & 2) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORouteReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_168;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORoute *)self readAll:0];
  if ((*(void *)&self->_flags & 0x1000) != 0)
  {
    *(_DWORD *)(v5 + 548) = self->_transportType;
    *(void *)(v5 + 564) |= 0x1000uLL;
  }
  long long v228 = 0u;
  long long v227 = 0u;
  long long v226 = 0u;
  long long v225 = 0u;
  uint64_t v9 = self->_steps;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v225 objects:v247 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v226;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v226 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v225 + 1) + 8 * v12) copyWithZone:a3];
        [(id)v5 addStep:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v225 objects:v247 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [(NSString *)self->_name copyWithZone:a3];
  unint64_t v15 = *(void **)(v5 + 296);
  *(void *)(v5 + 296) = v14;

  uint64_t v16 = [(NSString *)self->_phoneticName copyWithZone:a3];
  long long v17 = *(void **)(v5 + 336);
  *(void *)(v5 + 336) = v16;

  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 512) = self->_distance;
    *(void *)(v5 + 564) |= 8uLL;
    uint64_t flags = (uint64_t)self->_flags;
  }
  if ((flags & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 524) = self->_expectedTime;
    *(void *)(v5 + 564) |= 0x40uLL;
  }
  uint64_t v19 = [(NSData *)self->_routeID copyWithZone:a3];
  unint64_t v20 = *(void **)(v5 + 360);
  *(void *)(v5 + 360) = v19;

  if ((*(void *)&self->_flags & 0x200) != 0)
  {
    *(_DWORD *)(v5 + 536) = self->_routeType;
    *(void *)(v5 + 564) |= 0x200uLL;
  }
  long long v224 = 0u;
  long long v223 = 0u;
  long long v222 = 0u;
  long long v221 = 0u;
  long long v21 = self->_zilchPoints;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v221 objects:v246 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v222;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v222 != v23) {
          objc_enumerationMutation(v21);
        }
        unint64_t v25 = (void *)[*(id *)(*((void *)&v221 + 1) + 8 * v24) copyWithZone:a3];
        [(id)v5 addZilchPoints:v25];

        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v221 objects:v246 count:16];
    }
    while (v22);
  }

  long long v220 = 0u;
  long long v219 = 0u;
  long long v218 = 0u;
  long long v217 = 0u;
  unint64_t v26 = self->_basicPoints;
  uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v217 objects:v245 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v218;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v218 != v28) {
          objc_enumerationMutation(v26);
        }
        unint64_t v30 = (void *)[*(id *)(*((void *)&v217 + 1) + 8 * v29) copyWithZone:a3];
        [(id)v5 addBasicPoints:v30];

        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v217 objects:v245 count:16];
    }
    while (v27);
  }

  uint64_t v31 = [(NSData *)self->_pathLeg copyWithZone:a3];
  uint64_t v32 = *(void **)(v5 + 320);
  *(void *)(v5 + 320) = v31;

  id v33 = [(GEOPathMapMatcherInstructions *)self->_pathMapMatcherInstructions copyWithZone:a3];
  unint64_t v34 = *(void **)(v5 + 328);
  *(void *)(v5 + 328) = v33;

  if ((*(void *)&self->_flags & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 516) = self->_drivingSide;
    *(void *)(v5 + 564) |= 0x10uLL;
  }
  uint64_t v35 = [(NSData *)self->_departureRouteID copyWithZone:a3];
  uint64_t v36 = *(void **)(v5 + 208);
  *(void *)(v5 + 208) = v35;

  if ((*(void *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 508) = self->_departureStepID;
    *(void *)(v5 + 564) |= 4uLL;
  }
  uint64_t v37 = [(NSData *)self->_arrivalRouteID copyWithZone:a3];
  unint64_t v38 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v37;

  if (*(void *)&self->_flags)
  {
    *(_DWORD *)(v5 + 500) = self->_arrivalStepID;
    *(void *)(v5 + 564) |= 1uLL;
  }
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  long long v215 = 0u;
  long long v216 = 0u;
  long long v213 = 0u;
  long long v214 = 0u;
  uint64_t v39 = self->_routeLineStyleInfos;
  uint64_t v40 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v213 objects:v244 count:16];
  if (v40)
  {
    uint64_t v41 = *(void *)v214;
    do
    {
      uint64_t v42 = 0;
      do
      {
        if (*(void *)v214 != v41) {
          objc_enumerationMutation(v39);
        }
        uint64_t v43 = (void *)[*(id *)(*((void *)&v213 + 1) + 8 * v42) copyWithZone:a3];
        [(id)v5 addRouteLineStyleInfo:v43];

        ++v42;
      }
      while (v40 != v42);
      uint64_t v40 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v213 objects:v244 count:16];
    }
    while (v40);
  }

  long long v211 = 0u;
  long long v212 = 0u;
  long long v209 = 0u;
  long long v210 = 0u;
  uint64_t v44 = self->_routeCameraInputInfos;
  uint64_t v45 = [(NSMutableArray *)v44 countByEnumeratingWithState:&v209 objects:v243 count:16];
  if (v45)
  {
    uint64_t v46 = *(void *)v210;
    do
    {
      uint64_t v47 = 0;
      do
      {
        if (*(void *)v210 != v46) {
          objc_enumerationMutation(v44);
        }
        unint64_t v48 = (void *)[*(id *)(*((void *)&v209 + 1) + 8 * v47) copyWithZone:a3];
        [(id)v5 addRouteCameraInputInfo:v48];

        ++v47;
      }
      while (v45 != v47);
      uint64_t v45 = [(NSMutableArray *)v44 countByEnumeratingWithState:&v209 objects:v243 count:16];
    }
    while (v45);
  }

  long long v207 = 0u;
  long long v208 = 0u;
  long long v205 = 0u;
  long long v206 = 0u;
  unint64_t v49 = self->_trafficColorInfos;
  uint64_t v50 = [(NSMutableArray *)v49 countByEnumeratingWithState:&v205 objects:v242 count:16];
  if (v50)
  {
    uint64_t v51 = *(void *)v206;
    do
    {
      uint64_t v52 = 0;
      do
      {
        if (*(void *)v206 != v51) {
          objc_enumerationMutation(v49);
        }
        unint64_t v53 = (void *)[*(id *)(*((void *)&v205 + 1) + 8 * v52) copyWithZone:a3];
        [(id)v5 addTrafficColorInfo:v53];

        ++v52;
      }
      while (v50 != v52);
      uint64_t v50 = [(NSMutableArray *)v49 countByEnumeratingWithState:&v205 objects:v242 count:16];
    }
    while (v50);
  }

  long long v203 = 0u;
  long long v204 = 0u;
  long long v201 = 0u;
  long long v202 = 0u;
  uint64_t v54 = self->_routeNames;
  uint64_t v55 = [(NSMutableArray *)v54 countByEnumeratingWithState:&v201 objects:v241 count:16];
  if (v55)
  {
    uint64_t v56 = *(void *)v202;
    do
    {
      uint64_t v57 = 0;
      do
      {
        if (*(void *)v202 != v56) {
          objc_enumerationMutation(v54);
        }
        unint64_t v58 = (void *)[*(id *)(*((void *)&v201 + 1) + 8 * v57) copyWithZone:a3];
        [(id)v5 addRouteName:v58];

        ++v57;
      }
      while (v55 != v57);
      uint64_t v55 = [(NSMutableArray *)v54 countByEnumeratingWithState:&v201 objects:v241 count:16];
    }
    while (v55);
  }

  if ((*(void *)&self->_flags & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 528) = self->_historicTravelTime;
    *(void *)(v5 + 564) |= 0x80uLL;
  }
  long long v199 = 0u;
  long long v200 = 0u;
  long long v197 = 0u;
  long long v198 = 0u;
  unint64_t v59 = self->_advisoryNotices;
  uint64_t v60 = [(NSMutableArray *)v59 countByEnumeratingWithState:&v197 objects:v240 count:16];
  if (v60)
  {
    uint64_t v61 = *(void *)v198;
    do
    {
      uint64_t v62 = 0;
      do
      {
        if (*(void *)v198 != v61) {
          objc_enumerationMutation(v59);
        }
        unint64_t v63 = (void *)[*(id *)(*((void *)&v197 + 1) + 8 * v62) copyWithZone:a3];
        [(id)v5 addAdvisoryNotice:v63];

        ++v62;
      }
      while (v60 != v62);
      uint64_t v60 = [(NSMutableArray *)v59 countByEnumeratingWithState:&v197 objects:v240 count:16];
    }
    while (v60);
  }

  id v64 = [(GEOFormattedString *)self->_routeLabelDetailText copyWithZone:a3];
  uint64_t v65 = *(void **)(v5 + 392);
  *(void *)(v5 + 392) = v64;

  id v66 = [(GEOFormattedString *)self->_infrastructureDescription copyWithZone:a3];
  unint64_t v67 = *(void **)(v5 + 272);
  *(void *)(v5 + 272) = v66;

  id v68 = [(GEOClickableAdvisory *)self->_clickableAdvisory copyWithZone:a3];
  uint64_t v69 = *(void **)(v5 + 200);
  *(void *)(v5 + 200) = v68;

  p_uint64_t flags = &self->_flags;
  uint64_t v71 = (uint64_t)self->_flags;
  if ((v71 & 0x2000) != 0)
  {
    *(_DWORD *)(v5 + 552) = self->_travelTimeAggressiveEstimate;
    *(void *)(v5 + 564) |= 0x2000uLL;
    uint64_t v71 = *(void *)p_flags;
    if ((*(void *)p_flags & 0x4000) == 0)
    {
LABEL_79:
      if ((v71 & 0x400) == 0) {
        goto LABEL_80;
      }
      goto LABEL_171;
    }
  }
  else if ((v71 & 0x4000) == 0)
  {
    goto LABEL_79;
  }
  *(_DWORD *)(v5 + 556) = self->_travelTimeConservativeEstimate;
  *(void *)(v5 + 564) |= 0x4000uLL;
  uint64_t v71 = (uint64_t)self->_flags;
  if ((v71 & 0x400) == 0)
  {
LABEL_80:
    if ((v71 & 0x10000) == 0) {
      goto LABEL_81;
    }
    goto LABEL_172;
  }
LABEL_171:
  *(_DWORD *)(v5 + 540) = self->_staticTravelTime;
  *(void *)(v5 + 564) |= 0x400uLL;
  uint64_t v71 = (uint64_t)self->_flags;
  if ((v71 & 0x10000) == 0)
  {
LABEL_81:
    if ((v71 & 0x8000) == 0) {
      goto LABEL_82;
    }
    goto LABEL_173;
  }
LABEL_172:
  *(unsigned char *)(v5 + 561) = self->_avoidsTolls;
  *(void *)(v5 + 564) |= 0x10000uLL;
  uint64_t v71 = (uint64_t)self->_flags;
  if ((v71 & 0x8000) == 0)
  {
LABEL_82:
    if ((v71 & 0x20000) == 0) {
      goto LABEL_84;
    }
    goto LABEL_83;
  }
LABEL_173:
  *(unsigned char *)(v5 + 560) = self->_avoidsHighways;
  *(void *)(v5 + 564) |= 0x8000uLL;
  if ((*(void *)&self->_flags & 0x20000) != 0)
  {
LABEL_83:
    *(unsigned char *)(v5 + 562) = self->_avoidsTraffic;
    *(void *)(v5 + 564) |= 0x20000uLL;
  }
LABEL_84:
  long long v195 = 0u;
  long long v196 = 0u;
  long long v193 = 0u;
  long long v194 = 0u;
  id v72 = self->_enrouteNotices;
  uint64_t v73 = [(NSMutableArray *)v72 countByEnumeratingWithState:&v193 objects:v239 count:16];
  if (v73)
  {
    uint64_t v74 = *(void *)v194;
    do
    {
      uint64_t v75 = 0;
      do
      {
        if (*(void *)v194 != v74) {
          objc_enumerationMutation(v72);
        }
        uint64_t v76 = (void *)[*(id *)(*((void *)&v193 + 1) + 8 * v75) copyWithZone:a3];
        [(id)v5 addEnrouteNotice:v76];

        ++v75;
      }
      while (v73 != v75);
      uint64_t v73 = [(NSMutableArray *)v72 countByEnumeratingWithState:&v193 objects:v239 count:16];
    }
    while (v73);
  }

  uint64_t v77 = [(NSData *)self->_unpackedLatLngVertices copyWithZone:a3];
  unint64_t v78 = *(void **)(v5 + 464);
  *(void *)(v5 + 464) = v77;

  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  long long v191 = 0u;
  long long v192 = 0u;
  long long v189 = 0u;
  long long v190 = 0u;
  unint64_t v79 = self->_incidentOnRouteInfos;
  uint64_t v80 = [(NSMutableArray *)v79 countByEnumeratingWithState:&v189 objects:v238 count:16];
  if (v80)
  {
    uint64_t v81 = *(void *)v190;
    do
    {
      uint64_t v82 = 0;
      do
      {
        if (*(void *)v190 != v81) {
          objc_enumerationMutation(v79);
        }
        unint64_t v83 = (void *)[*(id *)(*((void *)&v189 + 1) + 8 * v82) copyWithZone:a3];
        [(id)v5 addIncidentOnRouteInfo:v83];

        ++v82;
      }
      while (v80 != v82);
      uint64_t v80 = [(NSMutableArray *)v79 countByEnumeratingWithState:&v189 objects:v238 count:16];
    }
    while (v80);
  }

  id v84 = [(GEORouteInformation *)self->_routePlanningDescription copyWithZone:a3];
  uint64_t v85 = *(void **)(v5 + 408);
  *(void *)(v5 + 408) = v84;

  long long v187 = 0u;
  long long v188 = 0u;
  long long v185 = 0u;
  long long v186 = 0u;
  unint64_t v86 = self->_routeDescriptions;
  uint64_t v87 = [(NSMutableArray *)v86 countByEnumeratingWithState:&v185 objects:v237 count:16];
  if (v87)
  {
    uint64_t v88 = *(void *)v186;
    do
    {
      uint64_t v89 = 0;
      do
      {
        if (*(void *)v186 != v88) {
          objc_enumerationMutation(v86);
        }
        unint64_t v90 = (void *)[*(id *)(*((void *)&v185 + 1) + 8 * v89) copyWithZone:a3];
        [(id)v5 addRouteDescription:v90];

        ++v89;
      }
      while (v87 != v89);
      uint64_t v87 = [(NSMutableArray *)v86 countByEnumeratingWithState:&v185 objects:v237 count:16];
    }
    while (v87);
  }

  long long v183 = 0u;
  long long v184 = 0u;
  long long v181 = 0u;
  long long v182 = 0u;
  uint64_t v91 = self->_startingRouteInstructions;
  uint64_t v92 = [(NSMutableArray *)v91 countByEnumeratingWithState:&v181 objects:v236 count:16];
  if (v92)
  {
    uint64_t v93 = *(void *)v182;
    do
    {
      uint64_t v94 = 0;
      do
      {
        if (*(void *)v182 != v93) {
          objc_enumerationMutation(v91);
        }
        long long v95 = (void *)[*(id *)(*((void *)&v181 + 1) + 8 * v94) copyWithZone:a3];
        [(id)v5 addStartingRouteInstruction:v95];

        ++v94;
      }
      while (v92 != v94);
      uint64_t v92 = [(NSMutableArray *)v91 countByEnumeratingWithState:&v181 objects:v236 count:16];
    }
    while (v92);
  }

  long long v179 = 0u;
  long long v180 = 0u;
  long long v177 = 0u;
  long long v178 = 0u;
  unint64_t v96 = self->_endingRouteInstructions;
  uint64_t v97 = [(NSMutableArray *)v96 countByEnumeratingWithState:&v177 objects:v235 count:16];
  if (v97)
  {
    uint64_t v98 = *(void *)v178;
    do
    {
      uint64_t v99 = 0;
      do
      {
        if (*(void *)v178 != v98) {
          objc_enumerationMutation(v96);
        }
        unint64_t v100 = (void *)[*(id *)(*((void *)&v177 + 1) + 8 * v99) copyWithZone:a3];
        [(id)v5 addEndingRouteInstruction:v100];

        ++v99;
      }
      while (v97 != v99);
      uint64_t v97 = [(NSMutableArray *)v96 countByEnumeratingWithState:&v177 objects:v235 count:16];
    }
    while (v97);
  }

  uint64_t v101 = [(NSString *)self->_trafficDescription copyWithZone:a3];
  long long v102 = *(void **)(v5 + 456);
  *(void *)(v5 + 456) = v101;

  uint64_t v103 = [(NSString *)self->_trafficDescriptionLong copyWithZone:a3];
  unint64_t v104 = *(void **)(v5 + 448);
  *(void *)(v5 + 448) = v103;

  id v105 = [(GEOAlertNonRecommendedRouteText *)self->_alertNonRecommendedRouteText copyWithZone:a3];
  long long v106 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v105;

  long long v175 = 0u;
  long long v176 = 0u;
  long long v173 = 0u;
  long long v174 = 0u;
  long long v107 = self->_guidanceEvents;
  uint64_t v108 = [(NSMutableArray *)v107 countByEnumeratingWithState:&v173 objects:v234 count:16];
  if (v108)
  {
    uint64_t v109 = *(void *)v174;
    do
    {
      uint64_t v110 = 0;
      do
      {
        if (*(void *)v174 != v109) {
          objc_enumerationMutation(v107);
        }
        long long v111 = (void *)[*(id *)(*((void *)&v173 + 1) + 8 * v110) copyWithZone:a3];
        [(id)v5 addGuidanceEvent:v111];

        ++v110;
      }
      while (v108 != v110);
      uint64_t v108 = [(NSMutableArray *)v107 countByEnumeratingWithState:&v173 objects:v234 count:16];
    }
    while (v108);
  }

  id v112 = [(GEOLaunchAndGoCardText *)self->_launchAndGoCardText copyWithZone:a3];
  long long v113 = *(void **)(v5 + 288);
  *(void *)(v5 + 288) = v112;

  long long v171 = 0u;
  long long v172 = 0u;
  long long v169 = 0u;
  long long v170 = 0u;
  long long v114 = self->_roadComplexitys;
  uint64_t v115 = [(NSMutableArray *)v114 countByEnumeratingWithState:&v169 objects:v233 count:16];
  if (v115)
  {
    uint64_t v116 = *(void *)v170;
    do
    {
      uint64_t v117 = 0;
      do
      {
        if (*(void *)v170 != v116) {
          objc_enumerationMutation(v114);
        }
        long long v118 = (void *)[*(id *)(*((void *)&v169 + 1) + 8 * v117) copyWithZone:a3];
        [(id)v5 addRoadComplexity:v118];

        ++v117;
      }
      while (v115 != v117);
      uint64_t v115 = [(NSMutableArray *)v114 countByEnumeratingWithState:&v169 objects:v233 count:16];
    }
    while (v115);
  }

  long long v167 = 0u;
  long long v168 = 0u;
  long long v165 = 0u;
  long long v166 = 0u;
  long long v119 = self->_laneWidths;
  uint64_t v120 = [(NSMutableArray *)v119 countByEnumeratingWithState:&v165 objects:v232 count:16];
  if (v120)
  {
    uint64_t v121 = *(void *)v166;
    do
    {
      uint64_t v122 = 0;
      do
      {
        if (*(void *)v166 != v121) {
          objc_enumerationMutation(v119);
        }
        long long v123 = (void *)[*(id *)(*((void *)&v165 + 1) + 8 * v122) copyWithZone:a3];
        [(id)v5 addLaneWidth:v123];

        ++v122;
      }
      while (v120 != v122);
      uint64_t v120 = [(NSMutableArray *)v119 countByEnumeratingWithState:&v165 objects:v232 count:16];
    }
    while (v120);
  }

  id v124 = [(GEOElevationProfile *)self->_elevationProfile copyWithZone:a3];
  long long v125 = *(void **)(v5 + 232);
  *(void *)(v5 + 232) = v124;

  if ((*(void *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 504) = self->_arrivalParameterIndex;
    *(void *)(v5 + 564) |= 2uLL;
  }
  long long v163 = 0u;
  long long v164 = 0u;
  long long v161 = 0u;
  long long v162 = 0u;
  long long v126 = self->_restrictedZoneIds;
  uint64_t v127 = [(NSMutableArray *)v126 countByEnumeratingWithState:&v161 objects:v231 count:16];
  if (v127)
  {
    uint64_t v128 = *(void *)v162;
    do
    {
      uint64_t v129 = 0;
      do
      {
        if (*(void *)v162 != v128) {
          objc_enumerationMutation(v126);
        }
        long long v130 = (void *)[*(id *)(*((void *)&v161 + 1) + 8 * v129) copyWithZone:a3];
        [(id)v5 addRestrictedZoneIds:v130];

        ++v129;
      }
      while (v127 != v129);
      uint64_t v127 = [(NSMutableArray *)v126 countByEnumeratingWithState:&v161 objects:v231 count:16];
    }
    while (v127);
  }

  long long v131 = &self->_flags;
  uint64_t v132 = (uint64_t)self->_flags;
  if ((v132 & 0x100) == 0)
  {
    if ((v132 & 0x20) == 0) {
      goto LABEL_151;
    }
LABEL_176:
    *(_DWORD *)(v5 + 520) = self->_environmentalCongestionZoneImpact;
    *(void *)(v5 + 564) |= 0x20uLL;
    if ((*(void *)&self->_flags & 0x800) == 0) {
      goto LABEL_153;
    }
    goto LABEL_152;
  }
  *(_DWORD *)(v5 + 532) = self->_licensePlateRestrictionImpact;
  *(void *)(v5 + 564) |= 0x100uLL;
  uint64_t v132 = *(void *)v131;
  if ((*(void *)v131 & 0x20) != 0) {
    goto LABEL_176;
  }
LABEL_151:
  if ((v132 & 0x800) != 0)
  {
LABEL_152:
    *(_DWORD *)(v5 + 544) = self->_tollCongestionZoneImpact;
    *(void *)(v5 + 564) |= 0x800uLL;
  }
LABEL_153:
  long long v159 = 0u;
  long long v160 = 0u;
  long long v157 = 0u;
  long long v158 = 0u;
  long long v133 = self->_stepGroups;
  uint64_t v134 = [(NSMutableArray *)v133 countByEnumeratingWithState:&v157 objects:v230 count:16];
  if (v134)
  {
    uint64_t v135 = *(void *)v158;
    do
    {
      uint64_t v136 = 0;
      do
      {
        if (*(void *)v158 != v135) {
          objc_enumerationMutation(v133);
        }
        long long v137 = (void *)[*(id *)(*((void *)&v157 + 1) + 8 * v136) copyWithZone:a3];
        [(id)v5 addStepGroup:v137];

        ++v136;
      }
      while (v134 != v136);
      uint64_t v134 = [(NSMutableArray *)v133 countByEnumeratingWithState:&v157 objects:v230 count:16];
    }
    while (v134);
  }

  long long v155 = 0u;
  long long v156 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  long long v138 = self->_updateLocations;
  uint64_t v139 = [(NSMutableArray *)v138 countByEnumeratingWithState:&v153 objects:v229 count:16];
  if (v139)
  {
    uint64_t v140 = *(void *)v154;
    do
    {
      uint64_t v141 = 0;
      do
      {
        if (*(void *)v154 != v140) {
          objc_enumerationMutation(v138);
        }
        long long v142 = objc_msgSend(*(id *)(*((void *)&v153 + 1) + 8 * v141), "copyWithZone:", a3, (void)v153);
        [(id)v5 addUpdateLocation:v142];

        ++v141;
      }
      while (v139 != v141);
      uint64_t v139 = [(NSMutableArray *)v138 countByEnumeratingWithState:&v153 objects:v229 count:16];
    }
    while (v139);
  }

  id v143 = [(GEOWaypointInfo *)self->_originWaypointInfo copyWithZone:a3];
  long long v144 = *(void **)(v5 + 312);
  *(void *)(v5 + 312) = v143;

  id v145 = [(GEOWaypointInfo *)self->_destinationWaypointInfo copyWithZone:a3];
  long long v146 = *(void **)(v5 + 224);
  *(void *)(v5 + 224) = v145;

  PBRepeatedInt32Copy();
  PBRepeatedUInt32Copy();
  id v147 = [(GEODrivingWalkingInstruction *)self->_originListInstruction copyWithZone:a3];
  long long v148 = *(void **)(v5 + 304);
  *(void *)(v5 + 304) = v147;

  id v149 = [(GEODrivingWalkingInstruction *)self->_destinationListInstruction copyWithZone:a3];
  long long v150 = *(void **)(v5 + 216);
  *(void *)(v5 + 216) = v149;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  id v151 = (id)v5;
LABEL_168:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_191;
  }
  [(GEORoute *)self readAll:1];
  [v4 readAll:1];
  uint64_t v5 = *(void *)(v4 + 564);
  if ((*(void *)&self->_flags & 0x1000) != 0)
  {
    if ((v5 & 0x1000) == 0 || self->_transportType != *((_DWORD *)v4 + 137)) {
      goto LABEL_191;
    }
  }
  else if ((v5 & 0x1000) != 0)
  {
    goto LABEL_191;
  }
  steps = self->_steps;
  if ((unint64_t)steps | *((void *)v4 + 54) && !-[NSMutableArray isEqual:](steps, "isEqual:")) {
    goto LABEL_191;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 37))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_191;
    }
  }
  phoneticName = self->_phoneticName;
  if ((unint64_t)phoneticName | *((void *)v4 + 42))
  {
    if (!-[NSString isEqual:](phoneticName, "isEqual:")) {
      goto LABEL_191;
    }
  }
  uint64_t flags = (uint64_t)self->_flags;
  uint64_t v10 = *(void *)(v4 + 564);
  if ((flags & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_distance != *((_DWORD *)v4 + 128)) {
      goto LABEL_191;
    }
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_191;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v10 & 0x40) == 0 || self->_expectedTime != *((_DWORD *)v4 + 131)) {
      goto LABEL_191;
    }
  }
  else if ((v10 & 0x40) != 0)
  {
    goto LABEL_191;
  }
  routeID = self->_routeID;
  if ((unint64_t)routeID | *((void *)v4 + 45))
  {
    if (!-[NSData isEqual:](routeID, "isEqual:")) {
      goto LABEL_191;
    }
    uint64_t flags = (uint64_t)self->_flags;
    uint64_t v10 = *(void *)(v4 + 564);
  }
  if ((flags & 0x200) != 0)
  {
    if ((v10 & 0x200) == 0 || self->_routeType != *((_DWORD *)v4 + 134)) {
      goto LABEL_191;
    }
  }
  else if ((v10 & 0x200) != 0)
  {
    goto LABEL_191;
  }
  zilchPoints = self->_zilchPoints;
  if ((unint64_t)zilchPoints | *((void *)v4 + 60)
    && !-[NSMutableArray isEqual:](zilchPoints, "isEqual:"))
  {
    goto LABEL_191;
  }
  basicPoints = self->_basicPoints;
  if ((unint64_t)basicPoints | *((void *)v4 + 24))
  {
    if (!-[NSMutableArray isEqual:](basicPoints, "isEqual:")) {
      goto LABEL_191;
    }
  }
  pathLeg = self->_pathLeg;
  if ((unint64_t)pathLeg | *((void *)v4 + 40))
  {
    if (!-[NSData isEqual:](pathLeg, "isEqual:")) {
      goto LABEL_191;
    }
  }
  pathMapMatcherInstructions = self->_pathMapMatcherInstructions;
  if ((unint64_t)pathMapMatcherInstructions | *((void *)v4 + 41))
  {
    if (!-[GEOPathMapMatcherInstructions isEqual:](pathMapMatcherInstructions, "isEqual:")) {
      goto LABEL_191;
    }
  }
  uint64_t v16 = (uint64_t)self->_flags;
  uint64_t v17 = *(void *)(v4 + 564);
  if ((v16 & 0x10) != 0)
  {
    if ((v17 & 0x10) == 0 || self->_drivingSide != *((_DWORD *)v4 + 129)) {
      goto LABEL_191;
    }
  }
  else if ((v17 & 0x10) != 0)
  {
    goto LABEL_191;
  }
  departureRouteID = self->_departureRouteID;
  if ((unint64_t)departureRouteID | *((void *)v4 + 26))
  {
    if (!-[NSData isEqual:](departureRouteID, "isEqual:")) {
      goto LABEL_191;
    }
    uint64_t v16 = (uint64_t)self->_flags;
    uint64_t v17 = *(void *)(v4 + 564);
  }
  if ((v16 & 4) != 0)
  {
    if ((v17 & 4) == 0 || self->_departureStepID != *((_DWORD *)v4 + 127)) {
      goto LABEL_191;
    }
  }
  else if ((v17 & 4) != 0)
  {
    goto LABEL_191;
  }
  arrivalRouteID = self->_arrivalRouteID;
  if ((unint64_t)arrivalRouteID | *((void *)v4 + 23))
  {
    if (!-[NSData isEqual:](arrivalRouteID, "isEqual:")) {
      goto LABEL_191;
    }
    uint64_t v16 = (uint64_t)self->_flags;
    uint64_t v17 = *(void *)(v4 + 564);
  }
  if (v16)
  {
    if ((v17 & 1) == 0 || self->_arrivalStepID != *((_DWORD *)v4 + 125)) {
      goto LABEL_191;
    }
  }
  else if (v17)
  {
    goto LABEL_191;
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_191;
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_191;
  }
  routeLineStyleInfos = self->_routeLineStyleInfos;
  if ((unint64_t)routeLineStyleInfos | *((void *)v4 + 50))
  {
    if (!-[NSMutableArray isEqual:](routeLineStyleInfos, "isEqual:")) {
      goto LABEL_191;
    }
  }
  routeCameraInputInfos = self->_routeCameraInputInfos;
  if ((unint64_t)routeCameraInputInfos | *((void *)v4 + 47))
  {
    if (!-[NSMutableArray isEqual:](routeCameraInputInfos, "isEqual:")) {
      goto LABEL_191;
    }
  }
  trafficColorInfos = self->_trafficColorInfos;
  if ((unint64_t)trafficColorInfos | *((void *)v4 + 55))
  {
    if (!-[NSMutableArray isEqual:](trafficColorInfos, "isEqual:")) {
      goto LABEL_191;
    }
  }
  routeNames = self->_routeNames;
  if ((unint64_t)routeNames | *((void *)v4 + 46))
  {
    if (!-[NSMutableArray isEqual:](routeNames, "isEqual:")) {
      goto LABEL_191;
    }
  }
  uint64_t v24 = *(void *)(v4 + 564);
  if ((*(void *)&self->_flags & 0x80) != 0)
  {
    if ((v24 & 0x80) == 0 || self->_historicTravelTime != *((_DWORD *)v4 + 132)) {
      goto LABEL_191;
    }
  }
  else if ((v24 & 0x80) != 0)
  {
    goto LABEL_191;
  }
  advisoryNotices = self->_advisoryNotices;
  if ((unint64_t)advisoryNotices | *((void *)v4 + 21)
    && !-[NSMutableArray isEqual:](advisoryNotices, "isEqual:"))
  {
    goto LABEL_191;
  }
  routeLabelDetailText = self->_routeLabelDetailText;
  if ((unint64_t)routeLabelDetailText | *((void *)v4 + 49))
  {
    if (!-[GEOFormattedString isEqual:](routeLabelDetailText, "isEqual:")) {
      goto LABEL_191;
    }
  }
  infrastructureDescriptiouint64_t n = self->_infrastructureDescription;
  if ((unint64_t)infrastructureDescription | *((void *)v4 + 34))
  {
    if (!-[GEOFormattedString isEqual:](infrastructureDescription, "isEqual:")) {
      goto LABEL_191;
    }
  }
  clickableAdvisory = self->_clickableAdvisory;
  if ((unint64_t)clickableAdvisory | *((void *)v4 + 25))
  {
    if (!-[GEOClickableAdvisory isEqual:](clickableAdvisory, "isEqual:")) {
      goto LABEL_191;
    }
  }
  uint64_t v29 = (uint64_t)self->_flags;
  uint64_t v30 = *(void *)(v4 + 564);
  if ((v29 & 0x2000) != 0)
  {
    if ((v30 & 0x2000) == 0 || self->_travelTimeAggressiveEstimate != *((_DWORD *)v4 + 138)) {
      goto LABEL_191;
    }
  }
  else if ((v30 & 0x2000) != 0)
  {
    goto LABEL_191;
  }
  if ((v29 & 0x4000) != 0)
  {
    if ((v30 & 0x4000) == 0 || self->_travelTimeConservativeEstimate != *((_DWORD *)v4 + 139)) {
      goto LABEL_191;
    }
  }
  else if ((v30 & 0x4000) != 0)
  {
    goto LABEL_191;
  }
  if ((v29 & 0x400) != 0)
  {
    if ((v30 & 0x400) == 0 || self->_staticTravelTime != *((_DWORD *)v4 + 135)) {
      goto LABEL_191;
    }
  }
  else if ((v30 & 0x400) != 0)
  {
    goto LABEL_191;
  }
  if ((v29 & 0x10000) != 0)
  {
    if ((v30 & 0x10000) == 0) {
      goto LABEL_191;
    }
    if (self->_avoidsTolls)
    {
      if (!v4[561]) {
        goto LABEL_191;
      }
    }
    else if (v4[561])
    {
      goto LABEL_191;
    }
  }
  else if ((v30 & 0x10000) != 0)
  {
    goto LABEL_191;
  }
  if ((v29 & 0x8000) != 0)
  {
    if ((v30 & 0x8000) == 0) {
      goto LABEL_191;
    }
    if (self->_avoidsHighways)
    {
      if (!v4[560]) {
        goto LABEL_191;
      }
    }
    else if (v4[560])
    {
      goto LABEL_191;
    }
  }
  else if ((v30 & 0x8000) != 0)
  {
    goto LABEL_191;
  }
  if ((v29 & 0x20000) != 0)
  {
    if ((v30 & 0x20000) == 0) {
      goto LABEL_191;
    }
    if (self->_avoidsTraffic)
    {
      if (!v4[562]) {
        goto LABEL_191;
      }
    }
    else if (v4[562])
    {
      goto LABEL_191;
    }
  }
  else if ((v30 & 0x20000) != 0)
  {
    goto LABEL_191;
  }
  enrouteNotices = self->_enrouteNotices;
  if ((unint64_t)enrouteNotices | *((void *)v4 + 31)
    && !-[NSMutableArray isEqual:](enrouteNotices, "isEqual:"))
  {
    goto LABEL_191;
  }
  unpackedLatLngVertices = self->_unpackedLatLngVertices;
  if ((unint64_t)unpackedLatLngVertices | *((void *)v4 + 58))
  {
    if (!-[NSData isEqual:](unpackedLatLngVertices, "isEqual:")) {
      goto LABEL_191;
    }
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_191;
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_191;
  }
  incidentOnRouteInfos = self->_incidentOnRouteInfos;
  if ((unint64_t)incidentOnRouteInfos | *((void *)v4 + 33))
  {
    if (!-[NSMutableArray isEqual:](incidentOnRouteInfos, "isEqual:")) {
      goto LABEL_191;
    }
  }
  routePlanningDescriptiouint64_t n = self->_routePlanningDescription;
  if ((unint64_t)routePlanningDescription | *((void *)v4 + 51))
  {
    if (!-[GEORouteInformation isEqual:](routePlanningDescription, "isEqual:")) {
      goto LABEL_191;
    }
  }
  routeDescriptions = self->_routeDescriptions;
  if ((unint64_t)routeDescriptions | *((void *)v4 + 48))
  {
    if (!-[NSMutableArray isEqual:](routeDescriptions, "isEqual:")) {
      goto LABEL_191;
    }
  }
  startingRouteInstructions = self->_startingRouteInstructions;
  if ((unint64_t)startingRouteInstructions | *((void *)v4 + 52))
  {
    if (!-[NSMutableArray isEqual:](startingRouteInstructions, "isEqual:")) {
      goto LABEL_191;
    }
  }
  endingRouteInstructions = self->_endingRouteInstructions;
  if ((unint64_t)endingRouteInstructions | *((void *)v4 + 30))
  {
    if (!-[NSMutableArray isEqual:](endingRouteInstructions, "isEqual:")) {
      goto LABEL_191;
    }
  }
  trafficDescriptiouint64_t n = self->_trafficDescription;
  if ((unint64_t)trafficDescription | *((void *)v4 + 57))
  {
    if (!-[NSString isEqual:](trafficDescription, "isEqual:")) {
      goto LABEL_191;
    }
  }
  trafficDescriptionLong = self->_trafficDescriptionLong;
  if ((unint64_t)trafficDescriptionLong | *((void *)v4 + 56))
  {
    if (!-[NSString isEqual:](trafficDescriptionLong, "isEqual:")) {
      goto LABEL_191;
    }
  }
  alertNonRecommendedRouteText = self->_alertNonRecommendedRouteText;
  if ((unint64_t)alertNonRecommendedRouteText | *((void *)v4 + 22))
  {
    if (!-[GEOAlertNonRecommendedRouteText isEqual:](alertNonRecommendedRouteText, "isEqual:")) {
      goto LABEL_191;
    }
  }
  guidanceEvents = self->_guidanceEvents;
  if ((unint64_t)guidanceEvents | *((void *)v4 + 32))
  {
    if (!-[NSMutableArray isEqual:](guidanceEvents, "isEqual:")) {
      goto LABEL_191;
    }
  }
  launchAndGoCardText = self->_launchAndGoCardText;
  if ((unint64_t)launchAndGoCardText | *((void *)v4 + 36))
  {
    if (!-[GEOLaunchAndGoCardText isEqual:](launchAndGoCardText, "isEqual:")) {
      goto LABEL_191;
    }
  }
  roadComplexitys = self->_roadComplexitys;
  if ((unint64_t)roadComplexitys | *((void *)v4 + 44))
  {
    if (!-[NSMutableArray isEqual:](roadComplexitys, "isEqual:")) {
      goto LABEL_191;
    }
  }
  laneWidths = self->_laneWidths;
  if ((unint64_t)laneWidths | *((void *)v4 + 35))
  {
    if (!-[NSMutableArray isEqual:](laneWidths, "isEqual:")) {
      goto LABEL_191;
    }
  }
  elevationProfile = self->_elevationProfile;
  if ((unint64_t)elevationProfile | *((void *)v4 + 29))
  {
    if (!-[GEOElevationProfile isEqual:](elevationProfile, "isEqual:")) {
      goto LABEL_191;
    }
  }
  uint64_t v46 = (uint64_t)self->_flags;
  uint64_t v47 = *(void *)(v4 + 564);
  if ((v46 & 2) != 0)
  {
    if ((v47 & 2) == 0 || self->_arrivalParameterIndex != *((_DWORD *)v4 + 126)) {
      goto LABEL_191;
    }
  }
  else if ((v47 & 2) != 0)
  {
    goto LABEL_191;
  }
  restrictedZoneIds = self->_restrictedZoneIds;
  if ((unint64_t)restrictedZoneIds | *((void *)v4 + 43))
  {
    if (-[NSMutableArray isEqual:](restrictedZoneIds, "isEqual:"))
    {
      uint64_t v46 = (uint64_t)self->_flags;
      uint64_t v47 = *(void *)(v4 + 564);
      goto LABEL_162;
    }
LABEL_191:
    char v55 = 0;
    goto LABEL_192;
  }
LABEL_162:
  if ((v46 & 0x100) != 0)
  {
    if ((v47 & 0x100) == 0 || self->_licensePlateRestrictionImpact != *((_DWORD *)v4 + 133)) {
      goto LABEL_191;
    }
  }
  else if ((v47 & 0x100) != 0)
  {
    goto LABEL_191;
  }
  if ((v46 & 0x20) != 0)
  {
    if ((v47 & 0x20) == 0 || self->_environmentalCongestionZoneImpact != *((_DWORD *)v4 + 130)) {
      goto LABEL_191;
    }
  }
  else if ((v47 & 0x20) != 0)
  {
    goto LABEL_191;
  }
  if ((v46 & 0x800) != 0)
  {
    if ((v47 & 0x800) == 0 || self->_tollCongestionZoneImpact != *((_DWORD *)v4 + 136)) {
      goto LABEL_191;
    }
  }
  else if ((v47 & 0x800) != 0)
  {
    goto LABEL_191;
  }
  stepGroups = self->_stepGroups;
  if ((unint64_t)stepGroups | *((void *)v4 + 53)
    && !-[NSMutableArray isEqual:](stepGroups, "isEqual:"))
  {
    goto LABEL_191;
  }
  updateLocations = self->_updateLocations;
  if ((unint64_t)updateLocations | *((void *)v4 + 59))
  {
    if (!-[NSMutableArray isEqual:](updateLocations, "isEqual:")) {
      goto LABEL_191;
    }
  }
  originWaypointInfo = self->_originWaypointInfo;
  if ((unint64_t)originWaypointInfo | *((void *)v4 + 39))
  {
    if (!-[GEOWaypointInfo isEqual:](originWaypointInfo, "isEqual:")) {
      goto LABEL_191;
    }
  }
  destinationWaypointInfo = self->_destinationWaypointInfo;
  if ((unint64_t)destinationWaypointInfo | *((void *)v4 + 28))
  {
    if (!-[GEOWaypointInfo isEqual:](destinationWaypointInfo, "isEqual:")) {
      goto LABEL_191;
    }
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_191;
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_191;
  }
  originListInstructiouint64_t n = self->_originListInstruction;
  if ((unint64_t)originListInstruction | *((void *)v4 + 38))
  {
    if (!-[GEODrivingWalkingInstruction isEqual:](originListInstruction, "isEqual:")) {
      goto LABEL_191;
    }
  }
  destinationListInstructiouint64_t n = self->_destinationListInstruction;
  if ((unint64_t)destinationListInstruction | *((void *)v4 + 27)) {
    char v55 = -[GEODrivingWalkingInstruction isEqual:](destinationListInstruction, "isEqual:");
  }
  else {
    char v55 = 1;
  }
LABEL_192:

  return v55;
}

- (unint64_t)hash
{
  [(GEORoute *)self readAll:1];
  if ((*(void *)&self->_flags & 0x1000) != 0) {
    uint64_t v69 = 2654435761 * self->_transportType;
  }
  else {
    uint64_t v69 = 0;
  }
  uint64_t v68 = [(NSMutableArray *)self->_steps hash];
  NSUInteger v67 = [(NSString *)self->_name hash];
  NSUInteger v66 = [(NSString *)self->_phoneticName hash];
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 8) != 0)
  {
    uint64_t v65 = 2654435761 * self->_distance;
    if ((flags & 0x40) != 0) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v65 = 0;
    if ((flags & 0x40) != 0)
    {
LABEL_6:
      uint64_t v64 = 2654435761 * self->_expectedTime;
      goto LABEL_9;
    }
  }
  uint64_t v64 = 0;
LABEL_9:
  uint64_t v63 = [(NSData *)self->_routeID hash];
  if ((*(void *)&self->_flags & 0x200) != 0) {
    uint64_t v62 = 2654435761 * self->_routeType;
  }
  else {
    uint64_t v62 = 0;
  }
  uint64_t v61 = [(NSMutableArray *)self->_zilchPoints hash];
  uint64_t v60 = [(NSMutableArray *)self->_basicPoints hash];
  uint64_t v59 = [(NSData *)self->_pathLeg hash];
  unint64_t v58 = [(GEOPathMapMatcherInstructions *)self->_pathMapMatcherInstructions hash];
  if ((*(void *)&self->_flags & 0x10) != 0) {
    uint64_t v57 = 2654435761 * self->_drivingSide;
  }
  else {
    uint64_t v57 = 0;
  }
  uint64_t v56 = [(NSData *)self->_departureRouteID hash];
  if ((*(void *)&self->_flags & 4) != 0) {
    uint64_t v55 = 2654435761 * self->_departureStepID;
  }
  else {
    uint64_t v55 = 0;
  }
  uint64_t v54 = [(NSData *)self->_arrivalRouteID hash];
  if (*(void *)&self->_flags) {
    uint64_t v53 = 2654435761 * self->_arrivalStepID;
  }
  else {
    uint64_t v53 = 0;
  }
  uint64_t v52 = PBRepeatedUInt32Hash();
  uint64_t v51 = PBRepeatedUInt32Hash();
  uint64_t v50 = [(NSMutableArray *)self->_routeLineStyleInfos hash];
  uint64_t v49 = [(NSMutableArray *)self->_routeCameraInputInfos hash];
  uint64_t v48 = [(NSMutableArray *)self->_trafficColorInfos hash];
  uint64_t v47 = [(NSMutableArray *)self->_routeNames hash];
  if ((*(void *)&self->_flags & 0x80) != 0) {
    uint64_t v46 = 2654435761 * self->_historicTravelTime;
  }
  else {
    uint64_t v46 = 0;
  }
  uint64_t v45 = [(NSMutableArray *)self->_advisoryNotices hash];
  unint64_t v44 = [(GEOFormattedString *)self->_routeLabelDetailText hash];
  unint64_t v43 = [(GEOFormattedString *)self->_infrastructureDescription hash];
  unint64_t v42 = [(GEOClickableAdvisory *)self->_clickableAdvisory hash];
  uint64_t v4 = (uint64_t)self->_flags;
  if ((v4 & 0x2000) != 0)
  {
    uint64_t v41 = 2654435761 * self->_travelTimeAggressiveEstimate;
    if ((v4 & 0x4000) != 0)
    {
LABEL_26:
      uint64_t v40 = 2654435761 * self->_travelTimeConservativeEstimate;
      if ((v4 & 0x400) != 0) {
        goto LABEL_27;
      }
      goto LABEL_33;
    }
  }
  else
  {
    uint64_t v41 = 0;
    if ((v4 & 0x4000) != 0) {
      goto LABEL_26;
    }
  }
  uint64_t v40 = 0;
  if ((v4 & 0x400) != 0)
  {
LABEL_27:
    uint64_t v39 = 2654435761 * self->_staticTravelTime;
    if ((v4 & 0x10000) != 0) {
      goto LABEL_28;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v39 = 0;
  if ((v4 & 0x10000) != 0)
  {
LABEL_28:
    uint64_t v38 = 2654435761 * self->_avoidsTolls;
    if ((v4 & 0x8000) != 0) {
      goto LABEL_29;
    }
LABEL_35:
    uint64_t v37 = 0;
    if ((v4 & 0x20000) != 0) {
      goto LABEL_30;
    }
    goto LABEL_36;
  }
LABEL_34:
  uint64_t v38 = 0;
  if ((v4 & 0x8000) == 0) {
    goto LABEL_35;
  }
LABEL_29:
  uint64_t v37 = 2654435761 * self->_avoidsHighways;
  if ((v4 & 0x20000) != 0)
  {
LABEL_30:
    uint64_t v36 = 2654435761 * self->_avoidsTraffic;
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v36 = 0;
LABEL_37:
  uint64_t v35 = [(NSMutableArray *)self->_enrouteNotices hash];
  uint64_t v34 = [(NSData *)self->_unpackedLatLngVertices hash];
  uint64_t v33 = PBRepeatedUInt32Hash();
  uint64_t v32 = PBRepeatedUInt32Hash();
  uint64_t v31 = [(NSMutableArray *)self->_incidentOnRouteInfos hash];
  unint64_t v30 = [(GEORouteInformation *)self->_routePlanningDescription hash];
  uint64_t v29 = [(NSMutableArray *)self->_routeDescriptions hash];
  uint64_t v28 = [(NSMutableArray *)self->_startingRouteInstructions hash];
  uint64_t v27 = [(NSMutableArray *)self->_endingRouteInstructions hash];
  NSUInteger v26 = [(NSString *)self->_trafficDescription hash];
  NSUInteger v25 = [(NSString *)self->_trafficDescriptionLong hash];
  unint64_t v5 = [(GEOAlertNonRecommendedRouteText *)self->_alertNonRecommendedRouteText hash];
  uint64_t v6 = [(NSMutableArray *)self->_guidanceEvents hash];
  unint64_t v7 = [(GEOLaunchAndGoCardText *)self->_launchAndGoCardText hash];
  uint64_t v8 = [(NSMutableArray *)self->_roadComplexitys hash];
  uint64_t v9 = [(NSMutableArray *)self->_laneWidths hash];
  unint64_t v10 = [(GEOElevationProfile *)self->_elevationProfile hash];
  if ((*(void *)&self->_flags & 2) != 0) {
    uint64_t v11 = 2654435761 * self->_arrivalParameterIndex;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = [(NSMutableArray *)self->_restrictedZoneIds hash];
  uint64_t v13 = (uint64_t)self->_flags;
  if ((v13 & 0x100) == 0)
  {
    uint64_t v14 = 0;
    if ((v13 & 0x20) != 0) {
      goto LABEL_42;
    }
LABEL_45:
    uint64_t v15 = 0;
    if ((v13 & 0x800) != 0) {
      goto LABEL_43;
    }
LABEL_46:
    uint64_t v16 = 0;
    goto LABEL_47;
  }
  uint64_t v14 = 2654435761 * self->_licensePlateRestrictionImpact;
  if ((v13 & 0x20) == 0) {
    goto LABEL_45;
  }
LABEL_42:
  uint64_t v15 = 2654435761 * self->_environmentalCongestionZoneImpact;
  if ((v13 & 0x800) == 0) {
    goto LABEL_46;
  }
LABEL_43:
  uint64_t v16 = 2654435761 * self->_tollCongestionZoneImpact;
LABEL_47:
  uint64_t v17 = v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ [(NSMutableArray *)self->_stepGroups hash];
  uint64_t v18 = v17 ^ [(NSMutableArray *)self->_updateLocations hash];
  unint64_t v19 = v18 ^ [(GEOWaypointInfo *)self->_originWaypointInfo hash];
  unint64_t v20 = v68 ^ v69 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v19 ^ [(GEOWaypointInfo *)self->_destinationWaypointInfo hash];
  uint64_t v21 = PBRepeatedInt32Hash();
  uint64_t v22 = v21 ^ PBRepeatedUInt32Hash();
  unint64_t v23 = v22 ^ [(GEODrivingWalkingInstruction *)self->_originListInstruction hash];
  return v20 ^ v23 ^ [(GEODrivingWalkingInstruction *)self->_destinationListInstruction hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v242 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if ((*(void *)((unsigned char *)v4 + 564) & 0x1000) != 0)
  {
    self->_transportType = *((_DWORD *)v4 + 137);
    *(void *)&self->_flags |= 0x1000uLL;
  }
  long long v222 = 0u;
  long long v221 = 0u;
  long long v220 = 0u;
  long long v219 = 0u;
  id v5 = *((id *)v4 + 54);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v219 objects:v241 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v220;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v220 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEORoute *)self addStep:*(void *)(*((void *)&v219 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v219 objects:v241 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 37)) {
    -[GEORoute setName:](self, "setName:");
  }
  if (*((void *)v4 + 42)) {
    -[GEORoute setPhoneticName:](self, "setPhoneticName:");
  }
  uint64_t v10 = *(void *)((char *)v4 + 564);
  if ((v10 & 8) != 0)
  {
    self->_distance = *((_DWORD *)v4 + 128);
    *(void *)&self->_flags |= 8uLL;
    uint64_t v10 = *(void *)((char *)v4 + 564);
  }
  if ((v10 & 0x40) != 0)
  {
    self->_expectedTime = *((_DWORD *)v4 + 131);
    *(void *)&self->_flags |= 0x40uLL;
  }
  if (*((void *)v4 + 45)) {
    [(GEORoute *)self setRouteID:"setRouteID:"];
  }
  if ((*(void *)((unsigned char *)v4 + 564) & 0x200) != 0)
  {
    self->_routeType = *((_DWORD *)v4 + 134);
    *(void *)&self->_flags |= 0x200uLL;
  }
  long long v218 = 0u;
  long long v217 = 0u;
  long long v216 = 0u;
  long long v215 = 0u;
  id v11 = *((id *)v4 + 60);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v215 objects:v240 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v216;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v216 != v14) {
          objc_enumerationMutation(v11);
        }
        [(GEORoute *)self addZilchPoints:*(void *)(*((void *)&v215 + 1) + 8 * j)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v215 objects:v240 count:16];
    }
    while (v13);
  }

  long long v214 = 0u;
  long long v213 = 0u;
  long long v212 = 0u;
  long long v211 = 0u;
  id v16 = *((id *)v4 + 24);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v211 objects:v239 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v212;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v212 != v19) {
          objc_enumerationMutation(v16);
        }
        [(GEORoute *)self addBasicPoints:*(void *)(*((void *)&v211 + 1) + 8 * k)];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v211 objects:v239 count:16];
    }
    while (v18);
  }

  if (*((void *)v4 + 40)) {
    -[GEORoute setPathLeg:](self, "setPathLeg:");
  }
  pathMapMatcherInstructions = self->_pathMapMatcherInstructions;
  uint64_t v22 = *((void *)v4 + 41);
  if (pathMapMatcherInstructions)
  {
    if (v22) {
      -[GEOPathMapMatcherInstructions mergeFrom:](pathMapMatcherInstructions, "mergeFrom:");
    }
  }
  else if (v22)
  {
    -[GEORoute setPathMapMatcherInstructions:](self, "setPathMapMatcherInstructions:");
  }
  if ((*(void *)((unsigned char *)v4 + 564) & 0x10) != 0)
  {
    self->_drivingSide = *((_DWORD *)v4 + 129);
    *(void *)&self->_flags |= 0x10uLL;
  }
  if (*((void *)v4 + 26)) {
    [(GEORoute *)self setDepartureRouteID:"setDepartureRouteID:"];
  }
  if ((*(void *)((unsigned char *)v4 + 564) & 4) != 0)
  {
    self->_departureStepID = *((_DWORD *)v4 + 127);
    *(void *)&self->_flags |= 4uLL;
  }
  if (*((void *)v4 + 23)) {
    [(GEORoute *)self setArrivalRouteID:"setArrivalRouteID:"];
  }
  if (*(void *)((unsigned char *)v4 + 564))
  {
    self->_arrivalStepID = *((_DWORD *)v4 + 125);
    *(void *)&self->_flags |= 1uLL;
  }
  uint64_t v23 = [v4 trafficColorsCount];
  if (v23)
  {
    uint64_t v24 = v23;
    for (uint64_t m = 0; m != v24; ++m)
      -[GEORoute addTrafficColor:](self, "addTrafficColor:", [v4 trafficColorAtIndex:m]);
  }
  uint64_t v26 = [v4 trafficColorOffsetsCount];
  if (v26)
  {
    uint64_t v27 = v26;
    for (uint64_t n = 0; n != v27; ++n)
      -[GEORoute addTrafficColorOffset:](self, "addTrafficColorOffset:", [v4 trafficColorOffsetAtIndex:n]);
  }
  long long v209 = 0u;
  long long v210 = 0u;
  long long v207 = 0u;
  long long v208 = 0u;
  id v29 = *((id *)v4 + 50);
  uint64_t v30 = [v29 countByEnumeratingWithState:&v207 objects:v238 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v208;
    do
    {
      for (iuint64_t i = 0; ii != v31; ++ii)
      {
        if (*(void *)v208 != v32) {
          objc_enumerationMutation(v29);
        }
        [(GEORoute *)self addRouteLineStyleInfo:*(void *)(*((void *)&v207 + 1) + 8 * ii)];
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v207 objects:v238 count:16];
    }
    while (v31);
  }

  long long v205 = 0u;
  long long v206 = 0u;
  long long v203 = 0u;
  long long v204 = 0u;
  id v34 = *((id *)v4 + 47);
  uint64_t v35 = [v34 countByEnumeratingWithState:&v203 objects:v237 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v204;
    do
    {
      for (juint64_t j = 0; jj != v36; ++jj)
      {
        if (*(void *)v204 != v37) {
          objc_enumerationMutation(v34);
        }
        [(GEORoute *)self addRouteCameraInputInfo:*(void *)(*((void *)&v203 + 1) + 8 * jj)];
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v203 objects:v237 count:16];
    }
    while (v36);
  }

  long long v201 = 0u;
  long long v202 = 0u;
  long long v199 = 0u;
  long long v200 = 0u;
  id v39 = *((id *)v4 + 55);
  uint64_t v40 = [v39 countByEnumeratingWithState:&v199 objects:v236 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v200;
    do
    {
      for (kuint64_t k = 0; kk != v41; ++kk)
      {
        if (*(void *)v200 != v42) {
          objc_enumerationMutation(v39);
        }
        [(GEORoute *)self addTrafficColorInfo:*(void *)(*((void *)&v199 + 1) + 8 * kk)];
      }
      uint64_t v41 = [v39 countByEnumeratingWithState:&v199 objects:v236 count:16];
    }
    while (v41);
  }

  long long v197 = 0u;
  long long v198 = 0u;
  long long v195 = 0u;
  long long v196 = 0u;
  id v44 = *((id *)v4 + 46);
  uint64_t v45 = [v44 countByEnumeratingWithState:&v195 objects:v235 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v196;
    do
    {
      for (muint64_t m = 0; mm != v46; ++mm)
      {
        if (*(void *)v196 != v47) {
          objc_enumerationMutation(v44);
        }
        [(GEORoute *)self addRouteName:*(void *)(*((void *)&v195 + 1) + 8 * mm)];
      }
      uint64_t v46 = [v44 countByEnumeratingWithState:&v195 objects:v235 count:16];
    }
    while (v46);
  }

  if ((*(void *)((unsigned char *)v4 + 564) & 0x80) != 0)
  {
    self->_historicTravelTime = *((_DWORD *)v4 + 132);
    *(void *)&self->_flags |= 0x80uLL;
  }
  long long v193 = 0u;
  long long v194 = 0u;
  long long v191 = 0u;
  long long v192 = 0u;
  id v49 = *((id *)v4 + 21);
  uint64_t v50 = [v49 countByEnumeratingWithState:&v191 objects:v234 count:16];
  if (v50)
  {
    uint64_t v51 = v50;
    uint64_t v52 = *(void *)v192;
    do
    {
      for (nuint64_t n = 0; nn != v51; ++nn)
      {
        if (*(void *)v192 != v52) {
          objc_enumerationMutation(v49);
        }
        [(GEORoute *)self addAdvisoryNotice:*(void *)(*((void *)&v191 + 1) + 8 * nn)];
      }
      uint64_t v51 = [v49 countByEnumeratingWithState:&v191 objects:v234 count:16];
    }
    while (v51);
  }

  routeLabelDetailText = self->_routeLabelDetailText;
  uint64_t v55 = *((void *)v4 + 49);
  if (routeLabelDetailText)
  {
    if (v55) {
      -[GEOFormattedString mergeFrom:](routeLabelDetailText, "mergeFrom:");
    }
  }
  else if (v55)
  {
    [(GEORoute *)self setRouteLabelDetailText:"setRouteLabelDetailText:"];
  }
  infrastructureDescriptiouint64_t n = self->_infrastructureDescription;
  uint64_t v57 = *((void *)v4 + 34);
  if (infrastructureDescription)
  {
    if (v57) {
      -[GEOFormattedString mergeFrom:](infrastructureDescription, "mergeFrom:");
    }
  }
  else if (v57)
  {
    -[GEORoute setInfrastructureDescription:](self, "setInfrastructureDescription:");
  }
  clickableAdvisory = self->_clickableAdvisory;
  uint64_t v59 = *((void *)v4 + 25);
  if (clickableAdvisory)
  {
    if (v59) {
      -[GEOClickableAdvisory mergeFrom:](clickableAdvisory, "mergeFrom:");
    }
  }
  else if (v59)
  {
    -[GEORoute setClickableAdvisory:](self, "setClickableAdvisory:");
  }
  uint64_t v60 = (uint64_t *)((char *)v4 + 564);
  uint64_t v61 = *(void *)((char *)v4 + 564);
  if ((v61 & 0x2000) != 0)
  {
    self->_travelTimeAggressiveEstimate = *((_DWORD *)v4 + 138);
    *(void *)&self->_flags |= 0x2000uLL;
    uint64_t v61 = *v60;
    if ((*v60 & 0x4000) == 0)
    {
LABEL_113:
      if ((v61 & 0x400) == 0) {
        goto LABEL_114;
      }
      goto LABEL_145;
    }
  }
  else if ((v61 & 0x4000) == 0)
  {
    goto LABEL_113;
  }
  self->_travelTimeConservativeEstimate = *((_DWORD *)v4 + 139);
  *(void *)&self->_flags |= 0x4000uLL;
  uint64_t v61 = *(void *)((char *)v4 + 564);
  if ((v61 & 0x400) == 0)
  {
LABEL_114:
    if ((v61 & 0x10000) == 0) {
      goto LABEL_115;
    }
    goto LABEL_146;
  }
LABEL_145:
  self->_staticTravelTime = *((_DWORD *)v4 + 135);
  *(void *)&self->_flags |= 0x400uLL;
  uint64_t v61 = *(void *)((char *)v4 + 564);
  if ((v61 & 0x10000) == 0)
  {
LABEL_115:
    if ((v61 & 0x8000) == 0) {
      goto LABEL_116;
    }
    goto LABEL_147;
  }
LABEL_146:
  self->_avoidsTolls = *((unsigned char *)v4 + 561);
  *(void *)&self->_flags |= 0x10000uLL;
  uint64_t v61 = *(void *)((char *)v4 + 564);
  if ((v61 & 0x8000) == 0)
  {
LABEL_116:
    if ((v61 & 0x20000) == 0) {
      goto LABEL_118;
    }
    goto LABEL_117;
  }
LABEL_147:
  self->_avoidsHighways = *((unsigned char *)v4 + 560);
  *(void *)&self->_flags |= 0x8000uLL;
  if ((*(void *)((unsigned char *)v4 + 564) & 0x20000) != 0)
  {
LABEL_117:
    self->_avoidsTraffic = *((unsigned char *)v4 + 562);
    *(void *)&self->_flags |= 0x20000uLL;
  }
LABEL_118:
  long long v189 = 0u;
  long long v190 = 0u;
  long long v187 = 0u;
  long long v188 = 0u;
  id v62 = *((id *)v4 + 31);
  uint64_t v63 = [v62 countByEnumeratingWithState:&v187 objects:v233 count:16];
  if (v63)
  {
    uint64_t v64 = v63;
    uint64_t v65 = *(void *)v188;
    do
    {
      for (uint64_t i1 = 0; i1 != v64; ++i1)
      {
        if (*(void *)v188 != v65) {
          objc_enumerationMutation(v62);
        }
        [(GEORoute *)self addEnrouteNotice:*(void *)(*((void *)&v187 + 1) + 8 * i1)];
      }
      uint64_t v64 = [v62 countByEnumeratingWithState:&v187 objects:v233 count:16];
    }
    while (v64);
  }

  if (*((void *)v4 + 58)) {
    -[GEORoute setUnpackedLatLngVertices:](self, "setUnpackedLatLngVertices:");
  }
  uint64_t v67 = [v4 incidentIndicesCount];
  if (v67)
  {
    uint64_t v68 = v67;
    for (uint64_t i2 = 0; i2 != v68; ++i2)
      -[GEORoute addIncidentIndices:](self, "addIncidentIndices:", [v4 incidentIndicesAtIndex:i2]);
  }
  uint64_t v70 = [v4 incidentEndOffsetsInRoutesCount];
  if (v70)
  {
    uint64_t v71 = v70;
    for (uint64_t i3 = 0; i3 != v71; ++i3)
      -[GEORoute addIncidentEndOffsetsInRoute:](self, "addIncidentEndOffsetsInRoute:", [v4 incidentEndOffsetsInRouteAtIndex:i3]);
  }
  long long v185 = 0u;
  long long v186 = 0u;
  long long v183 = 0u;
  long long v184 = 0u;
  id v73 = *((id *)v4 + 33);
  uint64_t v74 = [v73 countByEnumeratingWithState:&v183 objects:v232 count:16];
  if (v74)
  {
    uint64_t v75 = v74;
    uint64_t v76 = *(void *)v184;
    do
    {
      for (uint64_t i4 = 0; i4 != v75; ++i4)
      {
        if (*(void *)v184 != v76) {
          objc_enumerationMutation(v73);
        }
        [(GEORoute *)self addIncidentOnRouteInfo:*(void *)(*((void *)&v183 + 1) + 8 * i4)];
      }
      uint64_t v75 = [v73 countByEnumeratingWithState:&v183 objects:v232 count:16];
    }
    while (v75);
  }

  routePlanningDescriptiouint64_t n = self->_routePlanningDescription;
  unint64_t v79 = (void *)*((void *)v4 + 51);
  if (routePlanningDescription)
  {
    if (v79) {
      -[GEORouteInformation mergeFrom:](routePlanningDescription, v79);
    }
  }
  else if (v79)
  {
    [(GEORoute *)self setRoutePlanningDescription:*((void *)v4 + 51)];
  }
  long long v181 = 0u;
  long long v182 = 0u;
  long long v179 = 0u;
  long long v180 = 0u;
  id v80 = *((id *)v4 + 48);
  uint64_t v81 = [v80 countByEnumeratingWithState:&v179 objects:v231 count:16];
  if (v81)
  {
    uint64_t v82 = v81;
    uint64_t v83 = *(void *)v180;
    do
    {
      for (uint64_t i5 = 0; i5 != v82; ++i5)
      {
        if (*(void *)v180 != v83) {
          objc_enumerationMutation(v80);
        }
        [(GEORoute *)self addRouteDescription:*(void *)(*((void *)&v179 + 1) + 8 * i5)];
      }
      uint64_t v82 = [v80 countByEnumeratingWithState:&v179 objects:v231 count:16];
    }
    while (v82);
  }

  long long v177 = 0u;
  long long v178 = 0u;
  long long v175 = 0u;
  long long v176 = 0u;
  id v85 = *((id *)v4 + 52);
  uint64_t v86 = [v85 countByEnumeratingWithState:&v175 objects:v230 count:16];
  if (v86)
  {
    uint64_t v87 = v86;
    uint64_t v88 = *(void *)v176;
    do
    {
      for (uint64_t i6 = 0; i6 != v87; ++i6)
      {
        if (*(void *)v176 != v88) {
          objc_enumerationMutation(v85);
        }
        [(GEORoute *)self addStartingRouteInstruction:*(void *)(*((void *)&v175 + 1) + 8 * i6)];
      }
      uint64_t v87 = [v85 countByEnumeratingWithState:&v175 objects:v230 count:16];
    }
    while (v87);
  }

  long long v173 = 0u;
  long long v174 = 0u;
  long long v171 = 0u;
  long long v172 = 0u;
  id v90 = *((id *)v4 + 30);
  uint64_t v91 = [v90 countByEnumeratingWithState:&v171 objects:v229 count:16];
  if (v91)
  {
    uint64_t v92 = v91;
    uint64_t v93 = *(void *)v172;
    do
    {
      for (uint64_t i7 = 0; i7 != v92; ++i7)
      {
        if (*(void *)v172 != v93) {
          objc_enumerationMutation(v90);
        }
        [(GEORoute *)self addEndingRouteInstruction:*(void *)(*((void *)&v171 + 1) + 8 * i7)];
      }
      uint64_t v92 = [v90 countByEnumeratingWithState:&v171 objects:v229 count:16];
    }
    while (v92);
  }

  if (*((void *)v4 + 57)) {
    -[GEORoute setTrafficDescription:](self, "setTrafficDescription:");
  }
  if (*((void *)v4 + 56)) {
    -[GEORoute setTrafficDescriptionLong:](self, "setTrafficDescriptionLong:");
  }
  alertNonRecommendedRouteText = self->_alertNonRecommendedRouteText;
  uint64_t v96 = *((void *)v4 + 22);
  if (alertNonRecommendedRouteText)
  {
    if (v96) {
      -[GEOAlertNonRecommendedRouteText mergeFrom:](alertNonRecommendedRouteText, "mergeFrom:");
    }
  }
  else if (v96)
  {
    [(GEORoute *)self setAlertNonRecommendedRouteText:"setAlertNonRecommendedRouteText:"];
  }
  long long v169 = 0u;
  long long v170 = 0u;
  long long v167 = 0u;
  long long v168 = 0u;
  id v97 = *((id *)v4 + 32);
  uint64_t v98 = [v97 countByEnumeratingWithState:&v167 objects:v228 count:16];
  if (v98)
  {
    uint64_t v99 = v98;
    uint64_t v100 = *(void *)v168;
    do
    {
      for (uint64_t i8 = 0; i8 != v99; ++i8)
      {
        if (*(void *)v168 != v100) {
          objc_enumerationMutation(v97);
        }
        [(GEORoute *)self addGuidanceEvent:*(void *)(*((void *)&v167 + 1) + 8 * i8)];
      }
      uint64_t v99 = [v97 countByEnumeratingWithState:&v167 objects:v228 count:16];
    }
    while (v99);
  }

  launchAndGoCardText = self->_launchAndGoCardText;
  uint64_t v103 = *((void *)v4 + 36);
  if (launchAndGoCardText)
  {
    if (v103) {
      -[GEOLaunchAndGoCardText mergeFrom:](launchAndGoCardText, "mergeFrom:");
    }
  }
  else if (v103)
  {
    -[GEORoute setLaunchAndGoCardText:](self, "setLaunchAndGoCardText:");
  }
  long long v165 = 0u;
  long long v166 = 0u;
  long long v163 = 0u;
  long long v164 = 0u;
  id v104 = *((id *)v4 + 44);
  uint64_t v105 = [v104 countByEnumeratingWithState:&v163 objects:v227 count:16];
  if (v105)
  {
    uint64_t v106 = v105;
    uint64_t v107 = *(void *)v164;
    do
    {
      for (uint64_t i9 = 0; i9 != v106; ++i9)
      {
        if (*(void *)v164 != v107) {
          objc_enumerationMutation(v104);
        }
        [(GEORoute *)self addRoadComplexity:*(void *)(*((void *)&v163 + 1) + 8 * i9)];
      }
      uint64_t v106 = [v104 countByEnumeratingWithState:&v163 objects:v227 count:16];
    }
    while (v106);
  }

  long long v161 = 0u;
  long long v162 = 0u;
  long long v159 = 0u;
  long long v160 = 0u;
  id v109 = *((id *)v4 + 35);
  uint64_t v110 = [v109 countByEnumeratingWithState:&v159 objects:v226 count:16];
  if (v110)
  {
    uint64_t v111 = v110;
    uint64_t v112 = *(void *)v160;
    do
    {
      for (uint64_t i10 = 0; i10 != v111; ++i10)
      {
        if (*(void *)v160 != v112) {
          objc_enumerationMutation(v109);
        }
        [(GEORoute *)self addLaneWidth:*(void *)(*((void *)&v159 + 1) + 8 * i10)];
      }
      uint64_t v111 = [v109 countByEnumeratingWithState:&v159 objects:v226 count:16];
    }
    while (v111);
  }

  elevationProfile = self->_elevationProfile;
  uint64_t v115 = *((void *)v4 + 29);
  if (elevationProfile)
  {
    if (v115) {
      -[GEOElevationProfile mergeFrom:](elevationProfile, "mergeFrom:");
    }
  }
  else if (v115)
  {
    -[GEORoute setElevationProfile:](self, "setElevationProfile:");
  }
  if ((*(void *)((unsigned char *)v4 + 564) & 2) != 0)
  {
    self->_arrivalParameterIndex = *((_DWORD *)v4 + 126);
    *(void *)&self->_flags |= 2uLL;
  }
  long long v157 = 0u;
  long long v158 = 0u;
  long long v155 = 0u;
  long long v156 = 0u;
  id v116 = *((id *)v4 + 43);
  uint64_t v117 = [v116 countByEnumeratingWithState:&v155 objects:v225 count:16];
  if (v117)
  {
    uint64_t v118 = v117;
    uint64_t v119 = *(void *)v156;
    do
    {
      for (uint64_t i11 = 0; i11 != v118; ++i11)
      {
        if (*(void *)v156 != v119) {
          objc_enumerationMutation(v116);
        }
        [(GEORoute *)self addRestrictedZoneIds:*(void *)(*((void *)&v155 + 1) + 8 * i11)];
      }
      uint64_t v118 = [v116 countByEnumeratingWithState:&v155 objects:v225 count:16];
    }
    while (v118);
  }

  uint64_t v121 = (uint64_t *)((char *)v4 + 564);
  uint64_t v122 = *(void *)((char *)v4 + 564);
  if ((v122 & 0x100) != 0)
  {
    self->_licensePlateRestrictionImpact = *((_DWORD *)v4 + 133);
    *(void *)&self->_flags |= 0x100uLL;
    uint64_t v122 = *v121;
    if ((*v121 & 0x20) == 0)
    {
LABEL_223:
      if ((v122 & 0x800) == 0) {
        goto LABEL_225;
      }
      goto LABEL_224;
    }
  }
  else if ((v122 & 0x20) == 0)
  {
    goto LABEL_223;
  }
  self->_environmentalCongestionZoneImpact = *((_DWORD *)v4 + 130);
  *(void *)&self->_flags |= 0x20uLL;
  if ((*(void *)((unsigned char *)v4 + 564) & 0x800) != 0)
  {
LABEL_224:
    self->_tollCongestionZoneImpact = *((_DWORD *)v4 + 136);
    *(void *)&self->_flags |= 0x800uLL;
  }
LABEL_225:
  long long v153 = 0u;
  long long v154 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  id v123 = *((id *)v4 + 53);
  uint64_t v124 = [v123 countByEnumeratingWithState:&v151 objects:v224 count:16];
  if (v124)
  {
    uint64_t v125 = v124;
    uint64_t v126 = *(void *)v152;
    do
    {
      for (uint64_t i12 = 0; i12 != v125; ++i12)
      {
        if (*(void *)v152 != v126) {
          objc_enumerationMutation(v123);
        }
        [(GEORoute *)self addStepGroup:*(void *)(*((void *)&v151 + 1) + 8 * i12)];
      }
      uint64_t v125 = [v123 countByEnumeratingWithState:&v151 objects:v224 count:16];
    }
    while (v125);
  }

  long long v149 = 0u;
  long long v150 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  id v128 = *((id *)v4 + 59);
  uint64_t v129 = [v128 countByEnumeratingWithState:&v147 objects:v223 count:16];
  if (v129)
  {
    uint64_t v130 = v129;
    uint64_t v131 = *(void *)v148;
    do
    {
      for (uint64_t i13 = 0; i13 != v130; ++i13)
      {
        if (*(void *)v148 != v131) {
          objc_enumerationMutation(v128);
        }
        -[GEORoute addUpdateLocation:](self, "addUpdateLocation:", *(void *)(*((void *)&v147 + 1) + 8 * i13), (void)v147);
      }
      uint64_t v130 = [v128 countByEnumeratingWithState:&v147 objects:v223 count:16];
    }
    while (v130);
  }

  originWaypointInfo = self->_originWaypointInfo;
  uint64_t v134 = *((void *)v4 + 39);
  if (originWaypointInfo)
  {
    if (v134) {
      -[GEOWaypointInfo mergeFrom:](originWaypointInfo, "mergeFrom:");
    }
  }
  else if (v134)
  {
    -[GEORoute setOriginWaypointInfo:](self, "setOriginWaypointInfo:");
  }
  destinationWaypointInfo = self->_destinationWaypointInfo;
  uint64_t v136 = *((void *)v4 + 28);
  if (destinationWaypointInfo)
  {
    if (v136) {
      -[GEOWaypointInfo mergeFrom:](destinationWaypointInfo, "mergeFrom:");
    }
  }
  else if (v136)
  {
    -[GEORoute setDestinationWaypointInfo:](self, "setDestinationWaypointInfo:");
  }
  uint64_t v137 = objc_msgSend(v4, "cellularCoveragesCount", (void)v147);
  if (v137)
  {
    uint64_t v138 = v137;
    for (uint64_t i14 = 0; i14 != v138; ++i14)
      -[GEORoute addCellularCoverage:](self, "addCellularCoverage:", [v4 cellularCoverageAtIndex:i14]);
  }
  uint64_t v140 = [v4 cellularCoverageOffsetsCount];
  if (v140)
  {
    uint64_t v141 = v140;
    for (uint64_t i15 = 0; i15 != v141; ++i15)
      -[GEORoute addCellularCoverageOffset:](self, "addCellularCoverageOffset:", [v4 cellularCoverageOffsetAtIndex:i15]);
  }
  originListInstructiouint64_t n = self->_originListInstruction;
  long long v144 = (void *)*((void *)v4 + 38);
  if (originListInstruction)
  {
    if (v144) {
      -[GEODrivingWalkingInstruction mergeFrom:](originListInstruction, v144);
    }
  }
  else if (v144)
  {
    [(GEORoute *)self setOriginListInstruction:*((void *)v4 + 38)];
  }
  destinationListInstructiouint64_t n = self->_destinationListInstruction;
  long long v146 = (void *)*((void *)v4 + 27);
  if (destinationListInstruction)
  {
    if (v146) {
      -[GEODrivingWalkingInstruction mergeFrom:](destinationListInstruction, v146);
    }
  }
  else if (v146)
  {
    [(GEORoute *)self setDestinationListInstruction:*((void *)v4 + 27)];
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(void *)&self->_flags & 0x40000) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEORouteReadSpecified((uint64_t)self, (char *)self->_reader, (int *)&unknownFields_tags_5371);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v168 = *MEMORY[0x1E4F143B8];
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char v6 = *((unsigned char *)&self->_flags + 8) | 2;
  *(void *)&self->_flags |= 0x40000uLL;
  *((unsigned char *)&self->_flags + 8) = v6;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORoute *)self readAll:0];
    long long v150 = 0u;
    long long v151 = 0u;
    long long v148 = 0u;
    long long v149 = 0u;
    uint64_t v8 = self->_steps;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v148 objects:v167 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v149;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v149 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v148 + 1) + 8 * v12++) clearUnknownFields:1];
        }
        while (v10 != v12);
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v148 objects:v167 count:16];
      }
      while (v10);
    }

    [(GEOPathMapMatcherInstructions *)self->_pathMapMatcherInstructions clearUnknownFields:1];
    long long v146 = 0u;
    long long v147 = 0u;
    long long v144 = 0u;
    long long v145 = 0u;
    uint64_t v13 = self->_routeLineStyleInfos;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v144 objects:v166 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v145;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v145 != v16) {
            objc_enumerationMutation(v13);
          }
          [*(id *)(*((void *)&v144 + 1) + 8 * v17++) clearUnknownFields:1];
        }
        while (v15 != v17);
        uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v144 objects:v166 count:16];
      }
      while (v15);
    }

    long long v142 = 0u;
    long long v143 = 0u;
    long long v140 = 0u;
    long long v141 = 0u;
    uint64_t v18 = self->_routeCameraInputInfos;
    uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v140 objects:v165 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v141;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v141 != v21) {
            objc_enumerationMutation(v18);
          }
          [*(id *)(*((void *)&v140 + 1) + 8 * v22++) clearUnknownFields:1];
        }
        while (v20 != v22);
        uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v140 objects:v165 count:16];
      }
      while (v20);
    }

    long long v138 = 0u;
    long long v139 = 0u;
    long long v136 = 0u;
    long long v137 = 0u;
    uint64_t v23 = self->_trafficColorInfos;
    uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v136 objects:v164 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v137;
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v137 != v26) {
            objc_enumerationMutation(v23);
          }
          [*(id *)(*((void *)&v136 + 1) + 8 * v27++) clearUnknownFields:1];
        }
        while (v25 != v27);
        uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v136 objects:v164 count:16];
      }
      while (v25);
    }

    long long v134 = 0u;
    long long v135 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    uint64_t v28 = self->_routeNames;
    uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v132 objects:v163 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v133;
      do
      {
        uint64_t v32 = 0;
        do
        {
          if (*(void *)v133 != v31) {
            objc_enumerationMutation(v28);
          }
          [*(id *)(*((void *)&v132 + 1) + 8 * v32++) clearUnknownFields:1];
        }
        while (v30 != v32);
        uint64_t v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v132 objects:v163 count:16];
      }
      while (v30);
    }

    [(GEOFormattedString *)self->_routeLabelDetailText clearUnknownFields:1];
    [(GEOFormattedString *)self->_infrastructureDescription clearUnknownFields:1];
    [(GEOClickableAdvisory *)self->_clickableAdvisory clearUnknownFields:1];
    long long v130 = 0u;
    long long v131 = 0u;
    long long v128 = 0u;
    long long v129 = 0u;
    uint64_t v33 = self->_enrouteNotices;
    uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v128 objects:v162 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v129;
      do
      {
        uint64_t v37 = 0;
        do
        {
          if (*(void *)v129 != v36) {
            objc_enumerationMutation(v33);
          }
          [*(id *)(*((void *)&v128 + 1) + 8 * v37++) clearUnknownFields:1];
        }
        while (v35 != v37);
        uint64_t v35 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v128 objects:v162 count:16];
      }
      while (v35);
    }

    long long v126 = 0u;
    long long v127 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    uint64_t v38 = self->_incidentOnRouteInfos;
    uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v124 objects:v161 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v125;
      do
      {
        uint64_t v42 = 0;
        do
        {
          if (*(void *)v125 != v41) {
            objc_enumerationMutation(v38);
          }
          [*(id *)(*((void *)&v124 + 1) + 8 * v42++) clearUnknownFields:1];
        }
        while (v40 != v42);
        uint64_t v40 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v124 objects:v161 count:16];
      }
      while (v40);
    }

    -[GEORouteInformation clearUnknownFields:]((uint64_t)self->_routePlanningDescription);
    long long v122 = 0u;
    long long v123 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    unint64_t v43 = self->_routeDescriptions;
    uint64_t v44 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v120 objects:v160 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v121;
      do
      {
        uint64_t v47 = 0;
        do
        {
          if (*(void *)v121 != v46) {
            objc_enumerationMutation(v43);
          }
          [*(id *)(*((void *)&v120 + 1) + 8 * v47++) clearUnknownFields:1];
        }
        while (v45 != v47);
        uint64_t v45 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v120 objects:v160 count:16];
      }
      while (v45);
    }

    long long v118 = 0u;
    long long v119 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    uint64_t v48 = self->_startingRouteInstructions;
    uint64_t v49 = [(NSMutableArray *)v48 countByEnumeratingWithState:&v116 objects:v159 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v117;
      do
      {
        uint64_t v52 = 0;
        do
        {
          if (*(void *)v117 != v51) {
            objc_enumerationMutation(v48);
          }
          [*(id *)(*((void *)&v116 + 1) + 8 * v52++) clearUnknownFields:1];
        }
        while (v50 != v52);
        uint64_t v50 = [(NSMutableArray *)v48 countByEnumeratingWithState:&v116 objects:v159 count:16];
      }
      while (v50);
    }

    long long v114 = 0u;
    long long v115 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    uint64_t v53 = self->_endingRouteInstructions;
    uint64_t v54 = [(NSMutableArray *)v53 countByEnumeratingWithState:&v112 objects:v158 count:16];
    if (v54)
    {
      uint64_t v55 = v54;
      uint64_t v56 = *(void *)v113;
      do
      {
        uint64_t v57 = 0;
        do
        {
          if (*(void *)v113 != v56) {
            objc_enumerationMutation(v53);
          }
          [*(id *)(*((void *)&v112 + 1) + 8 * v57++) clearUnknownFields:1];
        }
        while (v55 != v57);
        uint64_t v55 = [(NSMutableArray *)v53 countByEnumeratingWithState:&v112 objects:v158 count:16];
      }
      while (v55);
    }

    [(GEOAlertNonRecommendedRouteText *)self->_alertNonRecommendedRouteText clearUnknownFields:1];
    long long v110 = 0u;
    long long v111 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    unint64_t v58 = self->_guidanceEvents;
    uint64_t v59 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v108 objects:v157 count:16];
    if (v59)
    {
      uint64_t v60 = v59;
      uint64_t v61 = *(void *)v109;
      do
      {
        uint64_t v62 = 0;
        do
        {
          if (*(void *)v109 != v61) {
            objc_enumerationMutation(v58);
          }
          [*(id *)(*((void *)&v108 + 1) + 8 * v62++) clearUnknownFields:1];
        }
        while (v60 != v62);
        uint64_t v60 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v108 objects:v157 count:16];
      }
      while (v60);
    }

    [(GEOLaunchAndGoCardText *)self->_launchAndGoCardText clearUnknownFields:1];
    long long v106 = 0u;
    long long v107 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    uint64_t v63 = self->_roadComplexitys;
    uint64_t v64 = [(NSMutableArray *)v63 countByEnumeratingWithState:&v104 objects:v156 count:16];
    if (v64)
    {
      uint64_t v65 = v64;
      uint64_t v66 = *(void *)v105;
      do
      {
        uint64_t v67 = 0;
        do
        {
          if (*(void *)v105 != v66) {
            objc_enumerationMutation(v63);
          }
          [*(id *)(*((void *)&v104 + 1) + 8 * v67++) clearUnknownFields:1];
        }
        while (v65 != v67);
        uint64_t v65 = [(NSMutableArray *)v63 countByEnumeratingWithState:&v104 objects:v156 count:16];
      }
      while (v65);
    }

    long long v102 = 0u;
    long long v103 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    uint64_t v68 = self->_laneWidths;
    uint64_t v69 = [(NSMutableArray *)v68 countByEnumeratingWithState:&v100 objects:v155 count:16];
    if (v69)
    {
      uint64_t v70 = v69;
      uint64_t v71 = *(void *)v101;
      do
      {
        uint64_t v72 = 0;
        do
        {
          if (*(void *)v101 != v71) {
            objc_enumerationMutation(v68);
          }
          [*(id *)(*((void *)&v100 + 1) + 8 * v72++) clearUnknownFields:1];
        }
        while (v70 != v72);
        uint64_t v70 = [(NSMutableArray *)v68 countByEnumeratingWithState:&v100 objects:v155 count:16];
      }
      while (v70);
    }

    [(GEOElevationProfile *)self->_elevationProfile clearUnknownFields:1];
    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    id v73 = self->_restrictedZoneIds;
    uint64_t v74 = [(NSMutableArray *)v73 countByEnumeratingWithState:&v96 objects:v154 count:16];
    if (v74)
    {
      uint64_t v75 = v74;
      uint64_t v76 = *(void *)v97;
      do
      {
        uint64_t v77 = 0;
        do
        {
          if (*(void *)v97 != v76) {
            objc_enumerationMutation(v73);
          }
          [*(id *)(*((void *)&v96 + 1) + 8 * v77++) clearUnknownFields:1];
        }
        while (v75 != v77);
        uint64_t v75 = [(NSMutableArray *)v73 countByEnumeratingWithState:&v96 objects:v154 count:16];
      }
      while (v75);
    }

    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    unint64_t v78 = self->_stepGroups;
    uint64_t v79 = [(NSMutableArray *)v78 countByEnumeratingWithState:&v92 objects:v153 count:16];
    if (v79)
    {
      uint64_t v80 = v79;
      uint64_t v81 = *(void *)v93;
      do
      {
        uint64_t v82 = 0;
        do
        {
          if (*(void *)v93 != v81) {
            objc_enumerationMutation(v78);
          }
          [*(id *)(*((void *)&v92 + 1) + 8 * v82++) clearUnknownFields:1];
        }
        while (v80 != v82);
        uint64_t v80 = [(NSMutableArray *)v78 countByEnumeratingWithState:&v92 objects:v153 count:16];
      }
      while (v80);
    }

    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    uint64_t v83 = self->_updateLocations;
    uint64_t v84 = [(NSMutableArray *)v83 countByEnumeratingWithState:&v88 objects:v152 count:16];
    if (v84)
    {
      uint64_t v85 = v84;
      uint64_t v86 = *(void *)v89;
      do
      {
        uint64_t v87 = 0;
        do
        {
          if (*(void *)v89 != v86) {
            objc_enumerationMutation(v83);
          }
          objc_msgSend(*(id *)(*((void *)&v88 + 1) + 8 * v87++), "clearUnknownFields:", 1, (void)v88);
        }
        while (v85 != v87);
        uint64_t v85 = [(NSMutableArray *)v83 countByEnumeratingWithState:&v88 objects:v152 count:16];
      }
      while (v85);
    }

    [(GEOWaypointInfo *)self->_originWaypointInfo clearUnknownFields:1];
    [(GEOWaypointInfo *)self->_destinationWaypointInfo clearUnknownFields:1];
    -[GEODrivingWalkingInstruction clearUnknownFields:]((uint64_t)self->_originListInstruction);
    -[GEODrivingWalkingInstruction clearUnknownFields:]((uint64_t)self->_destinationListInstruction);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zilchPoints, 0);
  objc_storeStrong((id *)&self->_updateLocations, 0);
  objc_storeStrong((id *)&self->_unpackedLatLngVertices, 0);
  objc_storeStrong((id *)&self->_trafficDescription, 0);
  objc_storeStrong((id *)&self->_trafficDescriptionLong, 0);
  objc_storeStrong((id *)&self->_trafficColorInfos, 0);
  objc_storeStrong((id *)&self->_steps, 0);
  objc_storeStrong((id *)&self->_stepGroups, 0);
  objc_storeStrong((id *)&self->_startingRouteInstructions, 0);
  objc_storeStrong((id *)&self->_routePlanningDescription, 0);
  objc_storeStrong((id *)&self->_routeLineStyleInfos, 0);
  objc_storeStrong((id *)&self->_routeLabelDetailText, 0);
  objc_storeStrong((id *)&self->_routeDescriptions, 0);
  objc_storeStrong((id *)&self->_routeCameraInputInfos, 0);
  objc_storeStrong((id *)&self->_routeNames, 0);
  objc_storeStrong((id *)&self->_routeID, 0);
  objc_storeStrong((id *)&self->_roadComplexitys, 0);
  objc_storeStrong((id *)&self->_restrictedZoneIds, 0);
  objc_storeStrong((id *)&self->_phoneticName, 0);
  objc_storeStrong((id *)&self->_pathMapMatcherInstructions, 0);
  objc_storeStrong((id *)&self->_pathLeg, 0);
  objc_storeStrong((id *)&self->_originWaypointInfo, 0);
  objc_storeStrong((id *)&self->_originListInstruction, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_launchAndGoCardText, 0);
  objc_storeStrong((id *)&self->_laneWidths, 0);
  objc_storeStrong((id *)&self->_infrastructureDescription, 0);
  objc_storeStrong((id *)&self->_incidentOnRouteInfos, 0);
  objc_storeStrong((id *)&self->_guidanceEvents, 0);
  objc_storeStrong((id *)&self->_enrouteNotices, 0);
  objc_storeStrong((id *)&self->_endingRouteInstructions, 0);
  objc_storeStrong((id *)&self->_elevationProfile, 0);
  objc_storeStrong((id *)&self->_destinationWaypointInfo, 0);
  objc_storeStrong((id *)&self->_destinationListInstruction, 0);
  objc_storeStrong((id *)&self->_departureRouteID, 0);
  objc_storeStrong((id *)&self->_clickableAdvisory, 0);
  objc_storeStrong((id *)&self->_basicPoints, 0);
  objc_storeStrong((id *)&self->_arrivalRouteID, 0);
  objc_storeStrong((id *)&self->_alertNonRecommendedRouteText, 0);
  objc_storeStrong((id *)&self->_advisoryNotices, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)controlPoints
{
  if (![(GEORoute *)self zilchPointsCount]) {
    return 0;
  }
  id v3 = [(GEORoute *)self unpackedLatLngVertices];
  uint64_t v4 = [v3 bytes];

  if (!v4) {
    return 0;
  }
  id v5 = [(GEORoute *)self unpackedLatLngVertices];
  char v6 = (void *)[v5 bytes];

  return v6;
}

- ($1AB5FA073B851C12C2339EC22442E995)coordinateAt:(unsigned int)a3
{
  id v5 = [(GEORoute *)self unpackedLatLngVertices];
  +[GEOPointUtility pointAt:a3 pointData:v5 usesZilch:[(GEORoute *)self zilchPointsCount] != 0];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v7;
  double v13 = v9;
  double v14 = v11;
  result.var2 = v14;
  result.var1 = v13;
  result.var0 = v12;
  return result;
}

- (unsigned)pointCount
{
  id v3 = [(GEORoute *)self unpackedLatLngVertices];
  unsigned int v4 = +[GEOPointUtility pointCount:v3 usesZilch:[(GEORoute *)self zilchPointsCount] != 0];

  return v4;
}

- (BOOL)unpackLatLngVertices
{
  id v3 = [(GEORoute *)self unpackedLatLngVertices];

  if (v3) {
    return 1;
  }
  [(GEORoute *)self unpackZilchPoints];
  unsigned int v4 = [(GEORoute *)self unpackedLatLngVertices];

  if (v4) {
    return 1;
  }

  return [(GEORoute *)self unpackBasicPoints];
}

- (BOOL)unpackZilchPoints
{
  id v3 = [(GEORoute *)self zilchPoints];
  unsigned int v4 = [v3 firstObject];
  id v5 = +[GEOPointUtility unpackPoints:v4 usesZilch:1];
  [(GEORoute *)self setUnpackedLatLngVertices:v5];

  return 1;
}

- (BOOL)unpackBasicPoints
{
  id v3 = [(GEORoute *)self basicPoints];
  unsigned int v4 = [v3 firstObject];
  id v5 = +[GEOPointUtility unpackPoints:v4 usesZilch:0];
  [(GEORoute *)self setUnpackedLatLngVertices:v5];

  return 1;
}

- (double)distanceFromStepIndex:(unint64_t)a3 toStepIndex:(unint64_t)a4
{
  double v4 = 0.0;
  if (a3 < a4)
  {
    unint64_t v6 = a3;
    do
    {
      double v8 = [(GEORoute *)self stepAtIndex:v6];
      [v8 distanceMeters];
      double v4 = v4 + v9;

      ++v6;
    }
    while (a4 != v6);
  }
  return v4;
}

- (unint64_t)stepIndexForPointIndex:(unsigned int)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(GEORoute *)self steps];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      uint64_t v9 = 0;
      uint64_t v10 = v6 + v7;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v9), "maneuverEndIndex", (void)v14) > a3)
        {
          unint64_t v12 = v7 + v9;
          double v11 = v5;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      uint64_t v7 = v10;
      if (v6) {
        continue;
      }
      break;
    }
  }

  double v11 = [(GEORoute *)self steps];
  unint64_t v12 = [v11 count] - 1;
LABEL_11:

  return v12;
}

- (id)debugDescription
{
  unsigned int v3 = [(GEORoute *)self pointCount];
  double v4 = [MEMORY[0x1E4F28E78] stringWithCapacity:40 * v3 + 40];
  id v5 = [(GEORoute *)self description];
  [v4 appendFormat:@"%@\n", v5];

  return v4;
}

- (id)simplifiedDescription
{
  unsigned int v3 = [(GEORoute *)self dictionaryRepresentation];
  [v3 removeObjectForKey:@"latLngVertices"];
  [v3 removeObjectForKey:@"unpackedLatLngVertices"];
  [v3 removeObjectForKey:@"zilchPoints"];
  double v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[GEORoute pointCount](self, "pointCount"));
  [v3 setObject:v4 forKey:@"unpackedLatLngVerticesCount"];

  id v5 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)GEORoute;
  uint64_t v6 = [(GEORoute *)&v9 description];
  uint64_t v7 = [v5 stringWithFormat:@"%@ %@", v6, v3];

  return v7;
}

- (unint64_t)indexForStepID:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v4 = [(GEORoute *)self steps];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      uint64_t v8 = 0;
      uint64_t v9 = v5 + v6;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * v8) stepID] == a3)
        {
          unint64_t v10 = v6 + v8;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v6 = v9;
      if (v5) {
        continue;
      }
      break;
    }
  }
  unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v10;
}

- (id)convertToFullRoute:(id)a3 includeDepartureRoutes:(BOOL)a4 uniquePointRange:(_NSRange *)a5
{
  BOOL v28 = a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  [(GEORoute *)self unpackLatLngVertices];
  uint64_t v31 = self;
  if ([(GEORoute *)self hasDepartureRouteID] && v28
    || [(GEORoute *)self hasArrivalRouteID])
  {
    objc_alloc_init(GEORouteTrafficBuilder);
    uint64_t v6 = malloc_type_malloc(0x28uLL, 0x10A00400AA0B987uLL);
    *uint64_t v6 = self;
    v6[1] = 0;
    unint64_t v7 = [(GEORoute *)self stepsCount];
    uint64_t v8 = 0;
    v6[3] = 0;
    v6[4] = 0;
    v6[2] = v7;
    if (v28)
    {
      uint64_t v33 = self;
      uint64_t v9 = [(GEORoute *)v33 departureRouteID];
      if (v9)
      {
        unint64_t v10 = v6;
        double v11 = v33;
        do
        {
          uint64_t v34 = v11;
          unsigned int v12 = [(GEORoute *)v11 departureStepID];
          uint64_t v8 = [v32 objectForKey:v9];

          uint64_t v13 = [(GEORoute *)v8 indexForStepID:v12];
          if (v8)
          {
            uint64_t v14 = v13;
            long long v15 = malloc_type_malloc(0x28uLL, 0x10A00400AA0B987uLL);
            void *v15 = v8;
            v15[1] = 0;
            v15[3] = 0;
            v15[4] = v10;
            unint64_t v10 = v15;
            v15[2] = v14;
          }
          uint64_t v16 = [(GEORoute *)v8 departureRouteID];

          double v11 = v8;
          uint64_t v9 = (void *)v16;
        }
        while (v16);
      }
      else
      {
        uint64_t v8 = v33;
      }
    }
    uint64_t v18 = [(GEORoute *)v31 arrivalRouteID];
    if (v18)
    {
      do
      {
        unsigned int v19 = [(id)*v6 arrivalStepID];
        uint64_t v20 = [v32 objectForKey:v18];

        uint64_t v21 = [(GEORoute *)v20 indexForStepID:v19];
        if (v20)
        {
          uint64_t v22 = v21;
          uint64_t v23 = malloc_type_malloc(0x28uLL, 0x10A00400AA0B987uLL);
          *uint64_t v23 = v20;
          v23[1] = v22 + 1;
          v23[2] = [(GEORoute *)v20 stepsCount];
          uint64_t v24 = [(GEORoute *)v20 stepAtIndex:v22];
          v23[3] = [v24 maneuverEndIndex] + 1;

          v23[4] = 0;
          v6[4] = v23;
          uint64_t v6 = v23;
        }
        uint64_t v25 = [(GEORoute *)v20 arrivalRouteID];

        uint64_t v8 = v20;
        uint64_t v18 = (void *)v25;
      }
      while (v25);
    }
    uint64_t v30 = objc_alloc_init(GEORoute);
    -[GEORoute copyTo:](v31, "copyTo:");
    if ([(GEORoute *)v31 incidentIndicesCount]) {
      [(GEORoute *)v30 setIncidentIndices:[(GEORoute *)v31 incidentIndices] count:[(GEORoute *)v31 incidentIndicesCount]];
    }
    if ([(GEORoute *)v31 incidentEndOffsetsInRoutesCount]) {
      [(GEORoute *)v30 setIncidentEndOffsetsInRoutes:[(GEORoute *)v31 incidentEndOffsetsInRoutes] count:[(GEORoute *)v31 incidentEndOffsetsInRoutesCount]];
    }
    [(GEORoute *)v30 setAvoidsTolls:[(GEORoute *)v31 avoidsTolls]];
    [(GEORoute *)v30 setAvoidsHighways:[(GEORoute *)v31 avoidsHighways]];
    objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objc_alloc_init(MEMORY[0x1E4F1CA58]);
    zilch::Message::Message((zilch::Message *)v35);
  }
  if (a5)
  {
    unsigned int v17 = [(GEORoute *)self pointCount];
    a5->locatiouint64_t n = 0;
    a5->length = v17;
  }
  uint64_t v29 = self;

  return v29;
}

- (id)newETARoute
{
  return [(GEORoute *)self newETARouteFromStepIndex:0 stepPercentRemaining:1.0];
}

- (id)newETARouteFromStepIndex:(unint64_t)a3 stepPercentRemaining:(double)a4
{
  unint64_t v5 = [(GEORoute *)self stepsCount];
  if ([(GEORoute *)self zilchPointsCount] && v5 && [(GEORoute *)self controlPoints])
  {
    uint64_t v6 = objc_alloc_init(GEOETARoute);
    unint64_t v7 = [(GEORoute *)self routeID];
    [(GEOETARoute *)v6 setRouteID:v7];

    zilch::Message::Message((zilch::Message *)v9);
  }
  return 0;
}

- (BOOL)isContingentRouteFor:(id)a3 afterPoint:(unsigned int)a4 mainRoutes:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (GEORoute *)a3;
  id v9 = a5;
  uint64_t v29 = v8;
  if ([(GEORoute *)self routeType] == 2)
  {
    id v28 = v9;
    unint64_t v10 = [(GEORoute *)self stepIndexForPointIndex:v6];
    uint64_t v27 = self;
    while (1)
    {
      unint64_t v11 = [(GEORoute *)self stepsCount];
      BOOL v12 = v10 >= v11;
      if (v10 >= v11) {
        break;
      }
      uint64_t v13 = [(GEORoute *)self stepAtIndex:v10];
      unsigned int v14 = [v13 stepID];

      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v15 = v9;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v16)
      {
        unint64_t v26 = v10;
        char v17 = 0;
        uint64_t v18 = *(void *)v31;
        while (2)
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v31 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(GEORoute **)(*((void *)&v30 + 1) + 8 * i);
            unint64_t v21 = -[GEORoute indexForStepID:](v20, "indexForStepID:", v14, v26);
            if (v21 != 0x7FFFFFFFFFFFFFFFLL)
            {
              if (v20 == v29)
              {
                uint64_t v8 = v29;
                id v9 = v28;
                do
                {
                  unint64_t v22 = [(GEORoute *)v29 stepsCount];
                  BOOL v12 = v21 >= v22;
                  if (v21 >= v22) {
                    break;
                  }
                  uint64_t v23 = [(GEORoute *)v29 stepAtIndex:v21];
                  BOOL v24 = -[GEORoute indexForStepID:](v27, "indexForStepID:", [v23 stepID]) == 0x7FFFFFFFFFFFFFFFLL;

                  ++v21;
                }
                while (!v24);

                goto LABEL_23;
              }
              char v17 = 1;
            }
          }
          uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
          if (v16) {
            continue;
          }
          break;
        }

        id v9 = v28;
        uint64_t v8 = v29;
        unint64_t v10 = v26;
        self = v27;
        if (v17) {
          break;
        }
      }
      else
      {

        id v9 = v28;
      }
      ++v10;
    }
  }
  else
  {
    BOOL v12 = self == v8;
  }
LABEL_23:

  return v12;
}

- (BOOL)isMainOrAlternateRoute
{
  return ![(GEORoute *)self routeType] || [(GEORoute *)self routeType] == 1;
}

- (BOOL)isContingentRoute
{
  return [(GEORoute *)self routeType] == 3 || [(GEORoute *)self routeType] == 2;
}

- (int)transportTypeForStep:(id)a3
{
  id v4 = a3;
  if ([v4 hasOverrideTransportType]) {
    int v5 = [v4 overrideTransportType];
  }
  else {
    int v5 = [(GEORoute *)self transportType];
  }
  int v6 = v5;

  return v6;
}

@end