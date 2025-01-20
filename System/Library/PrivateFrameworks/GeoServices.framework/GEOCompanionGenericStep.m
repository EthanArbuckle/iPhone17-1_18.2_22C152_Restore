@interface GEOCompanionGenericStep
+ (BOOL)isValid:(id)a3;
+ (Class)maneuverNameType;
+ (Class)signpostType;
+ (id)genericStepForCyclingStep:(id)a3 protocolVersion:(unint64_t)a4;
- (BOOL)hasJunctionType;
- (BOOL)hasManeuverType;
- (BOOL)hasTransportType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOCompanionGenericStep)init;
- (GEOCompanionGenericStep)initWithData:(id)a3;
- (GEOCompanionGenericStep)initWithDictionary:(id)a3;
- (GEOCompanionGenericStep)initWithJSON:(id)a3;
- (GEOJunctionElement)junctionElementAtIndex:(unint64_t)a3;
- (GEOJunctionElement)junctionElements;
- (GEOTransitArtworkDataSource)maneuverArtworkOverride;
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
- (id)transportTypeAsString:(int)a3;
- (int)StringAsJunctionType:(id)a3;
- (int)StringAsManeuverType:(id)a3;
- (int)StringAsTransportType:(id)a3;
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
- (void)_initWithDictionary:(char)a3 isJSON:;
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
- (void)setHasJunctionType:(BOOL)a3;
- (void)setHasManeuverType:(BOOL)a3;
- (void)setHasTransportType:(BOOL)a3;
- (void)setJunctionElements:(GEOJunctionElement *)a3 count:(unint64_t)a4;
- (void)setJunctionType:(int)a3;
- (void)setManeuverNames:(id)a3;
- (void)setManeuverType:(int)a3;
- (void)setSignposts:(id)a3;
- (void)setTransportType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOCompanionGenericStep

- (GEOCompanionGenericStep)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOCompanionGenericStep;
  v2 = [(GEOCompanionGenericStep *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOCompanionGenericStep)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOCompanionGenericStep;
  v3 = [(GEOCompanionGenericStep *)&v7 initWithData:a3];
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
  [(GEOCompanionGenericStep *)self clearJunctionElements];
  v3.receiver = self;
  v3.super_class = (Class)GEOCompanionGenericStep;
  [(GEOCompanionGenericStep *)&v3 dealloc];
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

- (void)_readManeuverNames
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 80) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionGenericStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readManeuverNames_tags_261);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)maneuverNames
{
  -[GEOCompanionGenericStep _readManeuverNames]((uint64_t)self);
  maneuverNames = self->_maneuverNames;

  return maneuverNames;
}

- (void)setManeuverNames:(id)a3
{
  int v4 = (NSMutableArray *)a3;
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
  -[GEOCompanionGenericStep _readManeuverNames]((uint64_t)self);
  -[GEOCompanionGenericStep _addNoFlagsManeuverName:]((uint64_t)self, v4);

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
    id v4 = *(void **)(a1 + 40);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v5;

      id v4 = *(void **)(a1 + 40);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)maneuverNamesCount
{
  -[GEOCompanionGenericStep _readManeuverNames]((uint64_t)self);
  maneuverNames = self->_maneuverNames;

  return [(NSMutableArray *)maneuverNames count];
}

- (id)maneuverNameAtIndex:(unint64_t)a3
{
  -[GEOCompanionGenericStep _readManeuverNames]((uint64_t)self);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 80) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionGenericStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSignposts_tags_262);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)signposts
{
  -[GEOCompanionGenericStep _readSignposts]((uint64_t)self);
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
  -[GEOCompanionGenericStep _readSignposts]((uint64_t)self);
  -[GEOCompanionGenericStep _addNoFlagsSignpost:]((uint64_t)self, v4);

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
    id v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      id v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)signpostsCount
{
  -[GEOCompanionGenericStep _readSignposts]((uint64_t)self);
  signposts = self->_signposts;

  return [(NSMutableArray *)signposts count];
}

- (id)signpostAtIndex:(unint64_t)a3
{
  -[GEOCompanionGenericStep _readSignposts]((uint64_t)self);
  signposts = self->_signposts;

  return (id)[(NSMutableArray *)signposts objectAtIndex:a3];
}

+ (Class)signpostType
{
  return (Class)objc_opt_class();
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 80) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCompanionGenericStepReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readJunctionElements_tags_263);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
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
    uint64_t result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 16), 16 * v9, 0xC568D048uLL);
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
  *(unsigned char *)&self->_flags |= 8u;
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
  -[GEOCompanionGenericStep _readJunctionElements]((uint64_t)self);
  if (self && -[GEOCompanionGenericStep _reserveJunctionElements:]((uint64_t)self, 1uLL))
  {
    unint64_t v6 = &self->_junctionElements[self->_junctionElementsCount];
    *(void *)&v6->var0 = v4;
    *(void *)&v6->var2 = v3;
    ++self->_junctionElementsCount;
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
}

- (GEOJunctionElement)junctionElementAtIndex:(unint64_t)a3
{
  -[GEOCompanionGenericStep _readJunctionElements]((uint64_t)self);
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
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  [(GEOCompanionGenericStep *)self clearJunctionElements];
  if (-[GEOCompanionGenericStep _reserveJunctionElements:]((uint64_t)self, a4))
  {
    memcpy(self->_junctionElements, a3, 16 * a4);
    self->_unint64_t junctionElementsCount = a4;
  }
}

- (int)transportType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0) {
    return self->_transportType;
  }
  else {
    return 0;
  }
}

- (void)setTransportType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x44u;
  self->_transportType = a3;
}

- (void)setHasTransportType:(BOOL)a3
{
  if (a3) {
    char v3 = 68;
  }
  else {
    char v3 = 64;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasTransportType
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
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
    char v3 = off_1E53DF0A8[a3];
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

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOCompanionGenericStep;
  int v4 = [(GEOCompanionGenericStep *)&v8 description];
  unint64_t v5 = [(GEOCompanionGenericStep *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCompanionGenericStep _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ((*(unsigned char *)(a1 + 80) & 2) != 0)
    {
      unint64_t v5 = @"NO_TURN";
      switch(*(_DWORD *)(a1 + 72))
      {
        case 0:
          break;
        case 1:
          unint64_t v5 = @"LEFT_TURN";
          break;
        case 2:
          unint64_t v5 = @"RIGHT_TURN";
          break;
        case 3:
          unint64_t v5 = @"STRAIGHT_AHEAD";
          break;
        case 4:
          unint64_t v5 = @"U_TURN";
          break;
        case 5:
          unint64_t v5 = @"FOLLOW_ROAD";
          break;
        case 6:
          unint64_t v5 = @"ENTER_ROUNDABOUT";
          break;
        case 7:
          unint64_t v5 = @"EXIT_ROUNDABOUT";
          break;
        case 0xB:
          unint64_t v5 = @"OFF_RAMP";
          break;
        case 0xC:
          unint64_t v5 = @"ON_RAMP";
          break;
        case 0x10:
          unint64_t v5 = @"ARRIVE_END_OF_NAVIGATION";
          break;
        case 0x11:
          unint64_t v5 = @"START_ROUTE";
          break;
        case 0x12:
          unint64_t v5 = @"ARRIVE_AT_DESTINATION";
          break;
        case 0x14:
          unint64_t v5 = @"KEEP_LEFT";
          break;
        case 0x15:
          unint64_t v5 = @"KEEP_RIGHT";
          break;
        case 0x16:
          unint64_t v5 = @"ENTER_FERRY";
          break;
        case 0x17:
          unint64_t v5 = @"EXIT_FERRY";
          break;
        case 0x18:
          unint64_t v5 = @"CHANGE_FERRY";
          break;
        case 0x19:
          unint64_t v5 = @"START_ROUTE_WITH_U_TURN";
          break;
        case 0x1A:
          unint64_t v5 = @"U_TURN_AT_ROUNDABOUT";
          break;
        case 0x1B:
          unint64_t v5 = @"LEFT_TURN_AT_END";
          break;
        case 0x1C:
          unint64_t v5 = @"RIGHT_TURN_AT_END";
          break;
        case 0x1D:
          unint64_t v5 = @"HIGHWAY_OFF_RAMP_LEFT";
          break;
        case 0x1E:
          unint64_t v5 = @"HIGHWAY_OFF_RAMP_RIGHT";
          break;
        case 0x21:
          unint64_t v5 = @"ARRIVE_AT_DESTINATION_LEFT";
          break;
        case 0x22:
          unint64_t v5 = @"ARRIVE_AT_DESTINATION_RIGHT";
          break;
        case 0x23:
          unint64_t v5 = @"U_TURN_WHEN_POSSIBLE";
          break;
        case 0x27:
          unint64_t v5 = @"ARRIVE_END_OF_DIRECTIONS";
          break;
        case 0x29:
          unint64_t v5 = @"ROUNDABOUT_EXIT_1";
          break;
        case 0x2A:
          unint64_t v5 = @"ROUNDABOUT_EXIT_2";
          break;
        case 0x2B:
          unint64_t v5 = @"ROUNDABOUT_EXIT_3";
          break;
        case 0x2C:
          unint64_t v5 = @"ROUNDABOUT_EXIT_4";
          break;
        case 0x2D:
          unint64_t v5 = @"ROUNDABOUT_EXIT_5";
          break;
        case 0x2E:
          unint64_t v5 = @"ROUNDABOUT_EXIT_6";
          break;
        case 0x2F:
          unint64_t v5 = @"ROUNDABOUT_EXIT_7";
          break;
        case 0x30:
          unint64_t v5 = @"ROUNDABOUT_EXIT_8";
          break;
        case 0x31:
          unint64_t v5 = @"ROUNDABOUT_EXIT_9";
          break;
        case 0x32:
          unint64_t v5 = @"ROUNDABOUT_EXIT_10";
          break;
        case 0x33:
          unint64_t v5 = @"ROUNDABOUT_EXIT_11";
          break;
        case 0x34:
          unint64_t v5 = @"ROUNDABOUT_EXIT_12";
          break;
        case 0x35:
          unint64_t v5 = @"ROUNDABOUT_EXIT_13";
          break;
        case 0x36:
          unint64_t v5 = @"ROUNDABOUT_EXIT_14";
          break;
        case 0x37:
          unint64_t v5 = @"ROUNDABOUT_EXIT_15";
          break;
        case 0x38:
          unint64_t v5 = @"ROUNDABOUT_EXIT_16";
          break;
        case 0x39:
          unint64_t v5 = @"ROUNDABOUT_EXIT_17";
          break;
        case 0x3A:
          unint64_t v5 = @"ROUNDABOUT_EXIT_18";
          break;
        case 0x3B:
          unint64_t v5 = @"ROUNDABOUT_EXIT_19";
          break;
        case 0x3C:
          unint64_t v5 = @"SHARP_LEFT_TURN";
          break;
        case 0x3D:
          unint64_t v5 = @"SHARP_RIGHT_TURN";
          break;
        case 0x3E:
          unint64_t v5 = @"SLIGHT_LEFT_TURN";
          break;
        case 0x3F:
          unint64_t v5 = @"SLIGHT_RIGHT_TURN";
          break;
        case 0x40:
          unint64_t v5 = @"CHANGE_HIGHWAY";
          break;
        case 0x41:
          unint64_t v5 = @"CHANGE_HIGHWAY_LEFT";
          break;
        case 0x42:
          unint64_t v5 = @"CHANGE_HIGHWAY_RIGHT";
          break;
        case 0x50:
          unint64_t v5 = @"TOLL_STATION";
          break;
        case 0x51:
          unint64_t v5 = @"ENTER_TUNNEL";
          break;
        case 0x52:
          unint64_t v5 = @"WAYPOINT_STOP";
          break;
        case 0x53:
          unint64_t v5 = @"WAYPOINT_STOP_LEFT";
          break;
        case 0x54:
          unint64_t v5 = @"WAYPOINT_STOP_RIGHT";
          break;
        case 0x55:
          unint64_t v5 = @"RESUME_ROUTE";
          break;
        case 0x56:
          unint64_t v5 = @"RESUME_ROUTE_WITH_U_TURN";
          break;
        case 0x57:
          unint64_t v5 = @"CUSTOM";
          break;
        case 0x58:
          unint64_t v5 = @"TURN_AROUND";
          break;
        default:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 72));
          unint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
      }
      [v4 setObject:v5 forKey:@"maneuverType"];
    }
    if ([*(id *)(a1 + 40) count])
    {
      unint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v7 = *(id *)(a1 + 40);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v36 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            if (a2) {
              [v12 jsonRepresentation];
            }
            else {
            v13 = [v12 dictionaryRepresentation];
            }
            [v6 addObject:v13];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v35 objects:v40 count:16];
        }
        while (v9);
      }

      [v4 setObject:v6 forKey:@"maneuverName"];
    }
    if ([*(id *)(a1 + 48) count])
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v15 = *(id *)(a1 + 48);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v32;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v32 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v31 + 1) + 8 * j);
            if (a2) {
              [v20 jsonRepresentation];
            }
            else {
            v21 = [v20 dictionaryRepresentation];
            }
            [v14 addObject:v21];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v31 objects:v39 count:16];
        }
        while (v17);
      }

      [v4 setObject:v14 forKey:@"signpost"];
    }
    if (*(unsigned char *)(a1 + 80))
    {
      int v22 = *(_DWORD *)(a1 + 68);
      if (v22)
      {
        if (v22 == 1)
        {
          v23 = @"JCTTYPE_ROUNDABOUT";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 68));
          v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v23 = @"JCTTYPE_NORMAL";
      }
      [v4 setObject:v23 forKey:@"junctionType"];
    }
    if (*(void *)(a1 + 24))
    {
      v24 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 24)];
      if (*(void *)(a1 + 24))
      {
        uint64_t v25 = 0;
        unint64_t v26 = 0;
        do
        {
          v27 = _GEOJunctionElementDictionaryRepresentation((unsigned int *)(*(void *)(a1 + 16) + v25));
          [v24 addObject:v27];

          ++v26;
          v25 += 16;
        }
        while (v26 < *(void *)(a1 + 24));
      }
      [v4 setObject:v24 forKey:@"junctionElement"];
    }
    if ((*(unsigned char *)(a1 + 80) & 4) != 0)
    {
      uint64_t v28 = *(int *)(a1 + 76);
      if (v28 >= 7)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 76));
        v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v29 = off_1E53DF0A8[v28];
      }
      [v4 setObject:v29 forKey:@"transportType"];
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
  return -[GEOCompanionGenericStep _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOCompanionGenericStep)initWithDictionary:(id)a3
{
  return (GEOCompanionGenericStep *)-[GEOCompanionGenericStep _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
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

      uint64_t v9 = [v5 objectForKeyedSubscript:@"maneuverName"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v53 objects:v59 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v54;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v54 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v53 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v16 = [GEONameInfoList alloc];
                if (a3) {
                  uint64_t v17 = [(GEONameInfoList *)v16 initWithJSON:v15];
                }
                else {
                  uint64_t v17 = [(GEONameInfoList *)v16 initWithDictionary:v15];
                }
                uint64_t v18 = (void *)v17;
                [a1 addManeuverName:v17];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v53 objects:v59 count:16];
          }
          while (v12);
        }
      }
      v19 = [v5 objectForKeyedSubscript:@"signpost"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v20 = v19;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v49 objects:v58 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v50;
          do
          {
            for (uint64_t j = 0; j != v22; ++j)
            {
              if (*(void *)v50 != v23) {
                objc_enumerationMutation(v20);
              }
              uint64_t v25 = *(void *)(*((void *)&v49 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                unint64_t v26 = [GEONameInfo alloc];
                if (a3) {
                  uint64_t v27 = [(GEONameInfo *)v26 initWithJSON:v25];
                }
                else {
                  uint64_t v27 = [(GEONameInfo *)v26 initWithDictionary:v25];
                }
                uint64_t v28 = (void *)v27;
                [a1 addSignpost:v27];
              }
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v49 objects:v58 count:16];
          }
          while (v22);
        }
      }
      v29 = [v5 objectForKeyedSubscript:@"junctionType"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v30 = v29;
        if ([v30 isEqualToString:@"JCTTYPE_NORMAL"]) {
          uint64_t v31 = 0;
        }
        else {
          uint64_t v31 = [v30 isEqualToString:@"JCTTYPE_ROUNDABOUT"];
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_171;
        }
        uint64_t v31 = [v29 intValue];
      }
      [a1 setJunctionType:v31];
LABEL_171:

      long long v32 = [v5 objectForKeyedSubscript:@"junctionElement"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v33 = v32;
        uint64_t v34 = [v33 countByEnumeratingWithState:&v45 objects:v57 count:16];
        if (v34)
        {
          uint64_t v35 = v34;
          uint64_t v36 = *(void *)v46;
          do
          {
            for (uint64_t k = 0; k != v35; ++k)
            {
              if (*(void *)v46 != v36) {
                objc_enumerationMutation(v33);
              }
              long long v38 = *(void **)(*((void *)&v45 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v43 = 0;
                uint64_t v44 = 0;
                _GEOJunctionElementFromDictionaryRepresentation(v38, (uint64_t)&v43);
                objc_msgSend(a1, "addJunctionElement:", v43, v44);
              }
            }
            uint64_t v35 = [v33 countByEnumeratingWithState:&v45 objects:v57 count:16];
          }
          while (v35);
        }
      }
      v39 = [v5 objectForKeyedSubscript:@"transportType"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v40 = v39;
        if ([v40 isEqualToString:@"AUTOMOBILE"])
        {
          uint64_t v41 = 0;
        }
        else if ([v40 isEqualToString:@"TRANSIT"])
        {
          uint64_t v41 = 1;
        }
        else if ([v40 isEqualToString:@"WALKING"])
        {
          uint64_t v41 = 2;
        }
        else if ([v40 isEqualToString:@"BICYCLE"])
        {
          uint64_t v41 = 3;
        }
        else if ([v40 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
        {
          uint64_t v41 = 4;
        }
        else if ([v40 isEqualToString:@"FERRY"])
        {
          uint64_t v41 = 5;
        }
        else if ([v40 isEqualToString:@"RIDESHARE"])
        {
          uint64_t v41 = 6;
        }
        else
        {
          uint64_t v41 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_202:

          goto LABEL_203;
        }
        uint64_t v41 = [v39 intValue];
      }
      [a1 setTransportType:v41];
      goto LABEL_202;
    }
  }
LABEL_203:

  return a1;
}

- (GEOCompanionGenericStep)initWithJSON:(id)a3
{
  return (GEOCompanionGenericStep *)-[GEOCompanionGenericStep _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_267;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_268;
    }
    GEOCompanionGenericStepReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOCompanionGenericStepCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCompanionGenericStepIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCompanionGenericStepReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x78) == 0))
  {
    uint64_t v16 = self->_reader;
    objc_sync_enter(v16);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v17 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v17];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v16);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOCompanionGenericStep *)self readAll:0];
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    unint64_t v6 = self->_maneuverNames;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v7);
    }

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = self->_signposts;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v11);
    }

    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_junctionElementsCount)
    {
      uint64_t v14 = 0;
      unint64_t v15 = 0;
      do
      {
        PBDataWriterPlaceMark();
        GEOJunctionElementWriteTo((uint64_t)&self->_junctionElements[v14]);
        PBDataWriterRecallMark();
        ++v15;
        ++v14;
      }
      while (v15 < self->_junctionElementsCount);
    }
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      PBDataWriterWriteInt32Field();
    }
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v17 = (id *)a3;
  [(GEOCompanionGenericStep *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v17 + 1, self->_reader);
  *((_DWORD *)v17 + 14) = self->_readerMarkPos;
  *((_DWORD *)v17 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v17 + 18) = self->_maneuverType;
    *((unsigned char *)v17 + 80) |= 2u;
  }
  if ([(GEOCompanionGenericStep *)self maneuverNamesCount])
  {
    [v17 clearManeuverNames];
    unint64_t v4 = [(GEOCompanionGenericStep *)self maneuverNamesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOCompanionGenericStep *)self maneuverNameAtIndex:i];
        [v17 addManeuverName:v7];
      }
    }
  }
  if ([(GEOCompanionGenericStep *)self signpostsCount])
  {
    [v17 clearSignposts];
    unint64_t v8 = [(GEOCompanionGenericStep *)self signpostsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOCompanionGenericStep *)self signpostAtIndex:j];
        [v17 addSignpost:v11];
      }
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v17 + 17) = self->_junctionType;
    *((unsigned char *)v17 + 80) |= 1u;
  }
  if ([(GEOCompanionGenericStep *)self junctionElementsCount])
  {
    [v17 clearJunctionElements];
    unint64_t v12 = [(GEOCompanionGenericStep *)self junctionElementsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(GEOCompanionGenericStep *)self junctionElementAtIndex:k];
        objc_msgSend(v17, "addJunctionElement:", v15, v16);
      }
    }
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v17 + 19) = self->_transportType;
    *((unsigned char *)v17 + 80) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
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
      GEOCompanionGenericStepReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOCompanionGenericStep *)self readAll:0];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_maneuverType;
    *(unsigned char *)(v5 + 80) |= 2u;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  unint64_t v9 = self->_maneuverNames;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v9);
        }
        unint64_t v13 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addManeuverName:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v10);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v14 = self->_signposts;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v14);
        }
        long long v18 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * j), "copyWithZone:", a3, (void)v21);
        [(id)v5 addSignpost:v18];
      }
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v15);
  }

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 68) = self->_junctionType;
    *(unsigned char *)(v5 + 80) |= 1u;
  }
  unint64_t junctionElementsCount = self->_junctionElementsCount;
  if (junctionElementsCount)
  {
    -[GEOCompanionGenericStep _reserveJunctionElements:](v5, junctionElementsCount);
    memcpy(*(void **)(v5 + 16), self->_junctionElements, 16 * self->_junctionElementsCount);
    *(void *)(v5 + 24) = self->_junctionElementsCount;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_transportType;
    *(unsigned char *)(v5 + 80) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (const void **)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  [(GEOCompanionGenericStep *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if (((_BYTE)v4[10] & 2) == 0 || self->_maneuverType != *((_DWORD *)v4 + 18)) {
      goto LABEL_18;
    }
  }
  else if (((_BYTE)v4[10] & 2) != 0)
  {
    goto LABEL_18;
  }
  maneuverNames = self->_maneuverNames;
  if ((unint64_t)maneuverNames | (unint64_t)v4[5]
    && !-[NSMutableArray isEqual:](maneuverNames, "isEqual:"))
  {
    goto LABEL_18;
  }
  signposts = self->_signposts;
  if ((unint64_t)signposts | (unint64_t)v4[6])
  {
    if (!-[NSMutableArray isEqual:](signposts, "isEqual:")) {
      goto LABEL_18;
    }
  }
  char flags = (char)self->_flags;
  char v8 = *((unsigned char *)v4 + 80);
  if (flags)
  {
    if (((_BYTE)v4[10] & 1) == 0 || self->_junctionType != *((_DWORD *)v4 + 17)) {
      goto LABEL_18;
    }
  }
  else if ((_BYTE)v4[10])
  {
    goto LABEL_18;
  }
  unint64_t junctionElementsCount = self->_junctionElementsCount;
  if ((const void *)junctionElementsCount == v4[3]
    && !memcmp(self->_junctionElements, v4[2], 16 * junctionElementsCount))
  {
    BOOL v10 = (v8 & 4) == 0;
    if ((flags & 4) == 0) {
      goto LABEL_19;
    }
    if ((v8 & 4) != 0 && self->_transportType == *((_DWORD *)v4 + 19))
    {
      BOOL v10 = 1;
      goto LABEL_19;
    }
  }
LABEL_18:
  BOOL v10 = 0;
LABEL_19:

  return v10;
}

- (unint64_t)hash
{
  [(GEOCompanionGenericStep *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_maneuverType;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_maneuverNames hash];
  uint64_t v5 = [(NSMutableArray *)self->_signposts hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v6 = 2654435761 * self->_junctionType;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = PBHashBytes();
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    uint64_t v8 = 2654435761 * self->_transportType;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if ((*((unsigned char *)v4 + 80) & 2) != 0)
  {
    self->_maneuverType = *((_DWORD *)v4 + 18);
    *(unsigned char *)&self->_flags |= 2u;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = *((id *)v4 + 5);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOCompanionGenericStep *)self addManeuverName:*(void *)(*((void *)&v24 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v7);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = *((id *)v4 + 6);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        -[GEOCompanionGenericStep addSignpost:](self, "addSignpost:", *(void *)(*((void *)&v20 + 1) + 8 * j), (void)v20);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v12);
  }

  if (*((unsigned char *)v4 + 80))
  {
    self->_junctionType = *((_DWORD *)v4 + 17);
    *(unsigned char *)&self->_flags |= 1u;
  }
  uint64_t v15 = objc_msgSend(v4, "junctionElementsCount", (void)v20);
  if (v15)
  {
    uint64_t v16 = v15;
    for (uint64_t k = 0; k != v16; ++k)
    {
      uint64_t v18 = [v4 junctionElementAtIndex:k];
      -[GEOCompanionGenericStep addJunctionElement:](self, "addJunctionElement:", v18, v19);
    }
  }
  if ((*((unsigned char *)v4 + 80) & 4) != 0)
  {
    self->_transportType = *((_DWORD *)v4 + 19);
    *(unsigned char *)&self->_flags |= 4u;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signposts, 0);
  objc_storeStrong((id *)&self->_maneuverNames, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

+ (id)genericStepForCyclingStep:(id)a3 protocolVersion:(unint64_t)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)a1);
  [v6 setTransportType:3];
  if ([v5 hasManeuverType]) {
    objc_msgSend(v6, "setManeuverType:", objc_msgSend(v5, "maneuverType"));
  }
  uint64_t v7 = [v5 maneuverNames];
  [v6 setManeuverNames:v7];

  uint64_t v8 = [v5 signposts];
  [v6 setSignposts:v8];

  if ([v5 hasJunctionType]) {
    objc_msgSend(v6, "setJunctionType:", objc_msgSend(v5, "junctionType"));
  }
  objc_msgSend(v6, "setJunctionElements:count:", objc_msgSend(v5, "junctionElements"), objc_msgSend(v5, "junctionElementsCount"));

  return v6;
}

- (GEOTransitArtworkDataSource)maneuverArtworkOverride
{
  return 0;
}

@end