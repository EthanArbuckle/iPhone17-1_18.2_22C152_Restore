@interface GEORPDirectionsEvent
+ (BOOL)isValid:(id)a3;
- (BOOL)hasErrorCode;
- (BOOL)hasErrorDomain;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasOccurrenceLatLng;
- (BOOL)hasOccurrenceResponseIndex;
- (BOOL)hasOccurrenceRouteId;
- (BOOL)hasOccurrenceStepIndex;
- (BOOL)hasSwitchedToResponseIndex;
- (BOOL)hasSwitchedToRouteId;
- (BOOL)hasSynthesizedStepInstructions;
- (BOOL)hasSynthesizedStepManeuverType;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLatLng)occurrenceLatLng;
- (GEORPDirectionsEvent)init;
- (GEORPDirectionsEvent)initWithData:(id)a3;
- (GEORPDirectionsEvent)initWithDictionary:(id)a3;
- (GEORPDirectionsEvent)initWithJSON:(id)a3;
- (NSData)occurrenceRouteId;
- (NSData)switchedToRouteId;
- (NSString)errorDomain;
- (NSString)synthesizedStepInstructions;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)synthesizedStepManeuverTypeAsString:(int)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsSynthesizedStepManeuverType:(id)a3;
- (int)StringAsType:(id)a3;
- (int)synthesizedStepManeuverType;
- (int)type;
- (int64_t)errorCode;
- (unint64_t)hash;
- (unsigned)occurrenceResponseIndex;
- (unsigned)occurrenceStepIndex;
- (unsigned)switchedToResponseIndex;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readErrorDomain;
- (void)_readOccurrenceLatLng;
- (void)_readOccurrenceRouteId;
- (void)_readSwitchedToRouteId;
- (void)_readSynthesizedStepInstructions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setErrorCode:(int64_t)a3;
- (void)setErrorDomain:(id)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasOccurrenceResponseIndex:(BOOL)a3;
- (void)setHasOccurrenceStepIndex:(BOOL)a3;
- (void)setHasSwitchedToResponseIndex:(BOOL)a3;
- (void)setHasSynthesizedStepManeuverType:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setOccurrenceLatLng:(id)a3;
- (void)setOccurrenceResponseIndex:(unsigned int)a3;
- (void)setOccurrenceRouteId:(id)a3;
- (void)setOccurrenceStepIndex:(unsigned int)a3;
- (void)setSwitchedToResponseIndex:(unsigned int)a3;
- (void)setSwitchedToRouteId:(id)a3;
- (void)setSynthesizedStepInstructions:(id)a3;
- (void)setSynthesizedStepManeuverType:(int)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPDirectionsEvent

- (GEORPDirectionsEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPDirectionsEvent;
  v2 = [(GEORPDirectionsEvent *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPDirectionsEvent)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPDirectionsEvent;
  v3 = [(GEORPDirectionsEvent *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)type
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x20) != 0) {
    return self->_type;
  }
  else {
    return 1;
  }
}

- (void)setType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x820u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2080;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasType
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (id)typeAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53E6AC0[a3 - 1];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SWITCHED_TO_ROUTE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ERROR"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SYNTHESIZED_STEP"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (unsigned)occurrenceResponseIndex
{
  return self->_occurrenceResponseIndex;
}

- (void)setOccurrenceResponseIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x802u;
  self->_occurrenceResponseIndex = a3;
}

- (void)setHasOccurrenceResponseIndex:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2050;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasOccurrenceResponseIndex
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)_readOccurrenceRouteId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 96) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPDirectionsEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOccurrenceRouteId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasOccurrenceRouteId
{
  return self->_occurrenceRouteId != 0;
}

- (NSData)occurrenceRouteId
{
  -[GEORPDirectionsEvent _readOccurrenceRouteId]((uint64_t)self);
  occurrenceRouteId = self->_occurrenceRouteId;

  return occurrenceRouteId;
}

- (void)setOccurrenceRouteId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x900u;
  objc_storeStrong((id *)&self->_occurrenceRouteId, a3);
}

- (unsigned)occurrenceStepIndex
{
  return self->_occurrenceStepIndex;
}

- (void)setOccurrenceStepIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x804u;
  self->_occurrenceStepIndex = a3;
}

- (void)setHasOccurrenceStepIndex:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2052;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasOccurrenceStepIndex
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (void)_readOccurrenceLatLng
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 96) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPDirectionsEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOccurrenceLatLng_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasOccurrenceLatLng
{
  return self->_occurrenceLatLng != 0;
}

- (GEOLatLng)occurrenceLatLng
{
  -[GEORPDirectionsEvent _readOccurrenceLatLng]((uint64_t)self);
  occurrenceLatLng = self->_occurrenceLatLng;

  return occurrenceLatLng;
}

- (void)setOccurrenceLatLng:(id)a3
{
  *(_WORD *)&self->_flags |= 0x880u;
  objc_storeStrong((id *)&self->_occurrenceLatLng, a3);
}

- (unsigned)switchedToResponseIndex
{
  return self->_switchedToResponseIndex;
}

- (void)setSwitchedToResponseIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x808u;
  self->_switchedToResponseIndex = a3;
}

- (void)setHasSwitchedToResponseIndex:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2056;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasSwitchedToResponseIndex
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (void)_readSwitchedToRouteId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 96) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPDirectionsEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSwitchedToRouteId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasSwitchedToRouteId
{
  return self->_switchedToRouteId != 0;
}

- (NSData)switchedToRouteId
{
  -[GEORPDirectionsEvent _readSwitchedToRouteId]((uint64_t)self);
  switchedToRouteId = self->_switchedToRouteId;

  return switchedToRouteId;
}

- (void)setSwitchedToRouteId:(id)a3
{
  *(_WORD *)&self->_flags |= 0xA00u;
  objc_storeStrong((id *)&self->_switchedToRouteId, a3);
}

- (int)synthesizedStepManeuverType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x10) != 0) {
    return self->_synthesizedStepManeuverType;
  }
  else {
    return 0;
  }
}

- (void)setSynthesizedStepManeuverType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x810u;
  self->_synthesizedStepManeuverType = a3;
}

- (void)setHasSynthesizedStepManeuverType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2064;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasSynthesizedStepManeuverType
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (id)synthesizedStepManeuverTypeAsString:(int)a3
{
  int v4 = @"NO_TURN";
  switch(a3)
  {
    case 0:
      goto LABEL_24;
    case 1:
      int v4 = @"LEFT_TURN";
      break;
    case 2:
      int v4 = @"RIGHT_TURN";
      break;
    case 3:
      int v4 = @"STRAIGHT_AHEAD";
      break;
    case 4:
      int v4 = @"U_TURN";
      break;
    case 5:
      int v4 = @"FOLLOW_ROAD";
      break;
    case 6:
      int v4 = @"ENTER_ROUNDABOUT";
      break;
    case 7:
      int v4 = @"EXIT_ROUNDABOUT";
      break;
    case 11:
      int v4 = @"OFF_RAMP";
      break;
    case 12:
      int v4 = @"ON_RAMP";
      break;
    case 16:
      int v4 = @"ARRIVE_END_OF_NAVIGATION";
      break;
    case 17:
      int v4 = @"START_ROUTE";
      break;
    case 18:
      int v4 = @"ARRIVE_AT_DESTINATION";
      break;
    case 20:
      int v4 = @"KEEP_LEFT";
      break;
    case 21:
      int v4 = @"KEEP_RIGHT";
      break;
    case 22:
      int v4 = @"ENTER_FERRY";
      break;
    case 23:
      int v4 = @"EXIT_FERRY";
      break;
    case 24:
      int v4 = @"CHANGE_FERRY";
      break;
    case 25:
      int v4 = @"START_ROUTE_WITH_U_TURN";
      break;
    case 26:
      int v4 = @"U_TURN_AT_ROUNDABOUT";
      break;
    case 27:
      int v4 = @"LEFT_TURN_AT_END";
      break;
    case 28:
      int v4 = @"RIGHT_TURN_AT_END";
      break;
    case 29:
      int v4 = @"HIGHWAY_OFF_RAMP_LEFT";
      break;
    case 30:
      int v4 = @"HIGHWAY_OFF_RAMP_RIGHT";
      break;
    case 33:
      int v4 = @"ARRIVE_AT_DESTINATION_LEFT";
      break;
    case 34:
      int v4 = @"ARRIVE_AT_DESTINATION_RIGHT";
      break;
    case 35:
      int v4 = @"U_TURN_WHEN_POSSIBLE";
      break;
    case 39:
      int v4 = @"ARRIVE_END_OF_DIRECTIONS";
      break;
    case 41:
      int v4 = @"ROUNDABOUT_EXIT_1";
      break;
    case 42:
      int v4 = @"ROUNDABOUT_EXIT_2";
      break;
    case 43:
      int v4 = @"ROUNDABOUT_EXIT_3";
      break;
    case 44:
      int v4 = @"ROUNDABOUT_EXIT_4";
      break;
    case 45:
      int v4 = @"ROUNDABOUT_EXIT_5";
      break;
    case 46:
      int v4 = @"ROUNDABOUT_EXIT_6";
      break;
    case 47:
      int v4 = @"ROUNDABOUT_EXIT_7";
      break;
    case 48:
      int v4 = @"ROUNDABOUT_EXIT_8";
      break;
    case 49:
      int v4 = @"ROUNDABOUT_EXIT_9";
      break;
    case 50:
      int v4 = @"ROUNDABOUT_EXIT_10";
      break;
    case 51:
      int v4 = @"ROUNDABOUT_EXIT_11";
      break;
    case 52:
      int v4 = @"ROUNDABOUT_EXIT_12";
      break;
    case 53:
      int v4 = @"ROUNDABOUT_EXIT_13";
      break;
    case 54:
      int v4 = @"ROUNDABOUT_EXIT_14";
      break;
    case 55:
      int v4 = @"ROUNDABOUT_EXIT_15";
      break;
    case 56:
      int v4 = @"ROUNDABOUT_EXIT_16";
      break;
    case 57:
      int v4 = @"ROUNDABOUT_EXIT_17";
      break;
    case 58:
      int v4 = @"ROUNDABOUT_EXIT_18";
      break;
    case 59:
      int v4 = @"ROUNDABOUT_EXIT_19";
      break;
    case 60:
      int v4 = @"SHARP_LEFT_TURN";
      break;
    case 61:
      int v4 = @"SHARP_RIGHT_TURN";
      break;
    case 62:
      int v4 = @"SLIGHT_LEFT_TURN";
      break;
    case 63:
      int v4 = @"SLIGHT_RIGHT_TURN";
      break;
    case 64:
      int v4 = @"CHANGE_HIGHWAY";
      break;
    case 65:
      int v4 = @"CHANGE_HIGHWAY_LEFT";
      break;
    case 66:
      int v4 = @"CHANGE_HIGHWAY_RIGHT";
      break;
    case 80:
      int v4 = @"TOLL_STATION";
      break;
    case 81:
      int v4 = @"ENTER_TUNNEL";
      break;
    case 82:
      int v4 = @"WAYPOINT_STOP";
      break;
    case 83:
      int v4 = @"WAYPOINT_STOP_LEFT";
      break;
    case 84:
      int v4 = @"WAYPOINT_STOP_RIGHT";
      break;
    case 85:
      int v4 = @"RESUME_ROUTE";
      break;
    case 86:
      int v4 = @"RESUME_ROUTE_WITH_U_TURN";
      break;
    case 87:
      int v4 = @"CUSTOM";
      break;
    case 88:
      int v4 = @"TURN_AROUND";
      break;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_24:
      break;
  }
  return v4;
}

- (int)StringAsSynthesizedStepManeuverType:(id)a3
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

- (void)_readSynthesizedStepInstructions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 96) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPDirectionsEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSynthesizedStepInstructions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasSynthesizedStepInstructions
{
  return self->_synthesizedStepInstructions != 0;
}

- (NSString)synthesizedStepInstructions
{
  -[GEORPDirectionsEvent _readSynthesizedStepInstructions]((uint64_t)self);
  synthesizedStepInstructions = self->_synthesizedStepInstructions;

  return synthesizedStepInstructions;
}

- (void)setSynthesizedStepInstructions:(id)a3
{
  *(_WORD *)&self->_flags |= 0xC00u;
  objc_storeStrong((id *)&self->_synthesizedStepInstructions, a3);
}

- (void)_readErrorDomain
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 96) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPDirectionsEventReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readErrorDomain_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
}

- (NSString)errorDomain
{
  -[GEORPDirectionsEvent _readErrorDomain]((uint64_t)self);
  errorDomain = self->_errorDomain;

  return errorDomain;
}

- (void)setErrorDomain:(id)a3
{
  *(_WORD *)&self->_flags |= 0x840u;
  objc_storeStrong((id *)&self->_errorDomain, a3);
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  *(_WORD *)&self->_flags |= 0x801u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x800;
}

- (BOOL)hasErrorCode
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPDirectionsEvent;
  int v4 = [(GEORPDirectionsEvent *)&v8 description];
  v5 = [(GEORPDirectionsEvent *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPDirectionsEvent _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    __int16 v5 = *(_WORD *)(a1 + 96);
    if ((v5 & 0x20) != 0)
    {
      unsigned int v6 = *(_DWORD *)(a1 + 92) - 1;
      if (v6 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 92));
        objc_super v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v7 = off_1E53E6AC0[v6];
      }
      [v4 setObject:v7 forKey:@"type"];

      __int16 v5 = *(_WORD *)(a1 + 96);
    }
    if ((v5 & 2) != 0)
    {
      objc_super v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 76)];
      if (a2) {
        v9 = @"occurrenceResponseIndex";
      }
      else {
        v9 = @"occurrence_response_index";
      }
      [v4 setObject:v8 forKey:v9];
    }
    v10 = [(id)a1 occurrenceRouteId];
    v11 = v10;
    if (v10)
    {
      if (a2)
      {
        v12 = [v10 base64EncodedStringWithOptions:0];
        [v4 setObject:v12 forKey:@"occurrenceRouteId"];
      }
      else
      {
        [v4 setObject:v10 forKey:@"occurrence_route_id"];
      }
    }

    if ((*(_WORD *)(a1 + 96) & 4) != 0)
    {
      v13 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 80)];
      if (a2) {
        v14 = @"occurrenceStepIndex";
      }
      else {
        v14 = @"occurrence_step_index";
      }
      [v4 setObject:v13 forKey:v14];
    }
    v15 = [(id)a1 occurrenceLatLng];
    v16 = v15;
    if (v15)
    {
      if (a2)
      {
        v17 = [v15 jsonRepresentation];
        v18 = @"occurrenceLatLng";
      }
      else
      {
        v17 = [v15 dictionaryRepresentation];
        v18 = @"occurrence_lat_lng";
      }
      [v4 setObject:v17 forKey:v18];
    }
    if ((*(_WORD *)(a1 + 96) & 8) != 0)
    {
      v19 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 84)];
      if (a2) {
        v20 = @"switchedToResponseIndex";
      }
      else {
        v20 = @"switched_to_response_index";
      }
      [v4 setObject:v19 forKey:v20];
    }
    v21 = [(id)a1 switchedToRouteId];
    v22 = v21;
    if (v21)
    {
      if (a2)
      {
        v23 = [v21 base64EncodedStringWithOptions:0];
        [v4 setObject:v23 forKey:@"switchedToRouteId"];
      }
      else
      {
        [v4 setObject:v21 forKey:@"switched_to_route_id"];
      }
    }

    if ((*(_WORD *)(a1 + 96) & 0x10) != 0)
    {
      v24 = @"NO_TURN";
      switch(*(_DWORD *)(a1 + 88))
      {
        case 0:
          break;
        case 1:
          v24 = @"LEFT_TURN";
          break;
        case 2:
          v24 = @"RIGHT_TURN";
          break;
        case 3:
          v24 = @"STRAIGHT_AHEAD";
          break;
        case 4:
          v24 = @"U_TURN";
          break;
        case 5:
          v24 = @"FOLLOW_ROAD";
          break;
        case 6:
          v24 = @"ENTER_ROUNDABOUT";
          break;
        case 7:
          v24 = @"EXIT_ROUNDABOUT";
          break;
        case 0xB:
          v24 = @"OFF_RAMP";
          break;
        case 0xC:
          v24 = @"ON_RAMP";
          break;
        case 0x10:
          v24 = @"ARRIVE_END_OF_NAVIGATION";
          break;
        case 0x11:
          v24 = @"START_ROUTE";
          break;
        case 0x12:
          v24 = @"ARRIVE_AT_DESTINATION";
          break;
        case 0x14:
          v24 = @"KEEP_LEFT";
          break;
        case 0x15:
          v24 = @"KEEP_RIGHT";
          break;
        case 0x16:
          v24 = @"ENTER_FERRY";
          break;
        case 0x17:
          v24 = @"EXIT_FERRY";
          break;
        case 0x18:
          v24 = @"CHANGE_FERRY";
          break;
        case 0x19:
          v24 = @"START_ROUTE_WITH_U_TURN";
          break;
        case 0x1A:
          v24 = @"U_TURN_AT_ROUNDABOUT";
          break;
        case 0x1B:
          v24 = @"LEFT_TURN_AT_END";
          break;
        case 0x1C:
          v24 = @"RIGHT_TURN_AT_END";
          break;
        case 0x1D:
          v24 = @"HIGHWAY_OFF_RAMP_LEFT";
          break;
        case 0x1E:
          v24 = @"HIGHWAY_OFF_RAMP_RIGHT";
          break;
        case 0x21:
          v24 = @"ARRIVE_AT_DESTINATION_LEFT";
          break;
        case 0x22:
          v24 = @"ARRIVE_AT_DESTINATION_RIGHT";
          break;
        case 0x23:
          v24 = @"U_TURN_WHEN_POSSIBLE";
          break;
        case 0x27:
          v24 = @"ARRIVE_END_OF_DIRECTIONS";
          break;
        case 0x29:
          v24 = @"ROUNDABOUT_EXIT_1";
          break;
        case 0x2A:
          v24 = @"ROUNDABOUT_EXIT_2";
          break;
        case 0x2B:
          v24 = @"ROUNDABOUT_EXIT_3";
          break;
        case 0x2C:
          v24 = @"ROUNDABOUT_EXIT_4";
          break;
        case 0x2D:
          v24 = @"ROUNDABOUT_EXIT_5";
          break;
        case 0x2E:
          v24 = @"ROUNDABOUT_EXIT_6";
          break;
        case 0x2F:
          v24 = @"ROUNDABOUT_EXIT_7";
          break;
        case 0x30:
          v24 = @"ROUNDABOUT_EXIT_8";
          break;
        case 0x31:
          v24 = @"ROUNDABOUT_EXIT_9";
          break;
        case 0x32:
          v24 = @"ROUNDABOUT_EXIT_10";
          break;
        case 0x33:
          v24 = @"ROUNDABOUT_EXIT_11";
          break;
        case 0x34:
          v24 = @"ROUNDABOUT_EXIT_12";
          break;
        case 0x35:
          v24 = @"ROUNDABOUT_EXIT_13";
          break;
        case 0x36:
          v24 = @"ROUNDABOUT_EXIT_14";
          break;
        case 0x37:
          v24 = @"ROUNDABOUT_EXIT_15";
          break;
        case 0x38:
          v24 = @"ROUNDABOUT_EXIT_16";
          break;
        case 0x39:
          v24 = @"ROUNDABOUT_EXIT_17";
          break;
        case 0x3A:
          v24 = @"ROUNDABOUT_EXIT_18";
          break;
        case 0x3B:
          v24 = @"ROUNDABOUT_EXIT_19";
          break;
        case 0x3C:
          v24 = @"SHARP_LEFT_TURN";
          break;
        case 0x3D:
          v24 = @"SHARP_RIGHT_TURN";
          break;
        case 0x3E:
          v24 = @"SLIGHT_LEFT_TURN";
          break;
        case 0x3F:
          v24 = @"SLIGHT_RIGHT_TURN";
          break;
        case 0x40:
          v24 = @"CHANGE_HIGHWAY";
          break;
        case 0x41:
          v24 = @"CHANGE_HIGHWAY_LEFT";
          break;
        case 0x42:
          v24 = @"CHANGE_HIGHWAY_RIGHT";
          break;
        case 0x50:
          v24 = @"TOLL_STATION";
          break;
        case 0x51:
          v24 = @"ENTER_TUNNEL";
          break;
        case 0x52:
          v24 = @"WAYPOINT_STOP";
          break;
        case 0x53:
          v24 = @"WAYPOINT_STOP_LEFT";
          break;
        case 0x54:
          v24 = @"WAYPOINT_STOP_RIGHT";
          break;
        case 0x55:
          v24 = @"RESUME_ROUTE";
          break;
        case 0x56:
          v24 = @"RESUME_ROUTE_WITH_U_TURN";
          break;
        case 0x57:
          v24 = @"CUSTOM";
          break;
        case 0x58:
          v24 = @"TURN_AROUND";
          break;
        default:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 88));
          v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
      }
      if (a2) {
        v25 = @"synthesizedStepManeuverType";
      }
      else {
        v25 = @"synthesized_step_maneuver_type";
      }
      [v4 setObject:v24 forKey:v25];
    }
    v26 = [(id)a1 synthesizedStepInstructions];
    if (v26)
    {
      if (a2) {
        v27 = @"synthesizedStepInstructions";
      }
      else {
        v27 = @"synthesized_step_instructions";
      }
      [v4 setObject:v26 forKey:v27];
    }

    v28 = [(id)a1 errorDomain];
    if (v28)
    {
      if (a2) {
        v29 = @"errorDomain";
      }
      else {
        v29 = @"error_domain";
      }
      [v4 setObject:v28 forKey:v29];
    }

    if (*(_WORD *)(a1 + 96))
    {
      v30 = [NSNumber numberWithLongLong:*(void *)(a1 + 16)];
      if (a2) {
        v31 = @"errorCode";
      }
      else {
        v31 = @"error_code";
      }
      [v4 setObject:v30 forKey:v31];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPDirectionsEvent _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPDirectionsEvent)initWithDictionary:(id)a3
{
  return (GEORPDirectionsEvent *)-[GEORPDirectionsEvent _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_199;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_199;
  }
  unsigned int v6 = [v5 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"SWITCHED_TO_ROUTE"])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:@"ERROR"])
    {
      uint64_t v8 = 2;
    }
    else if ([v7 isEqualToString:@"SYNTHESIZED_STEP"])
    {
      uint64_t v8 = 3;
    }
    else
    {
      uint64_t v8 = 1;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_15;
    }
    uint64_t v8 = [v6 intValue];
  }
  [a1 setType:v8];
LABEL_15:

  if (a3) {
    v9 = @"occurrenceResponseIndex";
  }
  else {
    v9 = @"occurrence_response_index";
  }
  v10 = [v5 objectForKeyedSubscript:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setOccurrenceResponseIndex:", objc_msgSend(v10, "unsignedIntValue"));
  }

  if (a3) {
    v11 = @"occurrenceRouteId";
  }
  else {
    v11 = @"occurrence_route_id";
  }
  v12 = [v5 objectForKeyedSubscript:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v12 options:0];
    [a1 setOccurrenceRouteId:v13];
  }
  if (a3) {
    v14 = @"occurrenceStepIndex";
  }
  else {
    v14 = @"occurrence_step_index";
  }
  v15 = [v5 objectForKeyedSubscript:v14];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setOccurrenceStepIndex:", objc_msgSend(v15, "unsignedIntValue"));
  }

  if (a3) {
    v16 = @"occurrenceLatLng";
  }
  else {
    v16 = @"occurrence_lat_lng";
  }
  v17 = [v5 objectForKeyedSubscript:v16];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v18 = [GEOLatLng alloc];
    if (a3) {
      uint64_t v19 = [(GEOLatLng *)v18 initWithJSON:v17];
    }
    else {
      uint64_t v19 = [(GEOLatLng *)v18 initWithDictionary:v17];
    }
    v20 = (void *)v19;
    [a1 setOccurrenceLatLng:v19];
  }
  if (a3) {
    v21 = @"switchedToResponseIndex";
  }
  else {
    v21 = @"switched_to_response_index";
  }
  v22 = [v5 objectForKeyedSubscript:v21];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setSwitchedToResponseIndex:", objc_msgSend(v22, "unsignedIntValue"));
  }

  if (a3) {
    v23 = @"switchedToRouteId";
  }
  else {
    v23 = @"switched_to_route_id";
  }
  v24 = [v5 objectForKeyedSubscript:v23];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v25 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v24 options:0];
    [a1 setSwitchedToRouteId:v25];
  }
  if (a3) {
    v26 = @"synthesizedStepManeuverType";
  }
  else {
    v26 = @"synthesized_step_maneuver_type";
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

    goto LABEL_182;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v29 = [v27 intValue];
LABEL_182:
    [a1 setSynthesizedStepManeuverType:v29];
  }

  if (a3) {
    v30 = @"synthesizedStepInstructions";
  }
  else {
    v30 = @"synthesized_step_instructions";
  }
  v31 = [v5 objectForKeyedSubscript:v30];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v32 = (void *)[v31 copy];
    [a1 setSynthesizedStepInstructions:v32];
  }
  if (a3) {
    v33 = @"errorDomain";
  }
  else {
    v33 = @"error_domain";
  }
  v34 = [v5 objectForKeyedSubscript:v33];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v35 = (void *)[v34 copy];
    [a1 setErrorDomain:v35];
  }
  if (a3) {
    v36 = @"errorCode";
  }
  else {
    v36 = @"error_code";
  }
  v37 = [v5 objectForKeyedSubscript:v36];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setErrorCode:", objc_msgSend(v37, "longLongValue"));
  }

LABEL_199:
  return a1;
}

- (GEORPDirectionsEvent)initWithJSON:(id)a3
{
  return (GEORPDirectionsEvent *)-[GEORPDirectionsEvent _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_839_0;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_840_0;
    }
    GEORPDirectionsEventReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOLatLng *)self->_occurrenceLatLng readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPDirectionsEventIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPDirectionsEventReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0xFC0) == 0))
  {
    unsigned int v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPDirectionsEvent *)self readAll:0];
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x20) != 0)
    {
      PBDataWriterWriteInt32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_occurrenceRouteId) {
      PBDataWriterWriteDataField();
    }
    if ((*(_WORD *)&self->_flags & 4) != 0) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_occurrenceLatLng) {
      PBDataWriterWriteSubmessage();
    }
    if ((*(_WORD *)&self->_flags & 8) != 0) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_switchedToRouteId) {
      PBDataWriterWriteDataField();
    }
    if ((*(_WORD *)&self->_flags & 0x10) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_synthesizedStepInstructions) {
      PBDataWriterWriteStringField();
    }
    if (self->_errorDomain) {
      PBDataWriterWriteStringField();
    }
    if (*(_WORD *)&self->_flags) {
      PBDataWriterWriteInt64Field();
    }
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEORPDirectionsEvent _readOccurrenceLatLng]((uint64_t)self);
  occurrenceLatLng = self->_occurrenceLatLng;

  return [(GEOLatLng *)occurrenceLatLng hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEORPDirectionsEvent *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 16) = self->_readerMarkPos;
  *((_DWORD *)v5 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x20) != 0)
  {
    *((_DWORD *)v5 + 23) = self->_type;
    *((_WORD *)v5 + 48) |= 0x20u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v5 + 19) = self->_occurrenceResponseIndex;
    *((_WORD *)v5 + 48) |= 2u;
  }
  if (self->_occurrenceRouteId) {
    objc_msgSend(v5, "setOccurrenceRouteId:");
  }
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v5 + 20) = self->_occurrenceStepIndex;
    *((_WORD *)v5 + 48) |= 4u;
  }
  if (self->_occurrenceLatLng) {
    objc_msgSend(v5, "setOccurrenceLatLng:");
  }
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    *((_DWORD *)v5 + 21) = self->_switchedToResponseIndex;
    *((_WORD *)v5 + 48) |= 8u;
  }
  if (self->_switchedToRouteId) {
    objc_msgSend(v5, "setSwitchedToRouteId:");
  }
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
    *((_DWORD *)v5 + 22) = self->_synthesizedStepManeuverType;
    *((_WORD *)v5 + 48) |= 0x10u;
  }
  if (self->_synthesizedStepInstructions) {
    objc_msgSend(v5, "setSynthesizedStepInstructions:");
  }
  if (self->_errorDomain) {
    objc_msgSend(v5, "setErrorDomain:");
  }
  if (*(_WORD *)&self->_flags)
  {
    v5[2] = self->_errorCode;
    *((_WORD *)v5 + 48) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x800) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPDirectionsEventReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPDirectionsEvent *)self readAll:0];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 92) = self->_type;
    *(_WORD *)(v5 + 96) |= 0x20u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_occurrenceResponseIndex;
    *(_WORD *)(v5 + 96) |= 2u;
  }
  uint64_t v10 = [(NSData *)self->_occurrenceRouteId copyWithZone:a3];
  v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_occurrenceStepIndex;
    *(_WORD *)(v5 + 96) |= 4u;
  }
  id v12 = [(GEOLatLng *)self->_occurrenceLatLng copyWithZone:a3];
  v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_switchedToResponseIndex;
    *(_WORD *)(v5 + 96) |= 8u;
  }
  uint64_t v14 = [(NSData *)self->_switchedToRouteId copyWithZone:a3];
  v15 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v14;

  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_synthesizedStepManeuverType;
    *(_WORD *)(v5 + 96) |= 0x10u;
  }
  uint64_t v16 = [(NSString *)self->_synthesizedStepInstructions copyWithZone:a3];
  v17 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v16;

  uint64_t v18 = [(NSString *)self->_errorDomain copyWithZone:a3];
  uint64_t v19 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v18;

  if (*(_WORD *)&self->_flags)
  {
    *(void *)(v5 + 16) = self->_errorCode;
    *(_WORD *)(v5 + 96) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_44;
  }
  [(GEORPDirectionsEvent *)self readAll:1];
  [v4 readAll:1];
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 48);
  if ((flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_type != *((_DWORD *)v4 + 23)) {
      goto LABEL_44;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_44;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_occurrenceResponseIndex != *((_DWORD *)v4 + 19)) {
      goto LABEL_44;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_44;
  }
  occurrenceRouteId = self->_occurrenceRouteId;
  if ((unint64_t)occurrenceRouteId | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](occurrenceRouteId, "isEqual:")) {
      goto LABEL_44;
    }
    __int16 flags = (__int16)self->_flags;
    __int16 v6 = *((_WORD *)v4 + 48);
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_occurrenceStepIndex != *((_DWORD *)v4 + 20)) {
      goto LABEL_44;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_44;
  }
  occurrenceLatLng = self->_occurrenceLatLng;
  if ((unint64_t)occurrenceLatLng | *((void *)v4 + 4))
  {
    if (!-[GEOLatLng isEqual:](occurrenceLatLng, "isEqual:")) {
      goto LABEL_44;
    }
    __int16 flags = (__int16)self->_flags;
    __int16 v6 = *((_WORD *)v4 + 48);
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_switchedToResponseIndex != *((_DWORD *)v4 + 21)) {
      goto LABEL_44;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_44;
  }
  switchedToRouteId = self->_switchedToRouteId;
  if ((unint64_t)switchedToRouteId | *((void *)v4 + 6))
  {
    if (-[NSData isEqual:](switchedToRouteId, "isEqual:"))
    {
      __int16 flags = (__int16)self->_flags;
      __int16 v6 = *((_WORD *)v4 + 48);
      goto LABEL_31;
    }
LABEL_44:
    BOOL v13 = 0;
    goto LABEL_45;
  }
LABEL_31:
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_synthesizedStepManeuverType != *((_DWORD *)v4 + 22)) {
      goto LABEL_44;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_44;
  }
  synthesizedStepInstructions = self->_synthesizedStepInstructions;
  if ((unint64_t)synthesizedStepInstructions | *((void *)v4 + 7)
    && !-[NSString isEqual:](synthesizedStepInstructions, "isEqual:"))
  {
    goto LABEL_44;
  }
  errorDomain = self->_errorDomain;
  if ((unint64_t)errorDomain | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](errorDomain, "isEqual:")) {
      goto LABEL_44;
    }
  }
  __int16 v12 = *((_WORD *)v4 + 48);
  BOOL v13 = (v12 & 1) == 0;
  if (*(_WORD *)&self->_flags)
  {
    if ((v12 & 1) == 0 || self->_errorCode != *((void *)v4 + 2)) {
      goto LABEL_44;
    }
    BOOL v13 = 1;
  }
LABEL_45:

  return v13;
}

- (unint64_t)hash
{
  [(GEORPDirectionsEvent *)self readAll:1];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x20) != 0)
  {
    uint64_t v15 = 2654435761 * self->_type;
    if ((flags & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v15 = 0;
    if ((flags & 2) != 0)
    {
LABEL_3:
      uint64_t v14 = 2654435761 * self->_occurrenceResponseIndex;
      goto LABEL_6;
    }
  }
  uint64_t v14 = 0;
LABEL_6:
  uint64_t v13 = [(NSData *)self->_occurrenceRouteId hash];
  if ((*(_WORD *)&self->_flags & 4) != 0) {
    uint64_t v4 = 2654435761 * self->_occurrenceStepIndex;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = [(GEOLatLng *)self->_occurrenceLatLng hash];
  if ((*(_WORD *)&self->_flags & 8) != 0) {
    uint64_t v6 = 2654435761 * self->_switchedToResponseIndex;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [(NSData *)self->_switchedToRouteId hash];
  if ((*(_WORD *)&self->_flags & 0x10) != 0) {
    uint64_t v8 = 2654435761 * self->_synthesizedStepManeuverType;
  }
  else {
    uint64_t v8 = 0;
  }
  NSUInteger v9 = [(NSString *)self->_synthesizedStepInstructions hash];
  NSUInteger v10 = [(NSString *)self->_errorDomain hash];
  if (*(_WORD *)&self->_flags) {
    uint64_t v11 = 2654435761 * self->_errorCode;
  }
  else {
    uint64_t v11 = 0;
  }
  return v14 ^ v15 ^ v4 ^ v13 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v8 = a3;
  [v8 readAll:0];
  id v4 = v8;
  __int16 v5 = *((_WORD *)v8 + 48);
  if ((v5 & 0x20) != 0)
  {
    self->_type = *((_DWORD *)v8 + 23);
    *(_WORD *)&self->_flags |= 0x20u;
    __int16 v5 = *((_WORD *)v8 + 48);
  }
  if ((v5 & 2) != 0)
  {
    self->_occurrenceResponseIndex = *((_DWORD *)v8 + 19);
    *(_WORD *)&self->_flags |= 2u;
  }
  if (*((void *)v8 + 5))
  {
    [(GEORPDirectionsEvent *)self setOccurrenceRouteId:"setOccurrenceRouteId:"];
    id v4 = v8;
  }
  if ((*((_WORD *)v4 + 48) & 4) != 0)
  {
    self->_occurrenceStepIndex = *((_DWORD *)v4 + 20);
    *(_WORD *)&self->_flags |= 4u;
  }
  occurrenceLatLng = self->_occurrenceLatLng;
  uint64_t v7 = *((void *)v4 + 4);
  if (occurrenceLatLng)
  {
    if (!v7) {
      goto LABEL_15;
    }
    -[GEOLatLng mergeFrom:](occurrenceLatLng, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_15;
    }
    -[GEORPDirectionsEvent setOccurrenceLatLng:](self, "setOccurrenceLatLng:");
  }
  id v4 = v8;
LABEL_15:
  if ((*((_WORD *)v4 + 48) & 8) != 0)
  {
    self->_switchedToResponseIndex = *((_DWORD *)v4 + 21);
    *(_WORD *)&self->_flags |= 8u;
  }
  if (*((void *)v4 + 6))
  {
    [(GEORPDirectionsEvent *)self setSwitchedToRouteId:"setSwitchedToRouteId:"];
    id v4 = v8;
  }
  if ((*((_WORD *)v4 + 48) & 0x10) != 0)
  {
    self->_synthesizedStepManeuverType = *((_DWORD *)v4 + 22);
    *(_WORD *)&self->_flags |= 0x10u;
  }
  if (*((void *)v4 + 7))
  {
    -[GEORPDirectionsEvent setSynthesizedStepInstructions:](self, "setSynthesizedStepInstructions:");
    id v4 = v8;
  }
  if (*((void *)v4 + 3))
  {
    -[GEORPDirectionsEvent setErrorDomain:](self, "setErrorDomain:");
    id v4 = v8;
  }
  if (*((_WORD *)v4 + 48))
  {
    self->_errorCode = *((void *)v4 + 2);
    *(_WORD *)&self->_flags |= 1u;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synthesizedStepInstructions, 0);
  objc_storeStrong((id *)&self->_switchedToRouteId, 0);
  objc_storeStrong((id *)&self->_occurrenceRouteId, 0);
  objc_storeStrong((id *)&self->_occurrenceLatLng, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end