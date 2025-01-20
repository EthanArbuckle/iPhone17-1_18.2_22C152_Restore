@interface GEOCompanionWalkStep
+ (BOOL)isValid:(id)a3;
+ (Class)maneuverNameType;
+ (Class)signpostType;
- (BOOL)hasArtworkOverride;
- (BOOL)hasJunctionType;
- (BOOL)hasManeuverType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOCompanionWalkStep)init;
- (GEOCompanionWalkStep)initWithData:(id)a3;
- (GEOCompanionWalkStep)initWithDictionary:(id)a3;
- (GEOCompanionWalkStep)initWithJSON:(id)a3;
- (GEOJunctionElement)junctionElementAtIndex:(unint64_t)a3;
- (GEOJunctionElement)junctionElements;
- (GEOPBTransitArtwork)artworkOverride;
- (NSMutableArray)maneuverNames;
- (NSMutableArray)signposts;
- (NSString)description;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)junctionTypeAsString:(int)a3;
- (id)maneuverNameAtIndex:(unint64_t)a3;
- (id)maneuverTypeAsString:(int)a3;
- (id)signpostAtIndex:(unint64_t)a3;
- (int)StringAsJunctionType:(id)a3;
- (int)StringAsManeuverType:(id)a3;
- (int)junctionType;
- (int)maneuverType;
- (int)transportType;
- (uint64_t)_reserveJunctionElements:(uint64_t)a1;
- (unint64_t)hash;
- (unint64_t)junctionElementsCount;
- (unint64_t)maneuverNamesCount;
- (unint64_t)signpostsCount;
- (void)_addNoFlagsManeuverName:(uint64_t)a1;
- (void)_addNoFlagsSignpost:(uint64_t)a1;
- (void)_readArtworkOverride;
- (void)_readJunctionElements;
- (void)_readManeuverNames;
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
- (void)setHasJunctionType:(BOOL)a3;
- (void)setHasManeuverType:(BOOL)a3;
- (void)setJunctionElements:(GEOJunctionElement *)a3 count:(unint64_t)a4;
- (void)setJunctionType:(int)a3;
- (void)setManeuverNames:(id)a3;
- (void)setManeuverType:(int)a3;
- (void)setSignposts:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOCompanionWalkStep

- (GEOCompanionWalkStep)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOCompanionWalkStep;
  v2 = [(GEOCompanionWalkStep *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOCompanionWalkStep)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOCompanionWalkStep;
  v3 = [(GEOCompanionWalkStep *)&v7 initWithData:a3];
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
  [(GEOCompanionWalkStep *)self clearJunctionElements];
  v3.receiver = self;
  v3.super_class = (Class)GEOCompanionWalkStep;
  [(GEOCompanionWalkStep *)&v3 dealloc];
}

- (int)maneuverType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_maneuverType;
  }
  else {
    return 0;
  }
}

- (void)setManeuverType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x42u;
  self->_maneuverType = a3;
}

- (void)setHasManeuverType:(BOOL)a3
{
  if (a3) {
    char v3 = 66;
  }
  else {
    char v3 = 64;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasManeuverType
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
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

- (int)junctionType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_junctionType;
  }
  else {
    return 0;
  }
}

- (void)setJunctionType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x41u;
  self->_junctionType = a3;
}

- (void)setHasJunctionType:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasJunctionType
{
  return *(unsigned char *)&self->_flags & 1;
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 84) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionWalkStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readJunctionElements_tags_1215);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
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
    uint64_t result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 16), 16 * v9, 0xB108DF27uLL);
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
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  self->_junctionElementsSpace = 0;
  self->_junctionElementsCount = 0;
  free(self->_junctionElements);
  self->_junctionElements = 0;
}

- (void)addJunctionElement:(GEOJunctionElement)a3
{
  uint64_t v3 = *(void *)&a3.var2;
  uint64_t v4 = *(void *)&a3.var0;
  -[GEOCompanionWalkStep _readJunctionElements]((uint64_t)self);
  if (self && -[GEOCompanionWalkStep _reserveJunctionElements:]((uint64_t)self, 1uLL))
  {
    unint64_t v6 = &self->_junctionElements[self->_junctionElementsCount];
    *(void *)&v6->var0 = v4;
    *(void *)&v6->var2 = v3;
    ++self->_junctionElementsCount;
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
}

- (GEOJunctionElement)junctionElementAtIndex:(unint64_t)a3
{
  -[GEOCompanionWalkStep _readJunctionElements]((uint64_t)self);
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
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  [(GEOCompanionWalkStep *)self clearJunctionElements];
  if (-[GEOCompanionWalkStep _reserveJunctionElements:]((uint64_t)self, a4))
  {
    memcpy(self->_junctionElements, a3, 16 * a4);
    self->_unint64_t junctionElementsCount = a4;
  }
}

- (void)_readManeuverNames
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 84) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionWalkStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readManeuverNames_tags_1216);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)maneuverNames
{
  -[GEOCompanionWalkStep _readManeuverNames]((uint64_t)self);
  maneuverNames = self->_maneuverNames;

  return maneuverNames;
}

- (void)setManeuverNames:(id)a3
{
  uint64_t v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  maneuverNames = self->_maneuverNames;
  self->_maneuverNames = v4;
}

- (void)clearManeuverNames
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  maneuverNames = self->_maneuverNames;

  [(NSMutableArray *)maneuverNames removeAllObjects];
}

- (void)addManeuverName:(id)a3
{
  id v4 = a3;
  -[GEOCompanionWalkStep _readManeuverNames]((uint64_t)self);
  -[GEOCompanionWalkStep _addNoFlagsManeuverName:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsManeuverName:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      id v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)maneuverNamesCount
{
  -[GEOCompanionWalkStep _readManeuverNames]((uint64_t)self);
  maneuverNames = self->_maneuverNames;

  return [(NSMutableArray *)maneuverNames count];
}

- (id)maneuverNameAtIndex:(unint64_t)a3
{
  -[GEOCompanionWalkStep _readManeuverNames]((uint64_t)self);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 84) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionWalkStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSignposts_tags_1217);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)signposts
{
  -[GEOCompanionWalkStep _readSignposts]((uint64_t)self);
  signposts = self->_signposts;

  return signposts;
}

- (void)setSignposts:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  signposts = self->_signposts;
  self->_signposts = v4;
}

- (void)clearSignposts
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  signposts = self->_signposts;

  [(NSMutableArray *)signposts removeAllObjects];
}

- (void)addSignpost:(id)a3
{
  id v4 = a3;
  -[GEOCompanionWalkStep _readSignposts]((uint64_t)self);
  -[GEOCompanionWalkStep _addNoFlagsSignpost:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsSignpost:(uint64_t)a1
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

- (unint64_t)signpostsCount
{
  -[GEOCompanionWalkStep _readSignposts]((uint64_t)self);
  signposts = self->_signposts;

  return [(NSMutableArray *)signposts count];
}

- (id)signpostAtIndex:(unint64_t)a3
{
  -[GEOCompanionWalkStep _readSignposts]((uint64_t)self);
  signposts = self->_signposts;

  return (id)[(NSMutableArray *)signposts objectAtIndex:a3];
}

+ (Class)signpostType
{
  return (Class)objc_opt_class();
}

- (void)_readArtworkOverride
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 84) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionWalkStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readArtworkOverride_tags_1218);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasArtworkOverride
{
  return self->_artworkOverride != 0;
}

- (GEOPBTransitArtwork)artworkOverride
{
  -[GEOCompanionWalkStep _readArtworkOverride]((uint64_t)self);
  artworkOverride = self->_artworkOverride;

  return artworkOverride;
}

- (void)setArtworkOverride:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_artworkOverride, a3);
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOCompanionWalkStep;
  id v4 = [(GEOCompanionWalkStep *)&v8 description];
  id v5 = [(GEOCompanionWalkStep *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCompanionWalkStep _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 84);
    if ((v5 & 2) != 0)
    {
      unint64_t v6 = @"NO_TURN";
      switch(*(_DWORD *)(a1 + 80))
      {
        case 0:
          break;
        case 1:
          unint64_t v6 = @"LEFT_TURN";
          break;
        case 2:
          unint64_t v6 = @"RIGHT_TURN";
          break;
        case 3:
          unint64_t v6 = @"STRAIGHT_AHEAD";
          break;
        case 4:
          unint64_t v6 = @"U_TURN";
          break;
        case 5:
          unint64_t v6 = @"FOLLOW_ROAD";
          break;
        case 6:
          unint64_t v6 = @"ENTER_ROUNDABOUT";
          break;
        case 7:
          unint64_t v6 = @"EXIT_ROUNDABOUT";
          break;
        case 0xB:
          unint64_t v6 = @"OFF_RAMP";
          break;
        case 0xC:
          unint64_t v6 = @"ON_RAMP";
          break;
        case 0x10:
          unint64_t v6 = @"ARRIVE_END_OF_NAVIGATION";
          break;
        case 0x11:
          unint64_t v6 = @"START_ROUTE";
          break;
        case 0x12:
          unint64_t v6 = @"ARRIVE_AT_DESTINATION";
          break;
        case 0x14:
          unint64_t v6 = @"KEEP_LEFT";
          break;
        case 0x15:
          unint64_t v6 = @"KEEP_RIGHT";
          break;
        case 0x16:
          unint64_t v6 = @"ENTER_FERRY";
          break;
        case 0x17:
          unint64_t v6 = @"EXIT_FERRY";
          break;
        case 0x18:
          unint64_t v6 = @"CHANGE_FERRY";
          break;
        case 0x19:
          unint64_t v6 = @"START_ROUTE_WITH_U_TURN";
          break;
        case 0x1A:
          unint64_t v6 = @"U_TURN_AT_ROUNDABOUT";
          break;
        case 0x1B:
          unint64_t v6 = @"LEFT_TURN_AT_END";
          break;
        case 0x1C:
          unint64_t v6 = @"RIGHT_TURN_AT_END";
          break;
        case 0x1D:
          unint64_t v6 = @"HIGHWAY_OFF_RAMP_LEFT";
          break;
        case 0x1E:
          unint64_t v6 = @"HIGHWAY_OFF_RAMP_RIGHT";
          break;
        case 0x21:
          unint64_t v6 = @"ARRIVE_AT_DESTINATION_LEFT";
          break;
        case 0x22:
          unint64_t v6 = @"ARRIVE_AT_DESTINATION_RIGHT";
          break;
        case 0x23:
          unint64_t v6 = @"U_TURN_WHEN_POSSIBLE";
          break;
        case 0x27:
          unint64_t v6 = @"ARRIVE_END_OF_DIRECTIONS";
          break;
        case 0x29:
          unint64_t v6 = @"ROUNDABOUT_EXIT_1";
          break;
        case 0x2A:
          unint64_t v6 = @"ROUNDABOUT_EXIT_2";
          break;
        case 0x2B:
          unint64_t v6 = @"ROUNDABOUT_EXIT_3";
          break;
        case 0x2C:
          unint64_t v6 = @"ROUNDABOUT_EXIT_4";
          break;
        case 0x2D:
          unint64_t v6 = @"ROUNDABOUT_EXIT_5";
          break;
        case 0x2E:
          unint64_t v6 = @"ROUNDABOUT_EXIT_6";
          break;
        case 0x2F:
          unint64_t v6 = @"ROUNDABOUT_EXIT_7";
          break;
        case 0x30:
          unint64_t v6 = @"ROUNDABOUT_EXIT_8";
          break;
        case 0x31:
          unint64_t v6 = @"ROUNDABOUT_EXIT_9";
          break;
        case 0x32:
          unint64_t v6 = @"ROUNDABOUT_EXIT_10";
          break;
        case 0x33:
          unint64_t v6 = @"ROUNDABOUT_EXIT_11";
          break;
        case 0x34:
          unint64_t v6 = @"ROUNDABOUT_EXIT_12";
          break;
        case 0x35:
          unint64_t v6 = @"ROUNDABOUT_EXIT_13";
          break;
        case 0x36:
          unint64_t v6 = @"ROUNDABOUT_EXIT_14";
          break;
        case 0x37:
          unint64_t v6 = @"ROUNDABOUT_EXIT_15";
          break;
        case 0x38:
          unint64_t v6 = @"ROUNDABOUT_EXIT_16";
          break;
        case 0x39:
          unint64_t v6 = @"ROUNDABOUT_EXIT_17";
          break;
        case 0x3A:
          unint64_t v6 = @"ROUNDABOUT_EXIT_18";
          break;
        case 0x3B:
          unint64_t v6 = @"ROUNDABOUT_EXIT_19";
          break;
        case 0x3C:
          unint64_t v6 = @"SHARP_LEFT_TURN";
          break;
        case 0x3D:
          unint64_t v6 = @"SHARP_RIGHT_TURN";
          break;
        case 0x3E:
          unint64_t v6 = @"SLIGHT_LEFT_TURN";
          break;
        case 0x3F:
          unint64_t v6 = @"SLIGHT_RIGHT_TURN";
          break;
        case 0x40:
          unint64_t v6 = @"CHANGE_HIGHWAY";
          break;
        case 0x41:
          unint64_t v6 = @"CHANGE_HIGHWAY_LEFT";
          break;
        case 0x42:
          unint64_t v6 = @"CHANGE_HIGHWAY_RIGHT";
          break;
        case 0x50:
          unint64_t v6 = @"TOLL_STATION";
          break;
        case 0x51:
          unint64_t v6 = @"ENTER_TUNNEL";
          break;
        case 0x52:
          unint64_t v6 = @"WAYPOINT_STOP";
          break;
        case 0x53:
          unint64_t v6 = @"WAYPOINT_STOP_LEFT";
          break;
        case 0x54:
          unint64_t v6 = @"WAYPOINT_STOP_RIGHT";
          break;
        case 0x55:
          unint64_t v6 = @"RESUME_ROUTE";
          break;
        case 0x56:
          unint64_t v6 = @"RESUME_ROUTE_WITH_U_TURN";
          break;
        case 0x57:
          unint64_t v6 = @"CUSTOM";
          break;
        case 0x58:
          unint64_t v6 = @"TURN_AROUND";
          break;
        default:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 80));
          unint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
      }
      [v4 setObject:v6 forKey:@"maneuverType"];

      char v5 = *(unsigned char *)(a1 + 84);
    }
    if (v5)
    {
      int v7 = *(_DWORD *)(a1 + 76);
      if (v7)
      {
        if (v7 == 1)
        {
          objc_super v8 = @"JCTTYPE_ROUNDABOUT";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 76));
          objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        objc_super v8 = @"JCTTYPE_NORMAL";
      }
      [v4 setObject:v8 forKey:@"junctionType"];
    }
    if (*(void *)(a1 + 24))
    {
      unint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 24)];
      if (*(void *)(a1 + 24))
      {
        uint64_t v10 = 0;
        unint64_t v11 = 0;
        do
        {
          uint64_t v12 = _GEOJunctionElementDictionaryRepresentation((unsigned int *)(*(void *)(a1 + 16) + v10));
          [v9 addObject:v12];

          ++v11;
          v10 += 16;
        }
        while (v11 < *(void *)(a1 + 24));
      }
      [v4 setObject:v9 forKey:@"junctionElement"];
    }
    if ([*(id *)(a1 + 48) count])
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v14 = *(id *)(a1 + 48);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v38 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            if (a2) {
              [v19 jsonRepresentation];
            }
            else {
            v20 = [v19 dictionaryRepresentation];
            }
            [v13 addObject:v20];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v37 objects:v42 count:16];
        }
        while (v16);
      }

      [v4 setObject:v13 forKey:@"maneuverName"];
    }
    if ([*(id *)(a1 + 56) count])
    {
      v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v22 = *(id *)(a1 + 56);
      uint64_t v23 = [v22 countByEnumeratingWithState:&v33 objects:v41 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v34;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v34 != v25) {
              objc_enumerationMutation(v22);
            }
            v27 = *(void **)(*((void *)&v33 + 1) + 8 * j);
            if (a2) {
              [v27 jsonRepresentation];
            }
            else {
            v28 = [v27 dictionaryRepresentation];
            }
            [v21 addObject:v28];
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v33 objects:v41 count:16];
        }
        while (v24);
      }

      [v4 setObject:v21 forKey:@"signpost"];
    }
    v29 = [(id)a1 artworkOverride];
    v30 = v29;
    if (v29)
    {
      if (a2) {
        [v29 jsonRepresentation];
      }
      else {
      v31 = [v29 dictionaryRepresentation];
      }
      [v4 setObject:v31 forKey:@"artworkOverride"];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOCompanionWalkStep _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOCompanionWalkStep)initWithDictionary:(id)a3
{
  return (GEOCompanionWalkStep *)-[GEOCompanionFerryStep _initWithDictionary:isJSON:](self, a3, 0);
}

- (GEOCompanionWalkStep)initWithJSON:(id)a3
{
  return (GEOCompanionWalkStep *)-[GEOCompanionFerryStep _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    int v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_1219;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1220;
    }
    GEOCompanionWalkStepReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOCompanionWalkStepCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCompanionWalkStepIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCompanionWalkStepReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOCompanionWalkStepIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v17 = self->_reader;
    objc_sync_enter(v17);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v18 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v18];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v17);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOCompanionWalkStep *)self readAll:0];
    char flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      char flags = (char)self->_flags;
    }
    if (flags) {
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
    unint64_t v9 = self->_maneuverNames;
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
    v13 = self->_signposts;
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

    if (self->_artworkOverride) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (void)copyTo:(id)a3
{
  v18 = (id *)a3;
  [(GEOCompanionWalkStep *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v18 + 1, self->_reader);
  *((_DWORD *)v18 + 16) = self->_readerMarkPos;
  *((_DWORD *)v18 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v18 + 20) = self->_maneuverType;
    *((unsigned char *)v18 + 84) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((_DWORD *)v18 + 19) = self->_junctionType;
    *((unsigned char *)v18 + 84) |= 1u;
  }
  if ([(GEOCompanionWalkStep *)self junctionElementsCount])
  {
    [v18 clearJunctionElements];
    unint64_t v5 = [(GEOCompanionWalkStep *)self junctionElementsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(GEOCompanionWalkStep *)self junctionElementAtIndex:i];
        objc_msgSend(v18, "addJunctionElement:", v8, v9);
      }
    }
  }
  if ([(GEOCompanionWalkStep *)self maneuverNamesCount])
  {
    [v18 clearManeuverNames];
    unint64_t v10 = [(GEOCompanionWalkStep *)self maneuverNamesCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        v13 = [(GEOCompanionWalkStep *)self maneuverNameAtIndex:j];
        [v18 addManeuverName:v13];
      }
    }
  }
  if ([(GEOCompanionWalkStep *)self signpostsCount])
  {
    [v18 clearSignposts];
    unint64_t v14 = [(GEOCompanionWalkStep *)self signpostsCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t k = 0; k != v15; ++k)
      {
        uint64_t v17 = [(GEOCompanionWalkStep *)self signpostAtIndex:k];
        [v18 addSignpost:v17];
      }
    }
  }
  if (self->_artworkOverride) {
    objc_msgSend(v18, "setArtworkOverride:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOCompanionWalkStepReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_26;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOCompanionWalkStep *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_maneuverType;
    *(unsigned char *)(v5 + 84) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(_DWORD *)(v5 + 76) = self->_junctionType;
    *(unsigned char *)(v5 + 84) |= 1u;
  }
  unint64_t junctionElementsCount = self->_junctionElementsCount;
  if (junctionElementsCount)
  {
    -[GEOCompanionWalkStep _reserveJunctionElements:](v5, junctionElementsCount);
    memcpy(*(void **)(v5 + 16), self->_junctionElements, 16 * self->_junctionElementsCount);
    *(void *)(v5 + 24) = self->_junctionElementsCount;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  unint64_t v11 = self->_maneuverNames;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v11);
        }
        unint64_t v15 = (void *)[*(id *)(*((void *)&v27 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addManeuverName:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v12);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v16 = self->_signposts;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v16);
        }
        long long v20 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * j), "copyWithZone:", a3, (void)v23);
        [(id)v5 addSignpost:v20];
      }
      uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v17);
  }

  id v21 = [(GEOPBTransitArtwork *)self->_artworkOverride copyWithZone:a3];
  id v8 = *(id *)(v5 + 40);
  *(void *)(v5 + 40) = v21;
LABEL_26:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (const void **)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  [(GEOCompanionWalkStep *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 84) & 2) == 0 || self->_maneuverType != *((_DWORD *)v4 + 20)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 84) & 2) != 0)
  {
LABEL_14:
    char v6 = 0;
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 84) & 1) == 0 || self->_junctionType != *((_DWORD *)v4 + 19)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 84))
  {
    goto LABEL_14;
  }
  unint64_t junctionElementsCount = self->_junctionElementsCount;
  if ((const void *)junctionElementsCount != v4[3]) {
    goto LABEL_14;
  }
  if (memcmp(self->_junctionElements, v4[2], 16 * junctionElementsCount)) {
    goto LABEL_14;
  }
  maneuverNames = self->_maneuverNames;
  if ((unint64_t)maneuverNames | (unint64_t)v4[6])
  {
    if (!-[NSMutableArray isEqual:](maneuverNames, "isEqual:")) {
      goto LABEL_14;
    }
  }
  signposts = self->_signposts;
  if ((unint64_t)signposts | (unint64_t)v4[7])
  {
    if (!-[NSMutableArray isEqual:](signposts, "isEqual:")) {
      goto LABEL_14;
    }
  }
  artworkOverride = self->_artworkOverride;
  if ((unint64_t)artworkOverride | (unint64_t)v4[5]) {
    char v6 = -[GEOPBTransitArtwork isEqual:](artworkOverride, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  [(GEOCompanionWalkStep *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_maneuverType;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_junctionType;
LABEL_6:
  uint64_t v5 = v4 ^ v3;
  uint64_t v6 = PBHashBytes();
  uint64_t v7 = v5 ^ [(NSMutableArray *)self->_maneuverNames hash] ^ v6;
  uint64_t v8 = [(NSMutableArray *)self->_signposts hash];
  return v7 ^ v8 ^ [(GEOPBTransitArtwork *)self->_artworkOverride hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  char v5 = *((unsigned char *)v4 + 84);
  if ((v5 & 2) != 0)
  {
    self->_maneuverType = *((_DWORD *)v4 + 20);
    *(unsigned char *)&self->_flags |= 2u;
    char v5 = *((unsigned char *)v4 + 84);
  }
  if (v5)
  {
    self->_junctionType = *((_DWORD *)v4 + 19);
    *(unsigned char *)&self->_flags |= 1u;
  }
  uint64_t v6 = [v4 junctionElementsCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
    {
      uint64_t v9 = [v4 junctionElementAtIndex:i];
      -[GEOCompanionWalkStep addJunctionElement:](self, "addJunctionElement:", v9, v10);
    }
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v11 = *((id *)v4 + 6);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v11);
        }
        [(GEOCompanionWalkStep *)self addManeuverName:*(void *)(*((void *)&v27 + 1) + 8 * j)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v13);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v16 = *((id *)v4 + 7);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        -[GEOCompanionWalkStep addSignpost:](self, "addSignpost:", *(void *)(*((void *)&v23 + 1) + 8 * k), (void)v23);
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v18);
  }

  artworkOverride = self->_artworkOverride;
  uint64_t v22 = *((void *)v4 + 5);
  if (artworkOverride)
  {
    if (v22) {
      -[GEOPBTransitArtwork mergeFrom:](artworkOverride, "mergeFrom:");
    }
  }
  else if (v22)
  {
    -[GEOCompanionWalkStep setArtworkOverride:](self, "setArtworkOverride:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signposts, 0);
  objc_storeStrong((id *)&self->_maneuverNames, 0);
  objc_storeStrong((id *)&self->_artworkOverride, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (int)transportType
{
  return 2;
}

@end