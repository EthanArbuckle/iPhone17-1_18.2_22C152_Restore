@interface GEOManeuverData
+ (BOOL)isValid:(id)a3;
- (BOOL)hasJunctionInfo;
- (BOOL)hasManeuverType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOJunctionInfo)junctionInfo;
- (GEOManeuverData)initWithDictionary:(id)a3;
- (GEOManeuverData)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)maneuverTypeAsString:(int)a3;
- (int)StringAsManeuverType:(id)a3;
- (int)maneuverType;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasManeuverType:(BOOL)a3;
- (void)setJunctionInfo:(id)a3;
- (void)setManeuverType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOManeuverData

- (int)maneuverType
{
  if (*(unsigned char *)&self->_flags) {
    return self->_maneuverType;
  }
  else {
    return 0;
  }
}

- (void)setManeuverType:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_maneuverType = a3;
}

- (void)setHasManeuverType:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasManeuverType
{
  return *(unsigned char *)&self->_flags & 1;
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

- (BOOL)hasJunctionInfo
{
  return self->_junctionInfo != 0;
}

- (GEOJunctionInfo)junctionInfo
{
  return self->_junctionInfo;
}

- (void)setJunctionInfo:(id)a3
{
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOManeuverData;
  int v4 = [(GEOManeuverData *)&v8 description];
  v5 = [(GEOManeuverData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOManeuverData _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 28))
    {
      v5 = @"NO_TURN";
      switch(*(_DWORD *)(a1 + 24))
      {
        case 0:
          break;
        case 1:
          v5 = @"LEFT_TURN";
          break;
        case 2:
          v5 = @"RIGHT_TURN";
          break;
        case 3:
          v5 = @"STRAIGHT_AHEAD";
          break;
        case 4:
          v5 = @"U_TURN";
          break;
        case 5:
          v5 = @"FOLLOW_ROAD";
          break;
        case 6:
          v5 = @"ENTER_ROUNDABOUT";
          break;
        case 7:
          v5 = @"EXIT_ROUNDABOUT";
          break;
        case 0xB:
          v5 = @"OFF_RAMP";
          break;
        case 0xC:
          v5 = @"ON_RAMP";
          break;
        case 0x10:
          v5 = @"ARRIVE_END_OF_NAVIGATION";
          break;
        case 0x11:
          v5 = @"START_ROUTE";
          break;
        case 0x12:
          v5 = @"ARRIVE_AT_DESTINATION";
          break;
        case 0x14:
          v5 = @"KEEP_LEFT";
          break;
        case 0x15:
          v5 = @"KEEP_RIGHT";
          break;
        case 0x16:
          v5 = @"ENTER_FERRY";
          break;
        case 0x17:
          v5 = @"EXIT_FERRY";
          break;
        case 0x18:
          v5 = @"CHANGE_FERRY";
          break;
        case 0x19:
          v5 = @"START_ROUTE_WITH_U_TURN";
          break;
        case 0x1A:
          v5 = @"U_TURN_AT_ROUNDABOUT";
          break;
        case 0x1B:
          v5 = @"LEFT_TURN_AT_END";
          break;
        case 0x1C:
          v5 = @"RIGHT_TURN_AT_END";
          break;
        case 0x1D:
          v5 = @"HIGHWAY_OFF_RAMP_LEFT";
          break;
        case 0x1E:
          v5 = @"HIGHWAY_OFF_RAMP_RIGHT";
          break;
        case 0x21:
          v5 = @"ARRIVE_AT_DESTINATION_LEFT";
          break;
        case 0x22:
          v5 = @"ARRIVE_AT_DESTINATION_RIGHT";
          break;
        case 0x23:
          v5 = @"U_TURN_WHEN_POSSIBLE";
          break;
        case 0x27:
          v5 = @"ARRIVE_END_OF_DIRECTIONS";
          break;
        case 0x29:
          v5 = @"ROUNDABOUT_EXIT_1";
          break;
        case 0x2A:
          v5 = @"ROUNDABOUT_EXIT_2";
          break;
        case 0x2B:
          v5 = @"ROUNDABOUT_EXIT_3";
          break;
        case 0x2C:
          v5 = @"ROUNDABOUT_EXIT_4";
          break;
        case 0x2D:
          v5 = @"ROUNDABOUT_EXIT_5";
          break;
        case 0x2E:
          v5 = @"ROUNDABOUT_EXIT_6";
          break;
        case 0x2F:
          v5 = @"ROUNDABOUT_EXIT_7";
          break;
        case 0x30:
          v5 = @"ROUNDABOUT_EXIT_8";
          break;
        case 0x31:
          v5 = @"ROUNDABOUT_EXIT_9";
          break;
        case 0x32:
          v5 = @"ROUNDABOUT_EXIT_10";
          break;
        case 0x33:
          v5 = @"ROUNDABOUT_EXIT_11";
          break;
        case 0x34:
          v5 = @"ROUNDABOUT_EXIT_12";
          break;
        case 0x35:
          v5 = @"ROUNDABOUT_EXIT_13";
          break;
        case 0x36:
          v5 = @"ROUNDABOUT_EXIT_14";
          break;
        case 0x37:
          v5 = @"ROUNDABOUT_EXIT_15";
          break;
        case 0x38:
          v5 = @"ROUNDABOUT_EXIT_16";
          break;
        case 0x39:
          v5 = @"ROUNDABOUT_EXIT_17";
          break;
        case 0x3A:
          v5 = @"ROUNDABOUT_EXIT_18";
          break;
        case 0x3B:
          v5 = @"ROUNDABOUT_EXIT_19";
          break;
        case 0x3C:
          v5 = @"SHARP_LEFT_TURN";
          break;
        case 0x3D:
          v5 = @"SHARP_RIGHT_TURN";
          break;
        case 0x3E:
          v5 = @"SLIGHT_LEFT_TURN";
          break;
        case 0x3F:
          v5 = @"SLIGHT_RIGHT_TURN";
          break;
        case 0x40:
          v5 = @"CHANGE_HIGHWAY";
          break;
        case 0x41:
          v5 = @"CHANGE_HIGHWAY_LEFT";
          break;
        case 0x42:
          v5 = @"CHANGE_HIGHWAY_RIGHT";
          break;
        case 0x50:
          v5 = @"TOLL_STATION";
          break;
        case 0x51:
          v5 = @"ENTER_TUNNEL";
          break;
        case 0x52:
          v5 = @"WAYPOINT_STOP";
          break;
        case 0x53:
          v5 = @"WAYPOINT_STOP_LEFT";
          break;
        case 0x54:
          v5 = @"WAYPOINT_STOP_RIGHT";
          break;
        case 0x55:
          v5 = @"RESUME_ROUTE";
          break;
        case 0x56:
          v5 = @"RESUME_ROUTE_WITH_U_TURN";
          break;
        case 0x57:
          v5 = @"CUSTOM";
          break;
        case 0x58:
          v5 = @"TURN_AROUND";
          break;
        default:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 24));
          v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
      }
      if (a2) {
        v6 = @"maneuverType";
      }
      else {
        v6 = @"maneuver_type";
      }
      [v4 setObject:v5 forKey:v6];
    }
    v7 = [(id)a1 junctionInfo];
    objc_super v8 = v7;
    if (v7)
    {
      if (a2)
      {
        v9 = [v7 jsonRepresentation];
        v10 = @"junctionInfo";
      }
      else
      {
        v9 = [v7 dictionaryRepresentation];
        v10 = @"junction_info";
      }
      [v4 setObject:v9 forKey:v10];
    }
    v11 = *(void **)(a1 + 8);
    if (v11)
    {
      v12 = [v11 dictionaryRepresentation];
      v13 = v12;
      if (a2)
      {
        v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __45__GEOManeuverData__dictionaryRepresentation___block_invoke;
        v18[3] = &unk_1E53D8860;
        id v15 = v14;
        id v19 = v15;
        [v13 enumerateKeysAndObjectsUsingBlock:v18];
        id v16 = v15;

        v13 = v16;
      }
      [v4 setObject:v13 forKey:@"Unknown Fields"];
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
  return -[GEOManeuverData _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __45__GEOManeuverData__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOManeuverData)initWithDictionary:(id)a3
{
  return (GEOManeuverData *)-[GEOManeuverData _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_147;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_147;
  }
  if (a3) {
    v6 = @"maneuverType";
  }
  else {
    v6 = @"maneuver_type";
  }
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"NO_TURN"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"LEFT_TURN"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"RIGHT_TURN"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"STRAIGHT_AHEAD"])
    {
      uint64_t v9 = 3;
    }
    else if ([v8 isEqualToString:@"U_TURN"])
    {
      uint64_t v9 = 4;
    }
    else if ([v8 isEqualToString:@"FOLLOW_ROAD"])
    {
      uint64_t v9 = 5;
    }
    else if ([v8 isEqualToString:@"ENTER_ROUNDABOUT"])
    {
      uint64_t v9 = 6;
    }
    else if ([v8 isEqualToString:@"EXIT_ROUNDABOUT"])
    {
      uint64_t v9 = 7;
    }
    else if ([v8 isEqualToString:@"OFF_RAMP"])
    {
      uint64_t v9 = 11;
    }
    else if ([v8 isEqualToString:@"ON_RAMP"])
    {
      uint64_t v9 = 12;
    }
    else if ([v8 isEqualToString:@"ARRIVE_END_OF_NAVIGATION"])
    {
      uint64_t v9 = 16;
    }
    else if ([v8 isEqualToString:@"START_ROUTE"])
    {
      uint64_t v9 = 17;
    }
    else if ([v8 isEqualToString:@"ARRIVE_AT_DESTINATION"])
    {
      uint64_t v9 = 18;
    }
    else if ([v8 isEqualToString:@"KEEP_LEFT"])
    {
      uint64_t v9 = 20;
    }
    else if ([v8 isEqualToString:@"KEEP_RIGHT"])
    {
      uint64_t v9 = 21;
    }
    else if ([v8 isEqualToString:@"ENTER_FERRY"])
    {
      uint64_t v9 = 22;
    }
    else if ([v8 isEqualToString:@"EXIT_FERRY"])
    {
      uint64_t v9 = 23;
    }
    else if ([v8 isEqualToString:@"CHANGE_FERRY"])
    {
      uint64_t v9 = 24;
    }
    else if ([v8 isEqualToString:@"START_ROUTE_WITH_U_TURN"])
    {
      uint64_t v9 = 25;
    }
    else if ([v8 isEqualToString:@"U_TURN_AT_ROUNDABOUT"])
    {
      uint64_t v9 = 26;
    }
    else if ([v8 isEqualToString:@"LEFT_TURN_AT_END"])
    {
      uint64_t v9 = 27;
    }
    else if ([v8 isEqualToString:@"RIGHT_TURN_AT_END"])
    {
      uint64_t v9 = 28;
    }
    else if ([v8 isEqualToString:@"HIGHWAY_OFF_RAMP_LEFT"])
    {
      uint64_t v9 = 29;
    }
    else if ([v8 isEqualToString:@"HIGHWAY_OFF_RAMP_RIGHT"])
    {
      uint64_t v9 = 30;
    }
    else if ([v8 isEqualToString:@"ARRIVE_AT_DESTINATION_LEFT"])
    {
      uint64_t v9 = 33;
    }
    else if ([v8 isEqualToString:@"ARRIVE_AT_DESTINATION_RIGHT"])
    {
      uint64_t v9 = 34;
    }
    else if ([v8 isEqualToString:@"U_TURN_WHEN_POSSIBLE"])
    {
      uint64_t v9 = 35;
    }
    else if ([v8 isEqualToString:@"ARRIVE_END_OF_DIRECTIONS"])
    {
      uint64_t v9 = 39;
    }
    else if ([v8 isEqualToString:@"ROUNDABOUT_EXIT_1"])
    {
      uint64_t v9 = 41;
    }
    else if ([v8 isEqualToString:@"ROUNDABOUT_EXIT_2"])
    {
      uint64_t v9 = 42;
    }
    else if ([v8 isEqualToString:@"ROUNDABOUT_EXIT_3"])
    {
      uint64_t v9 = 43;
    }
    else if ([v8 isEqualToString:@"ROUNDABOUT_EXIT_4"])
    {
      uint64_t v9 = 44;
    }
    else if ([v8 isEqualToString:@"ROUNDABOUT_EXIT_5"])
    {
      uint64_t v9 = 45;
    }
    else if ([v8 isEqualToString:@"ROUNDABOUT_EXIT_6"])
    {
      uint64_t v9 = 46;
    }
    else if ([v8 isEqualToString:@"ROUNDABOUT_EXIT_7"])
    {
      uint64_t v9 = 47;
    }
    else if ([v8 isEqualToString:@"ROUNDABOUT_EXIT_8"])
    {
      uint64_t v9 = 48;
    }
    else if ([v8 isEqualToString:@"ROUNDABOUT_EXIT_9"])
    {
      uint64_t v9 = 49;
    }
    else if ([v8 isEqualToString:@"ROUNDABOUT_EXIT_10"])
    {
      uint64_t v9 = 50;
    }
    else if ([v8 isEqualToString:@"ROUNDABOUT_EXIT_11"])
    {
      uint64_t v9 = 51;
    }
    else if ([v8 isEqualToString:@"ROUNDABOUT_EXIT_12"])
    {
      uint64_t v9 = 52;
    }
    else if ([v8 isEqualToString:@"ROUNDABOUT_EXIT_13"])
    {
      uint64_t v9 = 53;
    }
    else if ([v8 isEqualToString:@"ROUNDABOUT_EXIT_14"])
    {
      uint64_t v9 = 54;
    }
    else if ([v8 isEqualToString:@"ROUNDABOUT_EXIT_15"])
    {
      uint64_t v9 = 55;
    }
    else if ([v8 isEqualToString:@"ROUNDABOUT_EXIT_16"])
    {
      uint64_t v9 = 56;
    }
    else if ([v8 isEqualToString:@"ROUNDABOUT_EXIT_17"])
    {
      uint64_t v9 = 57;
    }
    else if ([v8 isEqualToString:@"ROUNDABOUT_EXIT_18"])
    {
      uint64_t v9 = 58;
    }
    else if ([v8 isEqualToString:@"ROUNDABOUT_EXIT_19"])
    {
      uint64_t v9 = 59;
    }
    else if ([v8 isEqualToString:@"SHARP_LEFT_TURN"])
    {
      uint64_t v9 = 60;
    }
    else if ([v8 isEqualToString:@"SHARP_RIGHT_TURN"])
    {
      uint64_t v9 = 61;
    }
    else if ([v8 isEqualToString:@"SLIGHT_LEFT_TURN"])
    {
      uint64_t v9 = 62;
    }
    else if ([v8 isEqualToString:@"SLIGHT_RIGHT_TURN"])
    {
      uint64_t v9 = 63;
    }
    else if ([v8 isEqualToString:@"CHANGE_HIGHWAY"])
    {
      uint64_t v9 = 64;
    }
    else if ([v8 isEqualToString:@"CHANGE_HIGHWAY_LEFT"])
    {
      uint64_t v9 = 65;
    }
    else if ([v8 isEqualToString:@"CHANGE_HIGHWAY_RIGHT"])
    {
      uint64_t v9 = 66;
    }
    else if ([v8 isEqualToString:@"TOLL_STATION"])
    {
      uint64_t v9 = 80;
    }
    else if ([v8 isEqualToString:@"ENTER_TUNNEL"])
    {
      uint64_t v9 = 81;
    }
    else if ([v8 isEqualToString:@"WAYPOINT_STOP"])
    {
      uint64_t v9 = 82;
    }
    else if ([v8 isEqualToString:@"WAYPOINT_STOP_LEFT"])
    {
      uint64_t v9 = 83;
    }
    else if ([v8 isEqualToString:@"WAYPOINT_STOP_RIGHT"])
    {
      uint64_t v9 = 84;
    }
    else if ([v8 isEqualToString:@"RESUME_ROUTE"])
    {
      uint64_t v9 = 85;
    }
    else if ([v8 isEqualToString:@"RESUME_ROUTE_WITH_U_TURN"])
    {
      uint64_t v9 = 86;
    }
    else if ([v8 isEqualToString:@"CUSTOM"])
    {
      uint64_t v9 = 87;
    }
    else if ([v8 isEqualToString:@"TURN_AROUND"])
    {
      uint64_t v9 = 88;
    }
    else
    {
      uint64_t v9 = 0;
    }

    goto LABEL_137;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_137:
    [a1 setManeuverType:v9];
  }

  if (a3) {
    id v10 = @"junctionInfo";
  }
  else {
    id v10 = @"junction_info";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = [GEOJunctionInfo alloc];
    if (a3) {
      uint64_t v13 = [(GEOJunctionInfo *)v12 initWithJSON:v11];
    }
    else {
      uint64_t v13 = [(GEOJunctionInfo *)v12 initWithDictionary:v11];
    }
    v14 = (void *)v13;
    [a1 setJunctionInfo:v13];
  }
LABEL_147:

  return a1;
}

- (GEOManeuverData)initWithJSON:(id)a3
{
  return (GEOManeuverData *)-[GEOManeuverData _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOManeuverDataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOManeuverDataReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_junctionInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOManeuverData *)self readAll:0];
  id v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v5 + 6) = self->_maneuverType;
    *((unsigned char *)v5 + 28) |= 1u;
  }
  if (self->_junctionInfo)
  {
    objc_msgSend(v5, "setJunctionInfo:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 24) = self->_maneuverType;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  id v7 = [(GEOJunctionInfo *)self->_junctionInfo copyWithZone:a3];
  id v8 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v7;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  [(GEOManeuverData *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_maneuverType != *((_DWORD *)v4 + 6)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  junctionInfo = self->_junctionInfo;
  if ((unint64_t)junctionInfo | *((void *)v4 + 2)) {
    char v6 = -[GEOJunctionInfo isEqual:](junctionInfo, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  [(GEOManeuverData *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_maneuverType;
  }
  else {
    uint64_t v3 = 0;
  }
  return [(GEOJunctionInfo *)self->_junctionInfo hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v7 = (int *)a3;
  [v7 readAll:0];
  id v4 = v7;
  if (v7[7])
  {
    self->_maneuverType = v7[6];
    *(unsigned char *)&self->_flags |= 1u;
  }
  junctionInfo = self->_junctionInfo;
  uint64_t v6 = *((void *)v7 + 2);
  if (junctionInfo)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOJunctionInfo mergeFrom:](junctionInfo, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOManeuverData setJunctionInfo:](self, "setJunctionInfo:");
  }
  id v4 = v7;
LABEL_9:
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
    [(GEOManeuverData *)self readAll:0];
    junctionInfo = self->_junctionInfo;
    [(GEOJunctionInfo *)junctionInfo clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_junctionInfo, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end