@interface ATXAnchorModelPBAnchorMetadata
- (BOOL)hasAnchorEventIdentifier;
- (BOOL)hasAnchorEventType;
- (BOOL)hasAnchorType;
- (BOOL)hasDayOfMonth;
- (BOOL)hasDayOfWeek;
- (BOOL)hasHourOfDay;
- (BOOL)hasLocationIdentifier;
- (BOOL)hasLocationType;
- (BOOL)hasMonth;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)anchorEventIdentifier;
- (NSString)locationIdentifier;
- (id)anchorEventTypeAsString:(int)a3;
- (id)anchorTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dayOfWeekAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)locationTypeAsString:(int)a3;
- (int)StringAsAnchorEventType:(id)a3;
- (int)StringAsAnchorType:(id)a3;
- (int)StringAsDayOfWeek:(id)a3;
- (int)StringAsLocationType:(id)a3;
- (int)anchorEventType;
- (int)anchorType;
- (int)dayOfWeek;
- (int)locationType;
- (unint64_t)hash;
- (unsigned)dayOfMonth;
- (unsigned)hourOfDay;
- (unsigned)month;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAnchorEventIdentifier:(id)a3;
- (void)setAnchorEventType:(int)a3;
- (void)setAnchorType:(int)a3;
- (void)setDayOfMonth:(unsigned int)a3;
- (void)setDayOfWeek:(int)a3;
- (void)setHasAnchorEventType:(BOOL)a3;
- (void)setHasAnchorType:(BOOL)a3;
- (void)setHasDayOfMonth:(BOOL)a3;
- (void)setHasDayOfWeek:(BOOL)a3;
- (void)setHasHourOfDay:(BOOL)a3;
- (void)setHasLocationType:(BOOL)a3;
- (void)setHasMonth:(BOOL)a3;
- (void)setHourOfDay:(unsigned int)a3;
- (void)setLocationIdentifier:(id)a3;
- (void)setLocationType:(int)a3;
- (void)setMonth:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXAnchorModelPBAnchorMetadata

- (int)anchorType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_anchorType;
  }
  else {
    return 0;
  }
}

- (void)setAnchorType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_anchorType = a3;
}

- (void)setHasAnchorType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAnchorType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)anchorTypeAsString:(int)a3
{
  if (a3 >= 0x12)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E68B34D8[a3];
  }
  return v3;
}

- (int)StringAsAnchorType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ANCHOR_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ANCHOR_TYPE_BLUETOOTH_CONNECTED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ANCHOR_TYPE_BLUETOOTH_DISCONNECTED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ANCHOR_TYPE_IDLE_TIME_BEGIN"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ANCHOR_TYPE_IDLE_TIME_END"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ANCHOR_TYPE_CARPLAY_CONNECTED"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"ANCHOR_TYPE_CARPLAY_DISCONNECTED"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"ANCHOR_TYPE_LOI_ENTRANCE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"ANCHOR_TYPE_LOI_EXIT"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"ANCHOR_TYPE_WORKOUT_START"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"ANCHOR_TYPE_WORKOUT_END"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"ANCHOR_TYPE_HEADING_HOME"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"ANCHOR_TYPE_HEADING_TO_WORK"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"ANCHOR_TYPE_FIRST_CALENDAR_EVENT_OF_DAY"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"ANCHOR_TYPE_LAST_CALENDAR_EVENT_OF_DAY"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"ANCHOR_TYPE_UPCOMING_SEMANTIC_EVENT"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"ANCHOR_TYPE_WIRED_AUDIO_DEVICE_CONNECTED"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"ANCHOR_TYPE_WIRED_AUDIO_DEVICE_DISCONNECTED"])
  {
    int v4 = 17;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasAnchorEventIdentifier
{
  return self->_anchorEventIdentifier != 0;
}

- (int)anchorEventType
{
  if (*(unsigned char *)&self->_has) {
    return self->_anchorEventType;
  }
  else {
    return 0;
  }
}

- (void)setAnchorEventType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_anchorEventType = a3;
}

- (void)setHasAnchorEventType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAnchorEventType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)anchorEventTypeAsString:(int)a3
{
  if (a3 >= 0x21)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E68B3568[a3];
  }
  return v3;
}

- (int)StringAsAnchorEventType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ANCHOR_EVENT_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ANCHOR_EVENT_TYPE_BLUETOOTH_DEVICE_OTHER"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ANCHOR_EVENT_TYPE_BLUETOOTH_DEVICE_IMAGING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ANCHOR_EVENT_TYPE_BLUETOOTH_DEVICE_AUDIO"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ANCHOR_EVENT_TYPE_BLUETOOTH_DEVICE_VEHICLE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ANCHOR_EVENT_TYPE_LOI_UNKNOWN"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"ANCHOR_EVENT_TYPE_LOI_HOME"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"ANCHOR_EVENT_TYPE_LOI_WORK"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"ANCHOR_EVENT_TYPE_LOI_GYM"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"ANCHOR_EVENT_TYPE_CALENDAR_EVENT_IS_ORGANIZER"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"ANCHOR_EVENT_TYPE_CALENDAR_EVENT_IS_NOT_ORGANIZER"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"ANCHOR_EVENT_TYPE_UPCOMING_SEMANTIC_EVENT_FLIGHT"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"ANCHOR_EVENT_TYPE_UPCOMING_SEMANTIC_EVENT_BUS"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"ANCHOR_EVENT_TYPE_UPCOMING_SEMANTIC_EVENT_TRAIN"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"ANCHOR_EVENT_TYPE_UPCOMING_SEMANTIC_EVENT_HOTEL"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"ANCHOR_EVENT_TYPE_UPCOMING_SEMANTIC_EVENT_CAR"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"ANCHOR_EVENT_TYPE_UPCOMING_SEMANTIC_EVENT_TICKET"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"ANCHOR_EVENT_TYPE_UPCOMING_SEMANTIC_EVENT_MOVIE"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"ANCHOR_EVENT_TYPE_UPCOMING_SEMANTIC_EVENT_FOOD"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"ANCHOR_EVENT_TYPE_UPCOMING_SEMANTIC_EVENT_SOCIAL"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"ANCHOR_EVENT_TYPE_UPCOMING_SEMANTIC_EVENT_OTHER"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"ANCHOR_EVENT_TYPE_WORKOUT_WALKING"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"ANCHOR_EVENT_TYPE_WORKOUT_RUNNING"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"ANCHOR_EVENT_TYPE_WORKOUT_CYCLING"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"ANCHOR_EVENT_TYPE_WORKOUT_ELLIPTICAL"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"ANCHOR_EVENT_TYPE_WORKOUT_STEPPER"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"ANCHOR_EVENT_TYPE_WORKOUT_ROWING"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"ANCHOR_EVENT_TYPE_WORKOUT_WHEELCHAIR_WALK_PACE"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"ANCHOR_EVENT_TYPE_WORKOUT_WHEELCHAIR_RUN_PACE"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"ANCHOR_EVENT_TYPE_WORKOUT_HIIT"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"ANCHOR_EVENT_TYPE_WORKOUT_HIKING"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"ANCHOR_EVENT_TYPE_WORKOUT_YOGA"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"ANCHOR_EVENT_TYPE_WORKOUT_OTHER"])
  {
    int v4 = 32;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setMonth:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_month = a3;
}

- (void)setHasMonth:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasMonth
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setDayOfMonth:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_dayOfMonth = a3;
}

- (void)setHasDayOfMonth:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDayOfMonth
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHourOfDay:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_hourOfDay = a3;
}

- (void)setHasHourOfDay:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasHourOfDay
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (int)dayOfWeek
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_dayOfWeek;
  }
  else {
    return 0;
  }
}

- (void)setDayOfWeek:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_dayOfWeek = a3;
}

- (void)setHasDayOfWeek:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDayOfWeek
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)dayOfWeekAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E68B3670[a3];
  }
  return v3;
}

- (int)StringAsDayOfWeek:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ANCHOR_DAY_OF_WEEK_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ANCHOR_DAY_OF_WEEK_SUNDAY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ANCHOR_DAY_OF_WEEK_MONDAY"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ANCHOR_DAY_OF_WEEK_TUESDAY"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ANCHOR_DAY_OF_WEEK_WEDNESDAY"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ANCHOR_DAY_OF_WEEK_THURSDAY"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"ANCHOR_DAY_OF_WEEK_FRIDAY"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"ANCHOR_DAY_OF_WEEK_SATURDAY"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasLocationIdentifier
{
  return self->_locationIdentifier != 0;
}

- (int)locationType
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_locationType;
  }
  else {
    return 0;
  }
}

- (void)setLocationType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_locationType = a3;
}

- (void)setHasLocationType:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasLocationType
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)locationTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E68B36B0[a3];
  }
  return v3;
}

- (int)StringAsLocationType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ANCHOR_LOCATION_TYPE_OTHER"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ANCHOR_LOCATION_TYPE_HOME"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ANCHOR_LOCATION_TYPE_WORK"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ANCHOR_LOCATION_TYPE_GYM"])
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
  v8.super_class = (Class)ATXAnchorModelPBAnchorMetadata;
  int v4 = [(ATXAnchorModelPBAnchorMetadata *)&v8 description];
  v5 = [(ATXAnchorModelPBAnchorMetadata *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t anchorType = self->_anchorType;
    if (anchorType >= 0x12)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_anchorType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E68B34D8[anchorType];
    }
    [v3 setObject:v5 forKey:@"anchorType"];
  }
  anchorEventIdentifier = self->_anchorEventIdentifier;
  if (anchorEventIdentifier) {
    [v3 setObject:anchorEventIdentifier forKey:@"anchorEventIdentifier"];
  }
  char has = (char)self->_has;
  if (has)
  {
    uint64_t anchorEventType = self->_anchorEventType;
    if (anchorEventType >= 0x21)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_anchorEventType);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E68B3568[anchorEventType];
    }
    [v3 setObject:v9 forKey:@"anchorEventType"];

    char has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    v10 = [NSNumber numberWithUnsignedInt:self->_month];
    [v3 setObject:v10 forKey:@"month"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_15:
      if ((has & 0x10) == 0) {
        goto LABEL_16;
      }
      goto LABEL_20;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_15;
  }
  v11 = [NSNumber numberWithUnsignedInt:self->_dayOfMonth];
  [v3 setObject:v11 forKey:@"dayOfMonth"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_16:
    if ((has & 8) == 0) {
      goto LABEL_25;
    }
    goto LABEL_21;
  }
LABEL_20:
  v12 = [NSNumber numberWithUnsignedInt:self->_hourOfDay];
  [v3 setObject:v12 forKey:@"hourOfDay"];

  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_25;
  }
LABEL_21:
  uint64_t dayOfWeek = self->_dayOfWeek;
  if (dayOfWeek >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_dayOfWeek);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = off_1E68B3670[dayOfWeek];
  }
  [v3 setObject:v14 forKey:@"dayOfWeek"];

LABEL_25:
  locationIdentifier = self->_locationIdentifier;
  if (locationIdentifier) {
    [v3 setObject:locationIdentifier forKey:@"locationIdentifier"];
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    uint64_t locationType = self->_locationType;
    if (locationType >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_locationType);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = off_1E68B36B0[locationType];
    }
    [v3 setObject:v17 forKey:@"locationType"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXAnchorModelPBAnchorMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_anchorEventIdentifier) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_20;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_10:
  }
    PBDataWriterWriteInt32Field();
LABEL_11:
  if (self->_locationIdentifier) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[5] = self->_anchorType;
    *((unsigned char *)v4 + 56) |= 2u;
  }
  v6 = v4;
  if (self->_anchorEventIdentifier)
  {
    objc_msgSend(v4, "setAnchorEventIdentifier:");
    int v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    v4[4] = self->_anchorEventType;
    *((unsigned char *)v4 + 56) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_20;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_7;
  }
  v4[13] = self->_month;
  *((unsigned char *)v4 + 56) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  v4[6] = self->_dayOfMonth;
  *((unsigned char *)v4 + 56) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  v4[8] = self->_hourOfDay;
  *((unsigned char *)v4 + 56) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_10:
    v4[7] = self->_dayOfWeek;
    *((unsigned char *)v4 + 56) |= 8u;
  }
LABEL_11:
  if (self->_locationIdentifier)
  {
    objc_msgSend(v6, "setLocationIdentifier:");
    int v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    v4[12] = self->_locationType;
    *((unsigned char *)v4 + 56) |= 0x20u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_anchorType;
    *(unsigned char *)(v5 + 56) |= 2u;
  }
  uint64_t v7 = [(NSString *)self->_anchorEventIdentifier copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v7;

  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v6 + 16) = self->_anchorEventType;
    *(unsigned char *)(v6 + 56) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 52) = self->_month;
  *(unsigned char *)(v6 + 56) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *(_DWORD *)(v6 + 24) = self->_dayOfMonth;
  *(unsigned char *)(v6 + 56) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_15:
  *(_DWORD *)(v6 + 32) = self->_hourOfDay;
  *(unsigned char *)(v6 + 56) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_8:
    *(_DWORD *)(v6 + 28) = self->_dayOfWeek;
    *(unsigned char *)(v6 + 56) |= 8u;
  }
LABEL_9:
  uint64_t v10 = [(NSString *)self->_locationIdentifier copyWithZone:a3];
  v11 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v10;

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 48) = self->_locationType;
    *(unsigned char *)(v6 + 56) |= 0x20u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_42;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_anchorType != *((_DWORD *)v4 + 5)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    goto LABEL_42;
  }
  anchorEventIdentifier = self->_anchorEventIdentifier;
  if ((unint64_t)anchorEventIdentifier | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](anchorEventIdentifier, "isEqual:")) {
      goto LABEL_42;
    }
    char has = (char)self->_has;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_anchorEventType != *((_DWORD *)v4 + 4)) {
      goto LABEL_42;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
    goto LABEL_42;
  }
  if ((has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 0x40) == 0 || self->_month != *((_DWORD *)v4 + 13)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 0x40) != 0)
  {
    goto LABEL_42;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0 || self->_dayOfMonth != *((_DWORD *)v4 + 6)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
    goto LABEL_42;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 0x10) == 0 || self->_hourOfDay != *((_DWORD *)v4 + 8)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 0x10) != 0)
  {
    goto LABEL_42;
  }
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 8) == 0 || self->_dayOfWeek != *((_DWORD *)v4 + 7)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 8) != 0)
  {
    goto LABEL_42;
  }
  locationIdentifier = self->_locationIdentifier;
  if ((unint64_t)locationIdentifier | *((void *)v4 + 5))
  {
    if (-[NSString isEqual:](locationIdentifier, "isEqual:"))
    {
      char has = (char)self->_has;
      goto LABEL_38;
    }
LABEL_42:
    BOOL v8 = 0;
    goto LABEL_43;
  }
LABEL_38:
  BOOL v8 = (*((unsigned char *)v4 + 56) & 0x20) == 0;
  if ((has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 0x20) == 0 || self->_locationType != *((_DWORD *)v4 + 12)) {
      goto LABEL_42;
    }
    BOOL v8 = 1;
  }
LABEL_43:

  return v8;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_anchorType;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_anchorEventIdentifier hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v5 = 2654435761 * self->_anchorEventType;
    if ((*(unsigned char *)&self->_has & 0x40) != 0)
    {
LABEL_6:
      uint64_t v6 = 2654435761 * self->_month;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_7;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_7:
    uint64_t v7 = 2654435761 * self->_dayOfMonth;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_8;
    }
LABEL_13:
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_9;
    }
    goto LABEL_14;
  }
LABEL_12:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_hourOfDay;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_9:
    uint64_t v9 = 2654435761 * self->_dayOfWeek;
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v9 = 0;
LABEL_15:
  NSUInteger v10 = [(NSString *)self->_locationIdentifier hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    uint64_t v11 = 2654435761 * self->_locationType;
  }
  else {
    uint64_t v11 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if ((v4[14] & 2) != 0)
  {
    self->_uint64_t anchorType = v4[5];
    *(unsigned char *)&self->_has |= 2u;
  }
  uint64_t v6 = v4;
  if (*((void *)v4 + 1))
  {
    -[ATXAnchorModelPBAnchorMetadata setAnchorEventIdentifier:](self, "setAnchorEventIdentifier:");
    NSUInteger v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 56);
  if (v5)
  {
    self->_uint64_t anchorEventType = v4[4];
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 56);
    if ((v5 & 0x40) == 0)
    {
LABEL_7:
      if ((v5 & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_20;
    }
  }
  else if ((v4[14] & 0x40) == 0)
  {
    goto LABEL_7;
  }
  self->_month = v4[13];
  *(unsigned char *)&self->_has |= 0x40u;
  char v5 = *((unsigned char *)v4 + 56);
  if ((v5 & 4) == 0)
  {
LABEL_8:
    if ((v5 & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_dayOfMonth = v4[6];
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 56);
  if ((v5 & 0x10) == 0)
  {
LABEL_9:
    if ((v5 & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  self->_hourOfDay = v4[8];
  *(unsigned char *)&self->_has |= 0x10u;
  if ((v4[14] & 8) != 0)
  {
LABEL_10:
    self->_uint64_t dayOfWeek = v4[7];
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_11:
  if (*((void *)v4 + 5))
  {
    -[ATXAnchorModelPBAnchorMetadata setLocationIdentifier:](self, "setLocationIdentifier:");
    NSUInteger v4 = v6;
  }
  if ((v4[14] & 0x20) != 0)
  {
    self->_uint64_t locationType = v4[12];
    *(unsigned char *)&self->_has |= 0x20u;
  }
}

- (NSString)anchorEventIdentifier
{
  return self->_anchorEventIdentifier;
}

- (void)setAnchorEventIdentifier:(id)a3
{
}

- (unsigned)month
{
  return self->_month;
}

- (unsigned)dayOfMonth
{
  return self->_dayOfMonth;
}

- (unsigned)hourOfDay
{
  return self->_hourOfDay;
}

- (NSString)locationIdentifier
{
  return self->_locationIdentifier;
}

- (void)setLocationIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationIdentifier, 0);
  objc_storeStrong((id *)&self->_anchorEventIdentifier, 0);
}

@end