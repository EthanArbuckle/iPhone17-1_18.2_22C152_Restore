@interface BMPBAlarmEvent
- (BOOL)hasAlarmID;
- (BOOL)hasEventType;
- (BOOL)hasIsSleepAlarm;
- (BOOL)hasLastEventType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSleepAlarm;
- (BOOL)readFrom:(id)a3;
- (NSString)alarmID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)eventTypeAsString:(int)a3;
- (id)lastEventTypeAsString:(int)a3;
- (int)StringAsEventType:(id)a3;
- (int)StringAsLastEventType:(id)a3;
- (int)eventType;
- (int)lastEventType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlarmID:(id)a3;
- (void)setEventType:(int)a3;
- (void)setHasEventType:(BOOL)a3;
- (void)setHasIsSleepAlarm:(BOOL)a3;
- (void)setHasLastEventType:(BOOL)a3;
- (void)setIsSleepAlarm:(BOOL)a3;
- (void)setLastEventType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBAlarmEvent

- (void)setIsSleepAlarm:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_isSleepAlarm = a3;
}

- (void)setHasIsSleepAlarm:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsSleepAlarm
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (int)eventType
{
  if (*(unsigned char *)&self->_has) {
    return self->_eventType;
  }
  else {
    return 0;
  }
}

- (void)setEventType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_eventType = a3;
}

- (void)setHasEventType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEventType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)eventTypeAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E55D85D0[a3];
  }

  return v3;
}

- (int)StringAsEventType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Firing"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Stopped"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Snoozed"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Created"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Updated"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Deleted"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasAlarmID
{
  return self->_alarmID != 0;
}

- (int)lastEventType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_lastEventType;
  }
  else {
    return 0;
  }
}

- (void)setLastEventType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_lastEventType = a3;
}

- (void)setHasLastEventType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLastEventType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)lastEventTypeAsString:(int)a3
{
  if (a3 >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E55D8600[a3];
  }

  return v3;
}

- (int)StringAsLastEventType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Idle"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Fired"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FiredAfterSnooze"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FiredGoToBedReminder"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FiredGoToBedReminderAfterSnooze"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Dismissed"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"DismissedGoToBedReminder"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"Snoozed"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SnoozedBedtime"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"ConfigurationChanged"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"TimedOut"])
  {
    int v4 = 10;
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
  v8.super_class = (Class)BMPBAlarmEvent;
  int v4 = [(BMPBAlarmEvent *)&v8 description];
  v5 = [(BMPBAlarmEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5 = [NSNumber numberWithBool:self->_isSleepAlarm];
    [v3 setObject:v5 forKey:@"isSleepAlarm"];

    char has = (char)self->_has;
  }
  if (has)
  {
    uint64_t eventType = self->_eventType;
    if (eventType >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_eventType);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E55D85D0[eventType];
    }
    [v3 setObject:v7 forKey:@"eventType"];
  }
  alarmID = self->_alarmID;
  if (alarmID) {
    [v3 setObject:alarmID forKey:@"alarmID"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t lastEventType = self->_lastEventType;
    if (lastEventType >= 0xB)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_lastEventType);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E55D8600[lastEventType];
    }
    [v3 setObject:v10 forKey:@"lastEventType"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBAlarmEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_alarmID) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[24] = self->_isSleepAlarm;
    v4[28] |= 4u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v4 + 4) = self->_eventType;
    v4[28] |= 1u;
  }
  if (self->_alarmID)
  {
    v6 = v4;
    objc_msgSend(v4, "setAlarmID:");
    int v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 5) = self->_lastEventType;
    v4[28] |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(unsigned char *)(v5 + 24) = self->_isSleepAlarm;
    *(unsigned char *)(v5 + 28) |= 4u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 16) = self->_eventType;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_alarmID copyWithZone:a3];
  v9 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v8;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 20) = self->_lastEventType;
    *(unsigned char *)(v6 + 28) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0) {
      goto LABEL_22;
    }
    if (self->_isSleepAlarm)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_22;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
    goto LABEL_22;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_eventType != *((_DWORD *)v4 + 4)) {
      goto LABEL_22;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_22;
  }
  alarmID = self->_alarmID;
  if ((unint64_t)alarmID | *((void *)v4 + 1))
  {
    if (-[NSString isEqual:](alarmID, "isEqual:"))
    {
      char has = (char)self->_has;
      goto LABEL_18;
    }
LABEL_22:
    BOOL v7 = 0;
    goto LABEL_23;
  }
LABEL_18:
  BOOL v7 = (*((unsigned char *)v4 + 28) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_lastEventType != *((_DWORD *)v4 + 5)) {
      goto LABEL_22;
    }
    BOOL v7 = 1;
  }
LABEL_23:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v3 = 2654435761 * self->_isSleepAlarm;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_eventType;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_alarmID hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_lastEventType;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 28);
  if ((v5 & 4) != 0)
  {
    self->_isSleepAlarm = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 28);
  }
  if (v5)
  {
    self->_uint64_t eventType = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    id v6 = v4;
    -[BMPBAlarmEvent setAlarmID:](self, "setAlarmID:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    self->_uint64_t lastEventType = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (BOOL)isSleepAlarm
{
  return self->_isSleepAlarm;
}

- (NSString)alarmID
{
  return self->_alarmID;
}

- (void)setAlarmID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end