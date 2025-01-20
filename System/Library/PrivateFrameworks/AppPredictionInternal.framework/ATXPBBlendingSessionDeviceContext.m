@interface ATXPBBlendingSessionDeviceContext
- (BOOL)dateInWeekend;
- (BOOL)hasCurrentLOIType;
- (BOOL)hasDateInWeekend;
- (BOOL)hasDayOfWeek;
- (BOOL)hasLastUnlockMoreThan1HourAgo;
- (BOOL)hasLastUnlockMoreThan30MinutesAgo;
- (BOOL)hasSecondsBeforeBlendingUpdate;
- (BOOL)hasTimeOfDay;
- (BOOL)isEqual:(id)a3;
- (BOOL)lastUnlockMoreThan1HourAgo;
- (BOOL)lastUnlockMoreThan30MinutesAgo;
- (BOOL)readFrom:(id)a3;
- (double)secondsBeforeBlendingUpdate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)currentLOITypeAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsCurrentLOIType:(id)a3;
- (int)currentLOIType;
- (unint64_t)hash;
- (unsigned)dayOfWeek;
- (unsigned)timeOfDay;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCurrentLOIType:(int)a3;
- (void)setDateInWeekend:(BOOL)a3;
- (void)setDayOfWeek:(unsigned int)a3;
- (void)setHasCurrentLOIType:(BOOL)a3;
- (void)setHasDateInWeekend:(BOOL)a3;
- (void)setHasDayOfWeek:(BOOL)a3;
- (void)setHasLastUnlockMoreThan1HourAgo:(BOOL)a3;
- (void)setHasLastUnlockMoreThan30MinutesAgo:(BOOL)a3;
- (void)setHasSecondsBeforeBlendingUpdate:(BOOL)a3;
- (void)setHasTimeOfDay:(BOOL)a3;
- (void)setLastUnlockMoreThan1HourAgo:(BOOL)a3;
- (void)setLastUnlockMoreThan30MinutesAgo:(BOOL)a3;
- (void)setSecondsBeforeBlendingUpdate:(double)a3;
- (void)setTimeOfDay:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBBlendingSessionDeviceContext

- (void)setTimeOfDay:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_timeOfDay = a3;
}

- (void)setHasTimeOfDay:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTimeOfDay
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setDayOfWeek:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_dayOfWeek = a3;
}

- (void)setHasDayOfWeek:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDayOfWeek
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setDateInWeekend:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_dateInWeekend = a3;
}

- (void)setHasDateInWeekend:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasDateInWeekend
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setLastUnlockMoreThan30MinutesAgo:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_lastUnlockMoreThan30MinutesAgo = a3;
}

- (void)setHasLastUnlockMoreThan30MinutesAgo:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasLastUnlockMoreThan30MinutesAgo
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setLastUnlockMoreThan1HourAgo:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_lastUnlockMoreThan1HourAgo = a3;
}

- (void)setHasLastUnlockMoreThan1HourAgo:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasLastUnlockMoreThan1HourAgo
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (int)currentLOIType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_currentLOIType;
  }
  else {
    return 0;
  }
}

- (void)setCurrentLOIType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_currentLOIType = a3;
}

- (void)setHasCurrentLOIType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCurrentLOIType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)currentLOITypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E68AC980[a3];
  }
  return v3;
}

- (int)StringAsCurrentLOIType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Other"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Home"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Work"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Gym"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setSecondsBeforeBlendingUpdate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_secondsBeforeBlendingUpdate = a3;
}

- (void)setHasSecondsBeforeBlendingUpdate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSecondsBeforeBlendingUpdate
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBBlendingSessionDeviceContext;
  int v4 = [(ATXPBBlendingSessionDeviceContext *)&v8 description];
  v5 = [(ATXPBBlendingSessionDeviceContext *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v7 = [NSNumber numberWithUnsignedInt:self->_timeOfDay];
    [v3 setObject:v7 forKey:@"timeOfDay"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithUnsignedInt:self->_dayOfWeek];
  [v3 setObject:v8 forKey:@"dayOfWeek"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  v9 = [NSNumber numberWithBool:self->_dateInWeekend];
  [v3 setObject:v9 forKey:@"dateInWeekend"];

  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  v10 = [NSNumber numberWithBool:self->_lastUnlockMoreThan30MinutesAgo];
  [v3 setObject:v10 forKey:@"lastUnlockMoreThan30MinutesAgo"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  v11 = [NSNumber numberWithBool:self->_lastUnlockMoreThan1HourAgo];
  [v3 setObject:v11 forKey:@"lastUnlockMoreThan1HourAgo"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  uint64_t currentLOIType = self->_currentLOIType;
  if (currentLOIType >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_currentLOIType);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = off_1E68AC980[currentLOIType];
  }
  [v3 setObject:v13 forKey:@"currentLOIType"];

  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_9;
  }
LABEL_8:
  v5 = [NSNumber numberWithDouble:self->_secondsBeforeBlendingUpdate];
  [v3 setObject:v5 forKey:@"secondsBeforeBlendingUpdate"];

LABEL_9:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBBlendingSessionDeviceContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  PBDataWriterWriteInt32Field();
  if (*(unsigned char *)&self->_has) {
LABEL_8:
  }
    PBDataWriterWriteDoubleField();
LABEL_9:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[6] = self->_timeOfDay;
    *((unsigned char *)v4 + 32) |= 8u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[5] = self->_dayOfWeek;
  *((unsigned char *)v4 + 32) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((unsigned char *)v4 + 28) = self->_dateInWeekend;
  *((unsigned char *)v4 + 32) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((unsigned char *)v4 + 30) = self->_lastUnlockMoreThan30MinutesAgo;
  *((unsigned char *)v4 + 32) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((unsigned char *)v4 + 29) = self->_lastUnlockMoreThan1HourAgo;
  *((unsigned char *)v4 + 32) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  v4[4] = self->_currentLOIType;
  *((unsigned char *)v4 + 32) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_8:
    *((void *)v4 + 1) = *(void *)&self->_secondsBeforeBlendingUpdate;
    *((unsigned char *)v4 + 32) |= 1u;
  }
LABEL_9:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)result + 6) = self->_timeOfDay;
    *((unsigned char *)result + 32) |= 8u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_dayOfWeek;
  *((unsigned char *)result + 32) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((unsigned char *)result + 28) = self->_dateInWeekend;
  *((unsigned char *)result + 32) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((unsigned char *)result + 30) = self->_lastUnlockMoreThan30MinutesAgo;
  *((unsigned char *)result + 32) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((unsigned char *)result + 29) = self->_lastUnlockMoreThan1HourAgo;
  *((unsigned char *)result + 32) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 1) == 0) {
      return result;
    }
    goto LABEL_8;
  }
LABEL_15:
  *((_DWORD *)result + 4) = self->_currentLOIType;
  *((unsigned char *)result + 32) |= 2u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_8:
  *((void *)result + 1) = *(void *)&self->_secondsBeforeBlendingUpdate;
  *((unsigned char *)result + 32) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_45;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 8) == 0 || self->_timeOfDay != *((_DWORD *)v4 + 6)) {
      goto LABEL_45;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 8) != 0)
  {
    goto LABEL_45;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_dayOfWeek != *((_DWORD *)v4 + 5)) {
      goto LABEL_45;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    goto LABEL_45;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 0x10) == 0) {
      goto LABEL_45;
    }
    if (self->_dateInWeekend)
    {
      if (!*((unsigned char *)v4 + 28)) {
        goto LABEL_45;
      }
    }
    else if (*((unsigned char *)v4 + 28))
    {
      goto LABEL_45;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 0x10) != 0)
  {
    goto LABEL_45;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 0x40) == 0) {
      goto LABEL_45;
    }
    if (self->_lastUnlockMoreThan30MinutesAgo)
    {
      if (!*((unsigned char *)v4 + 30)) {
        goto LABEL_45;
      }
    }
    else if (*((unsigned char *)v4 + 30))
    {
      goto LABEL_45;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 0x40) != 0)
  {
    goto LABEL_45;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 0x20) != 0)
    {
      if (self->_lastUnlockMoreThan1HourAgo)
      {
        if (!*((unsigned char *)v4 + 29)) {
          goto LABEL_45;
        }
        goto LABEL_36;
      }
      if (!*((unsigned char *)v4 + 29)) {
        goto LABEL_36;
      }
    }
LABEL_45:
    BOOL v5 = 0;
    goto LABEL_46;
  }
  if ((*((unsigned char *)v4 + 32) & 0x20) != 0) {
    goto LABEL_45;
  }
LABEL_36:
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_currentLOIType != *((_DWORD *)v4 + 4)) {
      goto LABEL_45;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_45;
  }
  BOOL v5 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_secondsBeforeBlendingUpdate != *((double *)v4 + 1)) {
      goto LABEL_45;
    }
    BOOL v5 = 1;
  }
LABEL_46:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v2 = 2654435761 * self->_timeOfDay;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_dayOfWeek;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_dateInWeekend;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_lastUnlockMoreThan30MinutesAgo;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_6:
    uint64_t v6 = 2654435761 * self->_lastUnlockMoreThan1HourAgo;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_7;
    }
LABEL_17:
    uint64_t v7 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_8;
    }
LABEL_18:
    unint64_t v12 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v12;
  }
LABEL_16:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_17;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_currentLOIType;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_18;
  }
LABEL_8:
  double secondsBeforeBlendingUpdate = self->_secondsBeforeBlendingUpdate;
  double v9 = -secondsBeforeBlendingUpdate;
  if (secondsBeforeBlendingUpdate >= 0.0) {
    double v9 = self->_secondsBeforeBlendingUpdate;
  }
  long double v10 = floor(v9 + 0.5);
  double v11 = (v9 - v10) * 1.84467441e19;
  unint64_t v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
  if (v11 >= 0.0)
  {
    if (v11 > 0.0) {
      v12 += (unint64_t)v11;
    }
  }
  else
  {
    v12 -= (unint64_t)fabs(v11);
  }
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 8) != 0)
  {
    self->_timeOfDay = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)v4 + 32);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_dayOfWeek = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_dateInWeekend = *((unsigned char *)v4 + 28);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 0x40) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_lastUnlockMoreThan30MinutesAgo = *((unsigned char *)v4 + 30);
  *(unsigned char *)&self->_has |= 0x40u;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 0x20) == 0)
  {
LABEL_6:
    if ((v5 & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_lastUnlockMoreThan1HourAgo = *((unsigned char *)v4 + 29);
  *(unsigned char *)&self->_has |= 0x20u;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 2) == 0)
  {
LABEL_7:
    if ((v5 & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  self->_uint64_t currentLOIType = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)v4 + 32))
  {
LABEL_8:
    self->_double secondsBeforeBlendingUpdate = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_9:
}

- (unsigned)timeOfDay
{
  return self->_timeOfDay;
}

- (unsigned)dayOfWeek
{
  return self->_dayOfWeek;
}

- (BOOL)dateInWeekend
{
  return self->_dateInWeekend;
}

- (BOOL)lastUnlockMoreThan30MinutesAgo
{
  return self->_lastUnlockMoreThan30MinutesAgo;
}

- (BOOL)lastUnlockMoreThan1HourAgo
{
  return self->_lastUnlockMoreThan1HourAgo;
}

- (double)secondsBeforeBlendingUpdate
{
  return self->_secondsBeforeBlendingUpdate;
}

@end