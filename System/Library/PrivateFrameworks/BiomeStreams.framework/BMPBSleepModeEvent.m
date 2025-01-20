@interface BMPBSleepModeEvent
- (BOOL)hasExpectedEndDate;
- (BOOL)hasSleepModeChangeReason;
- (BOOL)hasSleepModeState;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)expectedEndDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sleepModeChangeReasonAsString:(int)a3;
- (id)sleepModeStateAsString:(int)a3;
- (int)StringAsSleepModeChangeReason:(id)a3;
- (int)StringAsSleepModeState:(id)a3;
- (int)sleepModeChangeReason;
- (int)sleepModeState;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setExpectedEndDate:(double)a3;
- (void)setHasExpectedEndDate:(BOOL)a3;
- (void)setHasSleepModeChangeReason:(BOOL)a3;
- (void)setHasSleepModeState:(BOOL)a3;
- (void)setSleepModeChangeReason:(int)a3;
- (void)setSleepModeState:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBSleepModeEvent

- (int)sleepModeState
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_sleepModeState;
  }
  else {
    return 0;
  }
}

- (void)setSleepModeState:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_sleepModeState = a3;
}

- (void)setHasSleepModeState:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSleepModeState
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)sleepModeStateAsString:(int)a3
{
  if (a3 >= 3)
  {
    char v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    char v3 = *(&off_1E55D75D8 + a3);
  }

  return v3;
}

- (int)StringAsSleepModeState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Off"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"WindDown"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Bedtime"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)sleepModeChangeReason
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_sleepModeChangeReason;
  }
  else {
    return 0;
  }
}

- (void)setSleepModeChangeReason:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_sleepModeChangeReason = a3;
}

- (void)setHasSleepModeChangeReason:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSleepModeChangeReason
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)sleepModeChangeReasonAsString:(int)a3
{
  if (a3 >= 0xA)
  {
    char v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    char v3 = *(&off_1E55D75F0 + a3);
  }

  return v3;
}

- (int)StringAsSleepModeChangeReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"UserRequested"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Expected"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CloudSynced"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CloudSyncedUserRequested"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"NanoSynced"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"TurnedOffDND"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"Other"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"Automation"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"CloudSyncedAutomation"])
  {
    int v4 = 9;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setExpectedEndDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_expectedEndDate = a3;
}

- (void)setHasExpectedEndDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExpectedEndDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBSleepModeEvent;
  int v4 = [(BMPBSleepModeEvent *)&v8 description];
  v5 = [(BMPBSleepModeEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t sleepModeState = self->_sleepModeState;
    if (sleepModeState >= 3)
    {
      objc_super v8 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_sleepModeState);
    }
    else
    {
      objc_super v8 = *(&off_1E55D75D8 + sleepModeState);
    }
    [v3 setObject:v8 forKey:@"sleepModeState"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  uint64_t sleepModeChangeReason = self->_sleepModeChangeReason;
  if (sleepModeChangeReason >= 0xA)
  {
    v10 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_sleepModeChangeReason);
  }
  else
  {
    v10 = *(&off_1E55D75F0 + sleepModeChangeReason);
  }
  [v3 setObject:v10 forKey:@"sleepModeChangeReason"];

  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  v5 = [NSNumber numberWithDouble:self->_expectedEndDate];
  [v3 setObject:v5 forKey:@"expectedEndDate"];

LABEL_5:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBSleepModeEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_5:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[5] = self->_sleepModeState;
    *((unsigned char *)v4 + 24) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[4] = self->_sleepModeChangeReason;
  *((unsigned char *)v4 + 24) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    *((void *)v4 + 1) = *(void *)&self->_expectedEndDate;
    *((unsigned char *)v4 + 24) |= 1u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)result + 5) = self->_sleepModeState;
    *((unsigned char *)result + 24) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_sleepModeChangeReason;
  *((unsigned char *)result + 24) |= 2u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_4:
  *((void *)result + 1) = *(void *)&self->_expectedEndDate;
  *((unsigned char *)result + 24) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 4) == 0 || self->_sleepModeState != *((_DWORD *)v4 + 5)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 4) != 0)
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_sleepModeChangeReason != *((_DWORD *)v4 + 4)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
    goto LABEL_16;
  }
  BOOL v5 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_expectedEndDate != *((double *)v4 + 1)) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_10:
    unint64_t v8 = 0;
    return v3 ^ v2 ^ v8;
  }
  uint64_t v2 = 2654435761 * self->_sleepModeState;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_sleepModeChangeReason;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  double expectedEndDate = self->_expectedEndDate;
  double v5 = -expectedEndDate;
  if (expectedEndDate >= 0.0) {
    double v5 = self->_expectedEndDate;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
  return v3 ^ v2 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 24);
  if ((v5 & 4) != 0)
  {
    self->_uint64_t sleepModeState = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 24);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t sleepModeChangeReason = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)v4 + 24))
  {
LABEL_4:
    self->_double expectedEndDate = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_5:
}

- (double)expectedEndDate
{
  return self->_expectedEndDate;
}

@end