@interface GEOCompanionCyclingStep
+ (BOOL)isValid:(id)a3;
+ (Class)maneuverNameType;
+ (Class)signpostType;
- (BOOL)hasArtworkOverride;
- (BOOL)hasDrivingSide;
- (BOOL)hasExitNumber;
- (BOOL)hasJunctionType;
- (BOOL)hasManeuverType;
- (BOOL)hasShield;
- (BOOL)hasShieldType;
- (BOOL)hasToFreeway;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)toFreeway;
- (GEOCompanionCyclingStep)init;
- (GEOCompanionCyclingStep)initWithData:(id)a3;
- (GEOCompanionCyclingStep)initWithDictionary:(id)a3;
- (GEOCompanionCyclingStep)initWithJSON:(id)a3;
- (GEOJunctionElement)junctionElementAtIndex:(unint64_t)a3;
- (GEOJunctionElement)junctionElements;
- (GEONameInfo)exitNumber;
- (GEOPBTransitArtwork)artworkOverride;
- (NSMutableArray)maneuverNames;
- (NSMutableArray)signposts;
- (NSString)description;
- (NSString)shield;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)drivingSideAsString:(int)a3;
- (id)jsonRepresentation;
- (id)junctionTypeAsString:(int)a3;
- (id)maneuverNameAtIndex:(unint64_t)a3;
- (id)maneuverTypeAsString:(int)a3;
- (id)signpostAtIndex:(unint64_t)a3;
- (int)StringAsDrivingSide:(id)a3;
- (int)StringAsJunctionType:(id)a3;
- (int)StringAsManeuverType:(id)a3;
- (int)drivingSide;
- (int)junctionType;
- (int)maneuverType;
- (int)shieldType;
- (int)transportType;
- (uint64_t)_reserveJunctionElements:(uint64_t)a1;
- (unint64_t)hash;
- (unint64_t)junctionElementsCount;
- (unint64_t)maneuverNamesCount;
- (unint64_t)signpostsCount;
- (void)_addNoFlagsManeuverName:(uint64_t)a1;
- (void)_addNoFlagsSignpost:(uint64_t)a1;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readArtworkOverride;
- (void)_readExitNumber;
- (void)_readJunctionElements;
- (void)_readManeuverNames;
- (void)_readShield;
- (void)_readSignposts;
- (void)addJunctionElement:(GEOJunctionElement)a3;
- (void)addManeuverName:(id)a3;
- (void)addSignpost:(id)a3;
- (void)clearJunctionElements;
- (void)clearManeuverNames;
- (void)clearSignposts;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setArtworkOverride:(id)a3;
- (void)setDrivingSide:(int)a3;
- (void)setExitNumber:(id)a3;
- (void)setHasDrivingSide:(BOOL)a3;
- (void)setHasJunctionType:(BOOL)a3;
- (void)setHasManeuverType:(BOOL)a3;
- (void)setHasShieldType:(BOOL)a3;
- (void)setHasToFreeway:(BOOL)a3;
- (void)setJunctionElements:(GEOJunctionElement *)a3 count:(unint64_t)a4;
- (void)setJunctionType:(int)a3;
- (void)setManeuverNames:(id)a3;
- (void)setManeuverType:(int)a3;
- (void)setShield:(id)a3;
- (void)setShieldType:(int)a3;
- (void)setSignposts:(id)a3;
- (void)setToFreeway:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOCompanionCyclingStep

- (GEOCompanionCyclingStep)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOCompanionCyclingStep;
  v2 = [(GEOCompanionCyclingStep *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOCompanionCyclingStep)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOCompanionCyclingStep;
  v3 = [(GEOCompanionCyclingStep *)&v7 initWithData:a3];
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
  [(GEOCompanionCyclingStep *)self clearJunctionElements];
  v3.receiver = self;
  v3.super_class = (Class)GEOCompanionCyclingStep;
  [(GEOCompanionCyclingStep *)&v3 dealloc];
}

- (int)maneuverType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0) {
    return self->_maneuverType;
  }
  else {
    return 0;
  }
}

- (void)setManeuverType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x804u;
  self->_maneuverType = a3;
}

- (void)setHasManeuverType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2052;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasManeuverType
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
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

- (void)_readShield
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 112) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionCyclingStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readShield_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasShield
{
  return self->_shield != 0;
}

- (NSString)shield
{
  -[GEOCompanionCyclingStep _readShield]((uint64_t)self);
  shield = self->_shield;

  return shield;
}

- (void)setShield:(id)a3
{
  *(_WORD *)&self->_flags |= 0xA00u;
  objc_storeStrong((id *)&self->_shield, a3);
}

- (int)shieldType
{
  return self->_shieldType;
}

- (void)setShieldType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x808u;
  self->_shieldType = a3;
}

- (void)setHasShieldType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2056;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasShieldType
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (int)junctionType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_junctionType;
  }
  else {
    return 0;
  }
}

- (void)setJunctionType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x802u;
  self->_junctionType = a3;
}

- (void)setHasJunctionType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2050;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasJunctionType
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)junctionTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"JCTTYPE_ROUNDABOUT";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"JCTTYPE_NORMAL";
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 112) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionCyclingStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readJunctionElements_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
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
    unint64_t v4 = *(void *)(a1 + 24);
    unint64_t v5 = v4 + a2;
    if (v4 + a2 <= v4) {
      return 0;
    }
    unint64_t v6 = *(void *)(a1 + 32);
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
    uint64_t result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 16), 16 * v9, 0x4F87FA5FuLL);
    if (result)
    {
      *(void *)(a1 + 32) = v9;
      *(void *)(a1 + 16) = result;
      bzero((void *)(result + 16 * *(void *)(a1 + 24)), 16 * (v9 - *(void *)(a1 + 24)));
      return 1;
    }
  }
  return result;
}

- (void)clearJunctionElements
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  self->_junctionElementsSpace = 0;
  self->_junctionElementsCount = 0;
  free(self->_junctionElements);
  self->_junctionElements = 0;
}

- (void)addJunctionElement:(GEOJunctionElement)a3
{
  uint64_t v3 = *(void *)&a3.var2;
  uint64_t v4 = *(void *)&a3.var0;
  -[GEOCompanionCyclingStep _readJunctionElements]((uint64_t)self);
  if (self && -[GEOCompanionCyclingStep _reserveJunctionElements:]((uint64_t)self, 1uLL))
  {
    unint64_t v6 = &self->_junctionElements[self->_junctionElementsCount];
    *(void *)&v6->var0 = v4;
    *(void *)&v6->var2 = v3;
    ++self->_junctionElementsCount;
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
}

- (GEOJunctionElement)junctionElementAtIndex:(unint64_t)a3
{
  -[GEOCompanionCyclingStep _readJunctionElements]((uint64_t)self);
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
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  [(GEOCompanionCyclingStep *)self clearJunctionElements];
  if (-[GEOCompanionCyclingStep _reserveJunctionElements:]((uint64_t)self, a4))
  {
    memcpy(self->_junctionElements, a3, 16 * a4);
    self->_unint64_t junctionElementsCount = a4;
  }
}

- (void)_readManeuverNames
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 112) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionCyclingStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readManeuverNames_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)maneuverNames
{
  -[GEOCompanionCyclingStep _readManeuverNames]((uint64_t)self);
  maneuverNames = self->_maneuverNames;

  return maneuverNames;
}

- (void)setManeuverNames:(id)a3
{
  uint64_t v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  maneuverNames = self->_maneuverNames;
  self->_maneuverNames = v4;
}

- (void)clearManeuverNames
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  maneuverNames = self->_maneuverNames;

  [(NSMutableArray *)maneuverNames removeAllObjects];
}

- (void)addManeuverName:(id)a3
{
  id v4 = a3;
  -[GEOCompanionCyclingStep _readManeuverNames]((uint64_t)self);
  -[GEOCompanionCyclingStep _addNoFlagsManeuverName:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
}

- (void)_addNoFlagsManeuverName:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 56);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v5;

      id v4 = *(void **)(a1 + 56);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)maneuverNamesCount
{
  -[GEOCompanionCyclingStep _readManeuverNames]((uint64_t)self);
  maneuverNames = self->_maneuverNames;

  return [(NSMutableArray *)maneuverNames count];
}

- (id)maneuverNameAtIndex:(unint64_t)a3
{
  -[GEOCompanionCyclingStep _readManeuverNames]((uint64_t)self);
  maneuverNames = self->_maneuverNames;

  return (id)[(NSMutableArray *)maneuverNames objectAtIndex:a3];
}

+ (Class)maneuverNameType
{
  return (Class)objc_opt_class();
}

- (void)_readSignposts
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 112) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionCyclingStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSignposts_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)signposts
{
  -[GEOCompanionCyclingStep _readSignposts]((uint64_t)self);
  signposts = self->_signposts;

  return signposts;
}

- (void)setSignposts:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  signposts = self->_signposts;
  self->_signposts = v4;
}

- (void)clearSignposts
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  signposts = self->_signposts;

  [(NSMutableArray *)signposts removeAllObjects];
}

- (void)addSignpost:(id)a3
{
  id v4 = a3;
  -[GEOCompanionCyclingStep _readSignposts]((uint64_t)self);
  -[GEOCompanionCyclingStep _addNoFlagsSignpost:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
}

- (void)_addNoFlagsSignpost:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 72);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v6 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = v5;

      id v4 = *(void **)(a1 + 72);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)signpostsCount
{
  -[GEOCompanionCyclingStep _readSignposts]((uint64_t)self);
  signposts = self->_signposts;

  return [(NSMutableArray *)signposts count];
}

- (id)signpostAtIndex:(unint64_t)a3
{
  -[GEOCompanionCyclingStep _readSignposts]((uint64_t)self);
  signposts = self->_signposts;

  return (id)[(NSMutableArray *)signposts objectAtIndex:a3];
}

+ (Class)signpostType
{
  return (Class)objc_opt_class();
}

- (BOOL)toFreeway
{
  return self->_toFreeway;
}

- (void)setToFreeway:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x810u;
  self->_toFreeway = a3;
}

- (void)setHasToFreeway:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2064;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasToFreeway
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (void)_readExitNumber
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 112) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionCyclingStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readExitNumber_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasExitNumber
{
  return self->_exitNumber != 0;
}

- (GEONameInfo)exitNumber
{
  -[GEOCompanionCyclingStep _readExitNumber]((uint64_t)self);
  exitNumber = self->_exitNumber;

  return exitNumber;
}

- (void)setExitNumber:(id)a3
{
  *(_WORD *)&self->_flags |= 0x880u;
  objc_storeStrong((id *)&self->_exitNumber, a3);
}

- (int)drivingSide
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_drivingSide;
  }
  else {
    return 0;
  }
}

- (void)setDrivingSide:(int)a3
{
  *(_WORD *)&self->_flags |= 0x801u;
  self->_drivingSide = a3;
}

- (void)setHasDrivingSide:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x800;
}

- (BOOL)hasDrivingSide
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)drivingSideAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      id v4 = @"LEFT_SIDE";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v4 = @"RIGHT_SIDE";
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

- (void)_readArtworkOverride
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 112) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionCyclingStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readArtworkOverride_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasArtworkOverride
{
  return self->_artworkOverride != 0;
}

- (GEOPBTransitArtwork)artworkOverride
{
  -[GEOCompanionCyclingStep _readArtworkOverride]((uint64_t)self);
  artworkOverride = self->_artworkOverride;

  return artworkOverride;
}

- (void)setArtworkOverride:(id)a3
{
  *(_WORD *)&self->_flags |= 0x840u;
  objc_storeStrong((id *)&self->_artworkOverride, a3);
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOCompanionCyclingStep;
  int v4 = [(GEOCompanionCyclingStep *)&v8 description];
  id v5 = [(GEOCompanionCyclingStep *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCompanionCyclingStep _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ((*(_WORD *)(a1 + 112) & 4) != 0)
    {
      id v5 = @"NO_TURN";
      switch(*(_DWORD *)(a1 + 100))
      {
        case 0:
          break;
        case 1:
          id v5 = @"LEFT_TURN";
          break;
        case 2:
          id v5 = @"RIGHT_TURN";
          break;
        case 3:
          id v5 = @"STRAIGHT_AHEAD";
          break;
        case 4:
          id v5 = @"U_TURN";
          break;
        case 5:
          id v5 = @"FOLLOW_ROAD";
          break;
        case 6:
          id v5 = @"ENTER_ROUNDABOUT";
          break;
        case 7:
          id v5 = @"EXIT_ROUNDABOUT";
          break;
        case 0xB:
          id v5 = @"OFF_RAMP";
          break;
        case 0xC:
          id v5 = @"ON_RAMP";
          break;
        case 0x10:
          id v5 = @"ARRIVE_END_OF_NAVIGATION";
          break;
        case 0x11:
          id v5 = @"START_ROUTE";
          break;
        case 0x12:
          id v5 = @"ARRIVE_AT_DESTINATION";
          break;
        case 0x14:
          id v5 = @"KEEP_LEFT";
          break;
        case 0x15:
          id v5 = @"KEEP_RIGHT";
          break;
        case 0x16:
          id v5 = @"ENTER_FERRY";
          break;
        case 0x17:
          id v5 = @"EXIT_FERRY";
          break;
        case 0x18:
          id v5 = @"CHANGE_FERRY";
          break;
        case 0x19:
          id v5 = @"START_ROUTE_WITH_U_TURN";
          break;
        case 0x1A:
          id v5 = @"U_TURN_AT_ROUNDABOUT";
          break;
        case 0x1B:
          id v5 = @"LEFT_TURN_AT_END";
          break;
        case 0x1C:
          id v5 = @"RIGHT_TURN_AT_END";
          break;
        case 0x1D:
          id v5 = @"HIGHWAY_OFF_RAMP_LEFT";
          break;
        case 0x1E:
          id v5 = @"HIGHWAY_OFF_RAMP_RIGHT";
          break;
        case 0x21:
          id v5 = @"ARRIVE_AT_DESTINATION_LEFT";
          break;
        case 0x22:
          id v5 = @"ARRIVE_AT_DESTINATION_RIGHT";
          break;
        case 0x23:
          id v5 = @"U_TURN_WHEN_POSSIBLE";
          break;
        case 0x27:
          id v5 = @"ARRIVE_END_OF_DIRECTIONS";
          break;
        case 0x29:
          id v5 = @"ROUNDABOUT_EXIT_1";
          break;
        case 0x2A:
          id v5 = @"ROUNDABOUT_EXIT_2";
          break;
        case 0x2B:
          id v5 = @"ROUNDABOUT_EXIT_3";
          break;
        case 0x2C:
          id v5 = @"ROUNDABOUT_EXIT_4";
          break;
        case 0x2D:
          id v5 = @"ROUNDABOUT_EXIT_5";
          break;
        case 0x2E:
          id v5 = @"ROUNDABOUT_EXIT_6";
          break;
        case 0x2F:
          id v5 = @"ROUNDABOUT_EXIT_7";
          break;
        case 0x30:
          id v5 = @"ROUNDABOUT_EXIT_8";
          break;
        case 0x31:
          id v5 = @"ROUNDABOUT_EXIT_9";
          break;
        case 0x32:
          id v5 = @"ROUNDABOUT_EXIT_10";
          break;
        case 0x33:
          id v5 = @"ROUNDABOUT_EXIT_11";
          break;
        case 0x34:
          id v5 = @"ROUNDABOUT_EXIT_12";
          break;
        case 0x35:
          id v5 = @"ROUNDABOUT_EXIT_13";
          break;
        case 0x36:
          id v5 = @"ROUNDABOUT_EXIT_14";
          break;
        case 0x37:
          id v5 = @"ROUNDABOUT_EXIT_15";
          break;
        case 0x38:
          id v5 = @"ROUNDABOUT_EXIT_16";
          break;
        case 0x39:
          id v5 = @"ROUNDABOUT_EXIT_17";
          break;
        case 0x3A:
          id v5 = @"ROUNDABOUT_EXIT_18";
          break;
        case 0x3B:
          id v5 = @"ROUNDABOUT_EXIT_19";
          break;
        case 0x3C:
          id v5 = @"SHARP_LEFT_TURN";
          break;
        case 0x3D:
          id v5 = @"SHARP_RIGHT_TURN";
          break;
        case 0x3E:
          id v5 = @"SLIGHT_LEFT_TURN";
          break;
        case 0x3F:
          id v5 = @"SLIGHT_RIGHT_TURN";
          break;
        case 0x40:
          id v5 = @"CHANGE_HIGHWAY";
          break;
        case 0x41:
          id v5 = @"CHANGE_HIGHWAY_LEFT";
          break;
        case 0x42:
          id v5 = @"CHANGE_HIGHWAY_RIGHT";
          break;
        case 0x50:
          id v5 = @"TOLL_STATION";
          break;
        case 0x51:
          id v5 = @"ENTER_TUNNEL";
          break;
        case 0x52:
          id v5 = @"WAYPOINT_STOP";
          break;
        case 0x53:
          id v5 = @"WAYPOINT_STOP_LEFT";
          break;
        case 0x54:
          id v5 = @"WAYPOINT_STOP_RIGHT";
          break;
        case 0x55:
          id v5 = @"RESUME_ROUTE";
          break;
        case 0x56:
          id v5 = @"RESUME_ROUTE_WITH_U_TURN";
          break;
        case 0x57:
          id v5 = @"CUSTOM";
          break;
        case 0x58:
          id v5 = @"TURN_AROUND";
          break;
        default:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 100));
          id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
      }
      [v4 setObject:v5 forKey:@"maneuverType"];
    }
    unint64_t v6 = [(id)a1 shield];
    if (v6) {
      [v4 setObject:v6 forKey:@"shield"];
    }

    __int16 v7 = *(_WORD *)(a1 + 112);
    if ((v7 & 8) != 0)
    {
      objc_super v8 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 104)];
      [v4 setObject:v8 forKey:@"shieldType"];

      __int16 v7 = *(_WORD *)(a1 + 112);
    }
    if ((v7 & 2) != 0)
    {
      int v9 = *(_DWORD *)(a1 + 96);
      if (v9)
      {
        if (v9 == 1)
        {
          v10 = @"JCTTYPE_ROUNDABOUT";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 96));
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v10 = @"JCTTYPE_NORMAL";
      }
      [v4 setObject:v10 forKey:@"junctionType"];
    }
    if (*(void *)(a1 + 24))
    {
      uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 24)];
      if (*(void *)(a1 + 24))
      {
        uint64_t v12 = 0;
        unint64_t v13 = 0;
        do
        {
          v14 = _GEOJunctionElementDictionaryRepresentation((unsigned int *)(*(void *)(a1 + 16) + v12));
          [v11 addObject:v14];

          ++v13;
          v12 += 16;
        }
        while (v13 < *(void *)(a1 + 24));
      }
      [v4 setObject:v11 forKey:@"junctionElement"];
    }
    if ([*(id *)(a1 + 56) count])
    {
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v16 = *(id *)(a1 + 56);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v45 objects:v50 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v46 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = *(void **)(*((void *)&v45 + 1) + 8 * i);
            if (a2) {
              [v21 jsonRepresentation];
            }
            else {
            v22 = [v21 dictionaryRepresentation];
            }
            [v15 addObject:v22];
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v45 objects:v50 count:16];
        }
        while (v18);
      }

      [v4 setObject:v15 forKey:@"maneuverName"];
    }
    if ([*(id *)(a1 + 72) count])
    {
      v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v24 = *(id *)(a1 + 72);
      uint64_t v25 = [v24 countByEnumeratingWithState:&v41 objects:v49 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v42;
        do
        {
          for (uint64_t j = 0; j != v26; ++j)
          {
            if (*(void *)v42 != v27) {
              objc_enumerationMutation(v24);
            }
            v29 = *(void **)(*((void *)&v41 + 1) + 8 * j);
            if (a2) {
              [v29 jsonRepresentation];
            }
            else {
            v30 = [v29 dictionaryRepresentation];
            }
            [v23 addObject:v30];
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v41 objects:v49 count:16];
        }
        while (v26);
      }

      [v4 setObject:v23 forKey:@"signpost"];
    }
    if ((*(_WORD *)(a1 + 112) & 0x10) != 0)
    {
      v31 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 108)];
      [v4 setObject:v31 forKey:@"toFreeway"];
    }
    v32 = [(id)a1 exitNumber];
    v33 = v32;
    if (v32)
    {
      if (a2) {
        [v32 jsonRepresentation];
      }
      else {
      v34 = [v32 dictionaryRepresentation];
      }
      [v4 setObject:v34 forKey:@"exitNumber"];
    }
    if (*(_WORD *)(a1 + 112))
    {
      int v35 = *(_DWORD *)(a1 + 92);
      if (v35)
      {
        if (v35 == 1)
        {
          v36 = @"LEFT_SIDE";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 92));
          v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v36 = @"RIGHT_SIDE";
      }
      [v4 setObject:v36 forKey:@"drivingSide"];
    }
    v37 = [(id)a1 artworkOverride];
    v38 = v37;
    if (v37)
    {
      if (a2) {
        [v37 jsonRepresentation];
      }
      else {
      v39 = [v37 dictionaryRepresentation];
      }
      [v4 setObject:v39 forKey:@"artworkOverride"];
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
  return -[GEOCompanionCyclingStep _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOCompanionCyclingStep)initWithDictionary:(id)a3
{
  return (GEOCompanionCyclingStep *)-[GEOCompanionCyclingStep _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_207;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_207;
  }
  unint64_t v6 = [v5 objectForKeyedSubscript:@"maneuverType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"NO_TURN"])
    {
      uint64_t v8 = 0;
    }
    else if ([v7 isEqualToString:@"LEFT_TURN"])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:@"RIGHT_TURN"])
    {
      uint64_t v8 = 2;
    }
    else if ([v7 isEqualToString:@"STRAIGHT_AHEAD"])
    {
      uint64_t v8 = 3;
    }
    else if ([v7 isEqualToString:@"U_TURN"])
    {
      uint64_t v8 = 4;
    }
    else if ([v7 isEqualToString:@"FOLLOW_ROAD"])
    {
      uint64_t v8 = 5;
    }
    else if ([v7 isEqualToString:@"ENTER_ROUNDABOUT"])
    {
      uint64_t v8 = 6;
    }
    else if ([v7 isEqualToString:@"EXIT_ROUNDABOUT"])
    {
      uint64_t v8 = 7;
    }
    else if ([v7 isEqualToString:@"OFF_RAMP"])
    {
      uint64_t v8 = 11;
    }
    else if ([v7 isEqualToString:@"ON_RAMP"])
    {
      uint64_t v8 = 12;
    }
    else if ([v7 isEqualToString:@"ARRIVE_END_OF_NAVIGATION"])
    {
      uint64_t v8 = 16;
    }
    else if ([v7 isEqualToString:@"START_ROUTE"])
    {
      uint64_t v8 = 17;
    }
    else if ([v7 isEqualToString:@"ARRIVE_AT_DESTINATION"])
    {
      uint64_t v8 = 18;
    }
    else if ([v7 isEqualToString:@"KEEP_LEFT"])
    {
      uint64_t v8 = 20;
    }
    else if ([v7 isEqualToString:@"KEEP_RIGHT"])
    {
      uint64_t v8 = 21;
    }
    else if ([v7 isEqualToString:@"ENTER_FERRY"])
    {
      uint64_t v8 = 22;
    }
    else if ([v7 isEqualToString:@"EXIT_FERRY"])
    {
      uint64_t v8 = 23;
    }
    else if ([v7 isEqualToString:@"CHANGE_FERRY"])
    {
      uint64_t v8 = 24;
    }
    else if ([v7 isEqualToString:@"START_ROUTE_WITH_U_TURN"])
    {
      uint64_t v8 = 25;
    }
    else if ([v7 isEqualToString:@"U_TURN_AT_ROUNDABOUT"])
    {
      uint64_t v8 = 26;
    }
    else if ([v7 isEqualToString:@"LEFT_TURN_AT_END"])
    {
      uint64_t v8 = 27;
    }
    else if ([v7 isEqualToString:@"RIGHT_TURN_AT_END"])
    {
      uint64_t v8 = 28;
    }
    else if ([v7 isEqualToString:@"HIGHWAY_OFF_RAMP_LEFT"])
    {
      uint64_t v8 = 29;
    }
    else if ([v7 isEqualToString:@"HIGHWAY_OFF_RAMP_RIGHT"])
    {
      uint64_t v8 = 30;
    }
    else if ([v7 isEqualToString:@"ARRIVE_AT_DESTINATION_LEFT"])
    {
      uint64_t v8 = 33;
    }
    else if ([v7 isEqualToString:@"ARRIVE_AT_DESTINATION_RIGHT"])
    {
      uint64_t v8 = 34;
    }
    else if ([v7 isEqualToString:@"U_TURN_WHEN_POSSIBLE"])
    {
      uint64_t v8 = 35;
    }
    else if ([v7 isEqualToString:@"ARRIVE_END_OF_DIRECTIONS"])
    {
      uint64_t v8 = 39;
    }
    else if ([v7 isEqualToString:@"ROUNDABOUT_EXIT_1"])
    {
      uint64_t v8 = 41;
    }
    else if ([v7 isEqualToString:@"ROUNDABOUT_EXIT_2"])
    {
      uint64_t v8 = 42;
    }
    else if ([v7 isEqualToString:@"ROUNDABOUT_EXIT_3"])
    {
      uint64_t v8 = 43;
    }
    else if ([v7 isEqualToString:@"ROUNDABOUT_EXIT_4"])
    {
      uint64_t v8 = 44;
    }
    else if ([v7 isEqualToString:@"ROUNDABOUT_EXIT_5"])
    {
      uint64_t v8 = 45;
    }
    else if ([v7 isEqualToString:@"ROUNDABOUT_EXIT_6"])
    {
      uint64_t v8 = 46;
    }
    else if ([v7 isEqualToString:@"ROUNDABOUT_EXIT_7"])
    {
      uint64_t v8 = 47;
    }
    else if ([v7 isEqualToString:@"ROUNDABOUT_EXIT_8"])
    {
      uint64_t v8 = 48;
    }
    else if ([v7 isEqualToString:@"ROUNDABOUT_EXIT_9"])
    {
      uint64_t v8 = 49;
    }
    else if ([v7 isEqualToString:@"ROUNDABOUT_EXIT_10"])
    {
      uint64_t v8 = 50;
    }
    else if ([v7 isEqualToString:@"ROUNDABOUT_EXIT_11"])
    {
      uint64_t v8 = 51;
    }
    else if ([v7 isEqualToString:@"ROUNDABOUT_EXIT_12"])
    {
      uint64_t v8 = 52;
    }
    else if ([v7 isEqualToString:@"ROUNDABOUT_EXIT_13"])
    {
      uint64_t v8 = 53;
    }
    else if ([v7 isEqualToString:@"ROUNDABOUT_EXIT_14"])
    {
      uint64_t v8 = 54;
    }
    else if ([v7 isEqualToString:@"ROUNDABOUT_EXIT_15"])
    {
      uint64_t v8 = 55;
    }
    else if ([v7 isEqualToString:@"ROUNDABOUT_EXIT_16"])
    {
      uint64_t v8 = 56;
    }
    else if ([v7 isEqualToString:@"ROUNDABOUT_EXIT_17"])
    {
      uint64_t v8 = 57;
    }
    else if ([v7 isEqualToString:@"ROUNDABOUT_EXIT_18"])
    {
      uint64_t v8 = 58;
    }
    else if ([v7 isEqualToString:@"ROUNDABOUT_EXIT_19"])
    {
      uint64_t v8 = 59;
    }
    else if ([v7 isEqualToString:@"SHARP_LEFT_TURN"])
    {
      uint64_t v8 = 60;
    }
    else if ([v7 isEqualToString:@"SHARP_RIGHT_TURN"])
    {
      uint64_t v8 = 61;
    }
    else if ([v7 isEqualToString:@"SLIGHT_LEFT_TURN"])
    {
      uint64_t v8 = 62;
    }
    else if ([v7 isEqualToString:@"SLIGHT_RIGHT_TURN"])
    {
      uint64_t v8 = 63;
    }
    else if ([v7 isEqualToString:@"CHANGE_HIGHWAY"])
    {
      uint64_t v8 = 64;
    }
    else if ([v7 isEqualToString:@"CHANGE_HIGHWAY_LEFT"])
    {
      uint64_t v8 = 65;
    }
    else if ([v7 isEqualToString:@"CHANGE_HIGHWAY_RIGHT"])
    {
      uint64_t v8 = 66;
    }
    else if ([v7 isEqualToString:@"TOLL_STATION"])
    {
      uint64_t v8 = 80;
    }
    else if ([v7 isEqualToString:@"ENTER_TUNNEL"])
    {
      uint64_t v8 = 81;
    }
    else if ([v7 isEqualToString:@"WAYPOINT_STOP"])
    {
      uint64_t v8 = 82;
    }
    else if ([v7 isEqualToString:@"WAYPOINT_STOP_LEFT"])
    {
      uint64_t v8 = 83;
    }
    else if ([v7 isEqualToString:@"WAYPOINT_STOP_RIGHT"])
    {
      uint64_t v8 = 84;
    }
    else if ([v7 isEqualToString:@"RESUME_ROUTE"])
    {
      uint64_t v8 = 85;
    }
    else if ([v7 isEqualToString:@"RESUME_ROUTE_WITH_U_TURN"])
    {
      uint64_t v8 = 86;
    }
    else if ([v7 isEqualToString:@"CUSTOM"])
    {
      uint64_t v8 = 87;
    }
    else if ([v7 isEqualToString:@"TURN_AROUND"])
    {
      uint64_t v8 = 88;
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_135;
    }
    uint64_t v8 = [v6 intValue];
  }
  [a1 setManeuverType:v8];
LABEL_135:

  int v9 = [v5 objectForKeyedSubscript:@"shield"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = (void *)[v9 copy];
    [a1 setShield:v10];
  }
  uint64_t v11 = [v5 objectForKeyedSubscript:@"shieldType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setShieldType:", objc_msgSend(v11, "intValue"));
  }

  uint64_t v12 = [v5 objectForKeyedSubscript:@"junctionType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v12;
    if ([v13 isEqualToString:@"JCTTYPE_NORMAL"]) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = [v13 isEqualToString:@"JCTTYPE_ROUNDABOUT"];
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
  [a1 setJunctionType:v14];
LABEL_147:

  v15 = [v5 objectForKeyedSubscript:@"junctionElement"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v16 = v15;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v66 objects:v72 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v67;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v67 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v66 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v64 = 0;
            uint64_t v65 = 0;
            _GEOJunctionElementFromDictionaryRepresentation(v21, (uint64_t)&v64);
            objc_msgSend(a1, "addJunctionElement:", v64, v65);
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v66 objects:v72 count:16];
      }
      while (v18);
    }
  }
  v22 = [v5 objectForKeyedSubscript:@"maneuverName"];
  objc_opt_class();
  id v55 = v5;
  if (objc_opt_isKindOfClass())
  {
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v23 = v22;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v60 objects:v71 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v61;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v61 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void *)(*((void *)&v60 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v29 = [GEONameInfoList alloc];
            if (a3) {
              uint64_t v30 = [(GEONameInfoList *)v29 initWithJSON:v28];
            }
            else {
              uint64_t v30 = [(GEONameInfoList *)v29 initWithDictionary:v28];
            }
            v31 = (void *)v30;
            [a1 addManeuverName:v30];
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v60 objects:v71 count:16];
      }
      while (v25);
    }

    id v5 = v55;
  }

  v32 = [v5 objectForKeyedSubscript:@"signpost"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v33 = v32;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v56 objects:v70 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v57;
      do
      {
        for (uint64_t k = 0; k != v35; ++k)
        {
          if (*(void *)v57 != v36) {
            objc_enumerationMutation(v33);
          }
          uint64_t v38 = *(void *)(*((void *)&v56 + 1) + 8 * k);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v39 = [GEONameInfo alloc];
            if (a3) {
              uint64_t v40 = [(GEONameInfo *)v39 initWithJSON:v38];
            }
            else {
              uint64_t v40 = [(GEONameInfo *)v39 initWithDictionary:v38];
            }
            long long v41 = (void *)v40;
            [a1 addSignpost:v40];
          }
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v56 objects:v70 count:16];
      }
      while (v35);
    }

    id v5 = v55;
  }

  long long v42 = [v5 objectForKeyedSubscript:@"toFreeway"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setToFreeway:", objc_msgSend(v42, "BOOLValue"));
  }

  long long v43 = [v5 objectForKeyedSubscript:@"exitNumber"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v44 = [GEONameInfo alloc];
    if (a3) {
      uint64_t v45 = [(GEONameInfo *)v44 initWithJSON:v43];
    }
    else {
      uint64_t v45 = [(GEONameInfo *)v44 initWithDictionary:v43];
    }
    long long v46 = (void *)v45;
    [a1 setExitNumber:v45];
  }
  long long v47 = [v5 objectForKeyedSubscript:@"drivingSide"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v48 = v47;
    if ([v48 isEqualToString:@"RIGHT_SIDE"]) {
      uint64_t v49 = 0;
    }
    else {
      uint64_t v49 = [v48 isEqualToString:@"LEFT_SIDE"];
    }

    goto LABEL_200;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v49 = [v47 intValue];
LABEL_200:
    [a1 setDrivingSide:v49];
  }

  v50 = [v5 objectForKeyedSubscript:@"artworkOverride"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v51 = [GEOPBTransitArtwork alloc];
    if (a3) {
      uint64_t v52 = [(GEOPBTransitArtwork *)v51 initWithJSON:v50];
    }
    else {
      uint64_t v52 = [(GEOPBTransitArtwork *)v51 initWithDictionary:v50];
    }
    v53 = (void *)v52;
    [a1 setArtworkOverride:v52];
  }
LABEL_207:

  return a1;
}

- (GEOCompanionCyclingStep)initWithJSON:(id)a3
{
  return (GEOCompanionCyclingStep *)-[GEOCompanionCyclingStep _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_18;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_18;
    }
    GEOCompanionCyclingStepReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOCompanionCyclingStepCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCompanionCyclingStepIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCompanionCyclingStepReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOCompanionCyclingStepIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v17 = self->_reader;
    objc_sync_enter(v17);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v18 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v18];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v17);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOCompanionCyclingStep *)self readAll:0];
    if ((*(_WORD *)&self->_flags & 4) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_shield) {
      PBDataWriterWriteStringField();
    }
    __int16 flags = (__int16)self->_flags;
    if ((flags & 8) != 0)
    {
      PBDataWriterWriteSint32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_junctionElementsCount)
    {
      uint64_t v7 = 0;
      unint64_t v8 = 0;
      do
      {
        uint64_t v27 = 0;
        PBDataWriterPlaceMark();
        GEOJunctionElementWriteTo((uint64_t)&self->_junctionElements[v7]);
        PBDataWriterRecallMark();
        ++v8;
        ++v7;
      }
      while (v8 < self->_junctionElementsCount);
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    int v9 = self->_maneuverNames;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v9);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v23 objects:v29 count:16];
      }
      while (v10);
    }

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v13 = self->_signposts;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v19 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v13);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v19 objects:v28 count:16];
      }
      while (v14);
    }

    if ((*(_WORD *)&self->_flags & 0x10) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_exitNumber) {
      PBDataWriterWriteSubmessage();
    }
    if (*(_WORD *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_artworkOverride) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (void)copyTo:(id)a3
{
  long long v20 = (id *)a3;
  [(GEOCompanionCyclingStep *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v20 + 1, self->_reader);
  *((_DWORD *)v20 + 20) = self->_readerMarkPos;
  *((_DWORD *)v20 + 21) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  id v4 = v20;
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v20 + 25) = self->_maneuverType;
    *((_WORD *)v20 + 56) |= 4u;
  }
  if (self->_shield)
  {
    objc_msgSend(v20, "setShield:");
    id v4 = v20;
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    *((_DWORD *)v4 + 26) = self->_shieldType;
    *((_WORD *)v4 + 56) |= 8u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v4 + 24) = self->_junctionType;
    *((_WORD *)v4 + 56) |= 2u;
  }
  if ([(GEOCompanionCyclingStep *)self junctionElementsCount])
  {
    [v20 clearJunctionElements];
    unint64_t v6 = [(GEOCompanionCyclingStep *)self junctionElementsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(GEOCompanionCyclingStep *)self junctionElementAtIndex:i];
        objc_msgSend(v20, "addJunctionElement:", v9, v10);
      }
    }
  }
  if ([(GEOCompanionCyclingStep *)self maneuverNamesCount])
  {
    [v20 clearManeuverNames];
    unint64_t v11 = [(GEOCompanionCyclingStep *)self maneuverNamesCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t j = 0; j != v12; ++j)
      {
        uint64_t v14 = [(GEOCompanionCyclingStep *)self maneuverNameAtIndex:j];
        [v20 addManeuverName:v14];
      }
    }
  }
  if ([(GEOCompanionCyclingStep *)self signpostsCount])
  {
    [v20 clearSignposts];
    unint64_t v15 = [(GEOCompanionCyclingStep *)self signpostsCount];
    if (v15)
    {
      unint64_t v16 = v15;
      for (uint64_t k = 0; k != v16; ++k)
      {
        uint64_t v18 = [(GEOCompanionCyclingStep *)self signpostAtIndex:k];
        [v20 addSignpost:v18];
      }
    }
  }
  long long v19 = v20;
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
    *((unsigned char *)v20 + 108) = self->_toFreeway;
    *((_WORD *)v20 + 56) |= 0x10u;
  }
  if (self->_exitNumber)
  {
    objc_msgSend(v20, "setExitNumber:");
    long long v19 = v20;
  }
  if (*(_WORD *)&self->_flags)
  {
    *((_DWORD *)v19 + 23) = self->_drivingSide;
    *((_WORD *)v19 + 56) |= 1u;
  }
  if (self->_artworkOverride)
  {
    objc_msgSend(v20, "setArtworkOverride:");
    long long v19 = v20;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x800) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOCompanionCyclingStepReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_32;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOCompanionCyclingStep *)self readAll:0];
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 100) = self->_maneuverType;
    *(_WORD *)(v5 + 112) |= 4u;
  }
  uint64_t v9 = [(NSString *)self->_shield copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v9;

  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 104) = self->_shieldType;
    *(_WORD *)(v5 + 112) |= 8u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_junctionType;
    *(_WORD *)(v5 + 112) |= 2u;
  }
  unint64_t junctionElementsCount = self->_junctionElementsCount;
  if (junctionElementsCount)
  {
    -[GEOCompanionCyclingStep _reserveJunctionElements:](v5, junctionElementsCount);
    memcpy(*(void **)(v5 + 16), self->_junctionElements, 16 * self->_junctionElementsCount);
    *(void *)(v5 + 24) = self->_junctionElementsCount;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v13 = self->_maneuverNames;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = (void *)[*(id *)(*((void *)&v31 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addManeuverName:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v14);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v18 = self->_signposts;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v18);
        }
        long long v22 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * j), "copyWithZone:", a3, (void)v27);
        [(id)v5 addSignpost:v22];
      }
      uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v19);
  }

  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
    *(unsigned char *)(v5 + 108) = self->_toFreeway;
    *(_WORD *)(v5 + 112) |= 0x10u;
  }
  id v23 = -[GEONameInfo copyWithZone:](self->_exitNumber, "copyWithZone:", a3, (void)v27);
  long long v24 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v23;

  if (*(_WORD *)&self->_flags)
  {
    *(_DWORD *)(v5 + 92) = self->_drivingSide;
    *(_WORD *)(v5 + 112) |= 1u;
  }
  id v25 = [(GEOPBTransitArtwork *)self->_artworkOverride copyWithZone:a3];
  id v8 = *(id *)(v5 + 40);
  *(void *)(v5 + 40) = v25;
LABEL_32:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (const void **)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  [(GEOCompanionCyclingStep *)self readAll:1];
  [v4 readAll:1];
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 56);
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_maneuverType != *((_DWORD *)v4 + 25)) {
      goto LABEL_22;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_22;
  }
  shield = self->_shield;
  if ((unint64_t)shield | (unint64_t)v4[8])
  {
    if (!-[NSString isEqual:](shield, "isEqual:")) {
      goto LABEL_22;
    }
    __int16 flags = (__int16)self->_flags;
    __int16 v6 = *((_WORD *)v4 + 56);
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_shieldType != *((_DWORD *)v4 + 26)) {
      goto LABEL_22;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_22;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_junctionType != *((_DWORD *)v4 + 24)) {
      goto LABEL_22;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_22;
  }
  unint64_t junctionElementsCount = self->_junctionElementsCount;
  if ((const void *)junctionElementsCount != v4[3]) {
    goto LABEL_22;
  }
  if (memcmp(self->_junctionElements, v4[2], 16 * junctionElementsCount)) {
    goto LABEL_22;
  }
  maneuverNames = self->_maneuverNames;
  if ((unint64_t)maneuverNames | (unint64_t)v4[7])
  {
    if (!-[NSMutableArray isEqual:](maneuverNames, "isEqual:")) {
      goto LABEL_22;
    }
  }
  signposts = self->_signposts;
  if ((unint64_t)signposts | (unint64_t)v4[9])
  {
    if (!-[NSMutableArray isEqual:](signposts, "isEqual:")) {
      goto LABEL_22;
    }
  }
  __int16 v13 = (__int16)self->_flags;
  __int16 v14 = *((_WORD *)v4 + 56);
  if ((v13 & 0x10) != 0)
  {
    if ((v14 & 0x10) == 0) {
      goto LABEL_22;
    }
    if (self->_toFreeway)
    {
      if (!*((unsigned char *)v4 + 108)) {
        goto LABEL_22;
      }
    }
    else if (*((unsigned char *)v4 + 108))
    {
      goto LABEL_22;
    }
  }
  else if ((v14 & 0x10) != 0)
  {
    goto LABEL_22;
  }
  exitNumber = self->_exitNumber;
  if ((unint64_t)exitNumber | (unint64_t)v4[6])
  {
    if (!-[GEONameInfo isEqual:](exitNumber, "isEqual:")) {
      goto LABEL_22;
    }
    __int16 v13 = (__int16)self->_flags;
    __int16 v14 = *((_WORD *)v4 + 56);
  }
  if ((v13 & 1) == 0)
  {
    if ((v14 & 1) == 0) {
      goto LABEL_44;
    }
LABEL_22:
    char v9 = 0;
    goto LABEL_23;
  }
  if ((v14 & 1) == 0 || self->_drivingSide != *((_DWORD *)v4 + 23)) {
    goto LABEL_22;
  }
LABEL_44:
  artworkOverride = self->_artworkOverride;
  if ((unint64_t)artworkOverride | (unint64_t)v4[5]) {
    char v9 = -[GEOPBTransitArtwork isEqual:](artworkOverride, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_23:

  return v9;
}

- (unint64_t)hash
{
  [(GEOCompanionCyclingStep *)self readAll:1];
  if ((*(_WORD *)&self->_flags & 4) != 0) {
    uint64_t v14 = 2654435761 * self->_maneuverType;
  }
  else {
    uint64_t v14 = 0;
  }
  NSUInteger v3 = [(NSString *)self->_shield hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    uint64_t v5 = 2654435761 * self->_shieldType;
    if ((flags & 2) != 0) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((flags & 2) != 0)
    {
LABEL_6:
      uint64_t v6 = 2654435761 * self->_junctionType;
      goto LABEL_9;
    }
  }
  uint64_t v6 = 0;
LABEL_9:
  uint64_t v7 = PBHashBytes();
  uint64_t v8 = [(NSMutableArray *)self->_maneuverNames hash];
  uint64_t v9 = [(NSMutableArray *)self->_signposts hash];
  if ((*(_WORD *)&self->_flags & 0x10) != 0) {
    uint64_t v10 = 2654435761 * self->_toFreeway;
  }
  else {
    uint64_t v10 = 0;
  }
  unint64_t v11 = [(GEONameInfo *)self->_exitNumber hash];
  if (*(_WORD *)&self->_flags) {
    uint64_t v12 = 2654435761 * self->_drivingSide;
  }
  else {
    uint64_t v12 = 0;
  }
  return v3 ^ v14 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ [(GEOPBTransitArtwork *)self->_artworkOverride hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if ((*((_WORD *)v4 + 56) & 4) != 0)
  {
    self->_maneuverType = *((_DWORD *)v4 + 25);
    *(_WORD *)&self->_flags |= 4u;
  }
  if (*((void *)v4 + 8)) {
    -[GEOCompanionCyclingStep setShield:](self, "setShield:");
  }
  __int16 v5 = *((_WORD *)v4 + 56);
  if ((v5 & 8) != 0)
  {
    self->_shieldType = *((_DWORD *)v4 + 26);
    *(_WORD *)&self->_flags |= 8u;
    __int16 v5 = *((_WORD *)v4 + 56);
  }
  if ((v5 & 2) != 0)
  {
    self->_junctionType = *((_DWORD *)v4 + 24);
    *(_WORD *)&self->_flags |= 2u;
  }
  uint64_t v6 = [v4 junctionElementsCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
    {
      uint64_t v9 = [v4 junctionElementAtIndex:i];
      -[GEOCompanionCyclingStep addJunctionElement:](self, "addJunctionElement:", v9, v10);
    }
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v11 = *((id *)v4 + 7);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(v11);
        }
        [(GEOCompanionCyclingStep *)self addManeuverName:*(void *)(*((void *)&v29 + 1) + 8 * j)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v13);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v16 = *((id *)v4 + 9);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        -[GEOCompanionCyclingStep addSignpost:](self, "addSignpost:", *(void *)(*((void *)&v25 + 1) + 8 * k), (void)v25);
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v18);
  }

  if ((*((_WORD *)v4 + 56) & 0x10) != 0)
  {
    self->_toFreeway = *((unsigned char *)v4 + 108);
    *(_WORD *)&self->_flags |= 0x10u;
  }
  exitNumber = self->_exitNumber;
  uint64_t v22 = *((void *)v4 + 6);
  if (exitNumber)
  {
    if (v22) {
      -[GEONameInfo mergeFrom:](exitNumber, "mergeFrom:");
    }
  }
  else if (v22)
  {
    -[GEOCompanionCyclingStep setExitNumber:](self, "setExitNumber:");
  }
  if (*((_WORD *)v4 + 56))
  {
    self->_drivingSide = *((_DWORD *)v4 + 23);
    *(_WORD *)&self->_flags |= 1u;
  }
  artworkOverride = self->_artworkOverride;
  uint64_t v24 = *((void *)v4 + 5);
  if (artworkOverride)
  {
    if (v24) {
      -[GEOPBTransitArtwork mergeFrom:](artworkOverride, "mergeFrom:");
    }
  }
  else if (v24)
  {
    -[GEOCompanionCyclingStep setArtworkOverride:](self, "setArtworkOverride:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signposts, 0);
  objc_storeStrong((id *)&self->_shield, 0);
  objc_storeStrong((id *)&self->_maneuverNames, 0);
  objc_storeStrong((id *)&self->_exitNumber, 0);
  objc_storeStrong((id *)&self->_artworkOverride, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (int)transportType
{
  return 3;
}

@end