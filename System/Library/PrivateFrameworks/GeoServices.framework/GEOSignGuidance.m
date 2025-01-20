@interface GEOSignGuidance
+ (BOOL)isValid:(id)a3;
+ (Class)secondarySignType;
+ (Class)signDetailType;
+ (Class)signTitleType;
- (BOOL)hasArtworkOverride;
- (BOOL)hasJunctionInfo;
- (BOOL)hasManeuverArrowOverride;
- (BOOL)hasShieldName;
- (BOOL)hasStackRanking;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOJunctionInfo)junctionInfo;
- (GEONameInfo)shieldName;
- (GEOPBTransitArtwork)artworkOverride;
- (GEOSignGuidance)init;
- (GEOSignGuidance)initWithData:(id)a3;
- (GEOSignGuidance)initWithDictionary:(id)a3;
- (GEOSignGuidance)initWithJSON:(id)a3;
- (NSMutableArray)secondarySigns;
- (NSMutableArray)signDetails;
- (NSMutableArray)signTitles;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)maneuverArrowOverrideAsString:(int)a3;
- (id)secondarySignAtIndex:(unint64_t)a3;
- (id)signDetailAtIndex:(unint64_t)a3;
- (id)signTitleAtIndex:(unint64_t)a3;
- (int)StringAsManeuverArrowOverride:(id)a3;
- (int)maneuverArrowOverride;
- (unint64_t)hash;
- (unint64_t)secondarySignsCount;
- (unint64_t)signDetailsCount;
- (unint64_t)signTitlesCount;
- (unsigned)stackRanking;
- (void)_addNoFlagsSecondarySign:(uint64_t)a1;
- (void)_addNoFlagsSignDetail:(uint64_t)a1;
- (void)_addNoFlagsSignTitle:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readArtworkOverride;
- (void)_readJunctionInfo;
- (void)_readSecondarySigns;
- (void)_readShieldName;
- (void)_readSignDetails;
- (void)_readSignTitles;
- (void)addSecondarySign:(id)a3;
- (void)addSignDetail:(id)a3;
- (void)addSignTitle:(id)a3;
- (void)clearSecondarySigns;
- (void)clearSignDetails;
- (void)clearSignTitles;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setArtworkOverride:(id)a3;
- (void)setHasManeuverArrowOverride:(BOOL)a3;
- (void)setHasStackRanking:(BOOL)a3;
- (void)setJunctionInfo:(id)a3;
- (void)setManeuverArrowOverride:(int)a3;
- (void)setSecondarySigns:(id)a3;
- (void)setShieldName:(id)a3;
- (void)setSignDetails:(id)a3;
- (void)setSignTitles:(id)a3;
- (void)setStackRanking:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOSignGuidance

- (GEOSignGuidance)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOSignGuidance;
  v2 = [(GEOSignGuidance *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOSignGuidance)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOSignGuidance;
  v3 = [(GEOSignGuidance *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readSignTitles
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOSignGuidanceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSignTitles_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)signTitles
{
  -[GEOSignGuidance _readSignTitles]((uint64_t)self);
  signTitles = self->_signTitles;

  return signTitles;
}

- (void)setSignTitles:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  signTitles = self->_signTitles;
  self->_signTitles = v4;
}

- (void)clearSignTitles
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  signTitles = self->_signTitles;

  [(NSMutableArray *)signTitles removeAllObjects];
}

- (void)addSignTitle:(id)a3
{
  id v4 = a3;
  -[GEOSignGuidance _readSignTitles]((uint64_t)self);
  -[GEOSignGuidance _addNoFlagsSignTitle:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
}

- (void)_addNoFlagsSignTitle:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 64);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v5;

      id v4 = *(void **)(a1 + 64);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)signTitlesCount
{
  -[GEOSignGuidance _readSignTitles]((uint64_t)self);
  signTitles = self->_signTitles;

  return [(NSMutableArray *)signTitles count];
}

- (id)signTitleAtIndex:(unint64_t)a3
{
  -[GEOSignGuidance _readSignTitles]((uint64_t)self);
  signTitles = self->_signTitles;

  return (id)[(NSMutableArray *)signTitles objectAtIndex:a3];
}

+ (Class)signTitleType
{
  return (Class)objc_opt_class();
}

- (void)_readSignDetails
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOSignGuidanceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSignDetails_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)signDetails
{
  -[GEOSignGuidance _readSignDetails]((uint64_t)self);
  signDetails = self->_signDetails;

  return signDetails;
}

- (void)setSignDetails:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  signDetails = self->_signDetails;
  self->_signDetails = v4;
}

- (void)clearSignDetails
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  signDetails = self->_signDetails;

  [(NSMutableArray *)signDetails removeAllObjects];
}

- (void)addSignDetail:(id)a3
{
  id v4 = a3;
  -[GEOSignGuidance _readSignDetails]((uint64_t)self);
  -[GEOSignGuidance _addNoFlagsSignDetail:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
}

- (void)_addNoFlagsSignDetail:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 56);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v5;

      id v4 = *(void **)(a1 + 56);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)signDetailsCount
{
  -[GEOSignGuidance _readSignDetails]((uint64_t)self);
  signDetails = self->_signDetails;

  return [(NSMutableArray *)signDetails count];
}

- (id)signDetailAtIndex:(unint64_t)a3
{
  -[GEOSignGuidance _readSignDetails]((uint64_t)self);
  signDetails = self->_signDetails;

  return (id)[(NSMutableArray *)signDetails objectAtIndex:a3];
}

+ (Class)signDetailType
{
  return (Class)objc_opt_class();
}

- (void)_readSecondarySigns
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOSignGuidanceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSecondarySigns_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)secondarySigns
{
  -[GEOSignGuidance _readSecondarySigns]((uint64_t)self);
  secondarySigns = self->_secondarySigns;

  return secondarySigns;
}

- (void)setSecondarySigns:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  secondarySigns = self->_secondarySigns;
  self->_secondarySigns = v4;
}

- (void)clearSecondarySigns
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  secondarySigns = self->_secondarySigns;

  [(NSMutableArray *)secondarySigns removeAllObjects];
}

- (void)addSecondarySign:(id)a3
{
  id v4 = a3;
  -[GEOSignGuidance _readSecondarySigns]((uint64_t)self);
  -[GEOSignGuidance _addNoFlagsSecondarySign:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
}

- (void)_addNoFlagsSecondarySign:(uint64_t)a1
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

- (unint64_t)secondarySignsCount
{
  -[GEOSignGuidance _readSecondarySigns]((uint64_t)self);
  secondarySigns = self->_secondarySigns;

  return [(NSMutableArray *)secondarySigns count];
}

- (id)secondarySignAtIndex:(unint64_t)a3
{
  -[GEOSignGuidance _readSecondarySigns]((uint64_t)self);
  secondarySigns = self->_secondarySigns;

  return (id)[(NSMutableArray *)secondarySigns objectAtIndex:a3];
}

+ (Class)secondarySignType
{
  return (Class)objc_opt_class();
}

- (int)maneuverArrowOverride
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_maneuverArrowOverride;
  }
  else {
    return 0;
  }
}

- (void)setManeuverArrowOverride:(int)a3
{
  *(_WORD *)&self->_flags |= 0x201u;
  self->_maneuverArrowOverride = a3;
}

- (void)setHasManeuverArrowOverride:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x200;
}

- (BOOL)hasManeuverArrowOverride
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)maneuverArrowOverrideAsString:(int)a3
{
  id v4 = @"NO_TURN";
  switch(a3)
  {
    case 0:
      goto LABEL_24;
    case 1:
      id v4 = @"LEFT_TURN";
      break;
    case 2:
      id v4 = @"RIGHT_TURN";
      break;
    case 3:
      id v4 = @"STRAIGHT_AHEAD";
      break;
    case 4:
      id v4 = @"U_TURN";
      break;
    case 5:
      id v4 = @"FOLLOW_ROAD";
      break;
    case 6:
      id v4 = @"ENTER_ROUNDABOUT";
      break;
    case 7:
      id v4 = @"EXIT_ROUNDABOUT";
      break;
    case 11:
      id v4 = @"OFF_RAMP";
      break;
    case 12:
      id v4 = @"ON_RAMP";
      break;
    case 16:
      id v4 = @"ARRIVE_END_OF_NAVIGATION";
      break;
    case 17:
      id v4 = @"START_ROUTE";
      break;
    case 18:
      id v4 = @"ARRIVE_AT_DESTINATION";
      break;
    case 20:
      id v4 = @"KEEP_LEFT";
      break;
    case 21:
      id v4 = @"KEEP_RIGHT";
      break;
    case 22:
      id v4 = @"ENTER_FERRY";
      break;
    case 23:
      id v4 = @"EXIT_FERRY";
      break;
    case 24:
      id v4 = @"CHANGE_FERRY";
      break;
    case 25:
      id v4 = @"START_ROUTE_WITH_U_TURN";
      break;
    case 26:
      id v4 = @"U_TURN_AT_ROUNDABOUT";
      break;
    case 27:
      id v4 = @"LEFT_TURN_AT_END";
      break;
    case 28:
      id v4 = @"RIGHT_TURN_AT_END";
      break;
    case 29:
      id v4 = @"HIGHWAY_OFF_RAMP_LEFT";
      break;
    case 30:
      id v4 = @"HIGHWAY_OFF_RAMP_RIGHT";
      break;
    case 33:
      id v4 = @"ARRIVE_AT_DESTINATION_LEFT";
      break;
    case 34:
      id v4 = @"ARRIVE_AT_DESTINATION_RIGHT";
      break;
    case 35:
      id v4 = @"U_TURN_WHEN_POSSIBLE";
      break;
    case 39:
      id v4 = @"ARRIVE_END_OF_DIRECTIONS";
      break;
    case 41:
      id v4 = @"ROUNDABOUT_EXIT_1";
      break;
    case 42:
      id v4 = @"ROUNDABOUT_EXIT_2";
      break;
    case 43:
      id v4 = @"ROUNDABOUT_EXIT_3";
      break;
    case 44:
      id v4 = @"ROUNDABOUT_EXIT_4";
      break;
    case 45:
      id v4 = @"ROUNDABOUT_EXIT_5";
      break;
    case 46:
      id v4 = @"ROUNDABOUT_EXIT_6";
      break;
    case 47:
      id v4 = @"ROUNDABOUT_EXIT_7";
      break;
    case 48:
      id v4 = @"ROUNDABOUT_EXIT_8";
      break;
    case 49:
      id v4 = @"ROUNDABOUT_EXIT_9";
      break;
    case 50:
      id v4 = @"ROUNDABOUT_EXIT_10";
      break;
    case 51:
      id v4 = @"ROUNDABOUT_EXIT_11";
      break;
    case 52:
      id v4 = @"ROUNDABOUT_EXIT_12";
      break;
    case 53:
      id v4 = @"ROUNDABOUT_EXIT_13";
      break;
    case 54:
      id v4 = @"ROUNDABOUT_EXIT_14";
      break;
    case 55:
      id v4 = @"ROUNDABOUT_EXIT_15";
      break;
    case 56:
      id v4 = @"ROUNDABOUT_EXIT_16";
      break;
    case 57:
      id v4 = @"ROUNDABOUT_EXIT_17";
      break;
    case 58:
      id v4 = @"ROUNDABOUT_EXIT_18";
      break;
    case 59:
      id v4 = @"ROUNDABOUT_EXIT_19";
      break;
    case 60:
      id v4 = @"SHARP_LEFT_TURN";
      break;
    case 61:
      id v4 = @"SHARP_RIGHT_TURN";
      break;
    case 62:
      id v4 = @"SLIGHT_LEFT_TURN";
      break;
    case 63:
      id v4 = @"SLIGHT_RIGHT_TURN";
      break;
    case 64:
      id v4 = @"CHANGE_HIGHWAY";
      break;
    case 65:
      id v4 = @"CHANGE_HIGHWAY_LEFT";
      break;
    case 66:
      id v4 = @"CHANGE_HIGHWAY_RIGHT";
      break;
    case 80:
      id v4 = @"TOLL_STATION";
      break;
    case 81:
      id v4 = @"ENTER_TUNNEL";
      break;
    case 82:
      id v4 = @"WAYPOINT_STOP";
      break;
    case 83:
      id v4 = @"WAYPOINT_STOP_LEFT";
      break;
    case 84:
      id v4 = @"WAYPOINT_STOP_RIGHT";
      break;
    case 85:
      id v4 = @"RESUME_ROUTE";
      break;
    case 86:
      id v4 = @"RESUME_ROUTE_WITH_U_TURN";
      break;
    case 87:
      id v4 = @"CUSTOM";
      break;
    case 88:
      id v4 = @"TURN_AROUND";
      break;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_24:
      break;
  }
  return v4;
}

- (int)StringAsManeuverArrowOverride:(id)a3
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

- (void)_readShieldName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOSignGuidanceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readShieldName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasShieldName
{
  return self->_shieldName != 0;
}

- (GEONameInfo)shieldName
{
  -[GEOSignGuidance _readShieldName]((uint64_t)self);
  shieldName = self->_shieldName;

  return shieldName;
}

- (void)setShieldName:(id)a3
{
  *(_WORD *)&self->_flags |= 0x240u;
  objc_storeStrong((id *)&self->_shieldName, a3);
}

- (unsigned)stackRanking
{
  return self->_stackRanking;
}

- (void)setStackRanking:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x202u;
  self->_stackRanking = a3;
}

- (void)setHasStackRanking:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 514;
  }
  else {
    __int16 v3 = 512;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasStackRanking
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)_readJunctionInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOSignGuidanceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readJunctionInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasJunctionInfo
{
  return self->_junctionInfo != 0;
}

- (GEOJunctionInfo)junctionInfo
{
  -[GEOSignGuidance _readJunctionInfo]((uint64_t)self);
  junctionInfo = self->_junctionInfo;

  return junctionInfo;
}

- (void)setJunctionInfo:(id)a3
{
  *(_WORD *)&self->_flags |= 0x210u;
  objc_storeStrong((id *)&self->_junctionInfo, a3);
}

- (void)_readArtworkOverride
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOSignGuidanceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readArtworkOverride_tags_6728);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasArtworkOverride
{
  return self->_artworkOverride != 0;
}

- (GEOPBTransitArtwork)artworkOverride
{
  -[GEOSignGuidance _readArtworkOverride]((uint64_t)self);
  artworkOverride = self->_artworkOverride;

  return artworkOverride;
}

- (void)setArtworkOverride:(id)a3
{
  *(_WORD *)&self->_flags |= 0x208u;
  objc_storeStrong((id *)&self->_artworkOverride, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOSignGuidance;
  int v4 = [(GEOSignGuidance *)&v8 description];
  id v5 = [(GEOSignGuidance *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSignGuidance _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 64) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      id v6 = *(id *)(a1 + 64);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v65 objects:v71 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v66;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v66 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v65 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v65 objects:v71 count:16];
        }
        while (v8);
      }

      if (a2) {
        v13 = @"signTitle";
      }
      else {
        v13 = @"sign_title";
      }
      [v4 setObject:v5 forKey:v13];
    }
    if ([*(id *)(a1 + 56) count])
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      id v15 = *(id *)(a1 + 56);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v61 objects:v70 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v62;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v62 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v61 + 1) + 8 * j);
            if (a2) {
              [v20 jsonRepresentation];
            }
            else {
            v21 = [v20 dictionaryRepresentation];
            }
            [v14 addObject:v21];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v61 objects:v70 count:16];
        }
        while (v17);
      }

      if (a2) {
        v22 = @"signDetail";
      }
      else {
        v22 = @"sign_detail";
      }
      [v4 setObject:v14 forKey:v22];
    }
    if ([*(id *)(a1 + 40) count])
    {
      v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v24 = *(id *)(a1 + 40);
      uint64_t v25 = [v24 countByEnumeratingWithState:&v57 objects:v69 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v58;
        do
        {
          for (uint64_t k = 0; k != v26; ++k)
          {
            if (*(void *)v58 != v27) {
              objc_enumerationMutation(v24);
            }
            v29 = *(void **)(*((void *)&v57 + 1) + 8 * k);
            if (a2) {
              [v29 jsonRepresentation];
            }
            else {
            v30 = [v29 dictionaryRepresentation];
            }
            [v23 addObject:v30];
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v57 objects:v69 count:16];
        }
        while (v26);
      }

      if (a2) {
        v31 = @"secondarySign";
      }
      else {
        v31 = @"secondary_sign";
      }
      [v4 setObject:v23 forKey:v31];
    }
    if (*(_WORD *)(a1 + 92))
    {
      v32 = @"NO_TURN";
      switch(*(_DWORD *)(a1 + 84))
      {
        case 0:
          break;
        case 1:
          v32 = @"LEFT_TURN";
          break;
        case 2:
          v32 = @"RIGHT_TURN";
          break;
        case 3:
          v32 = @"STRAIGHT_AHEAD";
          break;
        case 4:
          v32 = @"U_TURN";
          break;
        case 5:
          v32 = @"FOLLOW_ROAD";
          break;
        case 6:
          v32 = @"ENTER_ROUNDABOUT";
          break;
        case 7:
          v32 = @"EXIT_ROUNDABOUT";
          break;
        case 0xB:
          v32 = @"OFF_RAMP";
          break;
        case 0xC:
          v32 = @"ON_RAMP";
          break;
        case 0x10:
          v32 = @"ARRIVE_END_OF_NAVIGATION";
          break;
        case 0x11:
          v32 = @"START_ROUTE";
          break;
        case 0x12:
          v32 = @"ARRIVE_AT_DESTINATION";
          break;
        case 0x14:
          v32 = @"KEEP_LEFT";
          break;
        case 0x15:
          v32 = @"KEEP_RIGHT";
          break;
        case 0x16:
          v32 = @"ENTER_FERRY";
          break;
        case 0x17:
          v32 = @"EXIT_FERRY";
          break;
        case 0x18:
          v32 = @"CHANGE_FERRY";
          break;
        case 0x19:
          v32 = @"START_ROUTE_WITH_U_TURN";
          break;
        case 0x1A:
          v32 = @"U_TURN_AT_ROUNDABOUT";
          break;
        case 0x1B:
          v32 = @"LEFT_TURN_AT_END";
          break;
        case 0x1C:
          v32 = @"RIGHT_TURN_AT_END";
          break;
        case 0x1D:
          v32 = @"HIGHWAY_OFF_RAMP_LEFT";
          break;
        case 0x1E:
          v32 = @"HIGHWAY_OFF_RAMP_RIGHT";
          break;
        case 0x21:
          v32 = @"ARRIVE_AT_DESTINATION_LEFT";
          break;
        case 0x22:
          v32 = @"ARRIVE_AT_DESTINATION_RIGHT";
          break;
        case 0x23:
          v32 = @"U_TURN_WHEN_POSSIBLE";
          break;
        case 0x27:
          v32 = @"ARRIVE_END_OF_DIRECTIONS";
          break;
        case 0x29:
          v32 = @"ROUNDABOUT_EXIT_1";
          break;
        case 0x2A:
          v32 = @"ROUNDABOUT_EXIT_2";
          break;
        case 0x2B:
          v32 = @"ROUNDABOUT_EXIT_3";
          break;
        case 0x2C:
          v32 = @"ROUNDABOUT_EXIT_4";
          break;
        case 0x2D:
          v32 = @"ROUNDABOUT_EXIT_5";
          break;
        case 0x2E:
          v32 = @"ROUNDABOUT_EXIT_6";
          break;
        case 0x2F:
          v32 = @"ROUNDABOUT_EXIT_7";
          break;
        case 0x30:
          v32 = @"ROUNDABOUT_EXIT_8";
          break;
        case 0x31:
          v32 = @"ROUNDABOUT_EXIT_9";
          break;
        case 0x32:
          v32 = @"ROUNDABOUT_EXIT_10";
          break;
        case 0x33:
          v32 = @"ROUNDABOUT_EXIT_11";
          break;
        case 0x34:
          v32 = @"ROUNDABOUT_EXIT_12";
          break;
        case 0x35:
          v32 = @"ROUNDABOUT_EXIT_13";
          break;
        case 0x36:
          v32 = @"ROUNDABOUT_EXIT_14";
          break;
        case 0x37:
          v32 = @"ROUNDABOUT_EXIT_15";
          break;
        case 0x38:
          v32 = @"ROUNDABOUT_EXIT_16";
          break;
        case 0x39:
          v32 = @"ROUNDABOUT_EXIT_17";
          break;
        case 0x3A:
          v32 = @"ROUNDABOUT_EXIT_18";
          break;
        case 0x3B:
          v32 = @"ROUNDABOUT_EXIT_19";
          break;
        case 0x3C:
          v32 = @"SHARP_LEFT_TURN";
          break;
        case 0x3D:
          v32 = @"SHARP_RIGHT_TURN";
          break;
        case 0x3E:
          v32 = @"SLIGHT_LEFT_TURN";
          break;
        case 0x3F:
          v32 = @"SLIGHT_RIGHT_TURN";
          break;
        case 0x40:
          v32 = @"CHANGE_HIGHWAY";
          break;
        case 0x41:
          v32 = @"CHANGE_HIGHWAY_LEFT";
          break;
        case 0x42:
          v32 = @"CHANGE_HIGHWAY_RIGHT";
          break;
        case 0x50:
          v32 = @"TOLL_STATION";
          break;
        case 0x51:
          v32 = @"ENTER_TUNNEL";
          break;
        case 0x52:
          v32 = @"WAYPOINT_STOP";
          break;
        case 0x53:
          v32 = @"WAYPOINT_STOP_LEFT";
          break;
        case 0x54:
          v32 = @"WAYPOINT_STOP_RIGHT";
          break;
        case 0x55:
          v32 = @"RESUME_ROUTE";
          break;
        case 0x56:
          v32 = @"RESUME_ROUTE_WITH_U_TURN";
          break;
        case 0x57:
          v32 = @"CUSTOM";
          break;
        case 0x58:
          v32 = @"TURN_AROUND";
          break;
        default:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 84));
          v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
      }
      if (a2) {
        v33 = @"maneuverArrowOverride";
      }
      else {
        v33 = @"maneuver_arrow_override";
      }
      [v4 setObject:v32 forKey:v33];
    }
    v34 = [(id)a1 shieldName];
    v35 = v34;
    if (v34)
    {
      if (a2)
      {
        v36 = [v34 jsonRepresentation];
        v37 = @"shieldName";
      }
      else
      {
        v36 = [v34 dictionaryRepresentation];
        v37 = @"shield_name";
      }
      [v4 setObject:v36 forKey:v37];
    }
    if ((*(_WORD *)(a1 + 92) & 2) != 0)
    {
      v38 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 88)];
      if (a2) {
        v39 = @"stackRanking";
      }
      else {
        v39 = @"stack_ranking";
      }
      [v4 setObject:v38 forKey:v39];
    }
    v40 = [(id)a1 junctionInfo];
    v41 = v40;
    if (v40)
    {
      if (a2)
      {
        v42 = [v40 jsonRepresentation];
        v43 = @"junctionInfo";
      }
      else
      {
        v42 = [v40 dictionaryRepresentation];
        v43 = @"junction_info";
      }
      [v4 setObject:v42 forKey:v43];
    }
    v44 = [(id)a1 artworkOverride];
    v45 = v44;
    if (v44)
    {
      if (a2)
      {
        v46 = [v44 jsonRepresentation];
        v47 = @"artworkOverride";
      }
      else
      {
        v46 = [v44 dictionaryRepresentation];
        v47 = @"artwork_override";
      }
      [v4 setObject:v46 forKey:v47];
    }
    v48 = *(void **)(a1 + 16);
    if (v48)
    {
      v49 = [v48 dictionaryRepresentation];
      v50 = v49;
      if (a2)
      {
        v51 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v49, "count"));
        v55[0] = MEMORY[0x1E4F143A8];
        v55[1] = 3221225472;
        v55[2] = __45__GEOSignGuidance__dictionaryRepresentation___block_invoke;
        v55[3] = &unk_1E53D8860;
        id v52 = v51;
        id v56 = v52;
        [v50 enumerateKeysAndObjectsUsingBlock:v55];
        id v53 = v52;

        v50 = v53;
      }
      [v4 setObject:v50 forKey:@"Unknown Fields"];
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
  return -[GEOSignGuidance _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __45__GEOSignGuidance__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOSignGuidance)initWithDictionary:(id)a3
{
  return (GEOSignGuidance *)-[GEOSignGuidance _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_220;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_220;
  }
  if (a3) {
    id v6 = @"signTitle";
  }
  else {
    id v6 = @"sign_title";
  }
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  id v61 = v5;
  if (objc_opt_isKindOfClass())
  {
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v70 objects:v76 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v71;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v71 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v70 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v14 = [GEOFormattedString alloc];
            if (a3) {
              uint64_t v15 = [(GEOFormattedString *)v14 initWithJSON:v13];
            }
            else {
              uint64_t v15 = [(GEOFormattedString *)v14 initWithDictionary:v13];
            }
            uint64_t v16 = (void *)v15;
            [a1 addSignTitle:v15];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v70 objects:v76 count:16];
      }
      while (v10);
    }

    id v5 = v61;
  }

  if (a3) {
    uint64_t v17 = @"signDetail";
  }
  else {
    uint64_t v17 = @"sign_detail";
  }
  uint64_t v18 = [v5 objectForKeyedSubscript:v17];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v19 = v18;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v66 objects:v75 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v67;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v67 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v66 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v25 = [GEOFormattedString alloc];
            if (a3) {
              uint64_t v26 = [(GEOFormattedString *)v25 initWithJSON:v24];
            }
            else {
              uint64_t v26 = [(GEOFormattedString *)v25 initWithDictionary:v24];
            }
            uint64_t v27 = (void *)v26;
            [a1 addSignDetail:v26];
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v66 objects:v75 count:16];
      }
      while (v21);
    }

    id v5 = v61;
  }

  if (a3) {
    v28 = @"secondarySign";
  }
  else {
    v28 = @"secondary_sign";
  }
  v29 = [v5 objectForKeyedSubscript:v28];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v30 = v29;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v62 objects:v74 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v63;
      do
      {
        for (uint64_t k = 0; k != v32; ++k)
        {
          if (*(void *)v63 != v33) {
            objc_enumerationMutation(v30);
          }
          uint64_t v35 = *(void *)(*((void *)&v62 + 1) + 8 * k);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v36 = [GEOFormattedString alloc];
            if (a3) {
              uint64_t v37 = [(GEOFormattedString *)v36 initWithJSON:v35];
            }
            else {
              uint64_t v37 = [(GEOFormattedString *)v36 initWithDictionary:v35];
            }
            v38 = (void *)v37;
            [a1 addSecondarySign:v37];
          }
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v62 objects:v74 count:16];
      }
      while (v32);
    }

    id v5 = v61;
  }

  if (a3) {
    v39 = @"maneuverArrowOverride";
  }
  else {
    v39 = @"maneuver_arrow_override";
  }
  v40 = [v5 objectForKeyedSubscript:v39];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v41 = v40;
    if ([v41 isEqualToString:@"NO_TURN"])
    {
      uint64_t v42 = 0;
    }
    else if ([v41 isEqualToString:@"LEFT_TURN"])
    {
      uint64_t v42 = 1;
    }
    else if ([v41 isEqualToString:@"RIGHT_TURN"])
    {
      uint64_t v42 = 2;
    }
    else if ([v41 isEqualToString:@"STRAIGHT_AHEAD"])
    {
      uint64_t v42 = 3;
    }
    else if ([v41 isEqualToString:@"U_TURN"])
    {
      uint64_t v42 = 4;
    }
    else if ([v41 isEqualToString:@"FOLLOW_ROAD"])
    {
      uint64_t v42 = 5;
    }
    else if ([v41 isEqualToString:@"ENTER_ROUNDABOUT"])
    {
      uint64_t v42 = 6;
    }
    else if ([v41 isEqualToString:@"EXIT_ROUNDABOUT"])
    {
      uint64_t v42 = 7;
    }
    else if ([v41 isEqualToString:@"OFF_RAMP"])
    {
      uint64_t v42 = 11;
    }
    else if ([v41 isEqualToString:@"ON_RAMP"])
    {
      uint64_t v42 = 12;
    }
    else if ([v41 isEqualToString:@"ARRIVE_END_OF_NAVIGATION"])
    {
      uint64_t v42 = 16;
    }
    else if ([v41 isEqualToString:@"START_ROUTE"])
    {
      uint64_t v42 = 17;
    }
    else
    {
      if ([v41 isEqualToString:@"ARRIVE_AT_DESTINATION"])
      {
        uint64_t v42 = 18;
      }
      else if ([v41 isEqualToString:@"KEEP_LEFT"])
      {
        uint64_t v42 = 20;
      }
      else if ([v41 isEqualToString:@"KEEP_RIGHT"])
      {
        uint64_t v42 = 21;
      }
      else if ([v41 isEqualToString:@"ENTER_FERRY"])
      {
        uint64_t v42 = 22;
      }
      else if ([v41 isEqualToString:@"EXIT_FERRY"])
      {
        uint64_t v42 = 23;
      }
      else if ([v41 isEqualToString:@"CHANGE_FERRY"])
      {
        uint64_t v42 = 24;
      }
      else if ([v41 isEqualToString:@"START_ROUTE_WITH_U_TURN"])
      {
        uint64_t v42 = 25;
      }
      else if ([v41 isEqualToString:@"U_TURN_AT_ROUNDABOUT"])
      {
        uint64_t v42 = 26;
      }
      else if ([v41 isEqualToString:@"LEFT_TURN_AT_END"])
      {
        uint64_t v42 = 27;
      }
      else if ([v41 isEqualToString:@"RIGHT_TURN_AT_END"])
      {
        uint64_t v42 = 28;
      }
      else if ([v41 isEqualToString:@"HIGHWAY_OFF_RAMP_LEFT"])
      {
        uint64_t v42 = 29;
      }
      else if ([v41 isEqualToString:@"HIGHWAY_OFF_RAMP_RIGHT"])
      {
        uint64_t v42 = 30;
      }
      else if ([v41 isEqualToString:@"ARRIVE_AT_DESTINATION_LEFT"])
      {
        uint64_t v42 = 33;
      }
      else if ([v41 isEqualToString:@"ARRIVE_AT_DESTINATION_RIGHT"])
      {
        uint64_t v42 = 34;
      }
      else if ([v41 isEqualToString:@"U_TURN_WHEN_POSSIBLE"])
      {
        uint64_t v42 = 35;
      }
      else if ([v41 isEqualToString:@"ARRIVE_END_OF_DIRECTIONS"])
      {
        uint64_t v42 = 39;
      }
      else if ([v41 isEqualToString:@"ROUNDABOUT_EXIT_1"])
      {
        uint64_t v42 = 41;
      }
      else if ([v41 isEqualToString:@"ROUNDABOUT_EXIT_2"])
      {
        uint64_t v42 = 42;
      }
      else if ([v41 isEqualToString:@"ROUNDABOUT_EXIT_3"])
      {
        uint64_t v42 = 43;
      }
      else if ([v41 isEqualToString:@"ROUNDABOUT_EXIT_4"])
      {
        uint64_t v42 = 44;
      }
      else if ([v41 isEqualToString:@"ROUNDABOUT_EXIT_5"])
      {
        uint64_t v42 = 45;
      }
      else if ([v41 isEqualToString:@"ROUNDABOUT_EXIT_6"])
      {
        uint64_t v42 = 46;
      }
      else if ([v41 isEqualToString:@"ROUNDABOUT_EXIT_7"])
      {
        uint64_t v42 = 47;
      }
      else if ([v41 isEqualToString:@"ROUNDABOUT_EXIT_8"])
      {
        uint64_t v42 = 48;
      }
      else if ([v41 isEqualToString:@"ROUNDABOUT_EXIT_9"])
      {
        uint64_t v42 = 49;
      }
      else if ([v41 isEqualToString:@"ROUNDABOUT_EXIT_10"])
      {
        uint64_t v42 = 50;
      }
      else if ([v41 isEqualToString:@"ROUNDABOUT_EXIT_11"])
      {
        uint64_t v42 = 51;
      }
      else if ([v41 isEqualToString:@"ROUNDABOUT_EXIT_12"])
      {
        uint64_t v42 = 52;
      }
      else if ([v41 isEqualToString:@"ROUNDABOUT_EXIT_13"])
      {
        uint64_t v42 = 53;
      }
      else if ([v41 isEqualToString:@"ROUNDABOUT_EXIT_14"])
      {
        uint64_t v42 = 54;
      }
      else if ([v41 isEqualToString:@"ROUNDABOUT_EXIT_15"])
      {
        uint64_t v42 = 55;
      }
      else if ([v41 isEqualToString:@"ROUNDABOUT_EXIT_16"])
      {
        uint64_t v42 = 56;
      }
      else if ([v41 isEqualToString:@"ROUNDABOUT_EXIT_17"])
      {
        uint64_t v42 = 57;
      }
      else if ([v41 isEqualToString:@"ROUNDABOUT_EXIT_18"])
      {
        uint64_t v42 = 58;
      }
      else if ([v41 isEqualToString:@"ROUNDABOUT_EXIT_19"])
      {
        uint64_t v42 = 59;
      }
      else if ([v41 isEqualToString:@"SHARP_LEFT_TURN"])
      {
        uint64_t v42 = 60;
      }
      else if ([v41 isEqualToString:@"SHARP_RIGHT_TURN"])
      {
        uint64_t v42 = 61;
      }
      else if ([v41 isEqualToString:@"SLIGHT_LEFT_TURN"])
      {
        uint64_t v42 = 62;
      }
      else if ([v41 isEqualToString:@"SLIGHT_RIGHT_TURN"])
      {
        uint64_t v42 = 63;
      }
      else if ([v41 isEqualToString:@"CHANGE_HIGHWAY"])
      {
        uint64_t v42 = 64;
      }
      else if ([v41 isEqualToString:@"CHANGE_HIGHWAY_LEFT"])
      {
        uint64_t v42 = 65;
      }
      else if ([v41 isEqualToString:@"CHANGE_HIGHWAY_RIGHT"])
      {
        uint64_t v42 = 66;
      }
      else if ([v41 isEqualToString:@"TOLL_STATION"])
      {
        uint64_t v42 = 80;
      }
      else if ([v41 isEqualToString:@"ENTER_TUNNEL"])
      {
        uint64_t v42 = 81;
      }
      else if ([v41 isEqualToString:@"WAYPOINT_STOP"])
      {
        uint64_t v42 = 82;
      }
      else if ([v41 isEqualToString:@"WAYPOINT_STOP_LEFT"])
      {
        uint64_t v42 = 83;
      }
      else if ([v41 isEqualToString:@"WAYPOINT_STOP_RIGHT"])
      {
        uint64_t v42 = 84;
      }
      else if ([v41 isEqualToString:@"RESUME_ROUTE"])
      {
        uint64_t v42 = 85;
      }
      else if ([v41 isEqualToString:@"RESUME_ROUTE_WITH_U_TURN"])
      {
        uint64_t v42 = 86;
      }
      else if ([v41 isEqualToString:@"CUSTOM"])
      {
        uint64_t v42 = 87;
      }
      else if ([v41 isEqualToString:@"TURN_AROUND"])
      {
        uint64_t v42 = 88;
      }
      else
      {
        uint64_t v42 = 0;
      }
      id v5 = v61;
    }

    goto LABEL_189;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v42 = [v40 intValue];
LABEL_189:
    [a1 setManeuverArrowOverride:v42];
  }

  if (a3) {
    v43 = @"shieldName";
  }
  else {
    v43 = @"shield_name";
  }
  v44 = [v5 objectForKeyedSubscript:v43];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v45 = [GEONameInfo alloc];
    if (a3) {
      uint64_t v46 = [(GEONameInfo *)v45 initWithJSON:v44];
    }
    else {
      uint64_t v46 = [(GEONameInfo *)v45 initWithDictionary:v44];
    }
    v47 = (void *)v46;
    [a1 setShieldName:v46];
  }
  if (a3) {
    v48 = @"stackRanking";
  }
  else {
    v48 = @"stack_ranking";
  }
  v49 = [v5 objectForKeyedSubscript:v48];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setStackRanking:", objc_msgSend(v49, "unsignedIntValue"));
  }

  if (a3) {
    v50 = @"junctionInfo";
  }
  else {
    v50 = @"junction_info";
  }
  v51 = [v5 objectForKeyedSubscript:v50];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v52 = [GEOJunctionInfo alloc];
    if (a3) {
      uint64_t v53 = [(GEOJunctionInfo *)v52 initWithJSON:v51];
    }
    else {
      uint64_t v53 = [(GEOJunctionInfo *)v52 initWithDictionary:v51];
    }
    v54 = (void *)v53;
    [a1 setJunctionInfo:v53];
  }
  if (a3) {
    v55 = @"artworkOverride";
  }
  else {
    v55 = @"artwork_override";
  }
  id v56 = [v5 objectForKeyedSubscript:v55];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v57 = [GEOPBTransitArtwork alloc];
    if (a3) {
      uint64_t v58 = [(GEOPBTransitArtwork *)v57 initWithJSON:v56];
    }
    else {
      uint64_t v58 = [(GEOPBTransitArtwork *)v57 initWithDictionary:v56];
    }
    long long v59 = (void *)v58;
    [a1 setArtworkOverride:v58];
  }
LABEL_220:

  return a1;
}

- (GEOSignGuidance)initWithJSON:(id)a3
{
  return (GEOSignGuidance *)-[GEOSignGuidance _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_6765;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_6766;
    }
    GEOSignGuidanceReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOSignGuidanceCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOSignGuidanceIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOSignGuidanceReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOSignGuidanceIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v18 = self->_reader;
    objc_sync_enter(v18);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v19 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v19];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v18);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOSignGuidance *)self readAll:0];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v6 = self->_signTitles;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v29 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v7);
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v10 = self->_signDetails;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v11);
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v14 = self->_secondarySigns;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v21;
      do
      {
        for (uint64_t k = 0; k != v15; ++k)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
      }
      while (v15);
    }

    if (*(_WORD *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_shieldName) {
      PBDataWriterWriteSubmessage();
    }
    if ((*(_WORD *)&self->_flags & 2) != 0) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_junctionInfo) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_artworkOverride) {
      PBDataWriterWriteSubmessage();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v20);
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v17 = (id *)a3;
  [(GEOSignGuidance *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v17 + 1, self->_reader);
  *((_DWORD *)v17 + 18) = self->_readerMarkPos;
  *((_DWORD *)v17 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOSignGuidance *)self signTitlesCount])
  {
    [v17 clearSignTitles];
    unint64_t v4 = [(GEOSignGuidance *)self signTitlesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOSignGuidance *)self signTitleAtIndex:i];
        [v17 addSignTitle:v7];
      }
    }
  }
  if ([(GEOSignGuidance *)self signDetailsCount])
  {
    [v17 clearSignDetails];
    unint64_t v8 = [(GEOSignGuidance *)self signDetailsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOSignGuidance *)self signDetailAtIndex:j];
        [v17 addSignDetail:v11];
      }
    }
  }
  if ([(GEOSignGuidance *)self secondarySignsCount])
  {
    [v17 clearSecondarySigns];
    unint64_t v12 = [(GEOSignGuidance *)self secondarySignsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(GEOSignGuidance *)self secondarySignAtIndex:k];
        [v17 addSecondarySign:v15];
      }
    }
  }
  uint64_t v16 = v17;
  if (*(_WORD *)&self->_flags)
  {
    *((_DWORD *)v17 + 21) = self->_maneuverArrowOverride;
    *((_WORD *)v17 + 46) |= 1u;
  }
  if (self->_shieldName)
  {
    objc_msgSend(v17, "setShieldName:");
    uint64_t v16 = v17;
  }
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v16 + 22) = self->_stackRanking;
    *((_WORD *)v16 + 46) |= 2u;
  }
  if (self->_junctionInfo)
  {
    objc_msgSend(v17, "setJunctionInfo:");
    uint64_t v16 = v17;
  }
  if (self->_artworkOverride)
  {
    objc_msgSend(v17, "setArtworkOverride:");
    uint64_t v16 = v17;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x200) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOSignGuidanceReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_31;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOSignGuidance *)self readAll:0];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  unint64_t v9 = self->_signTitles;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(v9);
        }
        unint64_t v13 = (void *)[*(id *)(*((void *)&v40 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addSignTitle:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v10);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v14 = self->_signDetails;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v37 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = (void *)[*(id *)(*((void *)&v36 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addSignDetail:v18];
      }
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v15);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v19 = self->_secondarySigns;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v33;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v33 != v21) {
          objc_enumerationMutation(v19);
        }
        long long v23 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * k), "copyWithZone:", a3, (void)v32);
        [(id)v5 addSecondarySign:v23];
      }
      uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v32 objects:v44 count:16];
    }
    while (v20);
  }

  if (*(_WORD *)&self->_flags)
  {
    *(_DWORD *)(v5 + 84) = self->_maneuverArrowOverride;
    *(_WORD *)(v5 + 92) |= 1u;
  }
  id v24 = -[GEONameInfo copyWithZone:](self->_shieldName, "copyWithZone:", a3, (void)v32);
  long long v25 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v24;

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_stackRanking;
    *(_WORD *)(v5 + 92) |= 2u;
  }
  id v26 = [(GEOJunctionInfo *)self->_junctionInfo copyWithZone:a3];
  long long v27 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v26;

  id v28 = [(GEOPBTransitArtwork *)self->_artworkOverride copyWithZone:a3];
  long long v29 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v28;

  long long v30 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v30;
LABEL_31:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  [(GEOSignGuidance *)self readAll:1];
  [v4 readAll:1];
  signTitles = self->_signTitles;
  if ((unint64_t)signTitles | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](signTitles, "isEqual:")) {
      goto LABEL_25;
    }
  }
  signDetails = self->_signDetails;
  if ((unint64_t)signDetails | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](signDetails, "isEqual:")) {
      goto LABEL_25;
    }
  }
  secondarySigns = self->_secondarySigns;
  if ((unint64_t)secondarySigns | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](secondarySigns, "isEqual:")) {
      goto LABEL_25;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v9 = *((_WORD *)v4 + 46);
  if (flags)
  {
    if ((v9 & 1) == 0 || self->_maneuverArrowOverride != *((_DWORD *)v4 + 21)) {
      goto LABEL_25;
    }
  }
  else if (v9)
  {
    goto LABEL_25;
  }
  shieldName = self->_shieldName;
  if ((unint64_t)shieldName | *((void *)v4 + 6))
  {
    if (!-[GEONameInfo isEqual:](shieldName, "isEqual:"))
    {
LABEL_25:
      char v13 = 0;
      goto LABEL_26;
    }
    __int16 flags = (__int16)self->_flags;
    __int16 v9 = *((_WORD *)v4 + 46);
  }
  if ((flags & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_stackRanking != *((_DWORD *)v4 + 22)) {
      goto LABEL_25;
    }
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_25;
  }
  junctionInfo = self->_junctionInfo;
  if ((unint64_t)junctionInfo | *((void *)v4 + 4) && !-[GEOJunctionInfo isEqual:](junctionInfo, "isEqual:")) {
    goto LABEL_25;
  }
  artworkOverride = self->_artworkOverride;
  if ((unint64_t)artworkOverride | *((void *)v4 + 3)) {
    char v13 = -[GEOPBTransitArtwork isEqual:](artworkOverride, "isEqual:");
  }
  else {
    char v13 = 1;
  }
LABEL_26:

  return v13;
}

- (unint64_t)hash
{
  [(GEOSignGuidance *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_signTitles hash];
  uint64_t v4 = [(NSMutableArray *)self->_signDetails hash];
  uint64_t v5 = [(NSMutableArray *)self->_secondarySigns hash];
  if (*(_WORD *)&self->_flags) {
    uint64_t v6 = 2654435761 * self->_maneuverArrowOverride;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = [(GEONameInfo *)self->_shieldName hash];
  if ((*(_WORD *)&self->_flags & 2) != 0) {
    uint64_t v8 = 2654435761 * self->_stackRanking;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = v4 ^ v3 ^ v5 ^ v6;
  unint64_t v10 = v7 ^ v8 ^ [(GEOJunctionInfo *)self->_junctionInfo hash];
  return v9 ^ v10 ^ [(GEOPBTransitArtwork *)self->_artworkOverride hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v5 = *((id *)v4 + 8);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOSignGuidance *)self addSignTitle:*(void *)(*((void *)&v34 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v7);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v10 = *((id *)v4 + 7);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(v10);
        }
        [(GEOSignGuidance *)self addSignDetail:*(void *)(*((void *)&v30 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v12);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v15 = *((id *)v4 + 5);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v27;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v15);
        }
        -[GEOSignGuidance addSecondarySign:](self, "addSecondarySign:", *(void *)(*((void *)&v26 + 1) + 8 * k), (void)v26);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v17);
  }

  if (*((_WORD *)v4 + 46))
  {
    self->_maneuverArrowOverride = *((_DWORD *)v4 + 21);
    *(_WORD *)&self->_flags |= 1u;
  }
  shieldName = self->_shieldName;
  uint64_t v21 = *((void *)v4 + 6);
  if (shieldName)
  {
    if (v21) {
      -[GEONameInfo mergeFrom:](shieldName, "mergeFrom:");
    }
  }
  else if (v21)
  {
    -[GEOSignGuidance setShieldName:](self, "setShieldName:");
  }
  if ((*((_WORD *)v4 + 46) & 2) != 0)
  {
    self->_stackRanking = *((_DWORD *)v4 + 22);
    *(_WORD *)&self->_flags |= 2u;
  }
  junctionInfo = self->_junctionInfo;
  uint64_t v23 = *((void *)v4 + 4);
  if (junctionInfo)
  {
    if (v23) {
      -[GEOJunctionInfo mergeFrom:](junctionInfo, "mergeFrom:");
    }
  }
  else if (v23)
  {
    -[GEOSignGuidance setJunctionInfo:](self, "setJunctionInfo:");
  }
  artworkOverride = self->_artworkOverride;
  uint64_t v25 = *((void *)v4 + 3);
  if (artworkOverride)
  {
    if (v25) {
      -[GEOPBTransitArtwork mergeFrom:](artworkOverride, "mergeFrom:");
    }
  }
  else if (v25)
  {
    -[GEOSignGuidance setArtworkOverride:](self, "setArtworkOverride:");
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEOSignGuidanceReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_6770);
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
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x204u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOSignGuidance *)self readAll:0];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v7 = self->_signTitles;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v31;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v30 + 1) + 8 * v11++) clearUnknownFields:1];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v9);
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v12 = self->_signDetails;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v26 objects:v35 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v27;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v26 + 1) + 8 * v16++) clearUnknownFields:1];
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v26 objects:v35 count:16];
      }
      while (v14);
    }

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v17 = self->_secondarySigns;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v23;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v23 != v20) {
            objc_enumerationMutation(v17);
          }
          objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v21++), "clearUnknownFields:", 1, (void)v22);
        }
        while (v19 != v21);
        uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
      }
      while (v19);
    }

    [(GEONameInfo *)self->_shieldName clearUnknownFields:1];
    [(GEOJunctionInfo *)self->_junctionInfo clearUnknownFields:1];
    [(GEOPBTransitArtwork *)self->_artworkOverride clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signTitles, 0);
  objc_storeStrong((id *)&self->_signDetails, 0);
  objc_storeStrong((id *)&self->_shieldName, 0);
  objc_storeStrong((id *)&self->_secondarySigns, 0);
  objc_storeStrong((id *)&self->_junctionInfo, 0);
  objc_storeStrong((id *)&self->_artworkOverride, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end