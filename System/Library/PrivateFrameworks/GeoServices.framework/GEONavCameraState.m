@interface GEONavCameraState
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDistanceToManeuver;
- (BOOL)hasIsGroupedManeuver;
- (BOOL)hasSpeedBucket;
- (BOOL)hasUpcomingManeuverType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGroupedManeuver;
- (BOOL)readFrom:(id)a3;
- (GEONavCameraState)initWithDictionary:(id)a3;
- (GEONavCameraState)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)distanceToManeuverAsString:(int)a3;
- (id)jsonRepresentation;
- (id)speedBucketAsString:(int)a3;
- (id)upcomingManeuverTypeAsString:(int)a3;
- (int)StringAsDistanceToManeuver:(id)a3;
- (int)StringAsSpeedBucket:(id)a3;
- (int)StringAsUpcomingManeuverType:(id)a3;
- (int)distanceToManeuver;
- (int)speedBucket;
- (int)upcomingManeuverType;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDistanceToManeuver:(int)a3;
- (void)setHasDistanceToManeuver:(BOOL)a3;
- (void)setHasIsGroupedManeuver:(BOOL)a3;
- (void)setHasSpeedBucket:(BOOL)a3;
- (void)setHasUpcomingManeuverType:(BOOL)a3;
- (void)setIsGroupedManeuver:(BOOL)a3;
- (void)setSpeedBucket:(int)a3;
- (void)setUpcomingManeuverType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEONavCameraState

- (int)upcomingManeuverType
{
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    return self->_upcomingManeuverType;
  }
  else {
    return 0;
  }
}

- (void)setUpcomingManeuverType:(int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_upcomingManeuverType = a3;
}

- (void)setHasUpcomingManeuverType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasUpcomingManeuverType
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)upcomingManeuverTypeAsString:(int)a3
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

- (int)StringAsUpcomingManeuverType:(id)a3
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

- (int)distanceToManeuver
{
  if (*(unsigned char *)&self->_flags) {
    return self->_distanceToManeuver;
  }
  else {
    return 0;
  }
}

- (void)setDistanceToManeuver:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_distanceToManeuver = a3;
}

- (void)setHasDistanceToManeuver:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasDistanceToManeuver
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)distanceToManeuverAsString:(int)a3
{
  if (a3 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53F8570[a3];
  }

  return v3;
}

- (int)StringAsDistanceToManeuver:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_DISTANCE_TO_MANEUVER"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"IMMEDIATE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EXTREMELY_NEAR"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"VERY_NEAR"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"NEAR"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"MEDIUM"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FAR"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"VERY_FAR"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"EXTREMELY_FAR"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)isGroupedManeuver
{
  return self->_isGroupedManeuver;
}

- (void)setIsGroupedManeuver:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_isGroupedManeuver = a3;
}

- (void)setHasIsGroupedManeuver:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasIsGroupedManeuver
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (int)speedBucket
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_speedBucket;
  }
  else {
    return 0;
  }
}

- (void)setSpeedBucket:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_speedBucket = a3;
}

- (void)setHasSpeedBucket:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasSpeedBucket
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)speedBucketAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F85B8[a3];
  }

  return v3;
}

- (int)StringAsSpeedBucket:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_SPEED_BUCKET"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"STILL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SLOW"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FAST"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEONavCameraState;
  int v4 = [(GEONavCameraState *)&v8 description];
  v5 = [(GEONavCameraState *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEONavCameraState _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_93;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 24);
  if ((v5 & 4) != 0)
  {
    v6 = @"NO_TURN";
    switch(*(_DWORD *)(a1 + 16))
    {
      case 0:
        break;
      case 1:
        v6 = @"LEFT_TURN";
        break;
      case 2:
        v6 = @"RIGHT_TURN";
        break;
      case 3:
        v6 = @"STRAIGHT_AHEAD";
        break;
      case 4:
        v6 = @"U_TURN";
        break;
      case 5:
        v6 = @"FOLLOW_ROAD";
        break;
      case 6:
        v6 = @"ENTER_ROUNDABOUT";
        break;
      case 7:
        v6 = @"EXIT_ROUNDABOUT";
        break;
      case 0xB:
        v6 = @"OFF_RAMP";
        break;
      case 0xC:
        v6 = @"ON_RAMP";
        break;
      case 0x10:
        v6 = @"ARRIVE_END_OF_NAVIGATION";
        break;
      case 0x11:
        v6 = @"START_ROUTE";
        break;
      case 0x12:
        v6 = @"ARRIVE_AT_DESTINATION";
        break;
      case 0x14:
        v6 = @"KEEP_LEFT";
        break;
      case 0x15:
        v6 = @"KEEP_RIGHT";
        break;
      case 0x16:
        v6 = @"ENTER_FERRY";
        break;
      case 0x17:
        v6 = @"EXIT_FERRY";
        break;
      case 0x18:
        v6 = @"CHANGE_FERRY";
        break;
      case 0x19:
        v6 = @"START_ROUTE_WITH_U_TURN";
        break;
      case 0x1A:
        v6 = @"U_TURN_AT_ROUNDABOUT";
        break;
      case 0x1B:
        v6 = @"LEFT_TURN_AT_END";
        break;
      case 0x1C:
        v6 = @"RIGHT_TURN_AT_END";
        break;
      case 0x1D:
        v6 = @"HIGHWAY_OFF_RAMP_LEFT";
        break;
      case 0x1E:
        v6 = @"HIGHWAY_OFF_RAMP_RIGHT";
        break;
      case 0x21:
        v6 = @"ARRIVE_AT_DESTINATION_LEFT";
        break;
      case 0x22:
        v6 = @"ARRIVE_AT_DESTINATION_RIGHT";
        break;
      case 0x23:
        v6 = @"U_TURN_WHEN_POSSIBLE";
        break;
      case 0x27:
        v6 = @"ARRIVE_END_OF_DIRECTIONS";
        break;
      case 0x29:
        v6 = @"ROUNDABOUT_EXIT_1";
        break;
      case 0x2A:
        v6 = @"ROUNDABOUT_EXIT_2";
        break;
      case 0x2B:
        v6 = @"ROUNDABOUT_EXIT_3";
        break;
      case 0x2C:
        v6 = @"ROUNDABOUT_EXIT_4";
        break;
      case 0x2D:
        v6 = @"ROUNDABOUT_EXIT_5";
        break;
      case 0x2E:
        v6 = @"ROUNDABOUT_EXIT_6";
        break;
      case 0x2F:
        v6 = @"ROUNDABOUT_EXIT_7";
        break;
      case 0x30:
        v6 = @"ROUNDABOUT_EXIT_8";
        break;
      case 0x31:
        v6 = @"ROUNDABOUT_EXIT_9";
        break;
      case 0x32:
        v6 = @"ROUNDABOUT_EXIT_10";
        break;
      case 0x33:
        v6 = @"ROUNDABOUT_EXIT_11";
        break;
      case 0x34:
        v6 = @"ROUNDABOUT_EXIT_12";
        break;
      case 0x35:
        v6 = @"ROUNDABOUT_EXIT_13";
        break;
      case 0x36:
        v6 = @"ROUNDABOUT_EXIT_14";
        break;
      case 0x37:
        v6 = @"ROUNDABOUT_EXIT_15";
        break;
      case 0x38:
        v6 = @"ROUNDABOUT_EXIT_16";
        break;
      case 0x39:
        v6 = @"ROUNDABOUT_EXIT_17";
        break;
      case 0x3A:
        v6 = @"ROUNDABOUT_EXIT_18";
        break;
      case 0x3B:
        v6 = @"ROUNDABOUT_EXIT_19";
        break;
      case 0x3C:
        v6 = @"SHARP_LEFT_TURN";
        break;
      case 0x3D:
        v6 = @"SHARP_RIGHT_TURN";
        break;
      case 0x3E:
        v6 = @"SLIGHT_LEFT_TURN";
        break;
      case 0x3F:
        v6 = @"SLIGHT_RIGHT_TURN";
        break;
      case 0x40:
        v6 = @"CHANGE_HIGHWAY";
        break;
      case 0x41:
        v6 = @"CHANGE_HIGHWAY_LEFT";
        break;
      case 0x42:
        v6 = @"CHANGE_HIGHWAY_RIGHT";
        break;
      case 0x50:
        v6 = @"TOLL_STATION";
        break;
      case 0x51:
        v6 = @"ENTER_TUNNEL";
        break;
      case 0x52:
        v6 = @"WAYPOINT_STOP";
        break;
      case 0x53:
        v6 = @"WAYPOINT_STOP_LEFT";
        break;
      case 0x54:
        v6 = @"WAYPOINT_STOP_RIGHT";
        break;
      case 0x55:
        v6 = @"RESUME_ROUTE";
        break;
      case 0x56:
        v6 = @"RESUME_ROUTE_WITH_U_TURN";
        break;
      case 0x57:
        v6 = @"CUSTOM";
        break;
      case 0x58:
        v6 = @"TURN_AROUND";
        break;
      default:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 16));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
    }
    if (a2) {
      v7 = @"upcomingManeuverType";
    }
    else {
      v7 = @"upcoming_maneuver_type";
    }
    [v4 setObject:v6 forKey:v7];

    char v5 = *(unsigned char *)(a1 + 24);
    if ((v5 & 1) == 0)
    {
LABEL_4:
      if ((v5 & 8) == 0) {
        goto LABEL_5;
      }
LABEL_82:
      v11 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 20)];
      if (a2) {
        v12 = @"isGroupedManeuver";
      }
      else {
        v12 = @"is_grouped_maneuver";
      }
      [v4 setObject:v11 forKey:v12];

      if ((*(unsigned char *)(a1 + 24) & 2) == 0) {
        goto LABEL_93;
      }
      goto LABEL_86;
    }
  }
  else if ((*(unsigned char *)(a1 + 24) & 1) == 0)
  {
    goto LABEL_4;
  }
  uint64_t v8 = *(int *)(a1 + 8);
  if (v8 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 8));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E53F8570[v8];
  }
  if (a2) {
    v10 = @"distanceToManeuver";
  }
  else {
    v10 = @"distance_to_maneuver";
  }
  [v4 setObject:v9 forKey:v10];

  char v5 = *(unsigned char *)(a1 + 24);
  if ((v5 & 8) != 0) {
    goto LABEL_82;
  }
LABEL_5:
  if ((v5 & 2) != 0)
  {
LABEL_86:
    uint64_t v13 = *(int *)(a1 + 12);
    if (v13 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 12));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_1E53F85B8[v13];
    }
    if (a2) {
      v15 = @"speedBucket";
    }
    else {
      v15 = @"speed_bucket";
    }
    [v4 setObject:v14 forKey:v15];
  }
LABEL_93:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEONavCameraState _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEONavCameraState)initWithDictionary:(id)a3
{
  return (GEONavCameraState *)-[GEONavCameraState _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"upcomingManeuverType";
      }
      else {
        v6 = @"upcoming_maneuver_type";
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
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_138;
        }
        uint64_t v9 = [v7 intValue];
      }
      [a1 setUpcomingManeuverType:v9];
LABEL_138:

      if (a3) {
        v10 = @"distanceToManeuver";
      }
      else {
        v10 = @"distance_to_maneuver";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = v11;
        if ([v12 isEqualToString:@"UNKNOWN_DISTANCE_TO_MANEUVER"])
        {
          uint64_t v13 = 0;
        }
        else if ([v12 isEqualToString:@"IMMEDIATE"])
        {
          uint64_t v13 = 1;
        }
        else if ([v12 isEqualToString:@"EXTREMELY_NEAR"])
        {
          uint64_t v13 = 2;
        }
        else if ([v12 isEqualToString:@"VERY_NEAR"])
        {
          uint64_t v13 = 3;
        }
        else if ([v12 isEqualToString:@"NEAR"])
        {
          uint64_t v13 = 4;
        }
        else if ([v12 isEqualToString:@"MEDIUM"])
        {
          uint64_t v13 = 5;
        }
        else if ([v12 isEqualToString:@"FAR"])
        {
          uint64_t v13 = 6;
        }
        else if ([v12 isEqualToString:@"VERY_FAR"])
        {
          uint64_t v13 = 7;
        }
        else if ([v12 isEqualToString:@"EXTREMELY_FAR"])
        {
          uint64_t v13 = 8;
        }
        else
        {
          uint64_t v13 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_165;
        }
        uint64_t v13 = [v11 intValue];
      }
      [a1 setDistanceToManeuver:v13];
LABEL_165:

      if (a3) {
        v14 = @"isGroupedManeuver";
      }
      else {
        v14 = @"is_grouped_maneuver";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsGroupedManeuver:", objc_msgSend(v15, "BOOLValue"));
      }

      if (a3) {
        v16 = @"speedBucket";
      }
      else {
        v16 = @"speed_bucket";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v18 = v17;
        if ([v18 isEqualToString:@"UNKNOWN_SPEED_BUCKET"])
        {
          uint64_t v19 = 0;
        }
        else if ([v18 isEqualToString:@"STILL"])
        {
          uint64_t v19 = 1;
        }
        else if ([v18 isEqualToString:@"SLOW"])
        {
          uint64_t v19 = 2;
        }
        else if ([v18 isEqualToString:@"FAST"])
        {
          uint64_t v19 = 3;
        }
        else
        {
          uint64_t v19 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_187:

          goto LABEL_188;
        }
        uint64_t v19 = [v17 intValue];
      }
      [a1 setSpeedBucket:v19];
      goto LABEL_187;
    }
  }
LABEL_188:

  return a1;
}

- (GEONavCameraState)initWithJSON:(id)a3
{
  return (GEONavCameraState *)-[GEONavCameraState _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEONavCameraStateIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEONavCameraStateReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
LABEL_5:
  }
    PBDataWriterWriteInt32Field();
LABEL_6:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEONavCameraState *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    v5[4] = self->_upcomingManeuverType;
    *((unsigned char *)v5 + 24) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  v5[2] = self->_distanceToManeuver;
  *((unsigned char *)v5 + 24) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  *((unsigned char *)v5 + 20) = self->_isGroupedManeuver;
  *((unsigned char *)v5 + 24) |= 8u;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
LABEL_5:
    v5[3] = self->_speedBucket;
    *((unsigned char *)v5 + 24) |= 2u;
  }
LABEL_6:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)result + 4) = self->_upcomingManeuverType;
    *((unsigned char *)result + 24) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 2) = self->_distanceToManeuver;
  *((unsigned char *)result + 24) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((unsigned char *)result + 20) = self->_isGroupedManeuver;
  *((unsigned char *)result + 24) |= 8u;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    return result;
  }
LABEL_5:
  *((_DWORD *)result + 3) = self->_speedBucket;
  *((unsigned char *)result + 24) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  [(GEONavCameraState *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 4) == 0 || self->_upcomingManeuverType != *((_DWORD *)v4 + 4)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 4) != 0)
  {
    goto LABEL_24;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_distanceToManeuver != *((_DWORD *)v4 + 2)) {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 8) != 0)
    {
      if (self->_isGroupedManeuver)
      {
        if (!*((unsigned char *)v4 + 20)) {
          goto LABEL_24;
        }
        goto LABEL_20;
      }
      if (!*((unsigned char *)v4 + 20)) {
        goto LABEL_20;
      }
    }
LABEL_24:
    BOOL v5 = 0;
    goto LABEL_25;
  }
  if ((*((unsigned char *)v4 + 24) & 8) != 0) {
    goto LABEL_24;
  }
LABEL_20:
  BOOL v5 = (*((unsigned char *)v4 + 24) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_speedBucket != *((_DWORD *)v4 + 3)) {
      goto LABEL_24;
    }
    BOOL v5 = 1;
  }
LABEL_25:

  return v5;
}

- (unint64_t)hash
{
  [(GEONavCameraState *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    uint64_t v3 = 2654435761 * self->_upcomingManeuverType;
    if (*(unsigned char *)&self->_flags)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_distanceToManeuver;
      if ((*(unsigned char *)&self->_flags & 8) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v5 = 0;
      if ((*(unsigned char *)&self->_flags & 2) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v6 = 0;
      return v4 ^ v3 ^ v5 ^ v6;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 8) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_isGroupedManeuver;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v6 = 2654435761 * self->_speedBucket;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 24);
  if ((v4 & 4) != 0)
  {
    self->_upcomingManeuverType = *((_DWORD *)v5 + 4);
    *(unsigned char *)&self->_flags |= 4u;
    char v4 = *((unsigned char *)v5 + 24);
    if ((v4 & 1) == 0)
    {
LABEL_3:
      if ((v4 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v5 + 24) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_distanceToManeuver = *((_DWORD *)v5 + 2);
  *(unsigned char *)&self->_flags |= 1u;
  char v4 = *((unsigned char *)v5 + 24);
  if ((v4 & 8) == 0)
  {
LABEL_4:
    if ((v4 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_isGroupedManeuver = *((unsigned char *)v5 + 20);
  *(unsigned char *)&self->_flags |= 8u;
  if ((*((unsigned char *)v5 + 24) & 2) != 0)
  {
LABEL_5:
    self->_speedBucket = *((_DWORD *)v5 + 3);
    *(unsigned char *)&self->_flags |= 2u;
  }
LABEL_6:
}

@end