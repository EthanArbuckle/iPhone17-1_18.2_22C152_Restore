@interface GEOStep
+ (BOOL)isValid:(id)a3;
+ (Class)guidanceEventType;
+ (Class)maneuverNameType;
+ (Class)roadDescriptionType;
+ (Class)signpostType;
- (BOOL)endsOnFwy;
- (BOOL)hasArrivalParameterIndex;
- (BOOL)hasArtworkOverride;
- (BOOL)hasChargingInfo;
- (BOOL)hasDistance;
- (BOOL)hasDistanceCm;
- (BOOL)hasDistanceMeters;
- (BOOL)hasEndsOnFwy;
- (BOOL)hasEvInfo;
- (BOOL)hasEvStateInfo;
- (BOOL)hasExitNumber;
- (BOOL)hasExpectedTime;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasHintFirstAnnouncementZilchIndex;
- (BOOL)hasInstructionSet;
- (BOOL)hasInstructions;
- (BOOL)hasJunctionType;
- (BOOL)hasManeuverEndBasicIndex;
- (BOOL)hasManeuverEndZilchIndex;
- (BOOL)hasManeuverLaneGuidanceSuppressed;
- (BOOL)hasManeuverStartPointOffsetCm;
- (BOOL)hasManeuverStartZilchIndex;
- (BOOL)hasManeuverType;
- (BOOL)hasNotice;
- (BOOL)hasOverrideDrivingSide;
- (BOOL)hasOverrideTransportType;
- (BOOL)hasShouldChainManeuver;
- (BOOL)hasStayOn;
- (BOOL)hasStepID;
- (BOOL)hasStopWaypoint;
- (BOOL)hasTimeCheckpoints;
- (BOOL)hasToFreeway;
- (BOOL)hasTollAhead;
- (BOOL)hasTollPrior;
- (BOOL)hasZilchPathIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)maneuverIsHighwayExit;
- (BOOL)maneuverLaneGuidanceSuppressed;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldChainManeuver;
- (BOOL)stayOn;
- (BOOL)toFreeway;
- (BOOL)tollAhead;
- (BOOL)tollPrior;
- (GEOEVChargeInfo)chargingInfo;
- (GEOEVStateInfo)evStateInfo;
- (GEOEVStepInfo)evInfo;
- (GEOInstructionSet)instructionSet;
- (GEOJunctionElement)junctionElementAtIndex:(unint64_t)a3;
- (GEOJunctionElement)junctionElements;
- (GEONameInfo)exitNumber;
- (GEOPBTransitArtwork)artworkOverride;
- (GEOStep)init;
- (GEOStep)initWithData:(id)a3;
- (GEOStep)initWithDictionary:(id)a3;
- (GEOStep)initWithJSON:(id)a3;
- (GEOStopWaypoint)stopWaypoint;
- (GEOTimeCheckpoints)timeCheckpoints;
- (NSMutableArray)guidanceEvents;
- (NSMutableArray)maneuverNames;
- (NSMutableArray)roadDescriptions;
- (NSMutableArray)signposts;
- (NSString)instructions;
- (NSString)notice;
- (PBUnknownFields)unknownFields;
- (float)distanceMeters;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithDictionary:(int)a3 isJSON:;
- (id)continueInstructionForSpoken;
- (id)continueInstructionsForSignView;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)distanceForListView;
- (id)distanceForSignView;
- (id)executionInstructionsForSpoken;
- (id)firstNameInfo;
- (id)guidanceEventAtIndex:(unint64_t)a3;
- (id)initialInstructionForSpoken;
- (id)instructionsForListView;
- (id)intersectionNameInfo;
- (id)jsonRepresentation;
- (id)junctionTypeAsString:(int)a3;
- (id)maneuverDescription;
- (id)maneuverNameAtIndex:(unint64_t)a3;
- (id)maneuverTypeAsString:(int)a3;
- (id)mergeInstructionsForSignView;
- (id)normalInstructionsForSignView;
- (id)overrideDrivingSideAsString:(int)a3;
- (id)overrideTransportTypeAsString:(int)a3;
- (id)prepareInstructionForSpoken;
- (id)proceedInstructionForSpoken;
- (id)roadDescriptionAtIndex:(unint64_t)a3;
- (id)roadName;
- (id)signpostAtIndex:(unint64_t)a3;
- (int)StringAsJunctionType:(id)a3;
- (int)StringAsManeuverType:(id)a3;
- (int)StringAsOverrideDrivingSide:(id)a3;
- (int)StringAsOverrideTransportType:(id)a3;
- (int)hintFirstAnnouncementZilchIndex;
- (int)junctionType;
- (int)maneuverEndBasicIndex;
- (int)maneuverEndZilchIndex;
- (int)maneuverStartZilchIndex;
- (int)maneuverType;
- (int)overrideDrivingSide;
- (int)overrideTransportType;
- (uint64_t)_reserveJunctionElements:(uint64_t)a1;
- (unint64_t)guidanceEventsCount;
- (unint64_t)hash;
- (unint64_t)junctionElementsCount;
- (unint64_t)maneuverNamesCount;
- (unint64_t)roadDescriptionsCount;
- (unint64_t)signpostsCount;
- (unsigned)arrivalParameterIndex;
- (unsigned)distance;
- (unsigned)distanceCm;
- (unsigned)expectedTime;
- (unsigned)maneuverEndIndex;
- (unsigned)maneuverStartIndex;
- (unsigned)maneuverStartPointOffsetCm;
- (unsigned)stepID;
- (unsigned)zilchPathIndex;
- (void)_addNoFlagsGuidanceEvent:(uint64_t)a1;
- (void)_addNoFlagsManeuverName:(uint64_t)a1;
- (void)_addNoFlagsRoadDescription:(uint64_t)a1;
- (void)_addNoFlagsSignpost:(uint64_t)a1;
- (void)_readArtworkOverride;
- (void)_readChargingInfo;
- (void)_readEvInfo;
- (void)_readEvStateInfo;
- (void)_readExitNumber;
- (void)_readGuidanceEvents;
- (void)_readInstructionSet;
- (void)_readInstructions;
- (void)_readJunctionElements;
- (void)_readManeuverNames;
- (void)_readNotice;
- (void)_readRoadDescriptions;
- (void)_readSignposts;
- (void)_readStopWaypoint;
- (void)_readTimeCheckpoints;
- (void)addGuidanceEvent:(id)a3;
- (void)addJunctionElement:(GEOJunctionElement)a3;
- (void)addManeuverName:(id)a3;
- (void)addRoadDescription:(id)a3;
- (void)addSignpost:(id)a3;
- (void)clearGuidanceEvents;
- (void)clearJunctionElements;
- (void)clearManeuverNames;
- (void)clearRoadDescriptions;
- (void)clearSignposts;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setArrivalParameterIndex:(unsigned int)a3;
- (void)setArtworkOverride:(id)a3;
- (void)setChargingInfo:(id)a3;
- (void)setDistance:(unsigned int)a3;
- (void)setDistanceCm:(unsigned int)a3;
- (void)setDistanceMeters:(float)a3;
- (void)setEndsOnFwy:(BOOL)a3;
- (void)setEvInfo:(id)a3;
- (void)setEvStateInfo:(id)a3;
- (void)setExitNumber:(id)a3;
- (void)setExpectedTime:(unsigned int)a3;
- (void)setGuidanceEvents:(id)a3;
- (void)setHasArrivalParameterIndex:(BOOL)a3;
- (void)setHasDistance:(BOOL)a3;
- (void)setHasDistanceCm:(BOOL)a3;
- (void)setHasDistanceMeters:(BOOL)a3;
- (void)setHasEndsOnFwy:(BOOL)a3;
- (void)setHasExpectedTime:(BOOL)a3;
- (void)setHasHintFirstAnnouncementZilchIndex:(BOOL)a3;
- (void)setHasJunctionType:(BOOL)a3;
- (void)setHasManeuverEndBasicIndex:(BOOL)a3;
- (void)setHasManeuverEndZilchIndex:(BOOL)a3;
- (void)setHasManeuverLaneGuidanceSuppressed:(BOOL)a3;
- (void)setHasManeuverStartPointOffsetCm:(BOOL)a3;
- (void)setHasManeuverStartZilchIndex:(BOOL)a3;
- (void)setHasManeuverType:(BOOL)a3;
- (void)setHasOverrideDrivingSide:(BOOL)a3;
- (void)setHasOverrideTransportType:(BOOL)a3;
- (void)setHasShouldChainManeuver:(BOOL)a3;
- (void)setHasStayOn:(BOOL)a3;
- (void)setHasStepID:(BOOL)a3;
- (void)setHasToFreeway:(BOOL)a3;
- (void)setHasTollAhead:(BOOL)a3;
- (void)setHasTollPrior:(BOOL)a3;
- (void)setHasZilchPathIndex:(BOOL)a3;
- (void)setHintFirstAnnouncementZilchIndex:(int)a3;
- (void)setInstructionSet:(id)a3;
- (void)setInstructions:(id)a3;
- (void)setJunctionElements:(GEOJunctionElement *)a3 count:(unint64_t)a4;
- (void)setJunctionType:(int)a3;
- (void)setManeuverEndBasicIndex:(int)a3;
- (void)setManeuverEndZilchIndex:(int)a3;
- (void)setManeuverLaneGuidanceSuppressed:(BOOL)a3;
- (void)setManeuverNames:(id)a3;
- (void)setManeuverStartPointOffsetCm:(unsigned int)a3;
- (void)setManeuverStartZilchIndex:(int)a3;
- (void)setManeuverType:(int)a3;
- (void)setNotice:(id)a3;
- (void)setOverrideDrivingSide:(int)a3;
- (void)setOverrideTransportType:(int)a3;
- (void)setRoadDescriptions:(id)a3;
- (void)setShouldChainManeuver:(BOOL)a3;
- (void)setSignposts:(id)a3;
- (void)setStayOn:(BOOL)a3;
- (void)setStepID:(unsigned int)a3;
- (void)setStopWaypoint:(id)a3;
- (void)setTimeCheckpoints:(id)a3;
- (void)setToFreeway:(BOOL)a3;
- (void)setTollAhead:(BOOL)a3;
- (void)setTollPrior:(BOOL)a3;
- (void)setZilchPathIndex:(unsigned int)a3;
- (void)shieldInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOStep

- (GEOStep)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOStep;
  v2 = [(GEOStep *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOStep)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOStep;
  v3 = [(GEOStep *)&v7 initWithData:a3];
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
  [(GEOStep *)self clearJunctionElements];
  v3.receiver = self;
  v3.super_class = (Class)GEOStep;
  [(GEOStep *)&v3 dealloc];
}

- (unsigned)stepID
{
  return self->_stepID;
}

- (void)setStepID:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x8000004000uLL;
  self->_stepID = a3;
}

- (void)setHasStepID:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (a3) {
    uint64_t v3 = 0x8000004000;
  }
  self->_flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(void *)&self->_flags & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasStepID
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 6) & 1;
}

- (int)maneuverEndBasicIndex
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $EDB2BE274159A3E7688E4593D5E8813B flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x80) != 0) {
    return self->_maneuverEndBasicIndex;
  }
  else {
    return -1;
  }
}

- (void)setManeuverEndBasicIndex:(int)a3
{
  *(void *)&self->_flags |= 0x8000000080uLL;
  self->_maneuverEndBasicIndex = a3;
}

- (void)setHasManeuverEndBasicIndex:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (a3) {
    uint64_t v3 = 0x8000000080;
  }
  self->_$EDB2BE274159A3E7688E4593D5E8813B flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(void *)&self->_flags & 0xFFFFFF7FFFFFFF7FLL | v3);
}

- (BOOL)hasManeuverEndBasicIndex
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (int)maneuverStartZilchIndex
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $EDB2BE274159A3E7688E4593D5E8813B flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x200) != 0) {
    return self->_maneuverStartZilchIndex;
  }
  else {
    return -1;
  }
}

- (void)setManeuverStartZilchIndex:(int)a3
{
  *(void *)&self->_flags |= 0x8000000200uLL;
  self->_maneuverStartZilchIndex = a3;
}

- (void)setHasManeuverStartZilchIndex:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (a3) {
    uint64_t v3 = 0x8000000200;
  }
  self->_$EDB2BE274159A3E7688E4593D5E8813B flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasManeuverStartZilchIndex
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (int)maneuverEndZilchIndex
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $EDB2BE274159A3E7688E4593D5E8813B flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x100) != 0) {
    return self->_maneuverEndZilchIndex;
  }
  else {
    return -1;
  }
}

- (void)setManeuverEndZilchIndex:(int)a3
{
  *(void *)&self->_flags |= 0x8000000100uLL;
  self->_maneuverEndZilchIndex = a3;
}

- (void)setHasManeuverEndZilchIndex:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (a3) {
    uint64_t v3 = 0x8000000100;
  }
  self->_$EDB2BE274159A3E7688E4593D5E8813B flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasManeuverEndZilchIndex
{
  return *((unsigned char *)&self->_flags + 1) & 1;
}

- (int)hintFirstAnnouncementZilchIndex
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $EDB2BE274159A3E7688E4593D5E8813B flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x20) != 0) {
    return self->_hintFirstAnnouncementZilchIndex;
  }
  else {
    return -1;
  }
}

- (void)setHintFirstAnnouncementZilchIndex:(int)a3
{
  *(void *)&self->_flags |= 0x8000000020uLL;
  self->_hintFirstAnnouncementZilchIndex = a3;
}

- (void)setHasHintFirstAnnouncementZilchIndex:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (a3) {
    uint64_t v3 = 0x8000000020;
  }
  self->_$EDB2BE274159A3E7688E4593D5E8813B flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasHintFirstAnnouncementZilchIndex
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (unsigned)expectedTime
{
  return self->_expectedTime;
}

- (void)setExpectedTime:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x8000000010uLL;
  self->_expectedTime = a3;
}

- (void)setHasExpectedTime:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (a3) {
    uint64_t v3 = 0x8000000010;
  }
  self->_$EDB2BE274159A3E7688E4593D5E8813B flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasExpectedTime
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (int)maneuverType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $EDB2BE274159A3E7688E4593D5E8813B flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x400) != 0) {
    return self->_maneuverType;
  }
  else {
    return 0;
  }
}

- (void)setManeuverType:(int)a3
{
  *(void *)&self->_flags |= 0x8000000400uLL;
  self->_maneuverType = a3;
}

- (void)setHasManeuverType:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (a3) {
    uint64_t v3 = 0x8000000400;
  }
  self->_$EDB2BE274159A3E7688E4593D5E8813B flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasManeuverType
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (id)maneuverTypeAsString:(int)a3
{
  v4 = @"NO_TURN";
  switch(a3)
  {
    case 0:
      goto LABEL_24;
    case 1:
      v4 = @"LEFT_TURN";
      break;
    case 2:
      v4 = @"RIGHT_TURN";
      break;
    case 3:
      v4 = @"STRAIGHT_AHEAD";
      break;
    case 4:
      v4 = @"U_TURN";
      break;
    case 5:
      v4 = @"FOLLOW_ROAD";
      break;
    case 6:
      v4 = @"ENTER_ROUNDABOUT";
      break;
    case 7:
      v4 = @"EXIT_ROUNDABOUT";
      break;
    case 11:
      v4 = @"OFF_RAMP";
      break;
    case 12:
      v4 = @"ON_RAMP";
      break;
    case 16:
      v4 = @"ARRIVE_END_OF_NAVIGATION";
      break;
    case 17:
      v4 = @"START_ROUTE";
      break;
    case 18:
      v4 = @"ARRIVE_AT_DESTINATION";
      break;
    case 20:
      v4 = @"KEEP_LEFT";
      break;
    case 21:
      v4 = @"KEEP_RIGHT";
      break;
    case 22:
      v4 = @"ENTER_FERRY";
      break;
    case 23:
      v4 = @"EXIT_FERRY";
      break;
    case 24:
      v4 = @"CHANGE_FERRY";
      break;
    case 25:
      v4 = @"START_ROUTE_WITH_U_TURN";
      break;
    case 26:
      v4 = @"U_TURN_AT_ROUNDABOUT";
      break;
    case 27:
      v4 = @"LEFT_TURN_AT_END";
      break;
    case 28:
      v4 = @"RIGHT_TURN_AT_END";
      break;
    case 29:
      v4 = @"HIGHWAY_OFF_RAMP_LEFT";
      break;
    case 30:
      v4 = @"HIGHWAY_OFF_RAMP_RIGHT";
      break;
    case 33:
      v4 = @"ARRIVE_AT_DESTINATION_LEFT";
      break;
    case 34:
      v4 = @"ARRIVE_AT_DESTINATION_RIGHT";
      break;
    case 35:
      v4 = @"U_TURN_WHEN_POSSIBLE";
      break;
    case 39:
      v4 = @"ARRIVE_END_OF_DIRECTIONS";
      break;
    case 41:
      v4 = @"ROUNDABOUT_EXIT_1";
      break;
    case 42:
      v4 = @"ROUNDABOUT_EXIT_2";
      break;
    case 43:
      v4 = @"ROUNDABOUT_EXIT_3";
      break;
    case 44:
      v4 = @"ROUNDABOUT_EXIT_4";
      break;
    case 45:
      v4 = @"ROUNDABOUT_EXIT_5";
      break;
    case 46:
      v4 = @"ROUNDABOUT_EXIT_6";
      break;
    case 47:
      v4 = @"ROUNDABOUT_EXIT_7";
      break;
    case 48:
      v4 = @"ROUNDABOUT_EXIT_8";
      break;
    case 49:
      v4 = @"ROUNDABOUT_EXIT_9";
      break;
    case 50:
      v4 = @"ROUNDABOUT_EXIT_10";
      break;
    case 51:
      v4 = @"ROUNDABOUT_EXIT_11";
      break;
    case 52:
      v4 = @"ROUNDABOUT_EXIT_12";
      break;
    case 53:
      v4 = @"ROUNDABOUT_EXIT_13";
      break;
    case 54:
      v4 = @"ROUNDABOUT_EXIT_14";
      break;
    case 55:
      v4 = @"ROUNDABOUT_EXIT_15";
      break;
    case 56:
      v4 = @"ROUNDABOUT_EXIT_16";
      break;
    case 57:
      v4 = @"ROUNDABOUT_EXIT_17";
      break;
    case 58:
      v4 = @"ROUNDABOUT_EXIT_18";
      break;
    case 59:
      v4 = @"ROUNDABOUT_EXIT_19";
      break;
    case 60:
      v4 = @"SHARP_LEFT_TURN";
      break;
    case 61:
      v4 = @"SHARP_RIGHT_TURN";
      break;
    case 62:
      v4 = @"SLIGHT_LEFT_TURN";
      break;
    case 63:
      v4 = @"SLIGHT_RIGHT_TURN";
      break;
    case 64:
      v4 = @"CHANGE_HIGHWAY";
      break;
    case 65:
      v4 = @"CHANGE_HIGHWAY_LEFT";
      break;
    case 66:
      v4 = @"CHANGE_HIGHWAY_RIGHT";
      break;
    case 80:
      v4 = @"TOLL_STATION";
      break;
    case 81:
      v4 = @"ENTER_TUNNEL";
      break;
    case 82:
      v4 = @"WAYPOINT_STOP";
      break;
    case 83:
      v4 = @"WAYPOINT_STOP_LEFT";
      break;
    case 84:
      v4 = @"WAYPOINT_STOP_RIGHT";
      break;
    case 85:
      v4 = @"RESUME_ROUTE";
      break;
    case 86:
      v4 = @"RESUME_ROUTE_WITH_U_TURN";
      break;
    case 87:
      v4 = @"CUSTOM";
      break;
    case 88:
      v4 = @"TURN_AROUND";
      break;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_24:
      break;
  }
  return v4;
}

- (int)StringAsManeuverType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NO_TURN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LEFT_TURN"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RIGHT_TURN"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"STRAIGHT_AHEAD"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"U_TURN"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FOLLOW_ROAD"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"ENTER_ROUNDABOUT"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"EXIT_ROUNDABOUT"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"OFF_RAMP"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"ON_RAMP"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"ARRIVE_END_OF_NAVIGATION"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"START_ROUTE"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"ARRIVE_AT_DESTINATION"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"KEEP_LEFT"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"KEEP_RIGHT"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"ENTER_FERRY"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"EXIT_FERRY"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"CHANGE_FERRY"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"START_ROUTE_WITH_U_TURN"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"U_TURN_AT_ROUNDABOUT"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"LEFT_TURN_AT_END"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"RIGHT_TURN_AT_END"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"HIGHWAY_OFF_RAMP_LEFT"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"HIGHWAY_OFF_RAMP_RIGHT"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"ARRIVE_AT_DESTINATION_LEFT"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"ARRIVE_AT_DESTINATION_RIGHT"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"U_TURN_WHEN_POSSIBLE"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"ARRIVE_END_OF_DIRECTIONS"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_1"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_2"])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_3"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_4"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_5"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_6"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_7"])
  {
    int v4 = 47;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_8"])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_9"])
  {
    int v4 = 49;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_10"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_11"])
  {
    int v4 = 51;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_12"])
  {
    int v4 = 52;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_13"])
  {
    int v4 = 53;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_14"])
  {
    int v4 = 54;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_15"])
  {
    int v4 = 55;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_16"])
  {
    int v4 = 56;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_17"])
  {
    int v4 = 57;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_18"])
  {
    int v4 = 58;
  }
  else if ([v3 isEqualToString:@"ROUNDABOUT_EXIT_19"])
  {
    int v4 = 59;
  }
  else if ([v3 isEqualToString:@"SHARP_LEFT_TURN"])
  {
    int v4 = 60;
  }
  else if ([v3 isEqualToString:@"SHARP_RIGHT_TURN"])
  {
    int v4 = 61;
  }
  else if ([v3 isEqualToString:@"SLIGHT_LEFT_TURN"])
  {
    int v4 = 62;
  }
  else if ([v3 isEqualToString:@"SLIGHT_RIGHT_TURN"])
  {
    int v4 = 63;
  }
  else if ([v3 isEqualToString:@"CHANGE_HIGHWAY"])
  {
    int v4 = 64;
  }
  else if ([v3 isEqualToString:@"CHANGE_HIGHWAY_LEFT"])
  {
    int v4 = 65;
  }
  else if ([v3 isEqualToString:@"CHANGE_HIGHWAY_RIGHT"])
  {
    int v4 = 66;
  }
  else if ([v3 isEqualToString:@"TOLL_STATION"])
  {
    int v4 = 80;
  }
  else if ([v3 isEqualToString:@"ENTER_TUNNEL"])
  {
    int v4 = 81;
  }
  else if ([v3 isEqualToString:@"WAYPOINT_STOP"])
  {
    int v4 = 82;
  }
  else if ([v3 isEqualToString:@"WAYPOINT_STOP_LEFT"])
  {
    int v4 = 83;
  }
  else if ([v3 isEqualToString:@"WAYPOINT_STOP_RIGHT"])
  {
    int v4 = 84;
  }
  else if ([v3 isEqualToString:@"RESUME_ROUTE"])
  {
    int v4 = 85;
  }
  else if ([v3 isEqualToString:@"RESUME_ROUTE_WITH_U_TURN"])
  {
    int v4 = 86;
  }
  else if ([v3 isEqualToString:@"CUSTOM"])
  {
    int v4 = 87;
  }
  else if ([v3 isEqualToString:@"TURN_AROUND"])
  {
    int v4 = 88;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readManeuverNames
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 248) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readManeuverNames_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (NSMutableArray)maneuverNames
{
  -[GEOStep _readManeuverNames]((uint64_t)self);
  maneuverNames = self->_maneuverNames;

  return maneuverNames;
}

- (void)setManeuverNames:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x200000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x8000000000uLL;
  maneuverNames = self->_maneuverNames;
  self->_maneuverNames = v4;
}

- (void)clearManeuverNames
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x200000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x8000000000uLL;
  maneuverNames = self->_maneuverNames;

  [(NSMutableArray *)maneuverNames removeAllObjects];
}

- (void)addManeuverName:(id)a3
{
  id v4 = a3;
  -[GEOStep _readManeuverNames]((uint64_t)self);
  -[GEOStep _addNoFlagsManeuverName:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x200000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x8000000000uLL;
}

- (void)_addNoFlagsManeuverName:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 112);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 112);
      *(void *)(a1 + 112) = v5;

      id v4 = *(void **)(a1 + 112);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)maneuverNamesCount
{
  -[GEOStep _readManeuverNames]((uint64_t)self);
  maneuverNames = self->_maneuverNames;

  return [(NSMutableArray *)maneuverNames count];
}

- (id)maneuverNameAtIndex:(unint64_t)a3
{
  -[GEOStep _readManeuverNames]((uint64_t)self);
  maneuverNames = self->_maneuverNames;

  return (id)[(NSMutableArray *)maneuverNames objectAtIndex:a3];
}

+ (Class)maneuverNameType
{
  return (Class)objc_opt_class();
}

- (int)junctionType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $EDB2BE274159A3E7688E4593D5E8813B flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x40) != 0) {
    return self->_junctionType;
  }
  else {
    return 0;
  }
}

- (void)setJunctionType:(int)a3
{
  *(void *)&self->_flags |= 0x8000000040uLL;
  self->_junctionType = a3;
}

- (void)setHasJunctionType:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (a3) {
    uint64_t v3 = 0x8000000040;
  }
  self->_$EDB2BE274159A3E7688E4593D5E8813B flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasJunctionType
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (id)junctionTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      id v4 = @"JCTTYPE_ROUNDABOUT";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v4 = @"JCTTYPE_NORMAL";
  }
  return v4;
}

- (int)StringAsJunctionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"JCTTYPE_NORMAL"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"JCTTYPE_ROUNDABOUT"];
  }

  return v4;
}

- (void)_readJunctionElements
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 247) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readJunctionElements_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (unint64_t)junctionElementsCount
{
  return self->_junctionElementsCount;
}

- (GEOJunctionElement)junctionElements
{
  return self->_junctionElements;
}

- (uint64_t)_reserveJunctionElements:(uint64_t)a1
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    unint64_t v4 = *(void *)(a1 + 32);
    unint64_t v5 = v4 + a2;
    if (v4 + a2 <= v4) {
      return 0;
    }
    unint64_t v6 = *(void *)(a1 + 40);
    if (v6 >= v5) {
      return 1;
    }
    unint64_t v7 = v6 + a2;
    if (v6 + a2)
    {
      unint64_t v8 = 1;
      while (1)
      {
        unint64_t v9 = v8;
        if (v8 >= v7) {
          break;
        }
        v8 *= 2;
        if ((v9 & 0x8000000000000000) != 0)
        {
          unint64_t v9 = -1;
          goto LABEL_12;
        }
      }
    }
    else
    {
      unint64_t v9 = 0;
    }
    if (v9 < a2) {
      return 0;
    }
LABEL_12:
    if (16 * v9 < v9) {
      return 0;
    }
    uint64_t result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 24), 16 * v9, 0x8260BA8AuLL);
    if (result)
    {
      *(void *)(a1 + 40) = v9;
      *(void *)(a1 + 24) = result;
      bzero((void *)(result + 16 * *(void *)(a1 + 32)), 16 * (v9 - *(void *)(a1 + 32)));
      return 1;
    }
  }
  return result;
}

- (void)clearJunctionElements
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x8000000000uLL;
  self->_junctionElementsSpace = 0;
  self->_junctionElementsCount = 0;
  free(self->_junctionElements);
  self->_junctionElements = 0;
}

- (void)addJunctionElement:(GEOJunctionElement)a3
{
  uint64_t v3 = *(void *)&a3.var2;
  uint64_t v4 = *(void *)&a3.var0;
  -[GEOStep _readJunctionElements]((uint64_t)self);
  if (self && -[GEOStep _reserveJunctionElements:]((uint64_t)self, 1uLL))
  {
    unint64_t v6 = &self->_junctionElements[self->_junctionElementsCount];
    *(void *)&v6->var0 = v4;
    *(void *)&v6->var2 = v3;
    ++self->_junctionElementsCount;
  }
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x8000000000uLL;
}

- (GEOJunctionElement)junctionElementAtIndex:(unint64_t)a3
{
  -[GEOStep _readJunctionElements]((uint64_t)self);
  unint64_t junctionElementsCount = self->_junctionElementsCount;
  if (junctionElementsCount <= a3)
  {
    unint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    unint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, junctionElementsCount);
    unint64_t v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  v10 = &self->_junctionElements[a3];
  uint64_t v11 = *(void *)&v10->var0;
  uint64_t v12 = *(void *)&v10->var2;
  result.var2 = v12;
  result.var3 = *($162FAC071EAEBA15A6F8D573D0754DF6 *)((char *)&v12 + 4);
  result.var0 = v11;
  result.var1 = HIDWORD(v11);
  return result;
}

- (void)setJunctionElements:(GEOJunctionElement *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x8000000000uLL;
  [(GEOStep *)self clearJunctionElements];
  if (-[GEOStep _reserveJunctionElements:]((uint64_t)self, a4))
  {
    memcpy(self->_junctionElements, a3, 16 * a4);
    self->_unint64_t junctionElementsCount = a4;
  }
}

- (void)_readSignposts
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 248) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSignposts_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (NSMutableArray)signposts
{
  -[GEOStep _readSignposts]((uint64_t)self);
  signposts = self->_signposts;

  return signposts;
}

- (void)setSignposts:(id)a3
{
  uint64_t v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x8000000000uLL;
  signposts = self->_signposts;
  self->_signposts = v4;
}

- (void)clearSignposts
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x8000000000uLL;
  signposts = self->_signposts;

  [(NSMutableArray *)signposts removeAllObjects];
}

- (void)addSignpost:(id)a3
{
  id v4 = a3;
  -[GEOStep _readSignposts]((uint64_t)self);
  -[GEOStep _addNoFlagsSignpost:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x8000000000uLL;
}

- (void)_addNoFlagsSignpost:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 136);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v6 = *(void **)(a1 + 136);
      *(void *)(a1 + 136) = v5;

      id v4 = *(void **)(a1 + 136);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)signpostsCount
{
  -[GEOStep _readSignposts]((uint64_t)self);
  signposts = self->_signposts;

  return [(NSMutableArray *)signposts count];
}

- (id)signpostAtIndex:(unint64_t)a3
{
  -[GEOStep _readSignposts]((uint64_t)self);
  signposts = self->_signposts;

  return (id)[(NSMutableArray *)signposts objectAtIndex:a3];
}

+ (Class)signpostType
{
  return (Class)objc_opt_class();
}

- (int)overrideTransportType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $EDB2BE274159A3E7688E4593D5E8813B flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x2000) != 0) {
    return self->_overrideTransportType;
  }
  else {
    return 0;
  }
}

- (void)setOverrideTransportType:(int)a3
{
  *(void *)&self->_flags |= 0x8000002000uLL;
  self->_overrideTransportType = a3;
}

- (void)setHasOverrideTransportType:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (a3) {
    uint64_t v3 = 0x8000002000;
  }
  self->_$EDB2BE274159A3E7688E4593D5E8813B flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(void *)&self->_flags & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasOverrideTransportType
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 5) & 1;
}

- (id)overrideTransportTypeAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53E0868[a3];
  }

  return v3;
}

- (int)StringAsOverrideTransportType:(id)a3
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

- (int)overrideDrivingSide
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $EDB2BE274159A3E7688E4593D5E8813B flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x1000) != 0) {
    return self->_overrideDrivingSide;
  }
  else {
    return 0;
  }
}

- (void)setOverrideDrivingSide:(int)a3
{
  *(void *)&self->_flags |= 0x8000001000uLL;
  self->_overrideDrivingSide = a3;
}

- (void)setHasOverrideDrivingSide:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (a3) {
    uint64_t v3 = 0x8000001000;
  }
  self->_$EDB2BE274159A3E7688E4593D5E8813B flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(void *)&self->_flags & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasOverrideDrivingSide
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 4) & 1;
}

- (id)overrideDrivingSideAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"LEFT_SIDE";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"RIGHT_SIDE";
  }
  return v4;
}

- (int)StringAsOverrideDrivingSide:(id)a3
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

- (void)_readExitNumber
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 247) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readExitNumber_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (BOOL)hasExitNumber
{
  return self->_exitNumber != 0;
}

- (GEONameInfo)exitNumber
{
  -[GEOStep _readExitNumber]((uint64_t)self);
  exitNumber = self->_exitNumber;

  return exitNumber;
}

- (void)setExitNumber:(id)a3
{
  *(void *)&self->_flags |= 0x8020000000uLL;
  objc_storeStrong((id *)&self->_exitNumber, a3);
}

- (BOOL)tollPrior
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $EDB2BE274159A3E7688E4593D5E8813B flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_DWORD *)&flags & 0x400000) != 0 && self->_tollPrior;
}

- (void)setTollPrior:(BOOL)a3
{
  *(void *)&self->_flags |= 0x8000400000uLL;
  self->_tollPrior = a3;
}

- (void)setHasTollPrior:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (a3) {
    uint64_t v3 = 0x8000400000;
  }
  self->_$EDB2BE274159A3E7688E4593D5E8813B flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(void *)&self->_flags & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasTollPrior
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 6) & 1;
}

- (BOOL)tollAhead
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $EDB2BE274159A3E7688E4593D5E8813B flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_DWORD *)&flags & 0x200000) != 0 && self->_tollAhead;
}

- (void)setTollAhead:(BOOL)a3
{
  *(void *)&self->_flags |= 0x8000200000uLL;
  self->_tollAhead = a3;
}

- (void)setHasTollAhead:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (a3) {
    uint64_t v3 = 0x8000200000;
  }
  self->_$EDB2BE274159A3E7688E4593D5E8813B flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(void *)&self->_flags & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasTollAhead
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 5) & 1;
}

- (BOOL)endsOnFwy
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $EDB2BE274159A3E7688E4593D5E8813B flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_DWORD *)&flags & 0x10000) != 0 && self->_endsOnFwy;
}

- (void)setEndsOnFwy:(BOOL)a3
{
  *(void *)&self->_flags |= 0x8000010000uLL;
  self->_endsOnFwy = a3;
}

- (void)setHasEndsOnFwy:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (a3) {
    uint64_t v3 = 0x8000010000;
  }
  self->_$EDB2BE274159A3E7688E4593D5E8813B flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(void *)&self->_flags & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasEndsOnFwy
{
  return *((unsigned char *)&self->_flags + 2) & 1;
}

- (BOOL)toFreeway
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $EDB2BE274159A3E7688E4593D5E8813B flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_DWORD *)&flags & 0x100000) != 0 && self->_toFreeway;
}

- (void)setToFreeway:(BOOL)a3
{
  *(void *)&self->_flags |= 0x8000100000uLL;
  self->_toFreeway = a3;
}

- (void)setHasToFreeway:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (a3) {
    uint64_t v3 = 0x8000100000;
  }
  self->_$EDB2BE274159A3E7688E4593D5E8813B flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(void *)&self->_flags & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasToFreeway
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 4) & 1;
}

- (void)_readInstructions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 248) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInstructions_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (BOOL)hasInstructions
{
  return self->_instructions != 0;
}

- (NSString)instructions
{
  -[GEOStep _readInstructions]((uint64_t)self);
  instructions = self->_instructions;

  return instructions;
}

- (void)setInstructions:(id)a3
{
  *(void *)&self->_flags |= 0x8100000000uLL;
  objc_storeStrong((id *)&self->_instructions, a3);
}

- (void)_readNotice
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 248) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNotice_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (BOOL)hasNotice
{
  return self->_notice != 0;
}

- (NSString)notice
{
  -[GEOStep _readNotice]((uint64_t)self);
  notice = self->_notice;

  return notice;
}

- (void)setNotice:(id)a3
{
  *(void *)&self->_flags |= 0x8400000000uLL;
  objc_storeStrong((id *)&self->_notice, a3);
}

- (void)_readTimeCheckpoints
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 248) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTimeCheckpoints_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (BOOL)hasTimeCheckpoints
{
  return self->_timeCheckpoints != 0;
}

- (GEOTimeCheckpoints)timeCheckpoints
{
  -[GEOStep _readTimeCheckpoints]((uint64_t)self);
  timeCheckpoints = self->_timeCheckpoints;

  return timeCheckpoints;
}

- (void)setTimeCheckpoints:(id)a3
{
  *(void *)&self->_flags |= 0xC000000000uLL;
  objc_storeStrong((id *)&self->_timeCheckpoints, a3);
}

- (void)_readInstructionSet
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 247) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInstructionSet_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (BOOL)hasInstructionSet
{
  return self->_instructionSet != 0;
}

- (GEOInstructionSet)instructionSet
{
  -[GEOStep _readInstructionSet]((uint64_t)self);
  instructionSet = self->_instructionSet;

  return instructionSet;
}

- (void)setInstructionSet:(id)a3
{
  *(void *)&self->_flags |= 0x8080000000uLL;
  objc_storeStrong((id *)&self->_instructionSet, a3);
}

- (BOOL)shouldChainManeuver
{
  return self->_shouldChainManeuver;
}

- (void)setShouldChainManeuver:(BOOL)a3
{
  *(void *)&self->_flags |= 0x8000040000uLL;
  self->_shouldChainManeuver = a3;
}

- (void)setHasShouldChainManeuver:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (a3) {
    uint64_t v3 = 0x8000040000;
  }
  self->_$EDB2BE274159A3E7688E4593D5E8813B flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(void *)&self->_flags & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasShouldChainManeuver
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 2) & 1;
}

- (void)_readGuidanceEvents
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 247) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGuidanceEvents_tags_7095);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (NSMutableArray)guidanceEvents
{
  -[GEOStep _readGuidanceEvents]((uint64_t)self);
  guidanceEvents = self->_guidanceEvents;

  return guidanceEvents;
}

- (void)setGuidanceEvents:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x40000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x8000000000uLL;
  guidanceEvents = self->_guidanceEvents;
  self->_guidanceEvents = v4;
}

- (void)clearGuidanceEvents
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x40000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x8000000000uLL;
  guidanceEvents = self->_guidanceEvents;

  [(NSMutableArray *)guidanceEvents removeAllObjects];
}

- (void)addGuidanceEvent:(id)a3
{
  id v4 = a3;
  -[GEOStep _readGuidanceEvents]((uint64_t)self);
  -[GEOStep _addNoFlagsGuidanceEvent:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x40000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x8000000000uLL;
}

- (void)_addNoFlagsGuidanceEvent:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 88);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v6 = *(void **)(a1 + 88);
      *(void *)(a1 + 88) = v5;

      id v4 = *(void **)(a1 + 88);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)guidanceEventsCount
{
  -[GEOStep _readGuidanceEvents]((uint64_t)self);
  guidanceEvents = self->_guidanceEvents;

  return [(NSMutableArray *)guidanceEvents count];
}

- (id)guidanceEventAtIndex:(unint64_t)a3
{
  -[GEOStep _readGuidanceEvents]((uint64_t)self);
  guidanceEvents = self->_guidanceEvents;

  return (id)[(NSMutableArray *)guidanceEvents objectAtIndex:a3];
}

+ (Class)guidanceEventType
{
  return (Class)objc_opt_class();
}

- (BOOL)stayOn
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $EDB2BE274159A3E7688E4593D5E8813B flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_DWORD *)&flags & 0x80000) != 0 && self->_stayOn;
}

- (void)setStayOn:(BOOL)a3
{
  *(void *)&self->_flags |= 0x8000080000uLL;
  self->_stayOn = a3;
}

- (void)setHasStayOn:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (a3) {
    uint64_t v3 = 0x8000080000;
  }
  self->_$EDB2BE274159A3E7688E4593D5E8813B flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(void *)&self->_flags & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasStayOn
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 3) & 1;
}

- (BOOL)maneuverLaneGuidanceSuppressed
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $EDB2BE274159A3E7688E4593D5E8813B flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_DWORD *)&flags & 0x20000) != 0 && self->_maneuverLaneGuidanceSuppressed;
}

- (void)setManeuverLaneGuidanceSuppressed:(BOOL)a3
{
  *(void *)&self->_flags |= 0x8000020000uLL;
  self->_maneuverLaneGuidanceSuppressed = a3;
}

- (void)setHasManeuverLaneGuidanceSuppressed:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (a3) {
    uint64_t v3 = 0x8000020000;
  }
  self->_$EDB2BE274159A3E7688E4593D5E8813B flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(void *)&self->_flags & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasManeuverLaneGuidanceSuppressed
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 1) & 1;
}

- (void)_readEvStateInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 247) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEvStateInfo_tags_7096);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (BOOL)hasEvStateInfo
{
  return self->_evStateInfo != 0;
}

- (GEOEVStateInfo)evStateInfo
{
  -[GEOStep _readEvStateInfo]((uint64_t)self);
  evStateInfo = self->_evStateInfo;

  return evStateInfo;
}

- (void)setEvStateInfo:(id)a3
{
  *(void *)&self->_flags |= 0x8010000000uLL;
  objc_storeStrong((id *)&self->_evStateInfo, a3);
}

- (void)_readEvInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 247) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEvInfo_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (BOOL)hasEvInfo
{
  return self->_evInfo != 0;
}

- (GEOEVStepInfo)evInfo
{
  -[GEOStep _readEvInfo]((uint64_t)self);
  evInfo = self->_evInfo;

  return evInfo;
}

- (void)setEvInfo:(id)a3
{
  *(void *)&self->_flags |= 0x8008000000uLL;
  objc_storeStrong((id *)&self->_evInfo, a3);
}

- (void)_readChargingInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 247) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readChargingInfo_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (BOOL)hasChargingInfo
{
  return self->_chargingInfo != 0;
}

- (GEOEVChargeInfo)chargingInfo
{
  -[GEOStep _readChargingInfo]((uint64_t)self);
  chargingInfo = self->_chargingInfo;

  return chargingInfo;
}

- (void)setChargingInfo:(id)a3
{
  *(void *)&self->_flags |= 0x8004000000uLL;
  objc_storeStrong((id *)&self->_chargingInfo, a3);
}

- (unsigned)arrivalParameterIndex
{
  return self->_arrivalParameterIndex;
}

- (void)setArrivalParameterIndex:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x8000000001uLL;
  self->_arrivalParameterIndex = a3;
}

- (void)setHasArrivalParameterIndex:(BOOL)a3
{
  self->_$EDB2BE274159A3E7688E4593D5E8813B flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3 | 0x8000000000);
}

- (BOOL)hasArrivalParameterIndex
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)_readArtworkOverride
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 247) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readArtworkOverride_tags_7097);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (BOOL)hasArtworkOverride
{
  return self->_artworkOverride != 0;
}

- (GEOPBTransitArtwork)artworkOverride
{
  -[GEOStep _readArtworkOverride]((uint64_t)self);
  artworkOverride = self->_artworkOverride;

  return artworkOverride;
}

- (void)setArtworkOverride:(id)a3
{
  *(void *)&self->_flags |= 0x8002000000uLL;
  objc_storeStrong((id *)&self->_artworkOverride, a3);
}

- (void)_readStopWaypoint
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 248) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStopWaypoint_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (BOOL)hasStopWaypoint
{
  return self->_stopWaypoint != 0;
}

- (GEOStopWaypoint)stopWaypoint
{
  -[GEOStep _readStopWaypoint]((uint64_t)self);
  stopWaypoint = self->_stopWaypoint;

  return stopWaypoint;
}

- (void)setStopWaypoint:(id)a3
{
  *(void *)&self->_flags |= 0xA000000000uLL;
  objc_storeStrong((id *)&self->_stopWaypoint, a3);
}

- (unsigned)zilchPathIndex
{
  return self->_zilchPathIndex;
}

- (void)setZilchPathIndex:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x8000008000uLL;
  self->_zilchPathIndex = a3;
}

- (void)setHasZilchPathIndex:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (a3) {
    uint64_t v3 = 0x8000008000;
  }
  self->_$EDB2BE274159A3E7688E4593D5E8813B flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(void *)&self->_flags & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasZilchPathIndex
{
  return *((unsigned __int8 *)&self->_flags + 1) >> 7;
}

- (void)_readRoadDescriptions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 168));
    if ((*(unsigned char *)(a1 + 248) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRoadDescriptions_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 168));
  }
}

- (NSMutableArray)roadDescriptions
{
  -[GEOStep _readRoadDescriptions]((uint64_t)self);
  roadDescriptions = self->_roadDescriptions;

  return roadDescriptions;
}

- (void)setRoadDescriptions:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x8000000000uLL;
  roadDescriptions = self->_roadDescriptions;
  self->_roadDescriptions = v4;
}

- (void)clearRoadDescriptions
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x8000000000uLL;
  roadDescriptions = self->_roadDescriptions;

  [(NSMutableArray *)roadDescriptions removeAllObjects];
}

- (void)addRoadDescription:(id)a3
{
  id v4 = a3;
  -[GEOStep _readRoadDescriptions]((uint64_t)self);
  -[GEOStep _addNoFlagsRoadDescription:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x800000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x8000000000uLL;
}

- (void)_addNoFlagsRoadDescription:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 128);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v6 = *(void **)(a1 + 128);
      *(void *)(a1 + 128) = v5;

      id v4 = *(void **)(a1 + 128);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)roadDescriptionsCount
{
  -[GEOStep _readRoadDescriptions]((uint64_t)self);
  roadDescriptions = self->_roadDescriptions;

  return [(NSMutableArray *)roadDescriptions count];
}

- (id)roadDescriptionAtIndex:(unint64_t)a3
{
  -[GEOStep _readRoadDescriptions]((uint64_t)self);
  roadDescriptions = self->_roadDescriptions;

  return (id)[(NSMutableArray *)roadDescriptions objectAtIndex:a3];
}

+ (Class)roadDescriptionType
{
  return (Class)objc_opt_class();
}

- (unsigned)distance
{
  return self->_distance;
}

- (void)setDistance:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x8000000008uLL;
  self->_distance = a3;
}

- (void)setHasDistance:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (a3) {
    uint64_t v3 = 0x8000000008;
  }
  self->_$EDB2BE274159A3E7688E4593D5E8813B flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasDistance
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (float)distanceMeters
{
  return self->_distanceMeters;
}

- (void)setDistanceMeters:(float)a3
{
  *(void *)&self->_flags |= 0x8000000004uLL;
  self->_distanceMeters = a3;
}

- (void)setHasDistanceMeters:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (a3) {
    uint64_t v3 = 0x8000000004;
  }
  self->_$EDB2BE274159A3E7688E4593D5E8813B flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasDistanceMeters
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (unsigned)distanceCm
{
  return self->_distanceCm;
}

- (void)setDistanceCm:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x8000000002uLL;
  self->_distanceCm = a3;
}

- (void)setHasDistanceCm:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (a3) {
    uint64_t v3 = 0x8000000002;
  }
  self->_$EDB2BE274159A3E7688E4593D5E8813B flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasDistanceCm
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unsigned)maneuverStartPointOffsetCm
{
  return self->_maneuverStartPointOffsetCm;
}

- (void)setManeuverStartPointOffsetCm:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x8000000800uLL;
  self->_maneuverStartPointOffsetCm = a3;
}

- (void)setHasManeuverStartPointOffsetCm:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (a3) {
    uint64_t v3 = 0x8000000800;
  }
  self->_$EDB2BE274159A3E7688E4593D5E8813B flags = ($EDB2BE274159A3E7688E4593D5E8813B)(*(void *)&self->_flags & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasManeuverStartPointOffsetCm
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOStep;
  id v4 = [(GEOStep *)&v8 description];
  id v5 = [(GEOStep *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOStep _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v150 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v121 = 0;
    goto LABEL_250;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = &OBJC_IVAR___GEOSpokenGuidance__priority;
  uint64_t v6 = *(void *)(a1 + 244);
  if ((v6 & 0x4000) != 0)
  {
    id v7 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 228)];
    [v4 setObject:v7 forKey:@"stepID"];

    uint64_t v6 = *(void *)(a1 + 244);
  }
  if ((v6 & 0x80) != 0)
  {
    objc_super v8 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 200)];
    [v4 setObject:v8 forKey:@"maneuverEndBasicIndex"];

    uint64_t v6 = *(void *)(a1 + 244);
    if ((v6 & 0x200) == 0)
    {
LABEL_6:
      if ((v6 & 0x100) == 0) {
        goto LABEL_7;
      }
      goto LABEL_13;
    }
  }
  else if ((v6 & 0x200) == 0)
  {
    goto LABEL_6;
  }
  unint64_t v9 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 208)];
  [v4 setObject:v9 forKey:@"maneuverStartZilchIndex"];

  uint64_t v6 = *(void *)(a1 + 244);
  if ((v6 & 0x100) == 0)
  {
LABEL_7:
    if ((v6 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_14;
  }
LABEL_13:
  v10 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 204)];
  [v4 setObject:v10 forKey:@"maneuverEndZilchIndex"];

  uint64_t v6 = *(void *)(a1 + 244);
  if ((v6 & 0x20) == 0)
  {
LABEL_8:
    if ((v6 & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v11 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 192)];
  [v4 setObject:v11 forKey:@"hintFirstAnnouncementZilchIndex"];

  uint64_t v6 = *(void *)(a1 + 244);
  if ((v6 & 0x10) == 0)
  {
LABEL_9:
    if ((v6 & 0x400) == 0) {
      goto LABEL_81;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v12 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 188)];
  [v4 setObject:v12 forKey:@"expectedTime"];

  if ((*(void *)(a1 + 244) & 0x400) == 0) {
    goto LABEL_81;
  }
LABEL_16:
  v13 = @"NO_TURN";
  switch(*(_DWORD *)(a1 + 212))
  {
    case 0:
      break;
    case 1:
      v13 = @"LEFT_TURN";
      break;
    case 2:
      v13 = @"RIGHT_TURN";
      break;
    case 3:
      v13 = @"STRAIGHT_AHEAD";
      break;
    case 4:
      v13 = @"U_TURN";
      break;
    case 5:
      v13 = @"FOLLOW_ROAD";
      break;
    case 6:
      v13 = @"ENTER_ROUNDABOUT";
      break;
    case 7:
      v13 = @"EXIT_ROUNDABOUT";
      break;
    case 0xB:
      v13 = @"OFF_RAMP";
      break;
    case 0xC:
      v13 = @"ON_RAMP";
      break;
    case 0x10:
      v13 = @"ARRIVE_END_OF_NAVIGATION";
      break;
    case 0x11:
      v13 = @"START_ROUTE";
      break;
    case 0x12:
      v13 = @"ARRIVE_AT_DESTINATION";
      break;
    case 0x14:
      v13 = @"KEEP_LEFT";
      break;
    case 0x15:
      v13 = @"KEEP_RIGHT";
      break;
    case 0x16:
      v13 = @"ENTER_FERRY";
      break;
    case 0x17:
      v13 = @"EXIT_FERRY";
      break;
    case 0x18:
      v13 = @"CHANGE_FERRY";
      break;
    case 0x19:
      v13 = @"START_ROUTE_WITH_U_TURN";
      break;
    case 0x1A:
      v13 = @"U_TURN_AT_ROUNDABOUT";
      break;
    case 0x1B:
      v13 = @"LEFT_TURN_AT_END";
      break;
    case 0x1C:
      v13 = @"RIGHT_TURN_AT_END";
      break;
    case 0x1D:
      v13 = @"HIGHWAY_OFF_RAMP_LEFT";
      break;
    case 0x1E:
      v13 = @"HIGHWAY_OFF_RAMP_RIGHT";
      break;
    case 0x21:
      v13 = @"ARRIVE_AT_DESTINATION_LEFT";
      break;
    case 0x22:
      v13 = @"ARRIVE_AT_DESTINATION_RIGHT";
      break;
    case 0x23:
      v13 = @"U_TURN_WHEN_POSSIBLE";
      break;
    case 0x27:
      v13 = @"ARRIVE_END_OF_DIRECTIONS";
      break;
    case 0x29:
      v13 = @"ROUNDABOUT_EXIT_1";
      break;
    case 0x2A:
      v13 = @"ROUNDABOUT_EXIT_2";
      break;
    case 0x2B:
      v13 = @"ROUNDABOUT_EXIT_3";
      break;
    case 0x2C:
      v13 = @"ROUNDABOUT_EXIT_4";
      break;
    case 0x2D:
      v13 = @"ROUNDABOUT_EXIT_5";
      break;
    case 0x2E:
      v13 = @"ROUNDABOUT_EXIT_6";
      break;
    case 0x2F:
      v13 = @"ROUNDABOUT_EXIT_7";
      break;
    case 0x30:
      v13 = @"ROUNDABOUT_EXIT_8";
      break;
    case 0x31:
      v13 = @"ROUNDABOUT_EXIT_9";
      break;
    case 0x32:
      v13 = @"ROUNDABOUT_EXIT_10";
      break;
    case 0x33:
      v13 = @"ROUNDABOUT_EXIT_11";
      break;
    case 0x34:
      v13 = @"ROUNDABOUT_EXIT_12";
      break;
    case 0x35:
      v13 = @"ROUNDABOUT_EXIT_13";
      break;
    case 0x36:
      v13 = @"ROUNDABOUT_EXIT_14";
      break;
    case 0x37:
      v13 = @"ROUNDABOUT_EXIT_15";
      break;
    case 0x38:
      v13 = @"ROUNDABOUT_EXIT_16";
      break;
    case 0x39:
      v13 = @"ROUNDABOUT_EXIT_17";
      break;
    case 0x3A:
      v13 = @"ROUNDABOUT_EXIT_18";
      break;
    case 0x3B:
      v13 = @"ROUNDABOUT_EXIT_19";
      break;
    case 0x3C:
      v13 = @"SHARP_LEFT_TURN";
      break;
    case 0x3D:
      v13 = @"SHARP_RIGHT_TURN";
      break;
    case 0x3E:
      v13 = @"SLIGHT_LEFT_TURN";
      break;
    case 0x3F:
      v13 = @"SLIGHT_RIGHT_TURN";
      break;
    case 0x40:
      v13 = @"CHANGE_HIGHWAY";
      break;
    case 0x41:
      v13 = @"CHANGE_HIGHWAY_LEFT";
      break;
    case 0x42:
      v13 = @"CHANGE_HIGHWAY_RIGHT";
      break;
    case 0x50:
      v13 = @"TOLL_STATION";
      break;
    case 0x51:
      v13 = @"ENTER_TUNNEL";
      break;
    case 0x52:
      v13 = @"WAYPOINT_STOP";
      break;
    case 0x53:
      v13 = @"WAYPOINT_STOP_LEFT";
      break;
    case 0x54:
      v13 = @"WAYPOINT_STOP_RIGHT";
      break;
    case 0x55:
      v13 = @"RESUME_ROUTE";
      break;
    case 0x56:
      v13 = @"RESUME_ROUTE_WITH_U_TURN";
      break;
    case 0x57:
      v13 = @"CUSTOM";
      break;
    case 0x58:
      v13 = @"TURN_AROUND";
      break;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 212));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  [v4 setObject:v13 forKey:@"maneuverType"];

LABEL_81:
  if ([*(id *)(a1 + 112) count])
  {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 112), "count"));
    long long v142 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    long long v145 = 0u;
    id v15 = *(id *)(a1 + 112);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v142 objects:v149 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v143;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v143 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v142 + 1) + 8 * i);
          if (a2) {
            [v20 jsonRepresentation];
          }
          else {
          id v21 = [v20 dictionaryRepresentation];
          }

          [v14 addObject:v21];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v142 objects:v149 count:16];
      }
      while (v17);
    }

    [v4 setObject:v14 forKey:@"maneuverName"];
    id v5 = &OBJC_IVAR___GEOSpokenGuidance__priority;
  }
  if ((*(unsigned char *)(a1 + 244) & 0x40) != 0)
  {
    int v22 = *(_DWORD *)(a1 + 196);
    if (v22)
    {
      if (v22 == 1)
      {
        v23 = @"JCTTYPE_ROUNDABOUT";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 196));
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v23 = @"JCTTYPE_NORMAL";
    }
    [v4 setObject:v23 forKey:@"junctionType"];
  }
  if (*(void *)(a1 + 32))
  {
    v24 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 32)];
    if (*(void *)(a1 + 32))
    {
      uint64_t v25 = 0;
      unint64_t v26 = 0;
      do
      {
        _GEOJunctionElementDictionaryRepresentation((unsigned int *)(*(void *)(a1 + 24) + v25));
        id v27 = (id)objc_claimAutoreleasedReturnValue();

        [v24 addObject:v27];
        ++v26;
        v25 += 16;
      }
      while (v26 < *(void *)(a1 + 32));
    }
    [v4 setObject:v24 forKey:@"junctionElement"];

    id v5 = &OBJC_IVAR___GEOSpokenGuidance__priority;
  }
  if ([*(id *)(a1 + 136) count])
  {
    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 136), "count"));
    long long v138 = 0u;
    long long v139 = 0u;
    long long v140 = 0u;
    long long v141 = 0u;
    id v29 = *(id *)(a1 + 136);
    uint64_t v30 = [v29 countByEnumeratingWithState:&v138 objects:v148 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v139;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v139 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = *(void **)(*((void *)&v138 + 1) + 8 * j);
          if (a2) {
            [v34 jsonRepresentation];
          }
          else {
          id v35 = [v34 dictionaryRepresentation];
          }

          [v28 addObject:v35];
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v138 objects:v148 count:16];
      }
      while (v31);
    }

    [v4 setObject:v28 forKey:@"signpost"];
    id v5 = &OBJC_IVAR___GEOSpokenGuidance__priority;
  }
  uint64_t v36 = *(void *)(a1 + v5[10]);
  if ((v36 & 0x2000) != 0)
  {
    uint64_t v37 = *(int *)(a1 + 224);
    if (v37 >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 224));
      v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v38 = off_1E53E0868[v37];
    }
    [v4 setObject:v38 forKey:@"overrideTransportType"];

    uint64_t v36 = *(void *)(a1 + v5[10]);
  }
  if ((v36 & 0x1000) != 0)
  {
    int v39 = *(_DWORD *)(a1 + 220);
    if (v39)
    {
      if (v39 == 1)
      {
        v40 = @"LEFT_SIDE";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 220));
        v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v40 = @"RIGHT_SIDE";
    }
    [v4 setObject:v40 forKey:@"overrideDrivingSide"];
  }
  v41 = [(id)a1 exitNumber];
  v42 = v41;
  if (v41)
  {
    if (a2) {
      [v41 jsonRepresentation];
    }
    else {
    id v43 = [v41 dictionaryRepresentation];
    }

    [v4 setObject:v43 forKey:@"exitNumber"];
  }

  uint64_t v44 = *(void *)(a1 + v5[10]);
  if ((v44 & 0x400000) != 0)
  {
    v50 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 242)];
    [v4 setObject:v50 forKey:@"tollPrior"];

    uint64_t v44 = *(void *)(a1 + 244);
    if ((v44 & 0x200000) == 0)
    {
LABEL_136:
      if ((v44 & 0x10000) == 0) {
        goto LABEL_137;
      }
      goto LABEL_148;
    }
  }
  else if ((v44 & 0x200000) == 0)
  {
    goto LABEL_136;
  }
  v51 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 241)];
  [v4 setObject:v51 forKey:@"tollAhead"];

  uint64_t v44 = *(void *)(a1 + 244);
  if ((v44 & 0x10000) == 0)
  {
LABEL_137:
    if ((v44 & 0x100000) == 0) {
      goto LABEL_139;
    }
    goto LABEL_138;
  }
LABEL_148:
  v52 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 236)];
  [v4 setObject:v52 forKey:@"endsOnFwy"];

  if ((*(void *)(a1 + 244) & 0x100000) != 0)
  {
LABEL_138:
    v45 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 240)];
    [v4 setObject:v45 forKey:@"toFreeway"];
  }
LABEL_139:
  v46 = [(id)a1 instructions];
  if (v46) {
    [v4 setObject:v46 forKey:@"instructions"];
  }

  v47 = [(id)a1 notice];
  if (v47) {
    [v4 setObject:v47 forKey:@"notice"];
  }

  v48 = [(id)a1 timeCheckpoints];
  v49 = v48;
  if (v48)
  {
    if (a2) {
      [v48 jsonRepresentation];
    }
    else {
    id v53 = [v48 dictionaryRepresentation];
    }

    [v4 setObject:v53 forKey:@"timeCheckpoints"];
  }

  v54 = [(id)a1 instructionSet];
  v55 = v54;
  if (v54)
  {
    if (a2) {
      [v54 jsonRepresentation];
    }
    else {
    id v56 = [v54 dictionaryRepresentation];
    }

    [v4 setObject:v56 forKey:@"instructionSet"];
  }

  if ((*(unsigned char *)(a1 + v5[10] + 2) & 4) != 0)
  {
    v57 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 238)];
    if (a2) {
      v58 = @"shouldChainManeuver";
    }
    else {
      v58 = @"should_chain_maneuver";
    }
    [v4 setObject:v57 forKey:v58];
  }
  if ([*(id *)(a1 + 88) count])
  {
    v59 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 88), "count"));
    long long v134 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    long long v137 = 0u;
    id v60 = *(id *)(a1 + 88);
    uint64_t v61 = [v60 countByEnumeratingWithState:&v134 objects:v147 count:16];
    if (v61)
    {
      uint64_t v62 = v61;
      uint64_t v63 = *(void *)v135;
      do
      {
        for (uint64_t k = 0; k != v62; ++k)
        {
          if (*(void *)v135 != v63) {
            objc_enumerationMutation(v60);
          }
          v65 = *(void **)(*((void *)&v134 + 1) + 8 * k);
          if (a2) {
            [v65 jsonRepresentation];
          }
          else {
          id v66 = [v65 dictionaryRepresentation];
          }

          [v59 addObject:v66];
        }
        uint64_t v62 = [v60 countByEnumeratingWithState:&v134 objects:v147 count:16];
      }
      while (v62);
    }

    if (a2) {
      v67 = @"guidanceEvent";
    }
    else {
      v67 = @"guidance_event";
    }
    [v4 setObject:v59 forKey:v67];

    id v5 = &OBJC_IVAR___GEOSpokenGuidance__priority;
  }
  uint64_t v68 = *(void *)(a1 + v5[10]);
  if ((v68 & 0x80000) != 0)
  {
    v69 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 239)];
    if (a2) {
      v70 = @"stayOn";
    }
    else {
      v70 = @"stay_on";
    }
    [v4 setObject:v69 forKey:v70];

    uint64_t v68 = *(void *)(a1 + 244);
  }
  if ((v68 & 0x20000) != 0)
  {
    v71 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 237)];
    if (a2) {
      v72 = @"maneuverLaneGuidanceSuppressed";
    }
    else {
      v72 = @"maneuver_lane_guidance_suppressed";
    }
    [v4 setObject:v71 forKey:v72];
  }
  v73 = [(id)a1 evStateInfo];
  v74 = v73;
  if (v73)
  {
    if (a2)
    {
      v75 = [v73 jsonRepresentation];
      v76 = @"evStateInfo";
    }
    else
    {
      v75 = [v73 dictionaryRepresentation];
      v76 = @"ev_state_info";
    }
    id v77 = v75;

    [v4 setObject:v77 forKey:v76];
  }

  v78 = [(id)a1 evInfo];
  v79 = v78;
  if (v78)
  {
    if (a2)
    {
      v80 = [v78 jsonRepresentation];
      v81 = @"evInfo";
    }
    else
    {
      v80 = [v78 dictionaryRepresentation];
      v81 = @"ev_info";
    }
    id v82 = v80;

    [v4 setObject:v82 forKey:v81];
  }

  v83 = [(id)a1 chargingInfo];
  v84 = v83;
  if (v83)
  {
    if (a2)
    {
      v85 = [v83 jsonRepresentation];
      v86 = @"chargingInfo";
    }
    else
    {
      v85 = [v83 dictionaryRepresentation];
      v86 = @"charging_info";
    }
    id v87 = v85;

    [v4 setObject:v87 forKey:v86];
  }

  if (*(unsigned char *)(a1 + v5[10]))
  {
    v88 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 172)];
    if (a2) {
      v89 = @"arrivalParameterIndex";
    }
    else {
      v89 = @"arrival_parameter_index";
    }
    [v4 setObject:v88 forKey:v89];
  }
  v90 = [(id)a1 artworkOverride];
  v91 = v90;
  if (v90)
  {
    if (a2)
    {
      v92 = [v90 jsonRepresentation];
      v93 = @"artworkOverride";
    }
    else
    {
      v92 = [v90 dictionaryRepresentation];
      v93 = @"artwork_override";
    }
    id v94 = v92;

    [v4 setObject:v94 forKey:v93];
  }

  v95 = [(id)a1 stopWaypoint];
  v96 = v95;
  if (v95)
  {
    if (a2)
    {
      v97 = [v95 jsonRepresentation];
      v98 = @"stopWaypoint";
    }
    else
    {
      v97 = [v95 dictionaryRepresentation];
      v98 = @"stop_waypoint";
    }
    id v99 = v97;

    [v4 setObject:v99 forKey:v98];
  }

  if ((*(unsigned char *)(a1 + v5[10] + 1) & 0x80) != 0)
  {
    v100 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 232)];
    if (a2) {
      v101 = @"zilchPathIndex";
    }
    else {
      v101 = @"zilch_path_index";
    }
    [v4 setObject:v100 forKey:v101];
  }
  if ([*(id *)(a1 + 128) count])
  {
    v103 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 128), "count"));
    long long v130 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    id v104 = *(id *)(a1 + 128);
    uint64_t v105 = [v104 countByEnumeratingWithState:&v130 objects:v146 count:16];
    if (v105)
    {
      uint64_t v106 = v105;
      uint64_t v107 = *(void *)v131;
      do
      {
        for (uint64_t m = 0; m != v106; ++m)
        {
          if (*(void *)v131 != v107) {
            objc_enumerationMutation(v104);
          }
          v109 = *(void **)(*((void *)&v130 + 1) + 8 * m);
          if (a2) {
            [v109 jsonRepresentation];
          }
          else {
          id v110 = [v109 dictionaryRepresentation];
          }

          [v103 addObject:v110];
        }
        uint64_t v106 = [v104 countByEnumeratingWithState:&v130 objects:v146 count:16];
      }
      while (v106);
    }

    if (a2) {
      v111 = @"roadDescription";
    }
    else {
      v111 = @"road_description";
    }
    [v4 setObject:v103 forKey:v111];

    id v5 = &OBJC_IVAR___GEOSpokenGuidance__priority;
  }
  uint64_t v112 = *(void *)(a1 + v5[10]);
  if ((v112 & 8) != 0)
  {
    v123 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 184)];
    [v4 setObject:v123 forKey:@"distance"];

    uint64_t v112 = *(void *)(a1 + 244);
    if ((v112 & 4) == 0)
    {
LABEL_239:
      if ((v112 & 2) == 0) {
        goto LABEL_240;
      }
LABEL_258:
      v126 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 176)];
      if (a2) {
        v127 = @"distanceCm";
      }
      else {
        v127 = @"distance_cm";
      }
      [v4 setObject:v126 forKey:v127];

      if ((*(void *)(a1 + 244) & 0x800) == 0) {
        goto LABEL_245;
      }
      goto LABEL_241;
    }
  }
  else if ((v112 & 4) == 0)
  {
    goto LABEL_239;
  }
  LODWORD(v102) = *(_DWORD *)(a1 + 180);
  v124 = [NSNumber numberWithFloat:v102];
  if (a2) {
    v125 = @"distanceMeters";
  }
  else {
    v125 = @"distance_meters";
  }
  [v4 setObject:v124 forKey:v125];

  uint64_t v112 = *(void *)(a1 + 244);
  if ((v112 & 2) != 0) {
    goto LABEL_258;
  }
LABEL_240:
  if ((v112 & 0x800) != 0)
  {
LABEL_241:
    v113 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 216)];
    if (a2) {
      v114 = @"maneuverStartPointOffsetCm";
    }
    else {
      v114 = @"maneuver_start_point_offset_cm";
    }
    [v4 setObject:v113 forKey:v114];
  }
LABEL_245:
  v115 = *(void **)(a1 + 16);
  if (v115)
  {
    v116 = [v115 dictionaryRepresentation];
    v117 = v116;
    if (a2)
    {
      v118 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v116, "count"));
      v128[0] = MEMORY[0x1E4F143A8];
      v128[1] = 3221225472;
      v128[2] = __37__GEOStep__dictionaryRepresentation___block_invoke;
      v128[3] = &unk_1E53D8860;
      id v119 = v118;
      id v129 = v119;
      [v117 enumerateKeysAndObjectsUsingBlock:v128];
      id v120 = v119;

      v117 = v120;
    }
    [v4 setObject:v117 forKey:@"Unknown Fields"];
  }
  id v121 = v4;

LABEL_250:

  return v121;
}

- (id)jsonRepresentation
{
  return -[GEOStep _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __37__GEOStep__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    unint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOStep)initWithDictionary:(id)a3
{
  return (GEOStep *)-[GEOStep _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v164 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_366;
  }
  a1 = (id)[a1 init];

  if (!a1) {
    goto LABEL_366;
  }
  uint64_t v6 = [v5 objectForKeyedSubscript:@"stepID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setStepID:", objc_msgSend(v6, "unsignedIntValue"));
  }

  id v7 = [v5 objectForKeyedSubscript:@"maneuverEndBasicIndex"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setManeuverEndBasicIndex:", objc_msgSend(v7, "intValue"));
  }

  objc_super v8 = [v5 objectForKeyedSubscript:@"maneuverStartZilchIndex"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setManeuverStartZilchIndex:", objc_msgSend(v8, "intValue"));
  }

  unint64_t v9 = [v5 objectForKeyedSubscript:@"maneuverEndZilchIndex"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setManeuverEndZilchIndex:", objc_msgSend(v9, "intValue"));
  }

  id v10 = [v5 objectForKeyedSubscript:@"hintFirstAnnouncementZilchIndex"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setHintFirstAnnouncementZilchIndex:", objc_msgSend(v10, "intValue"));
  }

  uint64_t v11 = [v5 objectForKeyedSubscript:@"expectedTime"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setExpectedTime:", objc_msgSend(v11, "unsignedIntValue"));
  }

  uint64_t v12 = [v5 objectForKeyedSubscript:@"maneuverType"];
  objc_opt_class();
  id v136 = v5;
  if (objc_opt_isKindOfClass())
  {
    id v13 = v12;
    if ([v13 isEqualToString:@"NO_TURN"])
    {
      uint64_t v14 = 0;
    }
    else if ([v13 isEqualToString:@"LEFT_TURN"])
    {
      uint64_t v14 = 1;
    }
    else if ([v13 isEqualToString:@"RIGHT_TURN"])
    {
      uint64_t v14 = 2;
    }
    else if ([v13 isEqualToString:@"STRAIGHT_AHEAD"])
    {
      uint64_t v14 = 3;
    }
    else if ([v13 isEqualToString:@"U_TURN"])
    {
      uint64_t v14 = 4;
    }
    else if ([v13 isEqualToString:@"FOLLOW_ROAD"])
    {
      uint64_t v14 = 5;
    }
    else if ([v13 isEqualToString:@"ENTER_ROUNDABOUT"])
    {
      uint64_t v14 = 6;
    }
    else if ([v13 isEqualToString:@"EXIT_ROUNDABOUT"])
    {
      uint64_t v14 = 7;
    }
    else if ([v13 isEqualToString:@"OFF_RAMP"])
    {
      uint64_t v14 = 11;
    }
    else if ([v13 isEqualToString:@"ON_RAMP"])
    {
      uint64_t v14 = 12;
    }
    else if ([v13 isEqualToString:@"ARRIVE_END_OF_NAVIGATION"])
    {
      uint64_t v14 = 16;
    }
    else if ([v13 isEqualToString:@"START_ROUTE"])
    {
      uint64_t v14 = 17;
    }
    else if ([v13 isEqualToString:@"ARRIVE_AT_DESTINATION"])
    {
      uint64_t v14 = 18;
    }
    else if ([v13 isEqualToString:@"KEEP_LEFT"])
    {
      uint64_t v14 = 20;
    }
    else if ([v13 isEqualToString:@"KEEP_RIGHT"])
    {
      uint64_t v14 = 21;
    }
    else if ([v13 isEqualToString:@"ENTER_FERRY"])
    {
      uint64_t v14 = 22;
    }
    else if ([v13 isEqualToString:@"EXIT_FERRY"])
    {
      uint64_t v14 = 23;
    }
    else if ([v13 isEqualToString:@"CHANGE_FERRY"])
    {
      uint64_t v14 = 24;
    }
    else if ([v13 isEqualToString:@"START_ROUTE_WITH_U_TURN"])
    {
      uint64_t v14 = 25;
    }
    else if ([v13 isEqualToString:@"U_TURN_AT_ROUNDABOUT"])
    {
      uint64_t v14 = 26;
    }
    else if ([v13 isEqualToString:@"LEFT_TURN_AT_END"])
    {
      uint64_t v14 = 27;
    }
    else if ([v13 isEqualToString:@"RIGHT_TURN_AT_END"])
    {
      uint64_t v14 = 28;
    }
    else if ([v13 isEqualToString:@"HIGHWAY_OFF_RAMP_LEFT"])
    {
      uint64_t v14 = 29;
    }
    else if ([v13 isEqualToString:@"HIGHWAY_OFF_RAMP_RIGHT"])
    {
      uint64_t v14 = 30;
    }
    else if ([v13 isEqualToString:@"ARRIVE_AT_DESTINATION_LEFT"])
    {
      uint64_t v14 = 33;
    }
    else if ([v13 isEqualToString:@"ARRIVE_AT_DESTINATION_RIGHT"])
    {
      uint64_t v14 = 34;
    }
    else if ([v13 isEqualToString:@"U_TURN_WHEN_POSSIBLE"])
    {
      uint64_t v14 = 35;
    }
    else if ([v13 isEqualToString:@"ARRIVE_END_OF_DIRECTIONS"])
    {
      uint64_t v14 = 39;
    }
    else if ([v13 isEqualToString:@"ROUNDABOUT_EXIT_1"])
    {
      uint64_t v14 = 41;
    }
    else if ([v13 isEqualToString:@"ROUNDABOUT_EXIT_2"])
    {
      uint64_t v14 = 42;
    }
    else if ([v13 isEqualToString:@"ROUNDABOUT_EXIT_3"])
    {
      uint64_t v14 = 43;
    }
    else if ([v13 isEqualToString:@"ROUNDABOUT_EXIT_4"])
    {
      uint64_t v14 = 44;
    }
    else if ([v13 isEqualToString:@"ROUNDABOUT_EXIT_5"])
    {
      uint64_t v14 = 45;
    }
    else if ([v13 isEqualToString:@"ROUNDABOUT_EXIT_6"])
    {
      uint64_t v14 = 46;
    }
    else if ([v13 isEqualToString:@"ROUNDABOUT_EXIT_7"])
    {
      uint64_t v14 = 47;
    }
    else if ([v13 isEqualToString:@"ROUNDABOUT_EXIT_8"])
    {
      uint64_t v14 = 48;
    }
    else if ([v13 isEqualToString:@"ROUNDABOUT_EXIT_9"])
    {
      uint64_t v14 = 49;
    }
    else if ([v13 isEqualToString:@"ROUNDABOUT_EXIT_10"])
    {
      uint64_t v14 = 50;
    }
    else if ([v13 isEqualToString:@"ROUNDABOUT_EXIT_11"])
    {
      uint64_t v14 = 51;
    }
    else if ([v13 isEqualToString:@"ROUNDABOUT_EXIT_12"])
    {
      uint64_t v14 = 52;
    }
    else if ([v13 isEqualToString:@"ROUNDABOUT_EXIT_13"])
    {
      uint64_t v14 = 53;
    }
    else if ([v13 isEqualToString:@"ROUNDABOUT_EXIT_14"])
    {
      uint64_t v14 = 54;
    }
    else if ([v13 isEqualToString:@"ROUNDABOUT_EXIT_15"])
    {
      uint64_t v14 = 55;
    }
    else if ([v13 isEqualToString:@"ROUNDABOUT_EXIT_16"])
    {
      uint64_t v14 = 56;
    }
    else if ([v13 isEqualToString:@"ROUNDABOUT_EXIT_17"])
    {
      uint64_t v14 = 57;
    }
    else if ([v13 isEqualToString:@"ROUNDABOUT_EXIT_18"])
    {
      uint64_t v14 = 58;
    }
    else if ([v13 isEqualToString:@"ROUNDABOUT_EXIT_19"])
    {
      uint64_t v14 = 59;
    }
    else if ([v13 isEqualToString:@"SHARP_LEFT_TURN"])
    {
      uint64_t v14 = 60;
    }
    else if ([v13 isEqualToString:@"SHARP_RIGHT_TURN"])
    {
      uint64_t v14 = 61;
    }
    else if ([v13 isEqualToString:@"SLIGHT_LEFT_TURN"])
    {
      uint64_t v14 = 62;
    }
    else if ([v13 isEqualToString:@"SLIGHT_RIGHT_TURN"])
    {
      uint64_t v14 = 63;
    }
    else if ([v13 isEqualToString:@"CHANGE_HIGHWAY"])
    {
      uint64_t v14 = 64;
    }
    else if ([v13 isEqualToString:@"CHANGE_HIGHWAY_LEFT"])
    {
      uint64_t v14 = 65;
    }
    else if ([v13 isEqualToString:@"CHANGE_HIGHWAY_RIGHT"])
    {
      uint64_t v14 = 66;
    }
    else if ([v13 isEqualToString:@"TOLL_STATION"])
    {
      uint64_t v14 = 80;
    }
    else if ([v13 isEqualToString:@"ENTER_TUNNEL"])
    {
      uint64_t v14 = 81;
    }
    else if ([v13 isEqualToString:@"WAYPOINT_STOP"])
    {
      uint64_t v14 = 82;
    }
    else if ([v13 isEqualToString:@"WAYPOINT_STOP_LEFT"])
    {
      uint64_t v14 = 83;
    }
    else if ([v13 isEqualToString:@"WAYPOINT_STOP_RIGHT"])
    {
      uint64_t v14 = 84;
    }
    else if ([v13 isEqualToString:@"RESUME_ROUTE"])
    {
      uint64_t v14 = 85;
    }
    else if ([v13 isEqualToString:@"RESUME_ROUTE_WITH_U_TURN"])
    {
      uint64_t v14 = 86;
    }
    else if ([v13 isEqualToString:@"CUSTOM"])
    {
      uint64_t v14 = 87;
    }
    else if ([v13 isEqualToString:@"TURN_AROUND"])
    {
      uint64_t v14 = 88;
    }
    else
    {
      uint64_t v14 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_147;
    }
    uint64_t v14 = [v12 intValue];
  }
  [a1 setManeuverType:v14];
LABEL_147:

  id v15 = [v5 objectForKeyedSubscript:@"maneuverName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v157 = 0u;
    long long v158 = 0u;
    long long v155 = 0u;
    long long v156 = 0u;
    id v16 = v15;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v155 objects:v163 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v156;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v156 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v155 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int v22 = [GEONameInfoList alloc];
            if (a3) {
              uint64_t v23 = [(GEONameInfoList *)v22 initWithJSON:v21];
            }
            else {
              uint64_t v23 = [(GEONameInfoList *)v22 initWithDictionary:v21];
            }
            v24 = (void *)v23;
            [a1 addManeuverName:v23];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v155 objects:v163 count:16];
      }
      while (v18);
    }

    id v5 = v136;
  }

  uint64_t v25 = [v5 objectForKeyedSubscript:@"junctionType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v26 = v25;
    if ([v26 isEqualToString:@"JCTTYPE_NORMAL"]) {
      uint64_t v27 = 0;
    }
    else {
      uint64_t v27 = [v26 isEqualToString:@"JCTTYPE_ROUNDABOUT"];
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_169;
    }
    uint64_t v27 = [v25 intValue];
  }
  [a1 setJunctionType:v27];
LABEL_169:

  v28 = [v5 objectForKeyedSubscript:@"junctionElement"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v153 = 0u;
    long long v154 = 0u;
    long long v151 = 0u;
    long long v152 = 0u;
    id v29 = v28;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v151 objects:v162 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v152;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v152 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = *(void **)(*((void *)&v151 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v149 = 0;
            uint64_t v150 = 0;
            _GEOJunctionElementFromDictionaryRepresentation(v34, (uint64_t)&v149);
            objc_msgSend(a1, "addJunctionElement:", v149, v150);
          }
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v151 objects:v162 count:16];
      }
      while (v31);
    }
  }
  id v35 = [v5 objectForKeyedSubscript:@"signpost"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v147 = 0u;
    long long v148 = 0u;
    long long v145 = 0u;
    long long v146 = 0u;
    id v36 = v35;
    uint64_t v37 = [v36 countByEnumeratingWithState:&v145 objects:v161 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v146;
      do
      {
        for (uint64_t k = 0; k != v38; ++k)
        {
          if (*(void *)v146 != v39) {
            objc_enumerationMutation(v36);
          }
          uint64_t v41 = *(void *)(*((void *)&v145 + 1) + 8 * k);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v42 = [GEONameInfo alloc];
            if (a3) {
              uint64_t v43 = [(GEONameInfo *)v42 initWithJSON:v41];
            }
            else {
              uint64_t v43 = [(GEONameInfo *)v42 initWithDictionary:v41];
            }
            uint64_t v44 = (void *)v43;
            [a1 addSignpost:v43];
          }
        }
        uint64_t v38 = [v36 countByEnumeratingWithState:&v145 objects:v161 count:16];
      }
      while (v38);
    }

    id v5 = v136;
  }

  v45 = [v5 objectForKeyedSubscript:@"overrideTransportType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v46 = v45;
    if ([v46 isEqualToString:@"AUTOMOBILE"])
    {
      uint64_t v47 = 0;
    }
    else if ([v46 isEqualToString:@"TRANSIT"])
    {
      uint64_t v47 = 1;
    }
    else if ([v46 isEqualToString:@"WALKING"])
    {
      uint64_t v47 = 2;
    }
    else if ([v46 isEqualToString:@"BICYCLE"])
    {
      uint64_t v47 = 3;
    }
    else if ([v46 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
    {
      uint64_t v47 = 4;
    }
    else if ([v46 isEqualToString:@"FERRY"])
    {
      uint64_t v47 = 5;
    }
    else if ([v46 isEqualToString:@"RIDESHARE"])
    {
      uint64_t v47 = 6;
    }
    else
    {
      uint64_t v47 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_214;
    }
    uint64_t v47 = [v45 intValue];
  }
  [a1 setOverrideTransportType:v47];
LABEL_214:

  v48 = [v5 objectForKeyedSubscript:@"overrideDrivingSide"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v49 = v48;
    if ([v49 isEqualToString:@"RIGHT_SIDE"]) {
      uint64_t v50 = 0;
    }
    else {
      uint64_t v50 = [v49 isEqualToString:@"LEFT_SIDE"];
    }

    goto LABEL_221;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v50 = [v48 intValue];
LABEL_221:
    [a1 setOverrideDrivingSide:v50];
  }

  v51 = [v5 objectForKeyedSubscript:@"exitNumber"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v52 = [GEONameInfo alloc];
    if (a3) {
      uint64_t v53 = [(GEONameInfo *)v52 initWithJSON:v51];
    }
    else {
      uint64_t v53 = [(GEONameInfo *)v52 initWithDictionary:v51];
    }
    v54 = (void *)v53;
    [a1 setExitNumber:v53];
  }
  v55 = [v5 objectForKeyedSubscript:@"tollPrior"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setTollPrior:", objc_msgSend(v55, "BOOLValue"));
  }

  id v56 = [v5 objectForKeyedSubscript:@"tollAhead"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setTollAhead:", objc_msgSend(v56, "BOOLValue"));
  }

  v57 = [v5 objectForKeyedSubscript:@"endsOnFwy"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setEndsOnFwy:", objc_msgSend(v57, "BOOLValue"));
  }

  v58 = [v5 objectForKeyedSubscript:@"toFreeway"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setToFreeway:", objc_msgSend(v58, "BOOLValue"));
  }

  v59 = [v5 objectForKeyedSubscript:@"instructions"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v60 = (void *)[v59 copy];
    [a1 setInstructions:v60];
  }
  uint64_t v61 = [v5 objectForKeyedSubscript:@"notice"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v62 = (void *)[v61 copy];
    [a1 setNotice:v62];
  }
  uint64_t v63 = [v5 objectForKeyedSubscript:@"timeCheckpoints"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v64 = [GEOTimeCheckpoints alloc];
    if (a3) {
      uint64_t v65 = [(GEOTimeCheckpoints *)v64 initWithJSON:v63];
    }
    else {
      uint64_t v65 = [(GEOTimeCheckpoints *)v64 initWithDictionary:v63];
    }
    id v66 = (void *)v65;
    [a1 setTimeCheckpoints:v65];
  }
  v67 = [v5 objectForKeyedSubscript:@"instructionSet"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v68 = [GEOInstructionSet alloc];
    if (a3) {
      uint64_t v69 = [(GEOInstructionSet *)v68 initWithJSON:v67];
    }
    else {
      uint64_t v69 = [(GEOInstructionSet *)v68 initWithDictionary:v67];
    }
    v70 = (void *)v69;
    [a1 setInstructionSet:v69];
  }
  if (a3) {
    v71 = @"shouldChainManeuver";
  }
  else {
    v71 = @"should_chain_maneuver";
  }
  v72 = [v5 objectForKeyedSubscript:v71];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setShouldChainManeuver:", objc_msgSend(v72, "BOOLValue"));
  }

  if (a3) {
    v73 = @"guidanceEvent";
  }
  else {
    v73 = @"guidance_event";
  }
  v74 = [v5 objectForKeyedSubscript:v73];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v143 = 0u;
    long long v144 = 0u;
    long long v141 = 0u;
    long long v142 = 0u;
    id v75 = v74;
    uint64_t v76 = [v75 countByEnumeratingWithState:&v141 objects:v160 count:16];
    if (v76)
    {
      uint64_t v77 = v76;
      uint64_t v78 = *(void *)v142;
      do
      {
        for (uint64_t m = 0; m != v77; ++m)
        {
          if (*(void *)v142 != v78) {
            objc_enumerationMutation(v75);
          }
          uint64_t v80 = *(void *)(*((void *)&v141 + 1) + 8 * m);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v81 = [GEOGuidanceEvent alloc];
            if (a3) {
              uint64_t v82 = [(GEOGuidanceEvent *)v81 initWithJSON:v80];
            }
            else {
              uint64_t v82 = [(GEOGuidanceEvent *)v81 initWithDictionary:v80];
            }
            v83 = (void *)v82;
            [a1 addGuidanceEvent:v82];
          }
        }
        uint64_t v77 = [v75 countByEnumeratingWithState:&v141 objects:v160 count:16];
      }
      while (v77);
    }

    id v5 = v136;
  }

  if (a3) {
    v84 = @"stayOn";
  }
  else {
    v84 = @"stay_on";
  }
  v85 = [v5 objectForKeyedSubscript:v84];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setStayOn:", objc_msgSend(v85, "BOOLValue"));
  }

  if (a3) {
    v86 = @"maneuverLaneGuidanceSuppressed";
  }
  else {
    v86 = @"maneuver_lane_guidance_suppressed";
  }
  id v87 = [v5 objectForKeyedSubscript:v86];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setManeuverLaneGuidanceSuppressed:", objc_msgSend(v87, "BOOLValue"));
  }

  if (a3) {
    v88 = @"evStateInfo";
  }
  else {
    v88 = @"ev_state_info";
  }
  v89 = [v5 objectForKeyedSubscript:v88];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v90 = [GEOEVStateInfo alloc];
    if (a3) {
      uint64_t v91 = [(GEOEVStateInfo *)v90 initWithJSON:v89];
    }
    else {
      uint64_t v91 = [(GEOEVStateInfo *)v90 initWithDictionary:v89];
    }
    v92 = (void *)v91;
    [a1 setEvStateInfo:v91];
  }
  if (a3) {
    v93 = @"evInfo";
  }
  else {
    v93 = @"ev_info";
  }
  id v94 = [v5 objectForKeyedSubscript:v93];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v95 = [GEOEVStepInfo alloc];
    if (a3) {
      uint64_t v96 = [(GEOEVStepInfo *)v95 initWithJSON:v94];
    }
    else {
      uint64_t v96 = [(GEOEVStepInfo *)v95 initWithDictionary:v94];
    }
    v97 = (void *)v96;
    [a1 setEvInfo:v96];
  }
  if (a3) {
    v98 = @"chargingInfo";
  }
  else {
    v98 = @"charging_info";
  }
  id v99 = [v5 objectForKeyedSubscript:v98];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v100 = [GEOEVChargeInfo alloc];
    if (a3) {
      uint64_t v101 = [(GEOEVChargeInfo *)v100 initWithJSON:v99];
    }
    else {
      uint64_t v101 = [(GEOEVChargeInfo *)v100 initWithDictionary:v99];
    }
    double v102 = (void *)v101;
    [a1 setChargingInfo:v101];
  }
  if (a3) {
    v103 = @"arrivalParameterIndex";
  }
  else {
    v103 = @"arrival_parameter_index";
  }
  id v104 = [v5 objectForKeyedSubscript:v103];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setArrivalParameterIndex:", objc_msgSend(v104, "unsignedIntValue"));
  }

  if (a3) {
    uint64_t v105 = @"artworkOverride";
  }
  else {
    uint64_t v105 = @"artwork_override";
  }
  uint64_t v106 = [v5 objectForKeyedSubscript:v105];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v107 = [GEOPBTransitArtwork alloc];
    if (a3) {
      uint64_t v108 = [(GEOPBTransitArtwork *)v107 initWithJSON:v106];
    }
    else {
      uint64_t v108 = [(GEOPBTransitArtwork *)v107 initWithDictionary:v106];
    }
    v109 = (void *)v108;
    [a1 setArtworkOverride:v108];
  }
  if (a3) {
    id v110 = @"stopWaypoint";
  }
  else {
    id v110 = @"stop_waypoint";
  }
  v111 = [v5 objectForKeyedSubscript:v110];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v112 = [GEOStopWaypoint alloc];
    if (a3) {
      uint64_t v113 = [(GEOStopWaypoint *)v112 initWithJSON:v111];
    }
    else {
      uint64_t v113 = [(GEOStopWaypoint *)v112 initWithDictionary:v111];
    }
    v114 = (void *)v113;
    [a1 setStopWaypoint:v113];
  }
  if (a3) {
    v115 = @"zilchPathIndex";
  }
  else {
    v115 = @"zilch_path_index";
  }
  v116 = [v5 objectForKeyedSubscript:v115];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setZilchPathIndex:", objc_msgSend(v116, "unsignedIntValue"));
  }

  if (a3) {
    v117 = @"roadDescription";
  }
  else {
    v117 = @"road_description";
  }
  v118 = [v5 objectForKeyedSubscript:v117];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v139 = 0u;
    long long v140 = 0u;
    long long v137 = 0u;
    long long v138 = 0u;
    id v119 = v118;
    uint64_t v120 = [v119 countByEnumeratingWithState:&v137 objects:v159 count:16];
    if (v120)
    {
      uint64_t v121 = v120;
      uint64_t v122 = *(void *)v138;
      do
      {
        for (uint64_t n = 0; n != v121; ++n)
        {
          if (*(void *)v138 != v122) {
            objc_enumerationMutation(v119);
          }
          uint64_t v124 = *(void *)(*((void *)&v137 + 1) + 8 * n);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v125 = [GEORoadDescription alloc];
            if (a3) {
              uint64_t v126 = [(GEORoadDescription *)v125 initWithJSON:v124];
            }
            else {
              uint64_t v126 = [(GEORoadDescription *)v125 initWithDictionary:v124];
            }
            v127 = (void *)v126;
            [a1 addRoadDescription:v126];
          }
        }
        uint64_t v121 = [v119 countByEnumeratingWithState:&v137 objects:v159 count:16];
      }
      while (v121);
    }

    id v5 = v136;
  }

  v128 = [v5 objectForKeyedSubscript:@"distance"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDistance:", objc_msgSend(v128, "unsignedIntValue"));
  }

  if (a3) {
    id v129 = @"distanceMeters";
  }
  else {
    id v129 = @"distance_meters";
  }
  long long v130 = [v5 objectForKeyedSubscript:v129];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v130 floatValue];
    objc_msgSend(a1, "setDistanceMeters:");
  }

  if (a3) {
    long long v131 = @"distanceCm";
  }
  else {
    long long v131 = @"distance_cm";
  }
  long long v132 = [v5 objectForKeyedSubscript:v131];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDistanceCm:", objc_msgSend(v132, "unsignedIntValue"));
  }

  if (a3) {
    long long v133 = @"maneuverStartPointOffsetCm";
  }
  else {
    long long v133 = @"maneuver_start_point_offset_cm";
  }
  long long v134 = [v5 objectForKeyedSubscript:v133];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setManeuverStartPointOffsetCm:", objc_msgSend(v134, "unsignedIntValue"));
  }

  a1 = a1;
LABEL_366:

  return a1;
}

- (GEOStep)initWithJSON:(id)a3
{
  return (GEOStep *)-[GEOStep _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_7218;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_7219;
    }
    GEOStepReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOStepCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOStepIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOStepReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOStepIsDirty((uint64_t)self) & 1) == 0)
  {
    id v29 = self->_reader;
    objc_sync_enter(v29);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v30 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v30];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v29);
    goto LABEL_103;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOStep *)self readAll:0];
  $EDB2BE274159A3E7688E4593D5E8813B flags = self->_flags;
  if ((*(_WORD *)&flags & 0x4000) != 0)
  {
    PBDataWriterWriteUint32Field();
    $EDB2BE274159A3E7688E4593D5E8813B flags = self->_flags;
    if ((*(unsigned char *)&flags & 0x80) == 0)
    {
LABEL_5:
      if ((*(_WORD *)&flags & 0x200) == 0) {
        goto LABEL_6;
      }
      goto LABEL_97;
    }
  }
  else if ((*(unsigned char *)&flags & 0x80) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  $EDB2BE274159A3E7688E4593D5E8813B flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&flags & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_98;
  }
LABEL_97:
  PBDataWriterWriteInt32Field();
  $EDB2BE274159A3E7688E4593D5E8813B flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&flags & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_99;
  }
LABEL_98:
  PBDataWriterWriteInt32Field();
  $EDB2BE274159A3E7688E4593D5E8813B flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x20) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&flags & 0x10) == 0) {
      goto LABEL_9;
    }
LABEL_100:
    PBDataWriterWriteUint32Field();
    if ((*(void *)&self->_flags & 0x400) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_99:
  PBDataWriterWriteInt32Field();
  $EDB2BE274159A3E7688E4593D5E8813B flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x10) != 0) {
    goto LABEL_100;
  }
LABEL_9:
  if ((*(_WORD *)&flags & 0x400) != 0) {
LABEL_10:
  }
    PBDataWriterWriteInt32Field();
LABEL_11:
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v7 = self->_maneuverNames;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v44 objects:v51 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v45 != v9) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v44 objects:v51 count:16];
    }
    while (v8);
  }

  if ((*(unsigned char *)&self->_flags & 0x40) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_junctionElementsCount)
  {
    uint64_t v11 = 0;
    unint64_t v12 = 0;
    do
    {
      uint64_t v43 = 0;
      PBDataWriterPlaceMark();
      GEOJunctionElementWriteTo((uint64_t)&self->_junctionElements[v11]);
      PBDataWriterRecallMark();
      ++v12;
      ++v11;
    }
    while (v12 < self->_junctionElementsCount);
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v13 = self->_signposts;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v39 objects:v50 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v40 != v15) {
          objc_enumerationMutation(v13);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v39 objects:v50 count:16];
    }
    while (v14);
  }

  $EDB2BE274159A3E7688E4593D5E8813B v17 = self->_flags;
  if ((*(_WORD *)&v17 & 0x2000) != 0)
  {
    PBDataWriterWriteInt32Field();
    $EDB2BE274159A3E7688E4593D5E8813B v17 = self->_flags;
  }
  if ((*(_WORD *)&v17 & 0x1000) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_exitNumber) {
    PBDataWriterWriteSubmessage();
  }
  $EDB2BE274159A3E7688E4593D5E8813B v18 = self->_flags;
  if ((*(_DWORD *)&v18 & 0x400000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $EDB2BE274159A3E7688E4593D5E8813B v18 = self->_flags;
  }
  if ((*(_DWORD *)&v18 & 0x200000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $EDB2BE274159A3E7688E4593D5E8813B v18 = self->_flags;
  }
  if ((*(_DWORD *)&v18 & 0x10000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $EDB2BE274159A3E7688E4593D5E8813B v18 = self->_flags;
  }
  if ((*(_DWORD *)&v18 & 0x100000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_instructions) {
    PBDataWriterWriteStringField();
  }
  if (self->_notice) {
    PBDataWriterWriteStringField();
  }
  if (self->_timeCheckpoints) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_instructionSet) {
    PBDataWriterWriteSubmessage();
  }
  if ((*((unsigned char *)&self->_flags + 2) & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v19 = self->_guidanceEvents;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v35 objects:v49 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v36;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v36 != v21) {
          objc_enumerationMutation(v19);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v35 objects:v49 count:16];
    }
    while (v20);
  }

  $EDB2BE274159A3E7688E4593D5E8813B v23 = self->_flags;
  if ((*(_DWORD *)&v23 & 0x80000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $EDB2BE274159A3E7688E4593D5E8813B v23 = self->_flags;
  }
  if ((*(_DWORD *)&v23 & 0x20000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_evStateInfo) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_evInfo) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_chargingInfo) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_artworkOverride) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_stopWaypoint) {
    PBDataWriterWriteSubmessage();
  }
  if ((*((unsigned char *)&self->_flags + 1) & 0x80) != 0) {
    PBDataWriterWriteUint32Field();
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v24 = self->_roadDescriptions;
  uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v31 objects:v48 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v32;
    do
    {
      for (uint64_t m = 0; m != v25; ++m)
      {
        if (*(void *)v32 != v26) {
          objc_enumerationMutation(v24);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v31 objects:v48 count:16];
    }
    while (v25);
  }

  $EDB2BE274159A3E7688E4593D5E8813B v28 = self->_flags;
  if ((*(unsigned char *)&v28 & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    $EDB2BE274159A3E7688E4593D5E8813B v28 = self->_flags;
  }
  if ((*(unsigned char *)&v28 & 4) != 0)
  {
    PBDataWriterWriteFloatField();
    $EDB2BE274159A3E7688E4593D5E8813B v28 = self->_flags;
  }
  if ((*(unsigned char *)&v28 & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    $EDB2BE274159A3E7688E4593D5E8813B v28 = self->_flags;
  }
  if ((*(_WORD *)&v28 & 0x800) != 0) {
    PBDataWriterWriteUint32Field();
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v31);
LABEL_103:
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOStep _readStopWaypoint]((uint64_t)self);
  stopWaypoint = self->_stopWaypoint;

  return [(GEOStopWaypoint *)stopWaypoint hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  long long v32 = (char *)a3;
  [(GEOStep *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)v32 + 1, self->_reader);
  *((_DWORD *)v32 + 40) = self->_readerMarkPos;
  *((_DWORD *)v32 + 41) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  $EDB2BE274159A3E7688E4593D5E8813B flags = self->_flags;
  if ((*(_WORD *)&flags & 0x4000) != 0)
  {
    *((_DWORD *)v32 + 57) = self->_stepID;
    *(void *)(v32 + 244) |= 0x4000uLL;
    $EDB2BE274159A3E7688E4593D5E8813B flags = self->_flags;
    if ((*(unsigned char *)&flags & 0x80) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&flags & 0x200) == 0) {
        goto LABEL_4;
      }
      goto LABEL_80;
    }
  }
  else if ((*(unsigned char *)&flags & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v32 + 50) = self->_maneuverEndBasicIndex;
  *(void *)(v32 + 244) |= 0x80uLL;
  $EDB2BE274159A3E7688E4593D5E8813B flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&flags & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_81;
  }
LABEL_80:
  *((_DWORD *)v32 + 52) = self->_maneuverStartZilchIndex;
  *(void *)(v32 + 244) |= 0x200uLL;
  $EDB2BE274159A3E7688E4593D5E8813B flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&flags & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_82;
  }
LABEL_81:
  *((_DWORD *)v32 + 51) = self->_maneuverEndZilchIndex;
  *(void *)(v32 + 244) |= 0x100uLL;
  $EDB2BE274159A3E7688E4593D5E8813B flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x20) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&flags & 0x10) == 0) {
      goto LABEL_7;
    }
LABEL_83:
    *((_DWORD *)v32 + 47) = self->_expectedTime;
    *(void *)(v32 + 244) |= 0x10uLL;
    if ((*(void *)&self->_flags & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_82:
  *((_DWORD *)v32 + 48) = self->_hintFirstAnnouncementZilchIndex;
  *(void *)(v32 + 244) |= 0x20uLL;
  $EDB2BE274159A3E7688E4593D5E8813B flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x10) != 0) {
    goto LABEL_83;
  }
LABEL_7:
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
LABEL_8:
    *((_DWORD *)v32 + 53) = self->_maneuverType;
    *(void *)(v32 + 244) |= 0x400uLL;
  }
LABEL_9:
  if ([(GEOStep *)self maneuverNamesCount])
  {
    [v32 clearManeuverNames];
    unint64_t v5 = [(GEOStep *)self maneuverNamesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(GEOStep *)self maneuverNameAtIndex:i];
        [v32 addManeuverName:v8];
      }
    }
  }
  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
    *((_DWORD *)v32 + 49) = self->_junctionType;
    *(void *)(v32 + 244) |= 0x40uLL;
  }
  if ([(GEOStep *)self junctionElementsCount])
  {
    [v32 clearJunctionElements];
    unint64_t v9 = [(GEOStep *)self junctionElementsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(GEOStep *)self junctionElementAtIndex:j];
        objc_msgSend(v32, "addJunctionElement:", v12, v13);
      }
    }
  }
  if ([(GEOStep *)self signpostsCount])
  {
    [v32 clearSignposts];
    unint64_t v14 = [(GEOStep *)self signpostsCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t k = 0; k != v15; ++k)
      {
        $EDB2BE274159A3E7688E4593D5E8813B v17 = [(GEOStep *)self signpostAtIndex:k];
        [v32 addSignpost:v17];
      }
    }
  }
  $EDB2BE274159A3E7688E4593D5E8813B v18 = self->_flags;
  uint64_t v19 = v32;
  if ((*(_WORD *)&v18 & 0x2000) != 0)
  {
    *((_DWORD *)v32 + 56) = self->_overrideTransportType;
    *(void *)(v32 + 244) |= 0x2000uLL;
    $EDB2BE274159A3E7688E4593D5E8813B v18 = self->_flags;
  }
  if ((*(_WORD *)&v18 & 0x1000) != 0)
  {
    *((_DWORD *)v32 + 55) = self->_overrideDrivingSide;
    *(void *)(v32 + 244) |= 0x1000uLL;
  }
  if (self->_exitNumber)
  {
    objc_msgSend(v32, "setExitNumber:");
    uint64_t v19 = v32;
  }
  $EDB2BE274159A3E7688E4593D5E8813B v20 = self->_flags;
  if ((*(_DWORD *)&v20 & 0x400000) != 0)
  {
    v19[242] = self->_tollPrior;
    *(void *)(v19 + 244) |= 0x400000uLL;
    $EDB2BE274159A3E7688E4593D5E8813B v20 = self->_flags;
    if ((*(_DWORD *)&v20 & 0x200000) == 0)
    {
LABEL_31:
      if ((*(_DWORD *)&v20 & 0x10000) == 0) {
        goto LABEL_32;
      }
      goto LABEL_87;
    }
  }
  else if ((*(_DWORD *)&v20 & 0x200000) == 0)
  {
    goto LABEL_31;
  }
  v19[241] = self->_tollAhead;
  *(void *)(v19 + 244) |= 0x200000uLL;
  $EDB2BE274159A3E7688E4593D5E8813B v20 = self->_flags;
  if ((*(_DWORD *)&v20 & 0x10000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v20 & 0x100000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
LABEL_87:
  v19[236] = self->_endsOnFwy;
  *(void *)(v19 + 244) |= 0x10000uLL;
  if ((*(void *)&self->_flags & 0x100000) != 0)
  {
LABEL_33:
    v19[240] = self->_toFreeway;
    *(void *)(v19 + 244) |= 0x100000uLL;
  }
LABEL_34:
  if (self->_instructions)
  {
    objc_msgSend(v32, "setInstructions:");
    uint64_t v19 = v32;
  }
  if (self->_notice)
  {
    objc_msgSend(v32, "setNotice:");
    uint64_t v19 = v32;
  }
  if (self->_timeCheckpoints)
  {
    objc_msgSend(v32, "setTimeCheckpoints:");
    uint64_t v19 = v32;
  }
  if (self->_instructionSet)
  {
    objc_msgSend(v32, "setInstructionSet:");
    uint64_t v19 = v32;
  }
  if ((*((unsigned char *)&self->_flags + 2) & 4) != 0)
  {
    v19[238] = self->_shouldChainManeuver;
    *(void *)(v19 + 244) |= 0x40000uLL;
  }
  if ([(GEOStep *)self guidanceEventsCount])
  {
    [v32 clearGuidanceEvents];
    unint64_t v21 = [(GEOStep *)self guidanceEventsCount];
    if (v21)
    {
      unint64_t v22 = v21;
      for (uint64_t m = 0; m != v22; ++m)
      {
        v24 = [(GEOStep *)self guidanceEventAtIndex:m];
        [v32 addGuidanceEvent:v24];
      }
    }
  }
  $EDB2BE274159A3E7688E4593D5E8813B v25 = self->_flags;
  uint64_t v26 = v32;
  if ((*(_DWORD *)&v25 & 0x80000) != 0)
  {
    v32[239] = self->_stayOn;
    *(void *)(v32 + 244) |= 0x80000uLL;
    $EDB2BE274159A3E7688E4593D5E8813B v25 = self->_flags;
  }
  if ((*(_DWORD *)&v25 & 0x20000) != 0)
  {
    v32[237] = self->_maneuverLaneGuidanceSuppressed;
    *(void *)(v32 + 244) |= 0x20000uLL;
  }
  if (self->_evStateInfo)
  {
    objc_msgSend(v32, "setEvStateInfo:");
    uint64_t v26 = v32;
  }
  if (self->_evInfo)
  {
    objc_msgSend(v32, "setEvInfo:");
    uint64_t v26 = v32;
  }
  if (self->_chargingInfo)
  {
    objc_msgSend(v32, "setChargingInfo:");
    uint64_t v26 = v32;
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v26 + 43) = self->_arrivalParameterIndex;
    *(void *)(v26 + 244) |= 1uLL;
  }
  if (self->_artworkOverride)
  {
    objc_msgSend(v32, "setArtworkOverride:");
    uint64_t v26 = v32;
  }
  if (self->_stopWaypoint)
  {
    objc_msgSend(v32, "setStopWaypoint:");
    uint64_t v26 = v32;
  }
  if ((*((unsigned char *)&self->_flags + 1) & 0x80) != 0)
  {
    *((_DWORD *)v26 + 58) = self->_zilchPathIndex;
    *(void *)(v26 + 244) |= 0x8000uLL;
  }
  if ([(GEOStep *)self roadDescriptionsCount])
  {
    [v32 clearRoadDescriptions];
    unint64_t v27 = [(GEOStep *)self roadDescriptionsCount];
    if (v27)
    {
      unint64_t v28 = v27;
      for (uint64_t n = 0; n != v28; ++n)
      {
        uint64_t v30 = [(GEOStep *)self roadDescriptionAtIndex:n];
        [v32 addRoadDescription:v30];
      }
    }
  }
  $EDB2BE274159A3E7688E4593D5E8813B v31 = self->_flags;
  if ((*(unsigned char *)&v31 & 8) != 0)
  {
    *((_DWORD *)v32 + 46) = self->_distance;
    *(void *)(v32 + 244) |= 8uLL;
    $EDB2BE274159A3E7688E4593D5E8813B v31 = self->_flags;
    if ((*(unsigned char *)&v31 & 4) == 0)
    {
LABEL_72:
      if ((*(unsigned char *)&v31 & 2) == 0) {
        goto LABEL_73;
      }
      goto LABEL_91;
    }
  }
  else if ((*(unsigned char *)&v31 & 4) == 0)
  {
    goto LABEL_72;
  }
  *((_DWORD *)v32 + 45) = LODWORD(self->_distanceMeters);
  *(void *)(v32 + 244) |= 4uLL;
  $EDB2BE274159A3E7688E4593D5E8813B v31 = self->_flags;
  if ((*(unsigned char *)&v31 & 2) == 0)
  {
LABEL_73:
    if ((*(_WORD *)&v31 & 0x800) == 0) {
      goto LABEL_75;
    }
    goto LABEL_74;
  }
LABEL_91:
  *((_DWORD *)v32 + 44) = self->_distanceCm;
  *(void *)(v32 + 244) |= 2uLL;
  if ((*(void *)&self->_flags & 0x800) != 0)
  {
LABEL_74:
    *((_DWORD *)v32 + 54) = self->_maneuverStartPointOffsetCm;
    *(void *)(v32 + 244) |= 0x800uLL;
  }
LABEL_75:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOStep *)self readAll:0];
    $EDB2BE274159A3E7688E4593D5E8813B flags = self->_flags;
    if ((*(_WORD *)&flags & 0x4000) != 0)
    {
      *(_DWORD *)(v5 + 228) = self->_stepID;
      *(void *)(v5 + 244) |= 0x4000uLL;
      $EDB2BE274159A3E7688E4593D5E8813B flags = self->_flags;
      if ((*(unsigned char *)&flags & 0x80) == 0)
      {
LABEL_7:
        if ((*(_WORD *)&flags & 0x200) == 0) {
          goto LABEL_8;
        }
        goto LABEL_73;
      }
    }
    else if ((*(unsigned char *)&flags & 0x80) == 0)
    {
      goto LABEL_7;
    }
    *(_DWORD *)(v5 + 200) = self->_maneuverEndBasicIndex;
    *(void *)(v5 + 244) |= 0x80uLL;
    $EDB2BE274159A3E7688E4593D5E8813B flags = self->_flags;
    if ((*(_WORD *)&flags & 0x200) == 0)
    {
LABEL_8:
      if ((*(_WORD *)&flags & 0x100) == 0) {
        goto LABEL_9;
      }
      goto LABEL_74;
    }
LABEL_73:
    *(_DWORD *)(v5 + 208) = self->_maneuverStartZilchIndex;
    *(void *)(v5 + 244) |= 0x200uLL;
    $EDB2BE274159A3E7688E4593D5E8813B flags = self->_flags;
    if ((*(_WORD *)&flags & 0x100) == 0)
    {
LABEL_9:
      if ((*(unsigned char *)&flags & 0x20) == 0) {
        goto LABEL_10;
      }
      goto LABEL_75;
    }
LABEL_74:
    *(_DWORD *)(v5 + 204) = self->_maneuverEndZilchIndex;
    *(void *)(v5 + 244) |= 0x100uLL;
    $EDB2BE274159A3E7688E4593D5E8813B flags = self->_flags;
    if ((*(unsigned char *)&flags & 0x20) == 0)
    {
LABEL_10:
      if ((*(unsigned char *)&flags & 0x10) == 0) {
        goto LABEL_11;
      }
      goto LABEL_76;
    }
LABEL_75:
    *(_DWORD *)(v5 + 192) = self->_hintFirstAnnouncementZilchIndex;
    *(void *)(v5 + 244) |= 0x20uLL;
    $EDB2BE274159A3E7688E4593D5E8813B flags = self->_flags;
    if ((*(unsigned char *)&flags & 0x10) == 0)
    {
LABEL_11:
      if ((*(_WORD *)&flags & 0x400) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
LABEL_76:
    *(_DWORD *)(v5 + 188) = self->_expectedTime;
    *(void *)(v5 + 244) |= 0x10uLL;
    if ((*(void *)&self->_flags & 0x400) == 0)
    {
LABEL_13:
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      unint64_t v10 = self->_maneuverNames;
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v69 objects:v76 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v70;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v70 != v12) {
              objc_enumerationMutation(v10);
            }
            unint64_t v14 = (void *)[*(id *)(*((void *)&v69 + 1) + 8 * i) copyWithZone:a3];
            [(id)v5 addManeuverName:v14];
          }
          uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v69 objects:v76 count:16];
        }
        while (v11);
      }

      if ((*(unsigned char *)&self->_flags & 0x40) != 0)
      {
        *(_DWORD *)(v5 + 196) = self->_junctionType;
        *(void *)(v5 + 244) |= 0x40uLL;
      }
      unint64_t junctionElementsCount = self->_junctionElementsCount;
      if (junctionElementsCount)
      {
        -[GEOStep _reserveJunctionElements:](v5, junctionElementsCount);
        memcpy(*(void **)(v5 + 24), self->_junctionElements, 16 * self->_junctionElementsCount);
        *(void *)(v5 + 32) = self->_junctionElementsCount;
      }
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id v16 = self->_signposts;
      uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v65 objects:v75 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v66;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v66 != v18) {
              objc_enumerationMutation(v16);
            }
            $EDB2BE274159A3E7688E4593D5E8813B v20 = (void *)[*(id *)(*((void *)&v65 + 1) + 8 * j) copyWithZone:a3];
            [(id)v5 addSignpost:v20];
          }
          uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v65 objects:v75 count:16];
        }
        while (v17);
      }

      $EDB2BE274159A3E7688E4593D5E8813B v21 = self->_flags;
      if ((*(_WORD *)&v21 & 0x2000) != 0)
      {
        *(_DWORD *)(v5 + 224) = self->_overrideTransportType;
        *(void *)(v5 + 244) |= 0x2000uLL;
        $EDB2BE274159A3E7688E4593D5E8813B v21 = self->_flags;
      }
      if ((*(_WORD *)&v21 & 0x1000) != 0)
      {
        *(_DWORD *)(v5 + 220) = self->_overrideDrivingSide;
        *(void *)(v5 + 244) |= 0x1000uLL;
      }
      id v22 = [(GEONameInfo *)self->_exitNumber copyWithZone:a3];
      $EDB2BE274159A3E7688E4593D5E8813B v23 = *(void **)(v5 + 80);
      *(void *)(v5 + 80) = v22;

      $EDB2BE274159A3E7688E4593D5E8813B v24 = self->_flags;
      if ((*(_DWORD *)&v24 & 0x400000) != 0)
      {
        *(unsigned char *)(v5 + 242) = self->_tollPrior;
        *(void *)(v5 + 244) |= 0x400000uLL;
        $EDB2BE274159A3E7688E4593D5E8813B v24 = self->_flags;
        if ((*(_DWORD *)&v24 & 0x200000) == 0)
        {
LABEL_37:
          if ((*(_DWORD *)&v24 & 0x10000) == 0) {
            goto LABEL_38;
          }
          goto LABEL_80;
        }
      }
      else if ((*(_DWORD *)&v24 & 0x200000) == 0)
      {
        goto LABEL_37;
      }
      *(unsigned char *)(v5 + 241) = self->_tollAhead;
      *(void *)(v5 + 244) |= 0x200000uLL;
      $EDB2BE274159A3E7688E4593D5E8813B v24 = self->_flags;
      if ((*(_DWORD *)&v24 & 0x10000) == 0)
      {
LABEL_38:
        if ((*(_DWORD *)&v24 & 0x100000) == 0) {
          goto LABEL_40;
        }
        goto LABEL_39;
      }
LABEL_80:
      *(unsigned char *)(v5 + 236) = self->_endsOnFwy;
      *(void *)(v5 + 244) |= 0x10000uLL;
      if ((*(void *)&self->_flags & 0x100000) == 0)
      {
LABEL_40:
        uint64_t v25 = [(NSString *)self->_instructions copyWithZone:a3];
        uint64_t v26 = *(void **)(v5 + 104);
        *(void *)(v5 + 104) = v25;

        uint64_t v27 = [(NSString *)self->_notice copyWithZone:a3];
        unint64_t v28 = *(void **)(v5 + 120);
        *(void *)(v5 + 120) = v27;

        id v29 = [(GEOTimeCheckpoints *)self->_timeCheckpoints copyWithZone:a3];
        uint64_t v30 = *(void **)(v5 + 152);
        *(void *)(v5 + 152) = v29;

        id v31 = [(GEOInstructionSet *)self->_instructionSet copyWithZone:a3];
        long long v32 = *(void **)(v5 + 96);
        *(void *)(v5 + 96) = v31;

        if ((*((unsigned char *)&self->_flags + 2) & 4) != 0)
        {
          *(unsigned char *)(v5 + 238) = self->_shouldChainManeuver;
          *(void *)(v5 + 244) |= 0x40000uLL;
        }
        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v33 = self->_guidanceEvents;
        uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v61 objects:v74 count:16];
        if (v34)
        {
          uint64_t v35 = *(void *)v62;
          do
          {
            for (uint64_t k = 0; k != v34; ++k)
            {
              if (*(void *)v62 != v35) {
                objc_enumerationMutation(v33);
              }
              long long v37 = (void *)[*(id *)(*((void *)&v61 + 1) + 8 * k) copyWithZone:a3];
              [(id)v5 addGuidanceEvent:v37];
            }
            uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v61 objects:v74 count:16];
          }
          while (v34);
        }

        $EDB2BE274159A3E7688E4593D5E8813B v38 = self->_flags;
        if ((*(_DWORD *)&v38 & 0x80000) != 0)
        {
          *(unsigned char *)(v5 + 239) = self->_stayOn;
          *(void *)(v5 + 244) |= 0x80000uLL;
          $EDB2BE274159A3E7688E4593D5E8813B v38 = self->_flags;
        }
        if ((*(_DWORD *)&v38 & 0x20000) != 0)
        {
          *(unsigned char *)(v5 + 237) = self->_maneuverLaneGuidanceSuppressed;
          *(void *)(v5 + 244) |= 0x20000uLL;
        }
        id v39 = [(GEOEVStateInfo *)self->_evStateInfo copyWithZone:a3];
        long long v40 = *(void **)(v5 + 72);
        *(void *)(v5 + 72) = v39;

        id v41 = [(GEOEVStepInfo *)self->_evInfo copyWithZone:a3];
        long long v42 = *(void **)(v5 + 64);
        *(void *)(v5 + 64) = v41;

        id v43 = [(GEOEVChargeInfo *)self->_chargingInfo copyWithZone:a3];
        long long v44 = *(void **)(v5 + 56);
        *(void *)(v5 + 56) = v43;

        if (*(unsigned char *)&self->_flags)
        {
          *(_DWORD *)(v5 + 172) = self->_arrivalParameterIndex;
          *(void *)(v5 + 244) |= 1uLL;
        }
        id v45 = [(GEOPBTransitArtwork *)self->_artworkOverride copyWithZone:a3];
        long long v46 = *(void **)(v5 + 48);
        *(void *)(v5 + 48) = v45;

        id v47 = [(GEOStopWaypoint *)self->_stopWaypoint copyWithZone:a3];
        v48 = *(void **)(v5 + 144);
        *(void *)(v5 + 144) = v47;

        if ((*((unsigned char *)&self->_flags + 1) & 0x80) != 0)
        {
          *(_DWORD *)(v5 + 232) = self->_zilchPathIndex;
          *(void *)(v5 + 244) |= 0x8000uLL;
        }
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        id v49 = self->_roadDescriptions;
        uint64_t v50 = [(NSMutableArray *)v49 countByEnumeratingWithState:&v57 objects:v73 count:16];
        if (v50)
        {
          uint64_t v51 = *(void *)v58;
          do
          {
            for (uint64_t m = 0; m != v50; ++m)
            {
              if (*(void *)v58 != v51) {
                objc_enumerationMutation(v49);
              }
              uint64_t v53 = objc_msgSend(*(id *)(*((void *)&v57 + 1) + 8 * m), "copyWithZone:", a3, (void)v57);
              [(id)v5 addRoadDescription:v53];
            }
            uint64_t v50 = [(NSMutableArray *)v49 countByEnumeratingWithState:&v57 objects:v73 count:16];
          }
          while (v50);
        }

        $EDB2BE274159A3E7688E4593D5E8813B v54 = self->_flags;
        if ((*(unsigned char *)&v54 & 8) != 0)
        {
          *(_DWORD *)(v5 + 184) = self->_distance;
          *(void *)(v5 + 244) |= 8uLL;
          $EDB2BE274159A3E7688E4593D5E8813B v54 = self->_flags;
          if ((*(unsigned char *)&v54 & 4) == 0)
          {
LABEL_66:
            if ((*(unsigned char *)&v54 & 2) == 0) {
              goto LABEL_67;
            }
            goto LABEL_84;
          }
        }
        else if ((*(unsigned char *)&v54 & 4) == 0)
        {
          goto LABEL_66;
        }
        *(float *)(v5 + 180) = self->_distanceMeters;
        *(void *)(v5 + 244) |= 4uLL;
        $EDB2BE274159A3E7688E4593D5E8813B v54 = self->_flags;
        if ((*(unsigned char *)&v54 & 2) == 0)
        {
LABEL_67:
          if ((*(_WORD *)&v54 & 0x800) == 0)
          {
LABEL_69:
            v55 = self->_unknownFields;
            id v8 = *(id *)(v5 + 16);
            *(void *)(v5 + 16) = v55;
            goto LABEL_70;
          }
LABEL_68:
          *(_DWORD *)(v5 + 216) = self->_maneuverStartPointOffsetCm;
          *(void *)(v5 + 244) |= 0x800uLL;
          goto LABEL_69;
        }
LABEL_84:
        *(_DWORD *)(v5 + 176) = self->_distanceCm;
        *(void *)(v5 + 244) |= 2uLL;
        if ((*(void *)&self->_flags & 0x800) == 0) {
          goto LABEL_69;
        }
        goto LABEL_68;
      }
LABEL_39:
      *(unsigned char *)(v5 + 240) = self->_toFreeway;
      *(void *)(v5 + 244) |= 0x100000uLL;
      goto LABEL_40;
    }
LABEL_12:
    *(_DWORD *)(v5 + 212) = self->_maneuverType;
    *(void *)(v5 + 244) |= 0x400uLL;
    goto LABEL_13;
  }
  id v7 = reader;
  objc_sync_enter(v7);
  if ((*((unsigned char *)&self->_flags + 4) & 0x80) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOStepReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_70:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_47;
  }
  [(GEOStep *)self readAll:1];
  [v4 readAll:1];
  $EDB2BE274159A3E7688E4593D5E8813B flags = self->_flags;
  uint64_t v6 = *(void *)(v4 + 244);
  if ((*(_WORD *)&flags & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_stepID != *((_DWORD *)v4 + 57)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_47;
  }
  if ((*(unsigned char *)&flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_maneuverEndBasicIndex != *((_DWORD *)v4 + 50)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_maneuverStartZilchIndex != *((_DWORD *)v4 + 52)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_maneuverEndZilchIndex != *((_DWORD *)v4 + 51)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_47;
  }
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_hintFirstAnnouncementZilchIndex != *((_DWORD *)v4 + 48)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_47;
  }
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_expectedTime != *((_DWORD *)v4 + 47)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_maneuverType != *((_DWORD *)v4 + 53)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_47;
  }
  maneuverNames = self->_maneuverNames;
  if ((unint64_t)maneuverNames | *((void *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](maneuverNames, "isEqual:")) {
      goto LABEL_47;
    }
    $EDB2BE274159A3E7688E4593D5E8813B flags = self->_flags;
    uint64_t v6 = *(void *)(v4 + 244);
  }
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_junctionType != *((_DWORD *)v4 + 49)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_47;
  }
  *(_DWORD *)&$EDB2BE274159A3E7688E4593D5E8813B v29 = flags;
  LODWORD(v30) = v6;
  unint64_t junctionElementsCount = self->_junctionElementsCount;
  if (junctionElementsCount != *((void *)v4 + 4)
    || memcmp(self->_junctionElements, *((const void **)v4 + 3), 16 * junctionElementsCount))
  {
    goto LABEL_47;
  }
  signposts = self->_signposts;
  if ((unint64_t)signposts | *((void *)v4 + 17))
  {
    if (!-[NSMutableArray isEqual:](signposts, "isEqual:")) {
      goto LABEL_47;
    }
    $EDB2BE274159A3E7688E4593D5E8813B v29 = self->_flags;
    uint64_t v30 = *(void *)(v4 + 244);
  }
  if ((*(_WORD *)&v29 & 0x2000) != 0)
  {
    if ((v30 & 0x2000) == 0 || self->_overrideTransportType != *((_DWORD *)v4 + 56)) {
      goto LABEL_47;
    }
  }
  else if ((v30 & 0x2000) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_WORD *)&v29 & 0x1000) != 0)
  {
    if ((v30 & 0x1000) == 0 || self->_overrideDrivingSide != *((_DWORD *)v4 + 55)) {
      goto LABEL_47;
    }
  }
  else if ((v30 & 0x1000) != 0)
  {
    goto LABEL_47;
  }
  exitNumber = self->_exitNumber;
  if ((unint64_t)exitNumber | *((void *)v4 + 10))
  {
    if (!-[GEONameInfo isEqual:](exitNumber, "isEqual:")) {
      goto LABEL_47;
    }
    $EDB2BE274159A3E7688E4593D5E8813B v29 = self->_flags;
    uint64_t v30 = *(void *)(v4 + 244);
  }
  if ((*(_DWORD *)&v29 & 0x400000) != 0)
  {
    if ((v30 & 0x400000) == 0) {
      goto LABEL_47;
    }
    if (self->_tollPrior)
    {
      if (!v4[242]) {
        goto LABEL_47;
      }
    }
    else if (v4[242])
    {
      goto LABEL_47;
    }
  }
  else if ((v30 & 0x400000) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_DWORD *)&v29 & 0x200000) != 0)
  {
    if ((v30 & 0x200000) == 0) {
      goto LABEL_47;
    }
    if (self->_tollAhead)
    {
      if (!v4[241]) {
        goto LABEL_47;
      }
    }
    else if (v4[241])
    {
      goto LABEL_47;
    }
  }
  else if ((v30 & 0x200000) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_DWORD *)&v29 & 0x10000) != 0)
  {
    if ((v30 & 0x10000) == 0) {
      goto LABEL_47;
    }
    if (self->_endsOnFwy)
    {
      if (!v4[236]) {
        goto LABEL_47;
      }
    }
    else if (v4[236])
    {
      goto LABEL_47;
    }
  }
  else if ((v30 & 0x10000) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_DWORD *)&v29 & 0x100000) != 0)
  {
    if ((v30 & 0x100000) == 0) {
      goto LABEL_47;
    }
    if (self->_toFreeway)
    {
      if (!v4[240]) {
        goto LABEL_47;
      }
    }
    else if (v4[240])
    {
      goto LABEL_47;
    }
  }
  else if ((v30 & 0x100000) != 0)
  {
    goto LABEL_47;
  }
  instructions = self->_instructions;
  if ((unint64_t)instructions | *((void *)v4 + 13)
    && !-[NSString isEqual:](instructions, "isEqual:"))
  {
    goto LABEL_47;
  }
  notice = self->_notice;
  if ((unint64_t)notice | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](notice, "isEqual:")) {
      goto LABEL_47;
    }
  }
  timeCheckpoints = self->_timeCheckpoints;
  if ((unint64_t)timeCheckpoints | *((void *)v4 + 19))
  {
    if (!-[GEOTimeCheckpoints isEqual:](timeCheckpoints, "isEqual:")) {
      goto LABEL_47;
    }
  }
  instructionSet = self->_instructionSet;
  if ((unint64_t)instructionSet | *((void *)v4 + 12))
  {
    if (!-[GEOInstructionSet isEqual:](instructionSet, "isEqual:")) {
      goto LABEL_47;
    }
  }
  $EDB2BE274159A3E7688E4593D5E8813B v17 = self->_flags;
  uint64_t v18 = *(void *)(v4 + 244);
  if ((*(_DWORD *)&v17 & 0x40000) != 0)
  {
    if ((v18 & 0x40000) == 0) {
      goto LABEL_47;
    }
    if (self->_shouldChainManeuver)
    {
      if (!v4[238]) {
        goto LABEL_47;
      }
    }
    else if (v4[238])
    {
      goto LABEL_47;
    }
  }
  else if ((v18 & 0x40000) != 0)
  {
    goto LABEL_47;
  }
  guidanceEvents = self->_guidanceEvents;
  if ((unint64_t)guidanceEvents | *((void *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](guidanceEvents, "isEqual:")) {
      goto LABEL_47;
    }
    $EDB2BE274159A3E7688E4593D5E8813B v17 = self->_flags;
    uint64_t v18 = *(void *)(v4 + 244);
  }
  if ((*(_DWORD *)&v17 & 0x80000) != 0)
  {
    if ((v18 & 0x80000) == 0) {
      goto LABEL_47;
    }
    if (self->_stayOn)
    {
      if (!v4[239]) {
        goto LABEL_47;
      }
    }
    else if (v4[239])
    {
      goto LABEL_47;
    }
  }
  else if ((v18 & 0x80000) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_DWORD *)&v17 & 0x20000) != 0)
  {
    if ((v18 & 0x20000) == 0) {
      goto LABEL_47;
    }
    if (self->_maneuverLaneGuidanceSuppressed)
    {
      if (!v4[237]) {
        goto LABEL_47;
      }
    }
    else if (v4[237])
    {
      goto LABEL_47;
    }
  }
  else if ((v18 & 0x20000) != 0)
  {
    goto LABEL_47;
  }
  evStateInfo = self->_evStateInfo;
  if ((unint64_t)evStateInfo | *((void *)v4 + 9) && !-[GEOEVStateInfo isEqual:](evStateInfo, "isEqual:")) {
    goto LABEL_47;
  }
  evInfo = self->_evInfo;
  if ((unint64_t)evInfo | *((void *)v4 + 8))
  {
    if (!-[GEOEVStepInfo isEqual:](evInfo, "isEqual:")) {
      goto LABEL_47;
    }
  }
  chargingInfo = self->_chargingInfo;
  if ((unint64_t)chargingInfo | *((void *)v4 + 7))
  {
    if (!-[GEOEVChargeInfo isEqual:](chargingInfo, "isEqual:")) {
      goto LABEL_47;
    }
  }
  uint64_t v23 = *(void *)(v4 + 244);
  if (*(unsigned char *)&self->_flags)
  {
    if ((v23 & 1) == 0 || self->_arrivalParameterIndex != *((_DWORD *)v4 + 43)) {
      goto LABEL_47;
    }
  }
  else if (v23)
  {
    goto LABEL_47;
  }
  artworkOverride = self->_artworkOverride;
  if ((unint64_t)artworkOverride | *((void *)v4 + 6)
    && !-[GEOPBTransitArtwork isEqual:](artworkOverride, "isEqual:"))
  {
    goto LABEL_47;
  }
  stopWaypoint = self->_stopWaypoint;
  if ((unint64_t)stopWaypoint | *((void *)v4 + 18))
  {
    if (!-[GEOStopWaypoint isEqual:](stopWaypoint, "isEqual:")) {
      goto LABEL_47;
    }
  }
  $EDB2BE274159A3E7688E4593D5E8813B v26 = self->_flags;
  uint64_t v27 = *(void *)(v4 + 244);
  if ((*(_WORD *)&v26 & 0x8000) != 0)
  {
    if ((v27 & 0x8000) == 0 || self->_zilchPathIndex != *((_DWORD *)v4 + 58)) {
      goto LABEL_47;
    }
  }
  else if ((v27 & 0x8000) != 0)
  {
    goto LABEL_47;
  }
  roadDescriptions = self->_roadDescriptions;
  if ((unint64_t)roadDescriptions | *((void *)v4 + 16))
  {
    if (!-[NSMutableArray isEqual:](roadDescriptions, "isEqual:")) {
      goto LABEL_47;
    }
    $EDB2BE274159A3E7688E4593D5E8813B v26 = self->_flags;
    uint64_t v27 = *(void *)(v4 + 244);
  }
  if ((*(unsigned char *)&v26 & 8) != 0)
  {
    if ((v27 & 8) == 0 || self->_distance != *((_DWORD *)v4 + 46)) {
      goto LABEL_47;
    }
  }
  else if ((v27 & 8) != 0)
  {
    goto LABEL_47;
  }
  if ((*(unsigned char *)&v26 & 4) != 0)
  {
    if ((v27 & 4) == 0 || self->_distanceMeters != *((float *)v4 + 45)) {
      goto LABEL_47;
    }
  }
  else if ((v27 & 4) != 0)
  {
    goto LABEL_47;
  }
  if ((*(unsigned char *)&v26 & 2) != 0)
  {
    if ((v27 & 2) == 0 || self->_distanceCm != *((_DWORD *)v4 + 44)) {
      goto LABEL_47;
    }
  }
  else if ((v27 & 2) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_WORD *)&v26 & 0x800) == 0)
  {
    BOOL v9 = (v27 & 0x800) == 0;
    goto LABEL_48;
  }
  if ((v27 & 0x800) != 0 && self->_maneuverStartPointOffsetCm == *((_DWORD *)v4 + 54))
  {
    BOOL v9 = 1;
    goto LABEL_48;
  }
LABEL_47:
  BOOL v9 = 0;
LABEL_48:

  return v9;
}

- (unint64_t)hash
{
  [(GEOStep *)self readAll:1];
  $EDB2BE274159A3E7688E4593D5E8813B flags = self->_flags;
  if ((*(_WORD *)&flags & 0x4000) != 0)
  {
    uint64_t v50 = 2654435761 * self->_stepID;
    if ((*(unsigned char *)&flags & 0x80) != 0)
    {
LABEL_3:
      uint64_t v49 = 2654435761 * self->_maneuverEndBasicIndex;
      if ((*(_WORD *)&flags & 0x200) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v50 = 0;
    if ((*(unsigned char *)&flags & 0x80) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v49 = 0;
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
LABEL_4:
    uint64_t v48 = 2654435761 * self->_maneuverStartZilchIndex;
    if ((*(_WORD *)&flags & 0x100) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v48 = 0;
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
LABEL_5:
    uint64_t v47 = 2654435761 * self->_maneuverEndZilchIndex;
    if ((*(unsigned char *)&flags & 0x20) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v47 = 0;
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
LABEL_6:
    uint64_t v46 = 2654435761 * self->_hintFirstAnnouncementZilchIndex;
    if ((*(unsigned char *)&flags & 0x10) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v45 = 0;
    if ((*(_WORD *)&flags & 0x400) != 0) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }
LABEL_13:
  uint64_t v46 = 0;
  if ((*(unsigned char *)&flags & 0x10) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v45 = 2654435761 * self->_expectedTime;
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
LABEL_8:
    uint64_t v44 = 2654435761 * self->_maneuverType;
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v44 = 0;
LABEL_16:
  uint64_t v43 = [(NSMutableArray *)self->_maneuverNames hash];
  if ((*(unsigned char *)&self->_flags & 0x40) != 0) {
    uint64_t v42 = 2654435761 * self->_junctionType;
  }
  else {
    uint64_t v42 = 0;
  }
  uint64_t v41 = PBHashBytes();
  uint64_t v40 = [(NSMutableArray *)self->_signposts hash];
  $EDB2BE274159A3E7688E4593D5E8813B v4 = self->_flags;
  if ((*(_WORD *)&v4 & 0x2000) != 0)
  {
    uint64_t v39 = 2654435761 * self->_overrideTransportType;
    if ((*(_WORD *)&v4 & 0x1000) != 0) {
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v39 = 0;
    if ((*(_WORD *)&v4 & 0x1000) != 0)
    {
LABEL_21:
      uint64_t v38 = 2654435761 * self->_overrideDrivingSide;
      goto LABEL_24;
    }
  }
  uint64_t v38 = 0;
LABEL_24:
  unint64_t v37 = [(GEONameInfo *)self->_exitNumber hash];
  $EDB2BE274159A3E7688E4593D5E8813B v5 = self->_flags;
  if ((*(_DWORD *)&v5 & 0x400000) != 0)
  {
    uint64_t v36 = 2654435761 * self->_tollPrior;
    if ((*(_DWORD *)&v5 & 0x200000) != 0)
    {
LABEL_26:
      uint64_t v35 = 2654435761 * self->_tollAhead;
      if ((*(_DWORD *)&v5 & 0x10000) != 0) {
        goto LABEL_27;
      }
LABEL_31:
      uint64_t v34 = 0;
      if ((*(_DWORD *)&v5 & 0x100000) != 0) {
        goto LABEL_28;
      }
      goto LABEL_32;
    }
  }
  else
  {
    uint64_t v36 = 0;
    if ((*(_DWORD *)&v5 & 0x200000) != 0) {
      goto LABEL_26;
    }
  }
  uint64_t v35 = 0;
  if ((*(_DWORD *)&v5 & 0x10000) == 0) {
    goto LABEL_31;
  }
LABEL_27:
  uint64_t v34 = 2654435761 * self->_endsOnFwy;
  if ((*(_DWORD *)&v5 & 0x100000) != 0)
  {
LABEL_28:
    uint64_t v33 = 2654435761 * self->_toFreeway;
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v33 = 0;
LABEL_33:
  NSUInteger v32 = [(NSString *)self->_instructions hash];
  NSUInteger v31 = [(NSString *)self->_notice hash];
  unint64_t v30 = [(GEOTimeCheckpoints *)self->_timeCheckpoints hash];
  unint64_t v29 = [(GEOInstructionSet *)self->_instructionSet hash];
  if ((*((unsigned char *)&self->_flags + 2) & 4) != 0) {
    uint64_t v28 = 2654435761 * self->_shouldChainManeuver;
  }
  else {
    uint64_t v28 = 0;
  }
  uint64_t v27 = [(NSMutableArray *)self->_guidanceEvents hash];
  $EDB2BE274159A3E7688E4593D5E8813B v6 = self->_flags;
  if ((*(_DWORD *)&v6 & 0x80000) != 0)
  {
    uint64_t v26 = 2654435761 * self->_stayOn;
    if ((*(_DWORD *)&v6 & 0x20000) != 0) {
      goto LABEL_38;
    }
  }
  else
  {
    uint64_t v26 = 0;
    if ((*(_DWORD *)&v6 & 0x20000) != 0)
    {
LABEL_38:
      uint64_t v25 = 2654435761 * self->_maneuverLaneGuidanceSuppressed;
      goto LABEL_41;
    }
  }
  uint64_t v25 = 0;
LABEL_41:
  unint64_t v24 = [(GEOEVStateInfo *)self->_evStateInfo hash];
  unint64_t v23 = [(GEOEVStepInfo *)self->_evInfo hash];
  unint64_t v7 = [(GEOEVChargeInfo *)self->_chargingInfo hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v8 = 2654435761 * self->_arrivalParameterIndex;
  }
  else {
    uint64_t v8 = 0;
  }
  unint64_t v9 = [(GEOPBTransitArtwork *)self->_artworkOverride hash];
  unint64_t v10 = [(GEOStopWaypoint *)self->_stopWaypoint hash];
  if ((*((unsigned char *)&self->_flags + 1) & 0x80) != 0) {
    uint64_t v11 = 2654435761 * self->_zilchPathIndex;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = [(NSMutableArray *)self->_roadDescriptions hash];
  $EDB2BE274159A3E7688E4593D5E8813B v13 = self->_flags;
  if ((*(unsigned char *)&v13 & 8) != 0)
  {
    uint64_t v14 = 2654435761 * self->_distance;
    if ((*(unsigned char *)&v13 & 4) != 0) {
      goto LABEL_49;
    }
LABEL_54:
    unint64_t v19 = 0;
    goto LABEL_57;
  }
  uint64_t v14 = 0;
  if ((*(unsigned char *)&v13 & 4) == 0) {
    goto LABEL_54;
  }
LABEL_49:
  float distanceMeters = self->_distanceMeters;
  double v16 = distanceMeters;
  if (distanceMeters < 0.0) {
    double v16 = -distanceMeters;
  }
  long double v17 = floor(v16 + 0.5);
  double v18 = (v16 - v17) * 1.84467441e19;
  unint64_t v19 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
  if (v18 >= 0.0)
  {
    if (v18 > 0.0) {
      v19 += (unint64_t)v18;
    }
  }
  else
  {
    v19 -= (unint64_t)fabs(v18);
  }
LABEL_57:
  if ((*(unsigned char *)&v13 & 2) != 0)
  {
    uint64_t v20 = 2654435761 * self->_distanceCm;
    if ((*(_WORD *)&v13 & 0x800) != 0) {
      goto LABEL_59;
    }
LABEL_61:
    uint64_t v21 = 0;
    return v49 ^ v50 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v42 ^ v43 ^ v40 ^ v41 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v19 ^ v20 ^ v21;
  }
  uint64_t v20 = 0;
  if ((*(_WORD *)&v13 & 0x800) == 0) {
    goto LABEL_61;
  }
LABEL_59:
  uint64_t v21 = 2654435761 * self->_maneuverStartPointOffsetCm;
  return v49 ^ v50 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v42 ^ v43 ^ v40 ^ v41 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v19 ^ v20 ^ v21;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  $EDB2BE274159A3E7688E4593D5E8813B v4 = (char *)a3;
  [v4 readAll:0];
  uint64_t v5 = *(void *)(v4 + 244);
  if ((v5 & 0x4000) != 0)
  {
    self->_stepID = *((_DWORD *)v4 + 57);
    *(void *)&self->_flags |= 0x4000uLL;
    uint64_t v5 = *(void *)(v4 + 244);
    if ((v5 & 0x80) == 0)
    {
LABEL_3:
      if ((v5 & 0x200) == 0) {
        goto LABEL_4;
      }
      goto LABEL_37;
    }
  }
  else if ((v5 & 0x80) == 0)
  {
    goto LABEL_3;
  }
  self->_maneuverEndBasicIndex = *((_DWORD *)v4 + 50);
  *(void *)&self->_flags |= 0x80uLL;
  uint64_t v5 = *(void *)(v4 + 244);
  if ((v5 & 0x200) == 0)
  {
LABEL_4:
    if ((v5 & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_maneuverStartZilchIndex = *((_DWORD *)v4 + 52);
  *(void *)&self->_flags |= 0x200uLL;
  uint64_t v5 = *(void *)(v4 + 244);
  if ((v5 & 0x100) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_maneuverEndZilchIndex = *((_DWORD *)v4 + 51);
  *(void *)&self->_flags |= 0x100uLL;
  uint64_t v5 = *(void *)(v4 + 244);
  if ((v5 & 0x20) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_hintFirstAnnouncementZilchIndex = *((_DWORD *)v4 + 48);
  *(void *)&self->_flags |= 0x20uLL;
  uint64_t v5 = *(void *)(v4 + 244);
  if ((v5 & 0x10) == 0)
  {
LABEL_7:
    if ((v5 & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_40:
  self->_expectedTime = *((_DWORD *)v4 + 47);
  *(void *)&self->_flags |= 0x10uLL;
  if ((*(void *)(v4 + 244) & 0x400) != 0)
  {
LABEL_8:
    self->_maneuverType = *((_DWORD *)v4 + 53);
    *(void *)&self->_flags |= 0x400uLL;
  }
LABEL_9:
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v6 = *((id *)v4 + 14);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v63 objects:v70 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v64 != v9) {
          objc_enumerationMutation(v6);
        }
        [(GEOStep *)self addManeuverName:*(void *)(*((void *)&v63 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v63 objects:v70 count:16];
    }
    while (v8);
  }

  if ((v4[244] & 0x40) != 0)
  {
    self->_junctionType = *((_DWORD *)v4 + 49);
    *(void *)&self->_flags |= 0x40uLL;
  }
  uint64_t v11 = [v4 junctionElementsCount];
  if (v11)
  {
    uint64_t v12 = v11;
    for (uint64_t j = 0; j != v12; ++j)
    {
      uint64_t v14 = [v4 junctionElementAtIndex:j];
      -[GEOStep addJunctionElement:](self, "addJunctionElement:", v14, v15);
    }
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v16 = *((id *)v4 + 17);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v59 objects:v69 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v60;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v60 != v19) {
          objc_enumerationMutation(v16);
        }
        [(GEOStep *)self addSignpost:*(void *)(*((void *)&v59 + 1) + 8 * k)];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v59 objects:v69 count:16];
    }
    while (v18);
  }

  uint64_t v21 = *(void *)(v4 + 244);
  if ((v21 & 0x2000) != 0)
  {
    self->_overrideTransportType = *((_DWORD *)v4 + 56);
    *(void *)&self->_flags |= 0x2000uLL;
    uint64_t v21 = *(void *)(v4 + 244);
  }
  if ((v21 & 0x1000) != 0)
  {
    self->_overrideDrivingSide = *((_DWORD *)v4 + 55);
    *(void *)&self->_flags |= 0x1000uLL;
  }
  exitNumber = self->_exitNumber;
  uint64_t v23 = *((void *)v4 + 10);
  if (exitNumber)
  {
    if (v23) {
      -[GEONameInfo mergeFrom:](exitNumber, "mergeFrom:");
    }
  }
  else if (v23)
  {
    -[GEOStep setExitNumber:](self, "setExitNumber:");
  }
  uint64_t v24 = *(void *)(v4 + 244);
  if ((v24 & 0x400000) != 0)
  {
    self->_tollPrior = v4[242];
    *(void *)&self->_flags |= 0x400000uLL;
    uint64_t v24 = *(void *)(v4 + 244);
    if ((v24 & 0x200000) == 0)
    {
LABEL_46:
      if ((v24 & 0x10000) == 0) {
        goto LABEL_47;
      }
      goto LABEL_58;
    }
  }
  else if ((v24 & 0x200000) == 0)
  {
    goto LABEL_46;
  }
  self->_tollAhead = v4[241];
  *(void *)&self->_flags |= 0x200000uLL;
  uint64_t v24 = *(void *)(v4 + 244);
  if ((v24 & 0x10000) == 0)
  {
LABEL_47:
    if ((v24 & 0x100000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_48;
  }
LABEL_58:
  self->_endsOnFwy = v4[236];
  *(void *)&self->_flags |= 0x10000uLL;
  if ((*(void *)(v4 + 244) & 0x100000) != 0)
  {
LABEL_48:
    self->_toFreeway = v4[240];
    *(void *)&self->_flags |= 0x100000uLL;
  }
LABEL_49:
  if (*((void *)v4 + 13)) {
    -[GEOStep setInstructions:](self, "setInstructions:");
  }
  if (*((void *)v4 + 15)) {
    -[GEOStep setNotice:](self, "setNotice:");
  }
  timeCheckpoints = self->_timeCheckpoints;
  uint64_t v26 = *((void *)v4 + 19);
  if (timeCheckpoints)
  {
    if (v26) {
      -[GEOTimeCheckpoints mergeFrom:](timeCheckpoints, "mergeFrom:");
    }
  }
  else if (v26)
  {
    -[GEOStep setTimeCheckpoints:](self, "setTimeCheckpoints:");
  }
  instructionSet = self->_instructionSet;
  uint64_t v28 = *((void *)v4 + 12);
  if (instructionSet)
  {
    if (v28) {
      -[GEOInstructionSet mergeFrom:](instructionSet, "mergeFrom:");
    }
  }
  else if (v28)
  {
    -[GEOStep setInstructionSet:](self, "setInstructionSet:");
  }
  if ((v4[246] & 4) != 0)
  {
    self->_shouldChainManeuver = v4[238];
    *(void *)&self->_flags |= 0x40000uLL;
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v29 = *((id *)v4 + 11);
  uint64_t v30 = [v29 countByEnumeratingWithState:&v55 objects:v68 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v56;
    do
    {
      for (uint64_t m = 0; m != v31; ++m)
      {
        if (*(void *)v56 != v32) {
          objc_enumerationMutation(v29);
        }
        [(GEOStep *)self addGuidanceEvent:*(void *)(*((void *)&v55 + 1) + 8 * m)];
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v55 objects:v68 count:16];
    }
    while (v31);
  }

  uint64_t v34 = *(void *)(v4 + 244);
  if ((v34 & 0x80000) != 0)
  {
    self->_stayOuint64_t n = v4[239];
    *(void *)&self->_flags |= 0x80000uLL;
    uint64_t v34 = *(void *)(v4 + 244);
  }
  if ((v34 & 0x20000) != 0)
  {
    self->_maneuverLaneGuidanceSuppressed = v4[237];
    *(void *)&self->_flags |= 0x20000uLL;
  }
  evStateInfo = self->_evStateInfo;
  uint64_t v36 = *((void *)v4 + 9);
  if (evStateInfo)
  {
    if (v36) {
      -[GEOEVStateInfo mergeFrom:](evStateInfo, "mergeFrom:");
    }
  }
  else if (v36)
  {
    -[GEOStep setEvStateInfo:](self, "setEvStateInfo:");
  }
  evInfo = self->_evInfo;
  uint64_t v38 = *((void *)v4 + 8);
  if (evInfo)
  {
    if (v38) {
      -[GEOEVStepInfo mergeFrom:](evInfo, "mergeFrom:");
    }
  }
  else if (v38)
  {
    -[GEOStep setEvInfo:](self, "setEvInfo:");
  }
  chargingInfo = self->_chargingInfo;
  uint64_t v40 = *((void *)v4 + 7);
  if (chargingInfo)
  {
    if (v40) {
      -[GEOEVChargeInfo mergeFrom:](chargingInfo, "mergeFrom:");
    }
  }
  else if (v40)
  {
    -[GEOStep setChargingInfo:](self, "setChargingInfo:");
  }
  if (v4[244])
  {
    self->_arrivalParameterIndex = *((_DWORD *)v4 + 43);
    *(void *)&self->_flags |= 1uLL;
  }
  artworkOverride = self->_artworkOverride;
  uint64_t v42 = *((void *)v4 + 6);
  if (artworkOverride)
  {
    if (v42) {
      -[GEOPBTransitArtwork mergeFrom:](artworkOverride, "mergeFrom:");
    }
  }
  else if (v42)
  {
    -[GEOStep setArtworkOverride:](self, "setArtworkOverride:");
  }
  stopWaypoint = self->_stopWaypoint;
  uint64_t v44 = *((void *)v4 + 18);
  if (stopWaypoint)
  {
    if (v44) {
      -[GEOStopWaypoint mergeFrom:](stopWaypoint, "mergeFrom:");
    }
  }
  else if (v44)
  {
    -[GEOStep setStopWaypoint:](self, "setStopWaypoint:");
  }
  if (v4[245] < 0)
  {
    self->_zilchPathIndex = *((_DWORD *)v4 + 58);
    *(void *)&self->_flags |= 0x8000uLL;
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v45 = *((id *)v4 + 16);
  uint64_t v46 = [v45 countByEnumeratingWithState:&v51 objects:v67 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v52;
    do
    {
      for (uint64_t n = 0; n != v47; ++n)
      {
        if (*(void *)v52 != v48) {
          objc_enumerationMutation(v45);
        }
        -[GEOStep addRoadDescription:](self, "addRoadDescription:", *(void *)(*((void *)&v51 + 1) + 8 * n), (void)v51);
      }
      uint64_t v47 = [v45 countByEnumeratingWithState:&v51 objects:v67 count:16];
    }
    while (v47);
  }

  uint64_t v50 = *(void *)(v4 + 244);
  if ((v50 & 8) != 0)
  {
    self->_distance = *((_DWORD *)v4 + 46);
    *(void *)&self->_flags |= 8uLL;
    uint64_t v50 = *(void *)(v4 + 244);
    if ((v50 & 4) == 0)
    {
LABEL_118:
      if ((v50 & 2) == 0) {
        goto LABEL_119;
      }
LABEL_124:
      self->_distanceCuint64_t m = *((_DWORD *)v4 + 44);
      *(void *)&self->_flags |= 2uLL;
      if ((*(void *)(v4 + 244) & 0x800) == 0) {
        goto LABEL_121;
      }
      goto LABEL_120;
    }
  }
  else if ((v50 & 4) == 0)
  {
    goto LABEL_118;
  }
  self->_float distanceMeters = *((float *)v4 + 45);
  *(void *)&self->_flags |= 4uLL;
  uint64_t v50 = *(void *)(v4 + 244);
  if ((v50 & 2) != 0) {
    goto LABEL_124;
  }
LABEL_119:
  if ((v50 & 0x800) != 0)
  {
LABEL_120:
    self->_maneuverStartPointOffsetCuint64_t m = *((_DWORD *)v4 + 54);
    *(void *)&self->_flags |= 0x800uLL;
  }
LABEL_121:
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*((unsigned char *)&self->_flags + 2) & 0x80) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOStepReadSpecified((uint64_t)self, (uint64_t)self->_reader, (int *)&unknownFields_tags_7223);
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
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x8000800000uLL;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOStep *)self readAll:0];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v7 = self->_maneuverNames;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v39 objects:v46 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v40;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v40 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v39 + 1) + 8 * v11++) clearUnknownFields:1];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v39 objects:v46 count:16];
      }
      while (v9);
    }

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v12 = self->_signposts;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v35 objects:v45 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v36;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v36 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v35 + 1) + 8 * v16++) clearUnknownFields:1];
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v35 objects:v45 count:16];
      }
      while (v14);
    }

    [(GEONameInfo *)self->_exitNumber clearUnknownFields:1];
    [(GEOTimeCheckpoints *)self->_timeCheckpoints clearUnknownFields:1];
    [(GEOInstructionSet *)self->_instructionSet clearUnknownFields:1];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v17 = self->_guidanceEvents;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v31 objects:v44 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v32;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v32 != v20) {
            objc_enumerationMutation(v17);
          }
          [*(id *)(*((void *)&v31 + 1) + 8 * v21++) clearUnknownFields:1];
        }
        while (v19 != v21);
        uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v31 objects:v44 count:16];
      }
      while (v19);
    }

    [(GEOEVStateInfo *)self->_evStateInfo clearUnknownFields:1];
    [(GEOEVStepInfo *)self->_evInfo clearUnknownFields:1];
    [(GEOEVChargeInfo *)self->_chargingInfo clearUnknownFields:1];
    [(GEOPBTransitArtwork *)self->_artworkOverride clearUnknownFields:1];
    [(GEOStopWaypoint *)self->_stopWaypoint clearUnknownFields:1];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v22 = self->_roadDescriptions;
    uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v27 objects:v43 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v28;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v28 != v25) {
            objc_enumerationMutation(v22);
          }
          objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * v26++), "clearUnknownFields:", 1, (void)v27);
        }
        while (v24 != v26);
        uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v27 objects:v43 count:16];
      }
      while (v24);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeCheckpoints, 0);
  objc_storeStrong((id *)&self->_stopWaypoint, 0);
  objc_storeStrong((id *)&self->_signposts, 0);
  objc_storeStrong((id *)&self->_roadDescriptions, 0);
  objc_storeStrong((id *)&self->_notice, 0);
  objc_storeStrong((id *)&self->_maneuverNames, 0);
  objc_storeStrong((id *)&self->_instructions, 0);
  objc_storeStrong((id *)&self->_instructionSet, 0);
  objc_storeStrong((id *)&self->_guidanceEvents, 0);
  objc_storeStrong((id *)&self->_exitNumber, 0);
  objc_storeStrong((id *)&self->_evStateInfo, 0);
  objc_storeStrong((id *)&self->_evInfo, 0);
  objc_storeStrong((id *)&self->_chargingInfo, 0);
  objc_storeStrong((id *)&self->_artworkOverride, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (unsigned)maneuverEndIndex
{
  if ([(GEOStep *)self hasManeuverEndZilchIndex])
  {
    return [(GEOStep *)self maneuverEndZilchIndex];
  }
  else
  {
    unsigned int result = [(GEOStep *)self hasManeuverEndBasicIndex];
    if (result)
    {
      return [(GEOStep *)self maneuverEndBasicIndex];
    }
  }
  return result;
}

- (unsigned)maneuverStartIndex
{
  if ([(GEOStep *)self hasManeuverStartZilchIndex])
  {
    return [(GEOStep *)self maneuverStartZilchIndex];
  }
  else
  {
    return [(GEOStep *)self maneuverEndIndex];
  }
}

- (id)firstNameInfo
{
  v2 = [(GEOStep *)self maneuverNames];
  BOOL v3 = v2;
  if (v2 && [v2 count])
  {
    $EDB2BE274159A3E7688E4593D5E8813B v4 = [v3 objectAtIndex:0];
    uint64_t v5 = [v4 nameInfos];

    if ([v5 count])
    {
      id v6 = [v5 objectAtIndex:0];
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)intersectionNameInfo
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(GEOStep *)self signposts];
  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 signType] == 3)
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)shieldInfo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(GEOStep *)self firstNameInfo];
    if ([v5 hasShieldType])
    {
      uint64_t v6 = [v5 shieldType];
      uint64_t v7 = [v5 shield];
    }
    else
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      long long v8 = [(GEOStep *)self signposts];
      uint64_t v7 = (void *)[v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7)
      {
        uint64_t v9 = *(void *)v13;
        while (2)
        {
          for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v13 != v9) {
              objc_enumerationMutation(v8);
            }
            long long v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
            if ([v11 hasShieldType])
            {
              uint64_t v6 = [v11 shieldType];
              uint64_t v7 = [v11 shield];
              goto LABEL_14;
            }
          }
          uint64_t v7 = (void *)[v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }
      uint64_t v6 = 0x7FFFFFFFLL;
LABEL_14:
    }
    if (v6 == 0x7FFFFFFF || ![v7 length]) {
      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    }
    else {
      (*((void (**)(id, uint64_t, void *))v4 + 2))(v4, v6, v7);
    }
  }
}

- (BOOL)maneuverIsHighwayExit
{
  if ([(GEOStep *)self hasEndsOnFwy])
  {
    return [(GEOStep *)self endsOnFwy];
  }
  else
  {
    int v4 = [(GEOStep *)self maneuverType];
    if ((v4 - 11) <= 0x37) {
      return (0xE00000000C0001uLL >> (v4 - 11)) & 1;
    }
    else {
      return 0;
    }
  }
}

- (id)maneuverDescription
{
  uint64_t v2 = [(GEOStep *)self maneuverType];
  id v3 = @"NO_TURN";
  switch((int)v2)
  {
    case 0:
      break;
    case 1:
      id v3 = @"LEFT_TURN";
      break;
    case 2:
      id v3 = @"RIGHT_TURN";
      break;
    case 3:
      id v3 = @"STRAIGHT_AHEAD";
      break;
    case 4:
      id v3 = @"U_TURN";
      break;
    case 5:
      id v3 = @"FOLLOW_ROAD";
      break;
    case 6:
      id v3 = @"ENTER_ROUNDABOUT";
      break;
    case 7:
      id v3 = @"EXIT_ROUNDABOUT";
      break;
    case 11:
      id v3 = @"OFF_RAMP";
      break;
    case 12:
      id v3 = @"ON_RAMP";
      break;
    case 16:
      id v3 = @"ARRIVE_END_OF_NAVIGATION";
      break;
    case 17:
      id v3 = @"START_ROUTE";
      break;
    case 18:
      id v3 = @"ARRIVE_AT_DESTINATION";
      break;
    case 20:
      id v3 = @"KEEP_LEFT";
      break;
    case 21:
      id v3 = @"KEEP_RIGHT";
      break;
    case 22:
      id v3 = @"ENTER_FERRY";
      break;
    case 23:
      id v3 = @"EXIT_FERRY";
      break;
    case 24:
      id v3 = @"CHANGE_FERRY";
      break;
    case 25:
      id v3 = @"START_ROUTE_WITH_U_TURN";
      break;
    case 26:
      id v3 = @"U_TURN_AT_ROUNDABOUT";
      break;
    case 27:
      id v3 = @"LEFT_TURN_AT_END";
      break;
    case 28:
      id v3 = @"RIGHT_TURN_AT_END";
      break;
    case 29:
      id v3 = @"HIGHWAY_OFF_RAMP_LEFT";
      break;
    case 30:
      id v3 = @"HIGHWAY_OFF_RAMP_RIGHT";
      break;
    case 33:
      id v3 = @"ARRIVE_AT_DESTINATION_LEFT";
      break;
    case 34:
      id v3 = @"ARRIVE_AT_DESTINATION_RIGHT";
      break;
    case 35:
      id v3 = @"U_TURN_WHEN_POSSIBLE";
      break;
    case 39:
      id v3 = @"ARRIVE_END_OF_DIRECTIONS";
      break;
    case 41:
      id v3 = @"ROUNDABOUT_EXIT_1";
      break;
    case 42:
      id v3 = @"ROUNDABOUT_EXIT_2";
      break;
    case 43:
      id v3 = @"ROUNDABOUT_EXIT_3";
      break;
    case 44:
      id v3 = @"ROUNDABOUT_EXIT_4";
      break;
    case 45:
      id v3 = @"ROUNDABOUT_EXIT_5";
      break;
    case 46:
      id v3 = @"ROUNDABOUT_EXIT_6";
      break;
    case 47:
      id v3 = @"ROUNDABOUT_EXIT_7";
      break;
    case 48:
      id v3 = @"ROUNDABOUT_EXIT_8";
      break;
    case 49:
      id v3 = @"ROUNDABOUT_EXIT_9";
      break;
    case 50:
      id v3 = @"ROUNDABOUT_EXIT_10";
      break;
    case 51:
      id v3 = @"ROUNDABOUT_EXIT_11";
      break;
    case 52:
      id v3 = @"ROUNDABOUT_EXIT_12";
      break;
    case 53:
      id v3 = @"ROUNDABOUT_EXIT_13";
      break;
    case 54:
      id v3 = @"ROUNDABOUT_EXIT_14";
      break;
    case 55:
      id v3 = @"ROUNDABOUT_EXIT_15";
      break;
    case 56:
      id v3 = @"ROUNDABOUT_EXIT_16";
      break;
    case 57:
      id v3 = @"ROUNDABOUT_EXIT_17";
      break;
    case 58:
      id v3 = @"ROUNDABOUT_EXIT_18";
      break;
    case 59:
      id v3 = @"ROUNDABOUT_EXIT_19";
      break;
    case 60:
      id v3 = @"SHARP_LEFT_TURN";
      break;
    case 61:
      id v3 = @"SHARP_RIGHT_TURN";
      break;
    case 62:
      id v3 = @"SLIGHT_LEFT_TURN";
      break;
    case 63:
      id v3 = @"SLIGHT_RIGHT_TURN";
      break;
    case 64:
      id v3 = @"CHANGE_HIGHWAY";
      break;
    case 65:
      id v3 = @"CHANGE_HIGHWAY_LEFT";
      break;
    case 66:
      id v3 = @"CHANGE_HIGHWAY_RIGHT";
      break;
    case 80:
      id v3 = @"TOLL_STATION";
      break;
    case 81:
      id v3 = @"ENTER_TUNNEL";
      break;
    case 82:
      id v3 = @"WAYPOINT_STOP";
      break;
    case 83:
      id v3 = @"WAYPOINT_STOP_LEFT";
      break;
    case 84:
      id v3 = @"WAYPOINT_STOP_RIGHT";
      break;
    case 85:
      id v3 = @"RESUME_ROUTE";
      break;
    case 86:
      id v3 = @"RESUME_ROUTE_WITH_U_TURN";
      break;
    case 87:
      id v3 = @"CUSTOM";
      break;
    case 88:
      id v3 = @"TURN_AROUND";
      break;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v2);
      id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }

  return v3;
}

- (id)distanceForListView
{
  uint64_t v2 = [(GEOStep *)self instructionSet];
  id v3 = [v2 drivingWalkingListInstruction];
  int v4 = -[GEODrivingWalkingInstruction title](v3);

  return v4;
}

- (id)instructionsForListView
{
  uint64_t v2 = [(GEOStep *)self instructionSet];
  id v3 = [v2 drivingWalkingListInstruction];
  int v4 = -[GEODrivingWalkingInstruction normalCommands](v3);

  return v4;
}

- (id)distanceForSignView
{
  uint64_t v2 = [(GEOStep *)self instructionSet];
  id v3 = [v2 drivingWalkingSignInstruction];
  int v4 = -[GEODrivingWalkingInstruction title](v3);

  return v4;
}

- (id)mergeInstructionsForSignView
{
  uint64_t v2 = [(GEOStep *)self instructionSet];
  id v3 = [v2 drivingWalkingSignInstruction];
  int v4 = -[GEODrivingWalkingInstruction mergeCommands](v3);

  return v4;
}

- (id)continueInstructionsForSignView
{
  uint64_t v2 = [(GEOStep *)self instructionSet];
  id v3 = [v2 drivingWalkingSignInstruction];
  int v4 = -[GEODrivingWalkingInstruction continueCommands](v3);

  return v4;
}

- (id)normalInstructionsForSignView
{
  uint64_t v2 = [(GEOStep *)self instructionSet];
  id v3 = [v2 drivingWalkingSignInstruction];
  int v4 = -[GEODrivingWalkingInstruction normalCommands](v3);

  return v4;
}

- (id)proceedInstructionForSpoken
{
  uint64_t v2 = [(GEOStep *)self instructionSet];
  id v3 = [v2 drivingWalkingSpokenInstruction];
  int v4 = [v3 proceedStage];

  return v4;
}

- (id)continueInstructionForSpoken
{
  uint64_t v2 = [(GEOStep *)self instructionSet];
  id v3 = [v2 drivingWalkingSpokenInstruction];
  int v4 = [v3 continueStage];

  return v4;
}

- (id)initialInstructionForSpoken
{
  uint64_t v2 = [(GEOStep *)self instructionSet];
  id v3 = [v2 drivingWalkingSpokenInstruction];
  int v4 = [v3 initialStage];

  return v4;
}

- (id)prepareInstructionForSpoken
{
  uint64_t v2 = [(GEOStep *)self instructionSet];
  id v3 = [v2 drivingWalkingSpokenInstruction];
  int v4 = [v3 preparationStage];

  return v4;
}

- (id)executionInstructionsForSpoken
{
  uint64_t v2 = [(GEOStep *)self instructionSet];
  id v3 = [v2 drivingWalkingSpokenInstruction];
  int v4 = [v3 executionStages];

  return v4;
}

- (id)roadName
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v3 = [(GEOStep *)self maneuverType];
  if (v3 != 4)
  {
    int v4 = [(GEOStep *)self firstNameInfo];
    id v5 = [v4 name];

    if (v5 && [v5 length]) {
      goto LABEL_24;
    }
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [(GEOStep *)self signposts];
  id v5 = (id)[v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v6);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        long long v10 = [v9 name];
        long long v11 = v10;
        if (v10 && [v10 length])
        {
          int v12 = [v9 signType];
          if (v12 == 3)
          {
            if (v3 == 4) {
              goto LABEL_22;
            }
          }
          else if (v12 == 1 && v3 != 4)
          {
LABEL_22:
            id v5 = v11;

            goto LABEL_23;
          }
        }
      }
      id v5 = (id)[v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_23:

LABEL_24:

  return v5;
}

@end