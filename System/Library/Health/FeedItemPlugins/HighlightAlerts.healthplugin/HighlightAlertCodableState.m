@interface HighlightAlertCodableState
- (BOOL)acknowledged;
- (BOOL)dismissed;
- (BOOL)hasAcknowledged;
- (BOOL)hasDismissed;
- (BOOL)hasEventDate;
- (BOOL)hasEventUUID;
- (BOOL)hasExpirationDate;
- (BOOL)hasLatestSupportedVersion;
- (BOOL)hasMinimumSupportedVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)eventUUID;
- (double)eventDate;
- (double)expirationDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)latestSupportedVersion;
- (int64_t)minimumSupportedVersion;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAcknowledged:(BOOL)a3;
- (void)setDismissed:(BOOL)a3;
- (void)setEventDate:(double)a3;
- (void)setEventUUID:(id)a3;
- (void)setExpirationDate:(double)a3;
- (void)setHasAcknowledged:(BOOL)a3;
- (void)setHasDismissed:(BOOL)a3;
- (void)setHasEventDate:(BOOL)a3;
- (void)setHasExpirationDate:(BOOL)a3;
- (void)setHasLatestSupportedVersion:(BOOL)a3;
- (void)setHasMinimumSupportedVersion:(BOOL)a3;
- (void)setLatestSupportedVersion:(int64_t)a3;
- (void)setMinimumSupportedVersion:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HighlightAlertCodableState

- (void)setLatestSupportedVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_latestSupportedVersion = a3;
}

- (void)setHasLatestSupportedVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLatestSupportedVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setMinimumSupportedVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_minimumSupportedVersion = a3;
}

- (void)setHasMinimumSupportedVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMinimumSupportedVersion
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasEventUUID
{
  return self->_eventUUID != 0;
}

- (void)setEventDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_eventDate = a3;
}

- (void)setHasEventDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEventDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setExpirationDate:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_expirationDate = a3;
}

- (void)setHasExpirationDate:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasExpirationDate
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAcknowledged:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_acknowledged = a3;
}

- (void)setHasAcknowledged:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasAcknowledged
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setDismissed:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_dismissed = a3;
}

- (void)setHasDismissed:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasDismissed
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HighlightAlertCodableState;
  v4 = [(HighlightAlertCodableState *)&v8 description];
  v5 = [(HighlightAlertCodableState *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5 = [NSNumber numberWithLongLong:self->_latestSupportedVersion];
    [v3 setObject:v5 forKey:@"latestSupportedVersion"];

    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v6 = [NSNumber numberWithLongLong:self->_minimumSupportedVersion];
    [v3 setObject:v6 forKey:@"minimumSupportedVersion"];
  }
  eventUUID = self->_eventUUID;
  if (eventUUID) {
    [v3 setObject:eventUUID forKey:@"eventUUID"];
  }
  char v8 = (char)self->_has;
  if (v8)
  {
    v11 = [NSNumber numberWithDouble:self->_eventDate];
    [v3 setObject:v11 forKey:@"eventDate"];

    char v8 = (char)self->_has;
    if ((v8 & 2) == 0)
    {
LABEL_9:
      if ((v8 & 0x10) == 0) {
        goto LABEL_10;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  v12 = [NSNumber numberWithDouble:self->_expirationDate];
  [v3 setObject:v12 forKey:@"expirationDate"];

  char v8 = (char)self->_has;
  if ((v8 & 0x10) == 0)
  {
LABEL_10:
    if ((v8 & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_17:
  v13 = [NSNumber numberWithBool:self->_acknowledged];
  [v3 setObject:v13 forKey:@"acknowledged"];

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_11:
    v9 = [NSNumber numberWithBool:self->_dismissed];
    [v3 setObject:v9 forKey:@"dismissed"];
  }
LABEL_12:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HighlightAlertCodableStateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
  }
  if ((has & 8) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_eventUUID) {
    PBDataWriterWriteStringField();
  }
  char v5 = (char)self->_has;
  if (v5)
  {
    PBDataWriterWriteDoubleField();
    char v5 = (char)self->_has;
    if ((v5 & 2) == 0)
    {
LABEL_9:
      if ((v5 & 0x10) == 0) {
        goto LABEL_10;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteDoubleField();
  char v5 = (char)self->_has;
  if ((v5 & 0x10) == 0)
  {
LABEL_10:
    if ((v5 & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_17:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
LABEL_11:
  }
    PBDataWriterWriteBOOLField();
LABEL_12:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[3] = self->_latestSupportedVersion;
    *((unsigned char *)v4 + 52) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v4[4] = self->_minimumSupportedVersion;
    *((unsigned char *)v4 + 52) |= 8u;
  }
  if (self->_eventUUID)
  {
    v7 = v4;
    objc_msgSend(v4, "setEventUUID:");
    v4 = v7;
  }
  char v6 = (char)self->_has;
  if (v6)
  {
    v4[1] = *(void *)&self->_eventDate;
    *((unsigned char *)v4 + 52) |= 1u;
    char v6 = (char)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_9:
      if ((v6 & 0x10) == 0) {
        goto LABEL_10;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  v4[2] = *(void *)&self->_expirationDate;
  *((unsigned char *)v4 + 52) |= 2u;
  char v6 = (char)self->_has;
  if ((v6 & 0x10) == 0)
  {
LABEL_10:
    if ((v6 & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_17:
  *((unsigned char *)v4 + 48) = self->_acknowledged;
  *((unsigned char *)v4 + 52) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_11:
    *((unsigned char *)v4 + 49) = self->_dismissed;
    *((unsigned char *)v4 + 52) |= 0x20u;
  }
LABEL_12:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_latestSupportedVersion;
    *(unsigned char *)(v5 + 52) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *(void *)(v5 + 32) = self->_minimumSupportedVersion;
    *(unsigned char *)(v5 + 52) |= 8u;
  }
  uint64_t v8 = [(NSString *)self->_eventUUID copyWithZone:a3];
  v9 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v8;

  char v10 = (char)self->_has;
  if (v10)
  {
    *(double *)(v6 + 8) = self->_eventDate;
    *(unsigned char *)(v6 + 52) |= 1u;
    char v10 = (char)self->_has;
    if ((v10 & 2) == 0)
    {
LABEL_7:
      if ((v10 & 0x10) == 0) {
        goto LABEL_8;
      }
LABEL_13:
      *(unsigned char *)(v6 + 48) = self->_acknowledged;
      *(unsigned char *)(v6 + 52) |= 0x10u;
      if ((*(unsigned char *)&self->_has & 0x20) == 0) {
        return (id)v6;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *(double *)(v6 + 16) = self->_expirationDate;
  *(unsigned char *)(v6 + 52) |= 2u;
  char v10 = (char)self->_has;
  if ((v10 & 0x10) != 0) {
    goto LABEL_13;
  }
LABEL_8:
  if ((v10 & 0x20) != 0)
  {
LABEL_9:
    *(unsigned char *)(v6 + 49) = self->_dismissed;
    *(unsigned char *)(v6 + 52) |= 0x20u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_35;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 4) == 0 || self->_latestSupportedVersion != *((void *)v4 + 3)) {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 4) != 0)
  {
    goto LABEL_35;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 8) == 0 || self->_minimumSupportedVersion != *((void *)v4 + 4)) {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 8) != 0)
  {
    goto LABEL_35;
  }
  eventUUID = self->_eventUUID;
  if ((unint64_t)eventUUID | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](eventUUID, "isEqual:")) {
      goto LABEL_35;
    }
    char has = (char)self->_has;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_eventDate != *((double *)v4 + 1)) {
      goto LABEL_35;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
    goto LABEL_35;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0 || self->_expirationDate != *((double *)v4 + 2)) {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
    goto LABEL_35;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 0x10) == 0) {
      goto LABEL_35;
    }
    if (self->_acknowledged)
    {
      if (!*((unsigned char *)v4 + 48)) {
        goto LABEL_35;
      }
    }
    else if (*((unsigned char *)v4 + 48))
    {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 0x10) != 0)
  {
    goto LABEL_35;
  }
  BOOL v7 = (*((unsigned char *)v4 + 52) & 0x20) == 0;
  if ((has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 0x20) != 0)
    {
      if (self->_dismissed)
      {
        if (!*((unsigned char *)v4 + 49)) {
          goto LABEL_35;
        }
      }
      else if (*((unsigned char *)v4 + 49))
      {
        goto LABEL_35;
      }
      BOOL v7 = 1;
      goto LABEL_36;
    }
LABEL_35:
    BOOL v7 = 0;
  }
LABEL_36:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v3 = 2654435761 * self->_latestSupportedVersion;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_minimumSupportedVersion;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_eventUUID hash];
  char has = (char)self->_has;
  if (has)
  {
    double eventDate = self->_eventDate;
    double v9 = -eventDate;
    if (eventDate >= 0.0) {
      double v9 = self->_eventDate;
    }
    long double v10 = floor(v9 + 0.5);
    double v11 = (v9 - v10) * 1.84467441e19;
    unint64_t v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0) {
        v7 += (unint64_t)v11;
      }
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    unint64_t v7 = 0;
  }
  if ((has & 2) != 0)
  {
    double expirationDate = self->_expirationDate;
    double v14 = -expirationDate;
    if (expirationDate >= 0.0) {
      double v14 = self->_expirationDate;
    }
    long double v15 = floor(v14 + 0.5);
    double v16 = (v14 - v15) * 1.84467441e19;
    unint64_t v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0) {
        v12 += (unint64_t)v16;
      }
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    unint64_t v12 = 0;
  }
  if ((has & 0x10) != 0)
  {
    uint64_t v17 = 2654435761 * self->_acknowledged;
    if ((has & 0x20) != 0) {
      goto LABEL_24;
    }
LABEL_26:
    uint64_t v18 = 0;
    return v4 ^ v3 ^ v7 ^ v12 ^ v17 ^ v18 ^ v5;
  }
  uint64_t v17 = 0;
  if ((has & 0x20) == 0) {
    goto LABEL_26;
  }
LABEL_24:
  uint64_t v18 = 2654435761 * self->_dismissed;
  return v4 ^ v3 ^ v7 ^ v12 ^ v17 ^ v18 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 52);
  if ((v5 & 4) != 0)
  {
    self->_latestSupportedVersion = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 52);
  }
  if ((v5 & 8) != 0)
  {
    self->_minimumSupportedVersion = *((void *)v4 + 4);
    *(unsigned char *)&self->_has |= 8u;
  }
  if (*((void *)v4 + 5))
  {
    id v7 = v4;
    -[HighlightAlertCodableState setEventUUID:](self, "setEventUUID:");
    id v4 = v7;
  }
  char v6 = *((unsigned char *)v4 + 52);
  if (v6)
  {
    self->_double eventDate = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 52);
    if ((v6 & 2) == 0)
    {
LABEL_9:
      if ((v6 & 0x10) == 0) {
        goto LABEL_10;
      }
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) == 0)
  {
    goto LABEL_9;
  }
  self->_double expirationDate = *((double *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v6 = *((unsigned char *)v4 + 52);
  if ((v6 & 0x10) == 0)
  {
LABEL_10:
    if ((v6 & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_17:
  self->_acknowledged = *((unsigned char *)v4 + 48);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((*((unsigned char *)v4 + 52) & 0x20) != 0)
  {
LABEL_11:
    self->_dismissed = *((unsigned char *)v4 + 49);
    *(unsigned char *)&self->_has |= 0x20u;
  }
LABEL_12:
}

- (int64_t)latestSupportedVersion
{
  return self->_latestSupportedVersion;
}

- (int64_t)minimumSupportedVersion
{
  return self->_minimumSupportedVersion;
}

- (NSString)eventUUID
{
  return self->_eventUUID;
}

- (void)setEventUUID:(id)a3
{
}

- (double)eventDate
{
  return self->_eventDate;
}

- (double)expirationDate
{
  return self->_expirationDate;
}

- (BOOL)acknowledged
{
  return self->_acknowledged;
}

- (BOOL)dismissed
{
  return self->_dismissed;
}

- (void).cxx_destruct
{
}

@end