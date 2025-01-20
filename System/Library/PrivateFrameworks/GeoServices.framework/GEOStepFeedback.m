@interface GEOStepFeedback
+ (BOOL)isValid:(id)a3;
- (BOOL)completedStep;
- (BOOL)hasCompletedStep;
- (BOOL)hasCompletionTimeStamp;
- (BOOL)hasEtaTrafficUpdateResponseId;
- (BOOL)hasEvStepInfo;
- (BOOL)hasExpectedTime;
- (BOOL)hasLightGuidance;
- (BOOL)hasManeuverType;
- (BOOL)hasRouteID;
- (BOOL)hasRouteIndex;
- (BOOL)hasRoutePaused;
- (BOOL)hasRouteResumed;
- (BOOL)hasStepEndPathPointIndex;
- (BOOL)hasStepEndPathPointOffset;
- (BOOL)hasStepID;
- (BOOL)hasStepZilch;
- (BOOL)hasTripID;
- (BOOL)hasWaypointRouteID;
- (BOOL)isEqual:(id)a3;
- (BOOL)lightGuidance;
- (BOOL)readFrom:(id)a3;
- (BOOL)routePaused;
- (BOOL)routeResumed;
- (GEOEVStepFeedbackInfo)evStepInfo;
- (GEOStepFeedback)init;
- (GEOStepFeedback)initWithData:(id)a3;
- (GEOStepFeedback)initWithDictionary:(id)a3;
- (GEOStepFeedback)initWithJSON:(id)a3;
- (NSData)etaTrafficUpdateResponseId;
- (NSData)routeID;
- (NSData)stepZilch;
- (NSData)tripID;
- (double)completionTimeStamp;
- (double)stepEndPathPointOffset;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)maneuverTypeAsString:(int)a3;
- (int)StringAsManeuverType:(id)a3;
- (int)maneuverType;
- (int)stepEndPathPointIndex;
- (unint64_t)hash;
- (unsigned)expectedTime;
- (unsigned)routeIndex;
- (unsigned)stepID;
- (unsigned)waypointRouteID;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readEtaTrafficUpdateResponseId;
- (void)_readEvStepInfo;
- (void)_readRouteID;
- (void)_readStepZilch;
- (void)_readTripID;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCompletedStep:(BOOL)a3;
- (void)setCompletionTimeStamp:(double)a3;
- (void)setEtaTrafficUpdateResponseId:(id)a3;
- (void)setEvStepInfo:(id)a3;
- (void)setExpectedTime:(unsigned int)a3;
- (void)setHasCompletedStep:(BOOL)a3;
- (void)setHasCompletionTimeStamp:(BOOL)a3;
- (void)setHasExpectedTime:(BOOL)a3;
- (void)setHasLightGuidance:(BOOL)a3;
- (void)setHasManeuverType:(BOOL)a3;
- (void)setHasRouteIndex:(BOOL)a3;
- (void)setHasRoutePaused:(BOOL)a3;
- (void)setHasRouteResumed:(BOOL)a3;
- (void)setHasStepEndPathPointIndex:(BOOL)a3;
- (void)setHasStepEndPathPointOffset:(BOOL)a3;
- (void)setHasStepID:(BOOL)a3;
- (void)setHasWaypointRouteID:(BOOL)a3;
- (void)setLightGuidance:(BOOL)a3;
- (void)setManeuverType:(int)a3;
- (void)setRouteID:(id)a3;
- (void)setRouteIndex:(unsigned int)a3;
- (void)setRoutePaused:(BOOL)a3;
- (void)setRouteResumed:(BOOL)a3;
- (void)setStepEndPathPointIndex:(int)a3;
- (void)setStepEndPathPointOffset:(double)a3;
- (void)setStepID:(unsigned int)a3;
- (void)setStepZilch:(id)a3;
- (void)setTripID:(id)a3;
- (void)setWaypointRouteID:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOStepFeedback

- (GEOStepFeedback)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOStepFeedback;
  v2 = [(GEOStepFeedback *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOStepFeedback)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOStepFeedback;
  v3 = [(GEOStepFeedback *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unsigned)stepID
{
  return self->_stepID;
}

- (void)setStepID:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x20020u;
  self->_stepID = a3;
}

- (void)setHasStepID:(BOOL)a3
{
  if (a3) {
    int v3 = 131104;
  }
  else {
    int v3 = 0x20000;
  }
  self->_flags = ($B5D046ADD8212AB5E9D0A6721CC205DC)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasStepID
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (double)completionTimeStamp
{
  return self->_completionTimeStamp;
}

- (void)setCompletionTimeStamp:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x20001u;
  self->_completionTimeStamp = a3;
}

- (void)setHasCompletionTimeStamp:(BOOL)a3
{
  self->_flags = ($B5D046ADD8212AB5E9D0A6721CC205DC)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x20000);
}

- (BOOL)hasCompletionTimeStamp
{
  return *(_DWORD *)&self->_flags & 1;
}

- (BOOL)completedStep
{
  return self->_completedStep;
}

- (void)setCompletedStep:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x20100u;
  self->_completedStep = a3;
}

- (void)setHasCompletedStep:(BOOL)a3
{
  if (a3) {
    int v3 = 131328;
  }
  else {
    int v3 = 0x20000;
  }
  self->_flags = ($B5D046ADD8212AB5E9D0A6721CC205DC)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v3);
}

- (BOOL)hasCompletedStep
{
  return *((unsigned char *)&self->_flags + 1) & 1;
}

- (void)_readRouteID
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 113) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOStepFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRouteID_tags_1109);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasRouteID
{
  return self->_routeID != 0;
}

- (NSData)routeID
{
  -[GEOStepFeedback _readRouteID]((uint64_t)self);
  routeID = self->_routeID;

  return routeID;
}

- (void)setRouteID:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x24000u;
  objc_storeStrong((id *)&self->_routeID, a3);
}

- (unsigned)routeIndex
{
  return self->_routeIndex;
}

- (void)setRouteIndex:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x20010u;
  self->_routeIndex = a3;
}

- (void)setHasRouteIndex:(BOOL)a3
{
  if (a3) {
    int v3 = 131088;
  }
  else {
    int v3 = 0x20000;
  }
  self->_flags = ($B5D046ADD8212AB5E9D0A6721CC205DC)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasRouteIndex
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (BOOL)lightGuidance
{
  return self->_lightGuidance;
}

- (void)setLightGuidance:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x20200u;
  self->_lightGuidance = a3;
}

- (void)setHasLightGuidance:(BOOL)a3
{
  if (a3) {
    int v3 = 131584;
  }
  else {
    int v3 = 0x20000;
  }
  self->_flags = ($B5D046ADD8212AB5E9D0A6721CC205DC)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v3);
}

- (BOOL)hasLightGuidance
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (void)_readTripID
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 114) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOStepFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTripID_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasTripID
{
  return self->_tripID != 0;
}

- (NSData)tripID
{
  -[GEOStepFeedback _readTripID]((uint64_t)self);
  tripID = self->_tripID;

  return tripID;
}

- (void)setTripID:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x30000u;
  objc_storeStrong((id *)&self->_tripID, a3);
}

- (BOOL)routePaused
{
  return self->_routePaused;
}

- (void)setRoutePaused:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x20400u;
  self->_routePaused = a3;
}

- (void)setHasRoutePaused:(BOOL)a3
{
  if (a3) {
    int v3 = 132096;
  }
  else {
    int v3 = 0x20000;
  }
  self->_flags = ($B5D046ADD8212AB5E9D0A6721CC205DC)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v3);
}

- (BOOL)hasRoutePaused
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (BOOL)routeResumed
{
  return self->_routeResumed;
}

- (void)setRouteResumed:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x20800u;
  self->_routeResumed = a3;
}

- (void)setHasRouteResumed:(BOOL)a3
{
  if (a3) {
    int v3 = 133120;
  }
  else {
    int v3 = 0x20000;
  }
  self->_flags = ($B5D046ADD8212AB5E9D0A6721CC205DC)(*(_DWORD *)&self->_flags & 0xFFFFF7FF | v3);
}

- (BOOL)hasRouteResumed
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (void)_readEvStepInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 113) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOStepFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEvStepInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasEvStepInfo
{
  return self->_evStepInfo != 0;
}

- (GEOEVStepFeedbackInfo)evStepInfo
{
  -[GEOStepFeedback _readEvStepInfo]((uint64_t)self);
  evStepInfo = self->_evStepInfo;

  return evStepInfo;
}

- (void)setEvStepInfo:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x22000u;
  objc_storeStrong((id *)&self->_evStepInfo, a3);
}

- (unsigned)waypointRouteID
{
  return self->_waypointRouteID;
}

- (void)setWaypointRouteID:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x20080u;
  self->_waypointRouteID = a3;
}

- (void)setHasWaypointRouteID:(BOOL)a3
{
  if (a3) {
    int v3 = 131200;
  }
  else {
    int v3 = 0x20000;
  }
  self->_flags = ($B5D046ADD8212AB5E9D0A6721CC205DC)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v3);
}

- (BOOL)hasWaypointRouteID
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (int)maneuverType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $B5D046ADD8212AB5E9D0A6721CC205DC flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 8) != 0) {
    return self->_maneuverType;
  }
  else {
    return 0;
  }
}

- (void)setManeuverType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x20008u;
  self->_maneuverType = a3;
}

- (void)setHasManeuverType:(BOOL)a3
{
  if (a3) {
    int v3 = 131080;
  }
  else {
    int v3 = 0x20000;
  }
  self->_$B5D046ADD8212AB5E9D0A6721CC205DC flags = ($B5D046ADD8212AB5E9D0A6721CC205DC)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasManeuverType
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
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

- (unsigned)expectedTime
{
  return self->_expectedTime;
}

- (void)setExpectedTime:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x20004u;
  self->_expectedTime = a3;
}

- (void)setHasExpectedTime:(BOOL)a3
{
  if (a3) {
    int v3 = 131076;
  }
  else {
    int v3 = 0x20000;
  }
  self->_$B5D046ADD8212AB5E9D0A6721CC205DC flags = ($B5D046ADD8212AB5E9D0A6721CC205DC)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasExpectedTime
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (void)_readStepZilch
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 113) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOStepFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStepZilch_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasStepZilch
{
  return self->_stepZilch != 0;
}

- (NSData)stepZilch
{
  -[GEOStepFeedback _readStepZilch]((uint64_t)self);
  stepZilch = self->_stepZilch;

  return stepZilch;
}

- (void)setStepZilch:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x28000u;
  objc_storeStrong((id *)&self->_stepZilch, a3);
}

- (int)stepEndPathPointIndex
{
  return self->_stepEndPathPointIndex;
}

- (void)setStepEndPathPointIndex:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x20040u;
  self->_stepEndPathPointIndex = a3;
}

- (void)setHasStepEndPathPointIndex:(BOOL)a3
{
  if (a3) {
    int v3 = 131136;
  }
  else {
    int v3 = 0x20000;
  }
  self->_$B5D046ADD8212AB5E9D0A6721CC205DC flags = ($B5D046ADD8212AB5E9D0A6721CC205DC)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasStepEndPathPointIndex
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (double)stepEndPathPointOffset
{
  return self->_stepEndPathPointOffset;
}

- (void)setStepEndPathPointOffset:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x20002u;
  self->_stepEndPathPointOffset = a3;
}

- (void)setHasStepEndPathPointOffset:(BOOL)a3
{
  if (a3) {
    int v3 = 131074;
  }
  else {
    int v3 = 0x20000;
  }
  self->_$B5D046ADD8212AB5E9D0A6721CC205DC flags = ($B5D046ADD8212AB5E9D0A6721CC205DC)(*(_DWORD *)&self->_flags & 0xFFFDFFFD | v3);
}

- (BOOL)hasStepEndPathPointOffset
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (void)_readEtaTrafficUpdateResponseId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 113) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOStepFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEtaTrafficUpdateResponseId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasEtaTrafficUpdateResponseId
{
  return self->_etaTrafficUpdateResponseId != 0;
}

- (NSData)etaTrafficUpdateResponseId
{
  -[GEOStepFeedback _readEtaTrafficUpdateResponseId]((uint64_t)self);
  etaTrafficUpdateResponseId = self->_etaTrafficUpdateResponseId;

  return etaTrafficUpdateResponseId;
}

- (void)setEtaTrafficUpdateResponseId:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x21000u;
  objc_storeStrong((id *)&self->_etaTrafficUpdateResponseId, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOStepFeedback;
  int v4 = [(GEOStepFeedback *)&v8 description];
  v5 = [(GEOStepFeedback *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOStepFeedback _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_67;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  int v5 = *(_DWORD *)(a1 + 112);
  if ((v5 & 0x20) != 0)
  {
    objc_super v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 96)];
    [v4 setObject:v6 forKey:@"stepID"];

    int v5 = *(_DWORD *)(a1 + 112);
  }
  if (v5)
  {
    objc_super v7 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
    [v4 setObject:v7 forKey:@"completionTimeStamp"];

    int v5 = *(_DWORD *)(a1 + 112);
  }
  if ((v5 & 0x100) != 0)
  {
    objc_super v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 108)];
    [v4 setObject:v8 forKey:@"completedStep"];
  }
  v9 = [(id)a1 routeID];
  v10 = v9;
  if (v9)
  {
    if (a2)
    {
      v11 = [v9 base64EncodedStringWithOptions:0];
      [v4 setObject:v11 forKey:@"routeID"];
    }
    else
    {
      [v4 setObject:v9 forKey:@"routeID"];
    }
  }

  int v12 = *(_DWORD *)(a1 + 112);
  if ((v12 & 0x10) != 0)
  {
    v13 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 92)];
    [v4 setObject:v13 forKey:@"routeIndex"];

    int v12 = *(_DWORD *)(a1 + 112);
  }
  if ((v12 & 0x200) != 0)
  {
    v14 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 109)];
    if (a2) {
      v15 = @"lightGuidance";
    }
    else {
      v15 = @"light_guidance";
    }
    [v4 setObject:v14 forKey:v15];
  }
  v16 = [(id)a1 tripID];
  v17 = v16;
  if (v16)
  {
    if (a2)
    {
      v18 = [v16 base64EncodedStringWithOptions:0];
      [v4 setObject:v18 forKey:@"tripID"];
    }
    else
    {
      [v4 setObject:v16 forKey:@"tripID"];
    }
  }

  int v19 = *(_DWORD *)(a1 + 112);
  if ((v19 & 0x400) != 0)
  {
    v20 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 110)];
    if (a2) {
      v21 = @"routePaused";
    }
    else {
      v21 = @"route_paused";
    }
    [v4 setObject:v20 forKey:v21];

    int v19 = *(_DWORD *)(a1 + 112);
  }
  if ((v19 & 0x800) != 0)
  {
    v22 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 111)];
    if (a2) {
      v23 = @"routeResumed";
    }
    else {
      v23 = @"route_resumed";
    }
    [v4 setObject:v22 forKey:v23];
  }
  v24 = [(id)a1 evStepInfo];
  v25 = v24;
  if (v24)
  {
    if (a2)
    {
      v26 = [v24 jsonRepresentation];
      v27 = @"evStepInfo";
    }
    else
    {
      v26 = [v24 dictionaryRepresentation];
      v27 = @"ev_step_info";
    }
    [v4 setObject:v26 forKey:v27];
  }
  int v28 = *(_DWORD *)(a1 + 112);
  if ((v28 & 0x80) == 0)
  {
    if ((v28 & 8) == 0) {
      goto LABEL_40;
    }
LABEL_49:
    v35 = @"NO_TURN";
    switch(*(_DWORD *)(a1 + 88))
    {
      case 0:
        break;
      case 1:
        v35 = @"LEFT_TURN";
        break;
      case 2:
        v35 = @"RIGHT_TURN";
        break;
      case 3:
        v35 = @"STRAIGHT_AHEAD";
        break;
      case 4:
        v35 = @"U_TURN";
        break;
      case 5:
        v35 = @"FOLLOW_ROAD";
        break;
      case 6:
        v35 = @"ENTER_ROUNDABOUT";
        break;
      case 7:
        v35 = @"EXIT_ROUNDABOUT";
        break;
      case 0xB:
        v35 = @"OFF_RAMP";
        break;
      case 0xC:
        v35 = @"ON_RAMP";
        break;
      case 0x10:
        v35 = @"ARRIVE_END_OF_NAVIGATION";
        break;
      case 0x11:
        v35 = @"START_ROUTE";
        break;
      case 0x12:
        v35 = @"ARRIVE_AT_DESTINATION";
        break;
      case 0x14:
        v35 = @"KEEP_LEFT";
        break;
      case 0x15:
        v35 = @"KEEP_RIGHT";
        break;
      case 0x16:
        v35 = @"ENTER_FERRY";
        break;
      case 0x17:
        v35 = @"EXIT_FERRY";
        break;
      case 0x18:
        v35 = @"CHANGE_FERRY";
        break;
      case 0x19:
        v35 = @"START_ROUTE_WITH_U_TURN";
        break;
      case 0x1A:
        v35 = @"U_TURN_AT_ROUNDABOUT";
        break;
      case 0x1B:
        v35 = @"LEFT_TURN_AT_END";
        break;
      case 0x1C:
        v35 = @"RIGHT_TURN_AT_END";
        break;
      case 0x1D:
        v35 = @"HIGHWAY_OFF_RAMP_LEFT";
        break;
      case 0x1E:
        v35 = @"HIGHWAY_OFF_RAMP_RIGHT";
        break;
      case 0x21:
        v35 = @"ARRIVE_AT_DESTINATION_LEFT";
        break;
      case 0x22:
        v35 = @"ARRIVE_AT_DESTINATION_RIGHT";
        break;
      case 0x23:
        v35 = @"U_TURN_WHEN_POSSIBLE";
        break;
      case 0x27:
        v35 = @"ARRIVE_END_OF_DIRECTIONS";
        break;
      case 0x29:
        v35 = @"ROUNDABOUT_EXIT_1";
        break;
      case 0x2A:
        v35 = @"ROUNDABOUT_EXIT_2";
        break;
      case 0x2B:
        v35 = @"ROUNDABOUT_EXIT_3";
        break;
      case 0x2C:
        v35 = @"ROUNDABOUT_EXIT_4";
        break;
      case 0x2D:
        v35 = @"ROUNDABOUT_EXIT_5";
        break;
      case 0x2E:
        v35 = @"ROUNDABOUT_EXIT_6";
        break;
      case 0x2F:
        v35 = @"ROUNDABOUT_EXIT_7";
        break;
      case 0x30:
        v35 = @"ROUNDABOUT_EXIT_8";
        break;
      case 0x31:
        v35 = @"ROUNDABOUT_EXIT_9";
        break;
      case 0x32:
        v35 = @"ROUNDABOUT_EXIT_10";
        break;
      case 0x33:
        v35 = @"ROUNDABOUT_EXIT_11";
        break;
      case 0x34:
        v35 = @"ROUNDABOUT_EXIT_12";
        break;
      case 0x35:
        v35 = @"ROUNDABOUT_EXIT_13";
        break;
      case 0x36:
        v35 = @"ROUNDABOUT_EXIT_14";
        break;
      case 0x37:
        v35 = @"ROUNDABOUT_EXIT_15";
        break;
      case 0x38:
        v35 = @"ROUNDABOUT_EXIT_16";
        break;
      case 0x39:
        v35 = @"ROUNDABOUT_EXIT_17";
        break;
      case 0x3A:
        v35 = @"ROUNDABOUT_EXIT_18";
        break;
      case 0x3B:
        v35 = @"ROUNDABOUT_EXIT_19";
        break;
      case 0x3C:
        v35 = @"SHARP_LEFT_TURN";
        break;
      case 0x3D:
        v35 = @"SHARP_RIGHT_TURN";
        break;
      case 0x3E:
        v35 = @"SLIGHT_LEFT_TURN";
        break;
      case 0x3F:
        v35 = @"SLIGHT_RIGHT_TURN";
        break;
      case 0x40:
        v35 = @"CHANGE_HIGHWAY";
        break;
      case 0x41:
        v35 = @"CHANGE_HIGHWAY_LEFT";
        break;
      case 0x42:
        v35 = @"CHANGE_HIGHWAY_RIGHT";
        break;
      case 0x50:
        v35 = @"TOLL_STATION";
        break;
      case 0x51:
        v35 = @"ENTER_TUNNEL";
        break;
      case 0x52:
        v35 = @"WAYPOINT_STOP";
        break;
      case 0x53:
        v35 = @"WAYPOINT_STOP_LEFT";
        break;
      case 0x54:
        v35 = @"WAYPOINT_STOP_RIGHT";
        break;
      case 0x55:
        v35 = @"RESUME_ROUTE";
        break;
      case 0x56:
        v35 = @"RESUME_ROUTE_WITH_U_TURN";
        break;
      case 0x57:
        v35 = @"CUSTOM";
        break;
      case 0x58:
        v35 = @"TURN_AROUND";
        break;
      default:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 88));
        v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
    }
    if (a2) {
      v45 = @"maneuverType";
    }
    else {
      v45 = @"maneuver_type";
    }
    [v4 setObject:v35 forKey:v45];

    if ((*(_DWORD *)(a1 + 112) & 4) == 0) {
      goto LABEL_45;
    }
    goto LABEL_41;
  }
  v34 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 104)];
  [v4 setObject:v34 forKey:@"waypointRouteID"];

  int v28 = *(_DWORD *)(a1 + 112);
  if ((v28 & 8) != 0) {
    goto LABEL_49;
  }
LABEL_40:
  if ((v28 & 4) != 0)
  {
LABEL_41:
    v29 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 84)];
    if (a2) {
      v30 = @"expectedTime";
    }
    else {
      v30 = @"expected_time";
    }
    [v4 setObject:v29 forKey:v30];
  }
LABEL_45:
  v31 = [(id)a1 stepZilch];
  v32 = v31;
  if (v31)
  {
    if (a2)
    {
      v33 = [v31 base64EncodedStringWithOptions:0];
      [v4 setObject:v33 forKey:@"stepZilch"];
    }
    else
    {
      [v4 setObject:v31 forKey:@"step_zilch"];
    }
  }

  int v36 = *(_DWORD *)(a1 + 112);
  if ((v36 & 0x40) != 0)
  {
    v37 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 100)];
    if (a2) {
      v38 = @"stepEndPathPointIndex";
    }
    else {
      v38 = @"step_end_path_point_index";
    }
    [v4 setObject:v37 forKey:v38];

    int v36 = *(_DWORD *)(a1 + 112);
  }
  if ((v36 & 2) != 0)
  {
    v39 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
    if (a2) {
      v40 = @"stepEndPathPointOffset";
    }
    else {
      v40 = @"step_end_path_point_offset";
    }
    [v4 setObject:v39 forKey:v40];
  }
  v41 = [(id)a1 etaTrafficUpdateResponseId];
  v42 = v41;
  if (v41)
  {
    if (a2)
    {
      v43 = [v41 base64EncodedStringWithOptions:0];
      [v4 setObject:v43 forKey:@"etaTrafficUpdateResponseId"];
    }
    else
    {
      [v4 setObject:v41 forKey:@"eta_traffic_update_response_id"];
    }
  }

LABEL_67:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOStepFeedback _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOStepFeedback)initWithDictionary:(id)a3
{
  return (GEOStepFeedback *)-[GEOStepFeedback _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_201;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_201;
  }
  objc_super v6 = [v5 objectForKeyedSubscript:@"stepID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setStepID:", objc_msgSend(v6, "unsignedIntValue"));
  }

  objc_super v7 = [v5 objectForKeyedSubscript:@"completionTimeStamp"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v7 doubleValue];
    objc_msgSend(a1, "setCompletionTimeStamp:");
  }

  objc_super v8 = [v5 objectForKeyedSubscript:@"completedStep"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setCompletedStep:", objc_msgSend(v8, "BOOLValue"));
  }

  v9 = [v5 objectForKeyedSubscript:@"routeID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v9 options:0];
    [a1 setRouteID:v10];
  }
  v11 = [v5 objectForKeyedSubscript:@"routeIndex"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setRouteIndex:", objc_msgSend(v11, "unsignedIntValue"));
  }

  if (a3) {
    int v12 = @"lightGuidance";
  }
  else {
    int v12 = @"light_guidance";
  }
  v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setLightGuidance:", objc_msgSend(v13, "BOOLValue"));
  }

  v14 = [v5 objectForKeyedSubscript:@"tripID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v14 options:0];
    [a1 setTripID:v15];
  }
  if (a3) {
    v16 = @"routePaused";
  }
  else {
    v16 = @"route_paused";
  }
  v17 = [v5 objectForKeyedSubscript:v16];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setRoutePaused:", objc_msgSend(v17, "BOOLValue"));
  }

  if (a3) {
    v18 = @"routeResumed";
  }
  else {
    v18 = @"route_resumed";
  }
  int v19 = [v5 objectForKeyedSubscript:v18];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setRouteResumed:", objc_msgSend(v19, "BOOLValue"));
  }

  if (a3) {
    v20 = @"evStepInfo";
  }
  else {
    v20 = @"ev_step_info";
  }
  v21 = [v5 objectForKeyedSubscript:v20];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v22 = [GEOEVStepFeedbackInfo alloc];
    if (a3) {
      uint64_t v23 = [(GEOEVStepFeedbackInfo *)v22 initWithJSON:v21];
    }
    else {
      uint64_t v23 = [(GEOEVStepFeedbackInfo *)v22 initWithDictionary:v21];
    }
    v24 = (void *)v23;
    [a1 setEvStepInfo:v23];
  }
  v25 = [v5 objectForKeyedSubscript:@"waypointRouteID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setWaypointRouteID:", objc_msgSend(v25, "unsignedIntValue"));
  }

  if (a3) {
    v26 = @"maneuverType";
  }
  else {
    v26 = @"maneuver_type";
  }
  v27 = [v5 objectForKeyedSubscript:v26];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v28 = v27;
    if ([v28 isEqualToString:@"NO_TURN"])
    {
      uint64_t v29 = 0;
    }
    else if ([v28 isEqualToString:@"LEFT_TURN"])
    {
      uint64_t v29 = 1;
    }
    else if ([v28 isEqualToString:@"RIGHT_TURN"])
    {
      uint64_t v29 = 2;
    }
    else if ([v28 isEqualToString:@"STRAIGHT_AHEAD"])
    {
      uint64_t v29 = 3;
    }
    else if ([v28 isEqualToString:@"U_TURN"])
    {
      uint64_t v29 = 4;
    }
    else if ([v28 isEqualToString:@"FOLLOW_ROAD"])
    {
      uint64_t v29 = 5;
    }
    else if ([v28 isEqualToString:@"ENTER_ROUNDABOUT"])
    {
      uint64_t v29 = 6;
    }
    else if ([v28 isEqualToString:@"EXIT_ROUNDABOUT"])
    {
      uint64_t v29 = 7;
    }
    else if ([v28 isEqualToString:@"OFF_RAMP"])
    {
      uint64_t v29 = 11;
    }
    else if ([v28 isEqualToString:@"ON_RAMP"])
    {
      uint64_t v29 = 12;
    }
    else if ([v28 isEqualToString:@"ARRIVE_END_OF_NAVIGATION"])
    {
      uint64_t v29 = 16;
    }
    else if ([v28 isEqualToString:@"START_ROUTE"])
    {
      uint64_t v29 = 17;
    }
    else if ([v28 isEqualToString:@"ARRIVE_AT_DESTINATION"])
    {
      uint64_t v29 = 18;
    }
    else if ([v28 isEqualToString:@"KEEP_LEFT"])
    {
      uint64_t v29 = 20;
    }
    else if ([v28 isEqualToString:@"KEEP_RIGHT"])
    {
      uint64_t v29 = 21;
    }
    else if ([v28 isEqualToString:@"ENTER_FERRY"])
    {
      uint64_t v29 = 22;
    }
    else if ([v28 isEqualToString:@"EXIT_FERRY"])
    {
      uint64_t v29 = 23;
    }
    else if ([v28 isEqualToString:@"CHANGE_FERRY"])
    {
      uint64_t v29 = 24;
    }
    else if ([v28 isEqualToString:@"START_ROUTE_WITH_U_TURN"])
    {
      uint64_t v29 = 25;
    }
    else if ([v28 isEqualToString:@"U_TURN_AT_ROUNDABOUT"])
    {
      uint64_t v29 = 26;
    }
    else if ([v28 isEqualToString:@"LEFT_TURN_AT_END"])
    {
      uint64_t v29 = 27;
    }
    else if ([v28 isEqualToString:@"RIGHT_TURN_AT_END"])
    {
      uint64_t v29 = 28;
    }
    else if ([v28 isEqualToString:@"HIGHWAY_OFF_RAMP_LEFT"])
    {
      uint64_t v29 = 29;
    }
    else if ([v28 isEqualToString:@"HIGHWAY_OFF_RAMP_RIGHT"])
    {
      uint64_t v29 = 30;
    }
    else if ([v28 isEqualToString:@"ARRIVE_AT_DESTINATION_LEFT"])
    {
      uint64_t v29 = 33;
    }
    else if ([v28 isEqualToString:@"ARRIVE_AT_DESTINATION_RIGHT"])
    {
      uint64_t v29 = 34;
    }
    else if ([v28 isEqualToString:@"U_TURN_WHEN_POSSIBLE"])
    {
      uint64_t v29 = 35;
    }
    else if ([v28 isEqualToString:@"ARRIVE_END_OF_DIRECTIONS"])
    {
      uint64_t v29 = 39;
    }
    else if ([v28 isEqualToString:@"ROUNDABOUT_EXIT_1"])
    {
      uint64_t v29 = 41;
    }
    else if ([v28 isEqualToString:@"ROUNDABOUT_EXIT_2"])
    {
      uint64_t v29 = 42;
    }
    else if ([v28 isEqualToString:@"ROUNDABOUT_EXIT_3"])
    {
      uint64_t v29 = 43;
    }
    else if ([v28 isEqualToString:@"ROUNDABOUT_EXIT_4"])
    {
      uint64_t v29 = 44;
    }
    else if ([v28 isEqualToString:@"ROUNDABOUT_EXIT_5"])
    {
      uint64_t v29 = 45;
    }
    else if ([v28 isEqualToString:@"ROUNDABOUT_EXIT_6"])
    {
      uint64_t v29 = 46;
    }
    else if ([v28 isEqualToString:@"ROUNDABOUT_EXIT_7"])
    {
      uint64_t v29 = 47;
    }
    else if ([v28 isEqualToString:@"ROUNDABOUT_EXIT_8"])
    {
      uint64_t v29 = 48;
    }
    else if ([v28 isEqualToString:@"ROUNDABOUT_EXIT_9"])
    {
      uint64_t v29 = 49;
    }
    else if ([v28 isEqualToString:@"ROUNDABOUT_EXIT_10"])
    {
      uint64_t v29 = 50;
    }
    else if ([v28 isEqualToString:@"ROUNDABOUT_EXIT_11"])
    {
      uint64_t v29 = 51;
    }
    else if ([v28 isEqualToString:@"ROUNDABOUT_EXIT_12"])
    {
      uint64_t v29 = 52;
    }
    else if ([v28 isEqualToString:@"ROUNDABOUT_EXIT_13"])
    {
      uint64_t v29 = 53;
    }
    else if ([v28 isEqualToString:@"ROUNDABOUT_EXIT_14"])
    {
      uint64_t v29 = 54;
    }
    else if ([v28 isEqualToString:@"ROUNDABOUT_EXIT_15"])
    {
      uint64_t v29 = 55;
    }
    else if ([v28 isEqualToString:@"ROUNDABOUT_EXIT_16"])
    {
      uint64_t v29 = 56;
    }
    else if ([v28 isEqualToString:@"ROUNDABOUT_EXIT_17"])
    {
      uint64_t v29 = 57;
    }
    else if ([v28 isEqualToString:@"ROUNDABOUT_EXIT_18"])
    {
      uint64_t v29 = 58;
    }
    else if ([v28 isEqualToString:@"ROUNDABOUT_EXIT_19"])
    {
      uint64_t v29 = 59;
    }
    else if ([v28 isEqualToString:@"SHARP_LEFT_TURN"])
    {
      uint64_t v29 = 60;
    }
    else if ([v28 isEqualToString:@"SHARP_RIGHT_TURN"])
    {
      uint64_t v29 = 61;
    }
    else if ([v28 isEqualToString:@"SLIGHT_LEFT_TURN"])
    {
      uint64_t v29 = 62;
    }
    else if ([v28 isEqualToString:@"SLIGHT_RIGHT_TURN"])
    {
      uint64_t v29 = 63;
    }
    else if ([v28 isEqualToString:@"CHANGE_HIGHWAY"])
    {
      uint64_t v29 = 64;
    }
    else if ([v28 isEqualToString:@"CHANGE_HIGHWAY_LEFT"])
    {
      uint64_t v29 = 65;
    }
    else if ([v28 isEqualToString:@"CHANGE_HIGHWAY_RIGHT"])
    {
      uint64_t v29 = 66;
    }
    else if ([v28 isEqualToString:@"TOLL_STATION"])
    {
      uint64_t v29 = 80;
    }
    else if ([v28 isEqualToString:@"ENTER_TUNNEL"])
    {
      uint64_t v29 = 81;
    }
    else if ([v28 isEqualToString:@"WAYPOINT_STOP"])
    {
      uint64_t v29 = 82;
    }
    else if ([v28 isEqualToString:@"WAYPOINT_STOP_LEFT"])
    {
      uint64_t v29 = 83;
    }
    else if ([v28 isEqualToString:@"WAYPOINT_STOP_RIGHT"])
    {
      uint64_t v29 = 84;
    }
    else if ([v28 isEqualToString:@"RESUME_ROUTE"])
    {
      uint64_t v29 = 85;
    }
    else if ([v28 isEqualToString:@"RESUME_ROUTE_WITH_U_TURN"])
    {
      uint64_t v29 = 86;
    }
    else if ([v28 isEqualToString:@"CUSTOM"])
    {
      uint64_t v29 = 87;
    }
    else if ([v28 isEqualToString:@"TURN_AROUND"])
    {
      uint64_t v29 = 88;
    }
    else
    {
      uint64_t v29 = 0;
    }

    goto LABEL_174;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v29 = [v27 intValue];
LABEL_174:
    [a1 setManeuverType:v29];
  }

  if (a3) {
    v30 = @"expectedTime";
  }
  else {
    v30 = @"expected_time";
  }
  v31 = [v5 objectForKeyedSubscript:v30];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setExpectedTime:", objc_msgSend(v31, "unsignedIntValue"));
  }

  if (a3) {
    v32 = @"stepZilch";
  }
  else {
    v32 = @"step_zilch";
  }
  v33 = [v5 objectForKeyedSubscript:v32];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v34 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v33 options:0];
    [a1 setStepZilch:v34];
  }
  if (a3) {
    v35 = @"stepEndPathPointIndex";
  }
  else {
    v35 = @"step_end_path_point_index";
  }
  int v36 = [v5 objectForKeyedSubscript:v35];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setStepEndPathPointIndex:", objc_msgSend(v36, "intValue"));
  }

  if (a3) {
    v37 = @"stepEndPathPointOffset";
  }
  else {
    v37 = @"step_end_path_point_offset";
  }
  v38 = [v5 objectForKeyedSubscript:v37];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v38 doubleValue];
    objc_msgSend(a1, "setStepEndPathPointOffset:");
  }

  if (a3) {
    v39 = @"etaTrafficUpdateResponseId";
  }
  else {
    v39 = @"eta_traffic_update_response_id";
  }
  v40 = [v5 objectForKeyedSubscript:v39];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v41 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v40 options:0];
    [a1 setEtaTrafficUpdateResponseId:v41];
  }
LABEL_201:

  return a1;
}

- (GEOStepFeedback)initWithJSON:(id)a3
{
  return (GEOStepFeedback *)-[GEOStepFeedback _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_1186;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1187;
    }
    GEOStepFeedbackReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOEVStepFeedbackInfo *)self->_evStepInfo readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOStepFeedbackIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOStepFeedbackReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_DWORD *)&self->_flags & 0x3F000) == 0)
    {
      v10 = self->_reader;
      objc_sync_enter(v10);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v12 writeData:v11];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v10);
      goto LABEL_40;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOStepFeedback *)self readAll:0];
  $B5D046ADD8212AB5E9D0A6721CC205DC flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field();
    $B5D046ADD8212AB5E9D0A6721CC205DC flags = self->_flags;
    if ((*(unsigned char *)&flags & 1) == 0)
    {
LABEL_5:
      if ((*(_WORD *)&flags & 0x100) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&flags & 1) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  if ((*(_DWORD *)&self->_flags & 0x100) != 0) {
LABEL_6:
  }
    PBDataWriterWriteBOOLField();
LABEL_7:
  if (self->_routeID) {
    PBDataWriterWriteDataField();
  }
  $B5D046ADD8212AB5E9D0A6721CC205DC v6 = self->_flags;
  if ((*(unsigned char *)&v6 & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    $B5D046ADD8212AB5E9D0A6721CC205DC v6 = self->_flags;
  }
  if ((*(_WORD *)&v6 & 0x200) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_tripID) {
    PBDataWriterWriteDataField();
  }
  $B5D046ADD8212AB5E9D0A6721CC205DC v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    $B5D046ADD8212AB5E9D0A6721CC205DC v7 = self->_flags;
  }
  if ((*(_WORD *)&v7 & 0x800) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_evStepInfo) {
    PBDataWriterWriteSubmessage();
  }
  $B5D046ADD8212AB5E9D0A6721CC205DC v8 = self->_flags;
  if ((*(unsigned char *)&v8 & 0x80) == 0)
  {
    if ((*(unsigned char *)&v8 & 8) == 0) {
      goto LABEL_23;
    }
LABEL_37:
    PBDataWriterWriteInt32Field();
    if ((*(_DWORD *)&self->_flags & 4) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  PBDataWriterWriteUint32Field();
  $B5D046ADD8212AB5E9D0A6721CC205DC v8 = self->_flags;
  if ((*(unsigned char *)&v8 & 8) != 0) {
    goto LABEL_37;
  }
LABEL_23:
  if ((*(unsigned char *)&v8 & 4) != 0) {
LABEL_24:
  }
    PBDataWriterWriteUint32Field();
LABEL_25:
  if (self->_stepZilch) {
    PBDataWriterWriteDataField();
  }
  $B5D046ADD8212AB5E9D0A6721CC205DC v9 = self->_flags;
  if ((*(unsigned char *)&v9 & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    $B5D046ADD8212AB5E9D0A6721CC205DC v9 = self->_flags;
  }
  if ((*(unsigned char *)&v9 & 2) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_etaTrafficUpdateResponseId) {
    PBDataWriterWriteDataField();
  }
LABEL_40:
}

- (void)copyTo:(id)a3
{
  v10 = (id *)a3;
  [(GEOStepFeedback *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v10 + 1, self->_reader);
  *((_DWORD *)v10 + 18) = self->_readerMarkPos;
  *((_DWORD *)v10 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  int v4 = v10;
  $B5D046ADD8212AB5E9D0A6721CC205DC flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    *((_DWORD *)v10 + 24) = self->_stepID;
    *((_DWORD *)v10 + 28) |= 0x20u;
    $B5D046ADD8212AB5E9D0A6721CC205DC flags = self->_flags;
    if ((*(unsigned char *)&flags & 1) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&flags & 0x100) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&flags & 1) == 0)
  {
    goto LABEL_3;
  }
  v10[2] = *(id *)&self->_completionTimeStamp;
  *((_DWORD *)v10 + 28) |= 1u;
  if ((*(_DWORD *)&self->_flags & 0x100) != 0)
  {
LABEL_4:
    *((unsigned char *)v10 + 108) = self->_completedStep;
    *((_DWORD *)v10 + 28) |= 0x100u;
  }
LABEL_5:
  if (self->_routeID)
  {
    objc_msgSend(v10, "setRouteID:");
    int v4 = v10;
  }
  $B5D046ADD8212AB5E9D0A6721CC205DC v6 = self->_flags;
  if ((*(unsigned char *)&v6 & 0x10) != 0)
  {
    *((_DWORD *)v4 + 23) = self->_routeIndex;
    *((_DWORD *)v4 + 28) |= 0x10u;
    $B5D046ADD8212AB5E9D0A6721CC205DC v6 = self->_flags;
  }
  if ((*(_WORD *)&v6 & 0x200) != 0)
  {
    *((unsigned char *)v4 + 109) = self->_lightGuidance;
    *((_DWORD *)v4 + 28) |= 0x200u;
  }
  if (self->_tripID)
  {
    objc_msgSend(v10, "setTripID:");
    int v4 = v10;
  }
  $B5D046ADD8212AB5E9D0A6721CC205DC v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x400) != 0)
  {
    *((unsigned char *)v4 + 110) = self->_routePaused;
    *((_DWORD *)v4 + 28) |= 0x400u;
    $B5D046ADD8212AB5E9D0A6721CC205DC v7 = self->_flags;
  }
  if ((*(_WORD *)&v7 & 0x800) != 0)
  {
    *((unsigned char *)v4 + 111) = self->_routeResumed;
    *((_DWORD *)v4 + 28) |= 0x800u;
  }
  if (self->_evStepInfo)
  {
    objc_msgSend(v10, "setEvStepInfo:");
    int v4 = v10;
  }
  $B5D046ADD8212AB5E9D0A6721CC205DC v8 = self->_flags;
  if ((*(unsigned char *)&v8 & 0x80) != 0)
  {
    *((_DWORD *)v4 + 26) = self->_waypointRouteID;
    *((_DWORD *)v4 + 28) |= 0x80u;
    $B5D046ADD8212AB5E9D0A6721CC205DC v8 = self->_flags;
    if ((*(unsigned char *)&v8 & 8) == 0)
    {
LABEL_21:
      if ((*(unsigned char *)&v8 & 4) == 0) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)&v8 & 8) == 0)
  {
    goto LABEL_21;
  }
  *((_DWORD *)v4 + 22) = self->_maneuverType;
  *((_DWORD *)v4 + 28) |= 8u;
  if ((*(_DWORD *)&self->_flags & 4) != 0)
  {
LABEL_22:
    *((_DWORD *)v4 + 21) = self->_expectedTime;
    *((_DWORD *)v4 + 28) |= 4u;
  }
LABEL_23:
  if (self->_stepZilch)
  {
    objc_msgSend(v10, "setStepZilch:");
    int v4 = v10;
  }
  $B5D046ADD8212AB5E9D0A6721CC205DC v9 = self->_flags;
  if ((*(unsigned char *)&v9 & 0x40) != 0)
  {
    *((_DWORD *)v4 + 25) = self->_stepEndPathPointIndex;
    *((_DWORD *)v4 + 28) |= 0x40u;
    $B5D046ADD8212AB5E9D0A6721CC205DC v9 = self->_flags;
  }
  if ((*(unsigned char *)&v9 & 2) != 0)
  {
    v4[6] = *(id *)&self->_stepEndPathPointOffset;
    *((_DWORD *)v4 + 28) |= 2u;
  }
  if (self->_etaTrafficUpdateResponseId)
  {
    objc_msgSend(v10, "setEtaTrafficUpdateResponseId:");
    int v4 = v10;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    $B5D046ADD8212AB5E9D0A6721CC205DC v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 2) & 2) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOStepFeedbackReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_26;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOStepFeedback *)self readAll:0];
  $B5D046ADD8212AB5E9D0A6721CC205DC flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_stepID;
    *(_DWORD *)(v5 + 112) |= 0x20u;
    $B5D046ADD8212AB5E9D0A6721CC205DC flags = self->_flags;
    if ((*(unsigned char *)&flags & 1) == 0)
    {
LABEL_7:
      if ((*(_WORD *)&flags & 0x100) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&flags & 1) == 0)
  {
    goto LABEL_7;
  }
  *(double *)(v5 + 16) = self->_completionTimeStamp;
  *(_DWORD *)(v5 + 112) |= 1u;
  if ((*(_DWORD *)&self->_flags & 0x100) != 0)
  {
LABEL_8:
    *(unsigned char *)(v5 + 108) = self->_completedStep;
    *(_DWORD *)(v5 + 112) |= 0x100u;
  }
LABEL_9:
  uint64_t v10 = [(NSData *)self->_routeID copyWithZone:a3];
  v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  $B5D046ADD8212AB5E9D0A6721CC205DC v12 = self->_flags;
  if ((*(unsigned char *)&v12 & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 92) = self->_routeIndex;
    *(_DWORD *)(v5 + 112) |= 0x10u;
    $B5D046ADD8212AB5E9D0A6721CC205DC v12 = self->_flags;
  }
  if ((*(_WORD *)&v12 & 0x200) != 0)
  {
    *(unsigned char *)(v5 + 109) = self->_lightGuidance;
    *(_DWORD *)(v5 + 112) |= 0x200u;
  }
  uint64_t v13 = [(NSData *)self->_tripID copyWithZone:a3];
  v14 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v13;

  $B5D046ADD8212AB5E9D0A6721CC205DC v15 = self->_flags;
  if ((*(_WORD *)&v15 & 0x400) != 0)
  {
    *(unsigned char *)(v5 + 110) = self->_routePaused;
    *(_DWORD *)(v5 + 112) |= 0x400u;
    $B5D046ADD8212AB5E9D0A6721CC205DC v15 = self->_flags;
  }
  if ((*(_WORD *)&v15 & 0x800) != 0)
  {
    *(unsigned char *)(v5 + 111) = self->_routeResumed;
    *(_DWORD *)(v5 + 112) |= 0x800u;
  }
  id v16 = [(GEOEVStepFeedbackInfo *)self->_evStepInfo copyWithZone:a3];
  v17 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v16;

  $B5D046ADD8212AB5E9D0A6721CC205DC v18 = self->_flags;
  if ((*(unsigned char *)&v18 & 0x80) == 0)
  {
    if ((*(unsigned char *)&v18 & 8) == 0) {
      goto LABEL_19;
    }
LABEL_31:
    *(_DWORD *)(v5 + 88) = self->_maneuverType;
    *(_DWORD *)(v5 + 112) |= 8u;
    if ((*(_DWORD *)&self->_flags & 4) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  *(_DWORD *)(v5 + 104) = self->_waypointRouteID;
  *(_DWORD *)(v5 + 112) |= 0x80u;
  $B5D046ADD8212AB5E9D0A6721CC205DC v18 = self->_flags;
  if ((*(unsigned char *)&v18 & 8) != 0) {
    goto LABEL_31;
  }
LABEL_19:
  if ((*(unsigned char *)&v18 & 4) != 0)
  {
LABEL_20:
    *(_DWORD *)(v5 + 84) = self->_expectedTime;
    *(_DWORD *)(v5 + 112) |= 4u;
  }
LABEL_21:
  uint64_t v19 = [(NSData *)self->_stepZilch copyWithZone:a3];
  v20 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v19;

  $B5D046ADD8212AB5E9D0A6721CC205DC v21 = self->_flags;
  if ((*(unsigned char *)&v21 & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 100) = self->_stepEndPathPointIndex;
    *(_DWORD *)(v5 + 112) |= 0x40u;
    $B5D046ADD8212AB5E9D0A6721CC205DC v21 = self->_flags;
  }
  if ((*(unsigned char *)&v21 & 2) != 0)
  {
    *(double *)(v5 + 48) = self->_stepEndPathPointOffset;
    *(_DWORD *)(v5 + 112) |= 2u;
  }
  uint64_t v22 = [(NSData *)self->_etaTrafficUpdateResponseId copyWithZone:a3];
  id v8 = *(id *)(v5 + 24);
  *(void *)(v5 + 24) = v22;
LABEL_26:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_88;
  }
  [(GEOStepFeedback *)self readAll:1];
  [v4 readAll:1];
  $B5D046ADD8212AB5E9D0A6721CC205DC flags = self->_flags;
  int v6 = *((_DWORD *)v4 + 28);
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_stepID != *((_DWORD *)v4 + 24)) {
      goto LABEL_88;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_88;
  }
  if (*(unsigned char *)&flags)
  {
    if ((v6 & 1) == 0 || self->_completionTimeStamp != *((double *)v4 + 2)) {
      goto LABEL_88;
    }
  }
  else if (v6)
  {
    goto LABEL_88;
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0) {
      goto LABEL_88;
    }
    if (self->_completedStep)
    {
      if (!*((unsigned char *)v4 + 108)) {
        goto LABEL_88;
      }
    }
    else if (*((unsigned char *)v4 + 108))
    {
      goto LABEL_88;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_88;
  }
  routeID = self->_routeID;
  if ((unint64_t)routeID | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](routeID, "isEqual:")) {
      goto LABEL_88;
    }
    $B5D046ADD8212AB5E9D0A6721CC205DC flags = self->_flags;
    int v6 = *((_DWORD *)v4 + 28);
  }
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_routeIndex != *((_DWORD *)v4 + 23)) {
      goto LABEL_88;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_88;
  }
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0) {
      goto LABEL_88;
    }
    if (self->_lightGuidance)
    {
      if (!*((unsigned char *)v4 + 109)) {
        goto LABEL_88;
      }
    }
    else if (*((unsigned char *)v4 + 109))
    {
      goto LABEL_88;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_88;
  }
  tripID = self->_tripID;
  if ((unint64_t)tripID | *((void *)v4 + 8))
  {
    if (!-[NSData isEqual:](tripID, "isEqual:")) {
      goto LABEL_88;
    }
    $B5D046ADD8212AB5E9D0A6721CC205DC flags = self->_flags;
    int v6 = *((_DWORD *)v4 + 28);
  }
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0) {
      goto LABEL_88;
    }
    if (self->_routePaused)
    {
      if (!*((unsigned char *)v4 + 110)) {
        goto LABEL_88;
      }
    }
    else if (*((unsigned char *)v4 + 110))
    {
      goto LABEL_88;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_88;
  }
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0) {
      goto LABEL_88;
    }
    if (self->_routeResumed)
    {
      if (!*((unsigned char *)v4 + 111)) {
        goto LABEL_88;
      }
    }
    else if (*((unsigned char *)v4 + 111))
    {
      goto LABEL_88;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_88;
  }
  evStepInfo = self->_evStepInfo;
  if ((unint64_t)evStepInfo | *((void *)v4 + 4))
  {
    if (!-[GEOEVStepFeedbackInfo isEqual:](evStepInfo, "isEqual:")) {
      goto LABEL_88;
    }
    $B5D046ADD8212AB5E9D0A6721CC205DC flags = self->_flags;
    int v6 = *((_DWORD *)v4 + 28);
  }
  if ((*(unsigned char *)&flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_waypointRouteID != *((_DWORD *)v4 + 26)) {
      goto LABEL_88;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_88;
  }
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_maneuverType != *((_DWORD *)v4 + 22)) {
      goto LABEL_88;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_88;
  }
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_expectedTime != *((_DWORD *)v4 + 21)) {
      goto LABEL_88;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_88;
  }
  stepZilch = self->_stepZilch;
  if ((unint64_t)stepZilch | *((void *)v4 + 7))
  {
    if (-[NSData isEqual:](stepZilch, "isEqual:"))
    {
      $B5D046ADD8212AB5E9D0A6721CC205DC flags = self->_flags;
      int v6 = *((_DWORD *)v4 + 28);
      goto LABEL_76;
    }
LABEL_88:
    char v12 = 0;
    goto LABEL_89;
  }
LABEL_76:
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_stepEndPathPointIndex != *((_DWORD *)v4 + 25)) {
      goto LABEL_88;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_88;
  }
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_stepEndPathPointOffset != *((double *)v4 + 6)) {
      goto LABEL_88;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_88;
  }
  etaTrafficUpdateResponseId = self->_etaTrafficUpdateResponseId;
  if ((unint64_t)etaTrafficUpdateResponseId | *((void *)v4 + 3)) {
    char v12 = -[NSData isEqual:](etaTrafficUpdateResponseId, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_89:

  return v12;
}

- (unint64_t)hash
{
  [(GEOStepFeedback *)self readAll:1];
  $B5D046ADD8212AB5E9D0A6721CC205DC flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    uint64_t v33 = 2654435761 * self->_stepID;
    if (*(unsigned char *)&flags) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v8 = 0;
    goto LABEL_11;
  }
  uint64_t v33 = 0;
  if ((*(unsigned char *)&flags & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double completionTimeStamp = self->_completionTimeStamp;
  double v5 = -completionTimeStamp;
  if (completionTimeStamp >= 0.0) {
    double v5 = self->_completionTimeStamp;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_11:
  unint64_t v32 = v8;
  if ((*(_WORD *)&flags & 0x100) != 0) {
    uint64_t v31 = 2654435761 * self->_completedStep;
  }
  else {
    uint64_t v31 = 0;
  }
  uint64_t v30 = [(NSData *)self->_routeID hash];
  $B5D046ADD8212AB5E9D0A6721CC205DC v9 = self->_flags;
  if ((*(unsigned char *)&v9 & 0x10) != 0)
  {
    uint64_t v29 = 2654435761 * self->_routeIndex;
    if ((*(_WORD *)&v9 & 0x200) != 0) {
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v29 = 0;
    if ((*(_WORD *)&v9 & 0x200) != 0)
    {
LABEL_16:
      uint64_t v28 = 2654435761 * self->_lightGuidance;
      goto LABEL_19;
    }
  }
  uint64_t v28 = 0;
LABEL_19:
  uint64_t v27 = [(NSData *)self->_tripID hash];
  $B5D046ADD8212AB5E9D0A6721CC205DC v10 = self->_flags;
  if ((*(_WORD *)&v10 & 0x400) != 0)
  {
    uint64_t v11 = 2654435761 * self->_routePaused;
    if ((*(_WORD *)&v10 & 0x800) != 0) {
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v11 = 0;
    if ((*(_WORD *)&v10 & 0x800) != 0)
    {
LABEL_21:
      uint64_t v12 = 2654435761 * self->_routeResumed;
      goto LABEL_24;
    }
  }
  uint64_t v12 = 0;
LABEL_24:
  unint64_t v13 = [(GEOEVStepFeedbackInfo *)self->_evStepInfo hash];
  $B5D046ADD8212AB5E9D0A6721CC205DC v14 = self->_flags;
  if ((*(unsigned char *)&v14 & 0x80) == 0)
  {
    uint64_t v15 = 0;
    if ((*(unsigned char *)&v14 & 8) != 0) {
      goto LABEL_26;
    }
LABEL_29:
    uint64_t v16 = 0;
    if ((*(unsigned char *)&v14 & 4) != 0) {
      goto LABEL_27;
    }
    goto LABEL_30;
  }
  uint64_t v15 = 2654435761 * self->_waypointRouteID;
  if ((*(unsigned char *)&v14 & 8) == 0) {
    goto LABEL_29;
  }
LABEL_26:
  uint64_t v16 = 2654435761 * self->_maneuverType;
  if ((*(unsigned char *)&v14 & 4) != 0)
  {
LABEL_27:
    uint64_t v17 = 2654435761 * self->_expectedTime;
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v17 = 0;
LABEL_31:
  uint64_t v18 = [(NSData *)self->_stepZilch hash];
  $B5D046ADD8212AB5E9D0A6721CC205DC v19 = self->_flags;
  if ((*(unsigned char *)&v19 & 0x40) != 0)
  {
    uint64_t v20 = 2654435761 * self->_stepEndPathPointIndex;
    if ((*(unsigned char *)&v19 & 2) != 0) {
      goto LABEL_33;
    }
LABEL_38:
    unint64_t v25 = 0;
    return v32 ^ v33 ^ v31 ^ v29 ^ v28 ^ v30 ^ v27 ^ v11 ^ v12 ^ v13 ^ v15 ^ v16 ^ v17 ^ v18 ^ v20 ^ v25 ^ [(NSData *)self->_etaTrafficUpdateResponseId hash];
  }
  uint64_t v20 = 0;
  if ((*(unsigned char *)&v19 & 2) == 0) {
    goto LABEL_38;
  }
LABEL_33:
  double stepEndPathPointOffset = self->_stepEndPathPointOffset;
  double v22 = -stepEndPathPointOffset;
  if (stepEndPathPointOffset >= 0.0) {
    double v22 = self->_stepEndPathPointOffset;
  }
  long double v23 = floor(v22 + 0.5);
  double v24 = (v22 - v23) * 1.84467441e19;
  unint64_t v25 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
  if (v24 >= 0.0)
  {
    if (v24 > 0.0) {
      v25 += (unint64_t)v24;
    }
  }
  else
  {
    v25 -= (unint64_t)fabs(v24);
  }
  return v32 ^ v33 ^ v31 ^ v29 ^ v28 ^ v30 ^ v27 ^ v11 ^ v12 ^ v13 ^ v15 ^ v16 ^ v17 ^ v18 ^ v20 ^ v25 ^ [(NSData *)self->_etaTrafficUpdateResponseId hash];
}

- (void)mergeFrom:(id)a3
{
  id v12 = a3;
  [v12 readAll:0];
  id v4 = v12;
  int v5 = *((_DWORD *)v12 + 28);
  if ((v5 & 0x20) != 0)
  {
    self->_stepID = *((_DWORD *)v12 + 24);
    *(_DWORD *)&self->_flags |= 0x20u;
    int v5 = *((_DWORD *)v12 + 28);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 0x100) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v5 & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_double completionTimeStamp = *((double *)v12 + 2);
  *(_DWORD *)&self->_flags |= 1u;
  if ((*((_DWORD *)v12 + 28) & 0x100) != 0)
  {
LABEL_4:
    self->_completedStep = *((unsigned char *)v12 + 108);
    *(_DWORD *)&self->_flags |= 0x100u;
  }
LABEL_5:
  if (*((void *)v12 + 5))
  {
    [(GEOStepFeedback *)self setRouteID:"setRouteID:"];
    id v4 = v12;
  }
  int v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 0x10) != 0)
  {
    self->_routeIndex = *((_DWORD *)v4 + 23);
    *(_DWORD *)&self->_flags |= 0x10u;
    int v6 = *((_DWORD *)v4 + 28);
  }
  if ((v6 & 0x200) != 0)
  {
    self->_lightGuidance = *((unsigned char *)v4 + 109);
    *(_DWORD *)&self->_flags |= 0x200u;
  }
  if (*((void *)v4 + 8))
  {
    -[GEOStepFeedback setTripID:](self, "setTripID:");
    id v4 = v12;
  }
  int v7 = *((_DWORD *)v4 + 28);
  if ((v7 & 0x400) != 0)
  {
    self->_routePaused = *((unsigned char *)v4 + 110);
    *(_DWORD *)&self->_flags |= 0x400u;
    int v7 = *((_DWORD *)v4 + 28);
  }
  if ((v7 & 0x800) != 0)
  {
    self->_routeResumed = *((unsigned char *)v4 + 111);
    *(_DWORD *)&self->_flags |= 0x800u;
  }
  evStepInfo = self->_evStepInfo;
  uint64_t v9 = *((void *)v4 + 4);
  if (evStepInfo)
  {
    if (!v9) {
      goto LABEL_26;
    }
    -[GEOEVStepFeedbackInfo mergeFrom:](evStepInfo, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_26;
    }
    -[GEOStepFeedback setEvStepInfo:](self, "setEvStepInfo:");
  }
  id v4 = v12;
LABEL_26:
  int v10 = *((_DWORD *)v4 + 28);
  if ((v10 & 0x80) != 0)
  {
    self->_waypointRouteID = *((_DWORD *)v4 + 26);
    *(_DWORD *)&self->_flags |= 0x80u;
    int v10 = *((_DWORD *)v4 + 28);
    if ((v10 & 8) == 0)
    {
LABEL_28:
      if ((v10 & 4) == 0) {
        goto LABEL_30;
      }
      goto LABEL_29;
    }
  }
  else if ((v10 & 8) == 0)
  {
    goto LABEL_28;
  }
  self->_maneuverType = *((_DWORD *)v4 + 22);
  *(_DWORD *)&self->_flags |= 8u;
  if ((*((_DWORD *)v4 + 28) & 4) != 0)
  {
LABEL_29:
    self->_expectedTime = *((_DWORD *)v4 + 21);
    *(_DWORD *)&self->_flags |= 4u;
  }
LABEL_30:
  if (*((void *)v4 + 7))
  {
    -[GEOStepFeedback setStepZilch:](self, "setStepZilch:");
    id v4 = v12;
  }
  int v11 = *((_DWORD *)v4 + 28);
  if ((v11 & 0x40) != 0)
  {
    self->_stepEndPathPointIndex = *((_DWORD *)v4 + 25);
    *(_DWORD *)&self->_flags |= 0x40u;
    int v11 = *((_DWORD *)v4 + 28);
  }
  if ((v11 & 2) != 0)
  {
    self->_double stepEndPathPointOffset = *((double *)v4 + 6);
    *(_DWORD *)&self->_flags |= 2u;
  }
  if (*((void *)v4 + 3))
  {
    -[GEOStepFeedback setEtaTrafficUpdateResponseId:](self, "setEtaTrafficUpdateResponseId:");
    id v4 = v12;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tripID, 0);
  objc_storeStrong((id *)&self->_stepZilch, 0);
  objc_storeStrong((id *)&self->_routeID, 0);
  objc_storeStrong((id *)&self->_evStepInfo, 0);
  objc_storeStrong((id *)&self->_etaTrafficUpdateResponseId, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end