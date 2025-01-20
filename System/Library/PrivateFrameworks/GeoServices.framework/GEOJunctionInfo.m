@interface GEOJunctionInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDrivingSide;
- (BOOL)hasJunctionType;
- (BOOL)hasManeuverType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOJunctionElement)junctionElementAtIndex:(unint64_t)a3;
- (GEOJunctionElement)junctionElements;
- (GEOJunctionInfo)initWithDictionary:(id)a3;
- (GEOJunctionInfo)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)drivingSideAsString:(int)a3;
- (id)jsonRepresentation;
- (id)junctionTypeAsString:(int)a3;
- (id)maneuverTypeAsString:(int)a3;
- (int)StringAsDrivingSide:(id)a3;
- (int)StringAsJunctionType:(id)a3;
- (int)StringAsManeuverType:(id)a3;
- (int)drivingSide;
- (int)junctionType;
- (int)maneuverType;
- (uint64_t)_reserveJunctionElements:(uint64_t)a1;
- (unint64_t)hash;
- (unint64_t)junctionElementsCount;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addJunctionElement:(GEOJunctionElement)a3;
- (void)clearJunctionElements;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setDrivingSide:(int)a3;
- (void)setHasDrivingSide:(BOOL)a3;
- (void)setHasJunctionType:(BOOL)a3;
- (void)setHasManeuverType:(BOOL)a3;
- (void)setJunctionElements:(GEOJunctionElement *)a3 count:(unint64_t)a4;
- (void)setJunctionType:(int)a3;
- (void)setManeuverType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOJunctionInfo

- (void)dealloc
{
  [(GEOJunctionInfo *)self clearJunctionElements];
  v3.receiver = self;
  v3.super_class = (Class)GEOJunctionInfo;
  [(GEOJunctionInfo *)&v3 dealloc];
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
    uint64_t result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 16), 16 * v9, 0x7BD3AE9AuLL);
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
  self->_junctionElementsSpace = 0;
  self->_junctionElementsCount = 0;
  free(self->_junctionElements);
  self->_junctionElements = 0;
}

- (void)addJunctionElement:(GEOJunctionElement)a3
{
  uint64_t v3 = *(void *)&a3.var2;
  uint64_t v4 = *(void *)&a3.var0;
  if (-[GEOJunctionInfo _reserveJunctionElements:]((uint64_t)self, 1uLL))
  {
    unint64_t v6 = &self->_junctionElements[self->_junctionElementsCount];
    *(void *)&v6->var0 = v4;
    *(void *)&v6->var2 = v3;
    ++self->_junctionElementsCount;
  }
}

- (GEOJunctionElement)junctionElementAtIndex:(unint64_t)a3
{
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
  if (-[GEOJunctionInfo _reserveJunctionElements:]((uint64_t)self, a4))
  {
    memcpy(self->_junctionElements, a3, 16 * a4);
    self->_unint64_t junctionElementsCount = a4;
  }
}

- (int)junctionType
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_junctionType;
  }
  else {
    return 0;
  }
}

- (void)setJunctionType:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_junctionType = a3;
}

- (void)setHasJunctionType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasJunctionType
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)junctionTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      uint64_t v4 = @"JCTTYPE_ROUNDABOUT";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v4 = @"JCTTYPE_NORMAL";
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

- (int)maneuverType
{
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    return self->_maneuverType;
  }
  else {
    return 0;
  }
}

- (void)setManeuverType:(int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_maneuverType = a3;
}

- (void)setHasManeuverType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasManeuverType
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)maneuverTypeAsString:(int)a3
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

- (int)drivingSide
{
  if (*(unsigned char *)&self->_flags) {
    return self->_drivingSide;
  }
  else {
    return 0;
  }
}

- (void)setDrivingSide:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_drivingSide = a3;
}

- (void)setHasDrivingSide:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasDrivingSide
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)drivingSideAsString:(int)a3
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

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOJunctionInfo;
  int v4 = [(GEOJunctionInfo *)&v8 description];
  unint64_t v5 = [(GEOJunctionInfo *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOJunctionInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_104;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(void *)(a1 + 24))
  {
    unint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 24)];
    if (*(void *)(a1 + 24))
    {
      uint64_t v6 = 0;
      unint64_t v7 = 0;
      do
      {
        objc_super v8 = _GEOJunctionElementDictionaryRepresentation((unsigned int *)(*(void *)(a1 + 16) + v6));
        [v5 addObject:v8];

        ++v7;
        v6 += 16;
      }
      while (v7 < *(void *)(a1 + 24));
    }
    if (a2) {
      unint64_t v9 = @"junctionElement";
    }
    else {
      unint64_t v9 = @"junction_element";
    }
    [v4 setObject:v5 forKey:v9];
  }
  char v10 = *(unsigned char *)(a1 + 52);
  if ((v10 & 2) != 0)
  {
    int v11 = *(_DWORD *)(a1 + 44);
    if (v11)
    {
      if (v11 == 1)
      {
        uint64_t v12 = @"JCTTYPE_ROUNDABOUT";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 44));
        uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      uint64_t v12 = @"JCTTYPE_NORMAL";
    }
    if (a2) {
      v13 = @"junctionType";
    }
    else {
      v13 = @"junction_type";
    }
    [v4 setObject:v12 forKey:v13];

    char v10 = *(unsigned char *)(a1 + 52);
    if ((v10 & 4) == 0)
    {
LABEL_12:
      if ((v10 & 1) == 0) {
        goto LABEL_100;
      }
      goto LABEL_91;
    }
  }
  else if ((*(unsigned char *)(a1 + 52) & 4) == 0)
  {
    goto LABEL_12;
  }
  v14 = @"NO_TURN";
  switch(*(_DWORD *)(a1 + 48))
  {
    case 0:
      break;
    case 1:
      v14 = @"LEFT_TURN";
      break;
    case 2:
      v14 = @"RIGHT_TURN";
      break;
    case 3:
      v14 = @"STRAIGHT_AHEAD";
      break;
    case 4:
      v14 = @"U_TURN";
      break;
    case 5:
      v14 = @"FOLLOW_ROAD";
      break;
    case 6:
      v14 = @"ENTER_ROUNDABOUT";
      break;
    case 7:
      v14 = @"EXIT_ROUNDABOUT";
      break;
    case 0xB:
      v14 = @"OFF_RAMP";
      break;
    case 0xC:
      v14 = @"ON_RAMP";
      break;
    case 0x10:
      v14 = @"ARRIVE_END_OF_NAVIGATION";
      break;
    case 0x11:
      v14 = @"START_ROUTE";
      break;
    case 0x12:
      v14 = @"ARRIVE_AT_DESTINATION";
      break;
    case 0x14:
      v14 = @"KEEP_LEFT";
      break;
    case 0x15:
      v14 = @"KEEP_RIGHT";
      break;
    case 0x16:
      v14 = @"ENTER_FERRY";
      break;
    case 0x17:
      v14 = @"EXIT_FERRY";
      break;
    case 0x18:
      v14 = @"CHANGE_FERRY";
      break;
    case 0x19:
      v14 = @"START_ROUTE_WITH_U_TURN";
      break;
    case 0x1A:
      v14 = @"U_TURN_AT_ROUNDABOUT";
      break;
    case 0x1B:
      v14 = @"LEFT_TURN_AT_END";
      break;
    case 0x1C:
      v14 = @"RIGHT_TURN_AT_END";
      break;
    case 0x1D:
      v14 = @"HIGHWAY_OFF_RAMP_LEFT";
      break;
    case 0x1E:
      v14 = @"HIGHWAY_OFF_RAMP_RIGHT";
      break;
    case 0x21:
      v14 = @"ARRIVE_AT_DESTINATION_LEFT";
      break;
    case 0x22:
      v14 = @"ARRIVE_AT_DESTINATION_RIGHT";
      break;
    case 0x23:
      v14 = @"U_TURN_WHEN_POSSIBLE";
      break;
    case 0x27:
      v14 = @"ARRIVE_END_OF_DIRECTIONS";
      break;
    case 0x29:
      v14 = @"ROUNDABOUT_EXIT_1";
      break;
    case 0x2A:
      v14 = @"ROUNDABOUT_EXIT_2";
      break;
    case 0x2B:
      v14 = @"ROUNDABOUT_EXIT_3";
      break;
    case 0x2C:
      v14 = @"ROUNDABOUT_EXIT_4";
      break;
    case 0x2D:
      v14 = @"ROUNDABOUT_EXIT_5";
      break;
    case 0x2E:
      v14 = @"ROUNDABOUT_EXIT_6";
      break;
    case 0x2F:
      v14 = @"ROUNDABOUT_EXIT_7";
      break;
    case 0x30:
      v14 = @"ROUNDABOUT_EXIT_8";
      break;
    case 0x31:
      v14 = @"ROUNDABOUT_EXIT_9";
      break;
    case 0x32:
      v14 = @"ROUNDABOUT_EXIT_10";
      break;
    case 0x33:
      v14 = @"ROUNDABOUT_EXIT_11";
      break;
    case 0x34:
      v14 = @"ROUNDABOUT_EXIT_12";
      break;
    case 0x35:
      v14 = @"ROUNDABOUT_EXIT_13";
      break;
    case 0x36:
      v14 = @"ROUNDABOUT_EXIT_14";
      break;
    case 0x37:
      v14 = @"ROUNDABOUT_EXIT_15";
      break;
    case 0x38:
      v14 = @"ROUNDABOUT_EXIT_16";
      break;
    case 0x39:
      v14 = @"ROUNDABOUT_EXIT_17";
      break;
    case 0x3A:
      v14 = @"ROUNDABOUT_EXIT_18";
      break;
    case 0x3B:
      v14 = @"ROUNDABOUT_EXIT_19";
      break;
    case 0x3C:
      v14 = @"SHARP_LEFT_TURN";
      break;
    case 0x3D:
      v14 = @"SHARP_RIGHT_TURN";
      break;
    case 0x3E:
      v14 = @"SLIGHT_LEFT_TURN";
      break;
    case 0x3F:
      v14 = @"SLIGHT_RIGHT_TURN";
      break;
    case 0x40:
      v14 = @"CHANGE_HIGHWAY";
      break;
    case 0x41:
      v14 = @"CHANGE_HIGHWAY_LEFT";
      break;
    case 0x42:
      v14 = @"CHANGE_HIGHWAY_RIGHT";
      break;
    case 0x50:
      v14 = @"TOLL_STATION";
      break;
    case 0x51:
      v14 = @"ENTER_TUNNEL";
      break;
    case 0x52:
      v14 = @"WAYPOINT_STOP";
      break;
    case 0x53:
      v14 = @"WAYPOINT_STOP_LEFT";
      break;
    case 0x54:
      v14 = @"WAYPOINT_STOP_RIGHT";
      break;
    case 0x55:
      v14 = @"RESUME_ROUTE";
      break;
    case 0x56:
      v14 = @"RESUME_ROUTE_WITH_U_TURN";
      break;
    case 0x57:
      v14 = @"CUSTOM";
      break;
    case 0x58:
      v14 = @"TURN_AROUND";
      break;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 48));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  if (a2) {
    v15 = @"maneuverType";
  }
  else {
    v15 = @"maneuver_type";
  }
  [v4 setObject:v14 forKey:v15];

  if ((*(unsigned char *)(a1 + 52) & 1) == 0) {
    goto LABEL_100;
  }
LABEL_91:
  int v16 = *(_DWORD *)(a1 + 40);
  if (v16)
  {
    if (v16 == 1)
    {
      v17 = @"LEFT_SIDE";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 40));
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v17 = @"RIGHT_SIDE";
  }
  if (a2) {
    v18 = @"drivingSide";
  }
  else {
    v18 = @"driving_side";
  }
  [v4 setObject:v17 forKey:v18];

LABEL_100:
  v19 = *(void **)(a1 + 8);
  if (v19)
  {
    v20 = [v19 dictionaryRepresentation];
    v21 = v20;
    if (a2)
    {
      v22 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __45__GEOJunctionInfo__dictionaryRepresentation___block_invoke;
      v26[3] = &unk_1E53D8860;
      id v23 = v22;
      id v27 = v23;
      [v21 enumerateKeysAndObjectsUsingBlock:v26];
      id v24 = v23;

      v21 = v24;
    }
    [v4 setObject:v21 forKey:@"Unknown Fields"];
  }
LABEL_104:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOJunctionInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __45__GEOJunctionInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  unint64_t v7 = *(void **)(a1 + 32);
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

- (GEOJunctionInfo)initWithDictionary:(id)a3
{
  return (GEOJunctionInfo *)-[GEOJunctionInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        uint64_t v6 = @"junctionElement";
      }
      else {
        uint64_t v6 = @"junction_element";
      }
      unint64_t v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v30;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v30 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v29 + 1) + 8 * v12);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v27 = 0;
                uint64_t v28 = 0;
                _GEOJunctionElementFromDictionaryRepresentation(v13, (uint64_t)&v27);
                objc_msgSend(a1, "addJunctionElement:", v27, v28);
              }
              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
          }
          while (v10);
        }
      }
      if (a3) {
        v14 = @"junctionType";
      }
      else {
        v14 = @"junction_type";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = v15;
        if ([v16 isEqualToString:@"JCTTYPE_NORMAL"]) {
          uint64_t v17 = 0;
        }
        else {
          uint64_t v17 = [v16 isEqualToString:@"JCTTYPE_ROUNDABOUT"];
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_28;
        }
        uint64_t v17 = [v15 intValue];
      }
      [a1 setJunctionType:v17];
LABEL_28:

      if (a3) {
        v18 = @"maneuverType";
      }
      else {
        v18 = @"maneuver_type";
      }
      v19 = [v5 objectForKeyedSubscript:v18];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v20 = v19;
        if ([v20 isEqualToString:@"NO_TURN"])
        {
          uint64_t v21 = 0;
        }
        else if ([v20 isEqualToString:@"LEFT_TURN"])
        {
          uint64_t v21 = 1;
        }
        else if ([v20 isEqualToString:@"RIGHT_TURN"])
        {
          uint64_t v21 = 2;
        }
        else if ([v20 isEqualToString:@"STRAIGHT_AHEAD"])
        {
          uint64_t v21 = 3;
        }
        else if ([v20 isEqualToString:@"U_TURN"])
        {
          uint64_t v21 = 4;
        }
        else if ([v20 isEqualToString:@"FOLLOW_ROAD"])
        {
          uint64_t v21 = 5;
        }
        else if ([v20 isEqualToString:@"ENTER_ROUNDABOUT"])
        {
          uint64_t v21 = 6;
        }
        else if ([v20 isEqualToString:@"EXIT_ROUNDABOUT"])
        {
          uint64_t v21 = 7;
        }
        else if ([v20 isEqualToString:@"OFF_RAMP"])
        {
          uint64_t v21 = 11;
        }
        else if ([v20 isEqualToString:@"ON_RAMP"])
        {
          uint64_t v21 = 12;
        }
        else if ([v20 isEqualToString:@"ARRIVE_END_OF_NAVIGATION"])
        {
          uint64_t v21 = 16;
        }
        else if ([v20 isEqualToString:@"START_ROUTE"])
        {
          uint64_t v21 = 17;
        }
        else if ([v20 isEqualToString:@"ARRIVE_AT_DESTINATION"])
        {
          uint64_t v21 = 18;
        }
        else if ([v20 isEqualToString:@"KEEP_LEFT"])
        {
          uint64_t v21 = 20;
        }
        else if ([v20 isEqualToString:@"KEEP_RIGHT"])
        {
          uint64_t v21 = 21;
        }
        else if ([v20 isEqualToString:@"ENTER_FERRY"])
        {
          uint64_t v21 = 22;
        }
        else if ([v20 isEqualToString:@"EXIT_FERRY"])
        {
          uint64_t v21 = 23;
        }
        else if ([v20 isEqualToString:@"CHANGE_FERRY"])
        {
          uint64_t v21 = 24;
        }
        else if ([v20 isEqualToString:@"START_ROUTE_WITH_U_TURN"])
        {
          uint64_t v21 = 25;
        }
        else if ([v20 isEqualToString:@"U_TURN_AT_ROUNDABOUT"])
        {
          uint64_t v21 = 26;
        }
        else if ([v20 isEqualToString:@"LEFT_TURN_AT_END"])
        {
          uint64_t v21 = 27;
        }
        else if ([v20 isEqualToString:@"RIGHT_TURN_AT_END"])
        {
          uint64_t v21 = 28;
        }
        else if ([v20 isEqualToString:@"HIGHWAY_OFF_RAMP_LEFT"])
        {
          uint64_t v21 = 29;
        }
        else if ([v20 isEqualToString:@"HIGHWAY_OFF_RAMP_RIGHT"])
        {
          uint64_t v21 = 30;
        }
        else if ([v20 isEqualToString:@"ARRIVE_AT_DESTINATION_LEFT"])
        {
          uint64_t v21 = 33;
        }
        else if ([v20 isEqualToString:@"ARRIVE_AT_DESTINATION_RIGHT"])
        {
          uint64_t v21 = 34;
        }
        else if ([v20 isEqualToString:@"U_TURN_WHEN_POSSIBLE"])
        {
          uint64_t v21 = 35;
        }
        else if ([v20 isEqualToString:@"ARRIVE_END_OF_DIRECTIONS"])
        {
          uint64_t v21 = 39;
        }
        else if ([v20 isEqualToString:@"ROUNDABOUT_EXIT_1"])
        {
          uint64_t v21 = 41;
        }
        else if ([v20 isEqualToString:@"ROUNDABOUT_EXIT_2"])
        {
          uint64_t v21 = 42;
        }
        else if ([v20 isEqualToString:@"ROUNDABOUT_EXIT_3"])
        {
          uint64_t v21 = 43;
        }
        else if ([v20 isEqualToString:@"ROUNDABOUT_EXIT_4"])
        {
          uint64_t v21 = 44;
        }
        else if ([v20 isEqualToString:@"ROUNDABOUT_EXIT_5"])
        {
          uint64_t v21 = 45;
        }
        else if ([v20 isEqualToString:@"ROUNDABOUT_EXIT_6"])
        {
          uint64_t v21 = 46;
        }
        else if ([v20 isEqualToString:@"ROUNDABOUT_EXIT_7"])
        {
          uint64_t v21 = 47;
        }
        else if ([v20 isEqualToString:@"ROUNDABOUT_EXIT_8"])
        {
          uint64_t v21 = 48;
        }
        else if ([v20 isEqualToString:@"ROUNDABOUT_EXIT_9"])
        {
          uint64_t v21 = 49;
        }
        else if ([v20 isEqualToString:@"ROUNDABOUT_EXIT_10"])
        {
          uint64_t v21 = 50;
        }
        else if ([v20 isEqualToString:@"ROUNDABOUT_EXIT_11"])
        {
          uint64_t v21 = 51;
        }
        else if ([v20 isEqualToString:@"ROUNDABOUT_EXIT_12"])
        {
          uint64_t v21 = 52;
        }
        else if ([v20 isEqualToString:@"ROUNDABOUT_EXIT_13"])
        {
          uint64_t v21 = 53;
        }
        else if ([v20 isEqualToString:@"ROUNDABOUT_EXIT_14"])
        {
          uint64_t v21 = 54;
        }
        else if ([v20 isEqualToString:@"ROUNDABOUT_EXIT_15"])
        {
          uint64_t v21 = 55;
        }
        else if ([v20 isEqualToString:@"ROUNDABOUT_EXIT_16"])
        {
          uint64_t v21 = 56;
        }
        else if ([v20 isEqualToString:@"ROUNDABOUT_EXIT_17"])
        {
          uint64_t v21 = 57;
        }
        else if ([v20 isEqualToString:@"ROUNDABOUT_EXIT_18"])
        {
          uint64_t v21 = 58;
        }
        else if ([v20 isEqualToString:@"ROUNDABOUT_EXIT_19"])
        {
          uint64_t v21 = 59;
        }
        else if ([v20 isEqualToString:@"SHARP_LEFT_TURN"])
        {
          uint64_t v21 = 60;
        }
        else if ([v20 isEqualToString:@"SHARP_RIGHT_TURN"])
        {
          uint64_t v21 = 61;
        }
        else if ([v20 isEqualToString:@"SLIGHT_LEFT_TURN"])
        {
          uint64_t v21 = 62;
        }
        else if ([v20 isEqualToString:@"SLIGHT_RIGHT_TURN"])
        {
          uint64_t v21 = 63;
        }
        else if ([v20 isEqualToString:@"CHANGE_HIGHWAY"])
        {
          uint64_t v21 = 64;
        }
        else if ([v20 isEqualToString:@"CHANGE_HIGHWAY_LEFT"])
        {
          uint64_t v21 = 65;
        }
        else if ([v20 isEqualToString:@"CHANGE_HIGHWAY_RIGHT"])
        {
          uint64_t v21 = 66;
        }
        else if ([v20 isEqualToString:@"TOLL_STATION"])
        {
          uint64_t v21 = 80;
        }
        else if ([v20 isEqualToString:@"ENTER_TUNNEL"])
        {
          uint64_t v21 = 81;
        }
        else if ([v20 isEqualToString:@"WAYPOINT_STOP"])
        {
          uint64_t v21 = 82;
        }
        else if ([v20 isEqualToString:@"WAYPOINT_STOP_LEFT"])
        {
          uint64_t v21 = 83;
        }
        else if ([v20 isEqualToString:@"WAYPOINT_STOP_RIGHT"])
        {
          uint64_t v21 = 84;
        }
        else if ([v20 isEqualToString:@"RESUME_ROUTE"])
        {
          uint64_t v21 = 85;
        }
        else if ([v20 isEqualToString:@"RESUME_ROUTE_WITH_U_TURN"])
        {
          uint64_t v21 = 86;
        }
        else if ([v20 isEqualToString:@"CUSTOM"])
        {
          uint64_t v21 = 87;
        }
        else if ([v20 isEqualToString:@"TURN_AROUND"])
        {
          uint64_t v21 = 88;
        }
        else
        {
          uint64_t v21 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_163;
        }
        uint64_t v21 = [v19 intValue];
      }
      [a1 setManeuverType:v21];
LABEL_163:

      if (a3) {
        v22 = @"drivingSide";
      }
      else {
        v22 = @"driving_side";
      }
      id v23 = [v5 objectForKeyedSubscript:v22];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v24 = v23;
        if ([v24 isEqualToString:@"RIGHT_SIDE"]) {
          uint64_t v25 = 0;
        }
        else {
          uint64_t v25 = [v24 isEqualToString:@"LEFT_SIDE"];
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_174:

          goto LABEL_175;
        }
        uint64_t v25 = [v23 intValue];
      }
      [a1 setDrivingSide:v25];
      goto LABEL_174;
    }
  }
LABEL_175:

  return a1;
}

- (GEOJunctionInfo)initWithJSON:(id)a3
{
  return (GEOJunctionInfo *)-[GEOJunctionInfo _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOJunctionInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOJunctionInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_junctionElementsCount)
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      PBDataWriterPlaceMark();
      GEOJunctionElementWriteTo((uint64_t)&self->_junctionElements[v5]);
      PBDataWriterRecallMark();
      ++v6;
      ++v5;
    }
    while (v6 < self->_junctionElementsCount);
  }
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_6;
    }
LABEL_10:
    PBDataWriterWriteInt32Field();
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  char flags = (char)self->_flags;
  if ((flags & 4) != 0) {
    goto LABEL_10;
  }
LABEL_6:
  if (flags) {
LABEL_7:
  }
    PBDataWriterWriteInt32Field();
LABEL_8:
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v10 = a3;
  [(GEOJunctionInfo *)self readAll:0];
  if ([(GEOJunctionInfo *)self junctionElementsCount])
  {
    [v10 clearJunctionElements];
    unint64_t v4 = [(GEOJunctionInfo *)self junctionElementsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOJunctionInfo *)self junctionElementAtIndex:i];
        objc_msgSend(v10, "addJunctionElement:", v7, v8);
      }
    }
  }
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v10 + 11) = self->_junctionType;
    *((unsigned char *)v10 + 52) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_7:
      if ((flags & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v10 + 12) = self->_maneuverType;
  *((unsigned char *)v10 + 52) |= 4u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_8:
    *((_DWORD *)v10 + 10) = self->_drivingSide;
    *((unsigned char *)v10 + 52) |= 1u;
  }
LABEL_9:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  unint64_t junctionElementsCount = self->_junctionElementsCount;
  if (junctionElementsCount)
  {
    -[GEOJunctionInfo _reserveJunctionElements:](v4, junctionElementsCount);
    memcpy(*(void **)(v5 + 16), self->_junctionElements, 16 * self->_junctionElementsCount);
    *(void *)(v5 + 24) = self->_junctionElementsCount;
  }
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_5;
    }
LABEL_9:
    *(_DWORD *)(v5 + 48) = self->_maneuverType;
    *(unsigned char *)(v5 + 52) |= 4u;
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  *(_DWORD *)(v5 + 44) = self->_junctionType;
  *(unsigned char *)(v5 + 52) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0) {
    goto LABEL_9;
  }
LABEL_5:
  if (flags)
  {
LABEL_6:
    *(_DWORD *)(v5 + 40) = self->_drivingSide;
    *(unsigned char *)(v5 + 52) |= 1u;
  }
LABEL_7:
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (const void **)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_4;
  }
  [(GEOJunctionInfo *)self readAll:1];
  [v4 readAll:1];
  unint64_t junctionElementsCount = self->_junctionElementsCount;
  if ((const void *)junctionElementsCount != v4[3]
    || memcmp(self->_junctionElements, v4[2], 16 * junctionElementsCount))
  {
    goto LABEL_4;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0 || self->_junctionType != *((_DWORD *)v4 + 11)) {
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
    goto LABEL_4;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 4) == 0 || self->_maneuverType != *((_DWORD *)v4 + 12)) {
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 4) != 0)
  {
    goto LABEL_4;
  }
  BOOL v6 = (*((unsigned char *)v4 + 52) & 1) == 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
  if ((*((unsigned char *)v4 + 52) & 1) != 0 && self->_drivingSide == *((_DWORD *)v4 + 10))
  {
    BOOL v6 = 1;
    goto LABEL_5;
  }
LABEL_4:
  BOOL v6 = 0;
LABEL_5:

  return v6;
}

- (unint64_t)hash
{
  [(GEOJunctionInfo *)self readAll:1];
  uint64_t v3 = PBHashBytes();
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v4 = 2654435761 * self->_junctionType;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_maneuverType;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_drivingSide;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v10 = (int *)a3;
  [v10 readAll:0];
  uint64_t v4 = [v10 junctionElementsCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
    {
      uint64_t v7 = [v10 junctionElementAtIndex:i];
      -[GEOJunctionInfo addJunctionElement:](self, "addJunctionElement:", v7, v8);
    }
  }
  char v9 = *((unsigned char *)v10 + 52);
  if ((v9 & 2) != 0)
  {
    self->_junctionType = v10[11];
    *(unsigned char *)&self->_flags |= 2u;
    char v9 = *((unsigned char *)v10 + 52);
    if ((v9 & 4) == 0)
    {
LABEL_6:
      if ((v9 & 1) == 0) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  else if ((v10[13] & 4) == 0)
  {
    goto LABEL_6;
  }
  self->_maneuverType = v10[12];
  *(unsigned char *)&self->_flags |= 4u;
  if (v10[13])
  {
LABEL_7:
    self->_drivingSide = v10[10];
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_8:
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOJunctionInfo *)self readAll:0];
  }
}

- (void).cxx_destruct
{
}

@end