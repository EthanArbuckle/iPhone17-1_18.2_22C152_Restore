@interface HMAudioAnalysisEventBulletinEventProtoAudioAnalysisEventBulletinEvent
- (BOOL)hasAccessoryIdentifier;
- (BOOL)hasDateOfOccurrence;
- (BOOL)hasEventStartDate;
- (BOOL)hasHomeIdentifier;
- (BOOL)hasNotificationUUID;
- (BOOL)hasReason;
- (BOOL)hasState;
- (BOOL)hasThreadIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)accessoryIdentifier;
- (NSString)homeIdentifier;
- (NSString)notificationUUID;
- (NSString)threadIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)dateOfOccurrence;
- (int64_t)eventStartDate;
- (int64_t)reason;
- (int64_t)state;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccessoryIdentifier:(id)a3;
- (void)setDateOfOccurrence:(int64_t)a3;
- (void)setEventStartDate:(int64_t)a3;
- (void)setHasDateOfOccurrence:(BOOL)a3;
- (void)setHasEventStartDate:(BOOL)a3;
- (void)setHasReason:(BOOL)a3;
- (void)setHasState:(BOOL)a3;
- (void)setHomeIdentifier:(id)a3;
- (void)setNotificationUUID:(id)a3;
- (void)setReason:(int64_t)a3;
- (void)setState:(int64_t)a3;
- (void)setThreadIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMAudioAnalysisEventBulletinEventProtoAudioAnalysisEventBulletinEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
  objc_storeStrong((id *)&self->_notificationUUID, 0);
  objc_storeStrong((id *)&self->_homeIdentifier, 0);

  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
}

- (int64_t)eventStartDate
{
  return self->_eventStartDate;
}

- (void)setHomeIdentifier:(id)a3
{
}

- (NSString)homeIdentifier
{
  return self->_homeIdentifier;
}

- (void)setAccessoryIdentifier:(id)a3
{
}

- (NSString)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (int64_t)dateOfOccurrence
{
  return self->_dateOfOccurrence;
}

- (void)setNotificationUUID:(id)a3
{
}

- (NSString)notificationUUID
{
  return self->_notificationUUID;
}

- (int64_t)reason
{
  return self->_reason;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setThreadIdentifier:(id)a3
{
}

- (NSString)threadIdentifier
{
  return self->_threadIdentifier;
}

- (void)mergeFrom:(id)a3
{
  v4 = (int64_t *)a3;
  v6 = v4;
  if (v4[8])
  {
    -[HMAudioAnalysisEventBulletinEventProtoAudioAnalysisEventBulletinEvent setThreadIdentifier:](self, "setThreadIdentifier:");
    v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 72);
  if ((v5 & 8) != 0)
  {
    self->_state = v4[4];
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)v4 + 72);
  }
  if ((v5 & 4) != 0)
  {
    self->_reason = v4[3];
    *(unsigned char *)&self->_has |= 4u;
  }
  if (v4[7])
  {
    -[HMAudioAnalysisEventBulletinEventProtoAudioAnalysisEventBulletinEvent setNotificationUUID:](self, "setNotificationUUID:");
    v4 = v6;
  }
  if (v4[9])
  {
    self->_dateOfOccurrence = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (v4[5])
  {
    -[HMAudioAnalysisEventBulletinEventProtoAudioAnalysisEventBulletinEvent setAccessoryIdentifier:](self, "setAccessoryIdentifier:");
    v4 = v6;
  }
  if (v4[6])
  {
    -[HMAudioAnalysisEventBulletinEventProtoAudioAnalysisEventBulletinEvent setHomeIdentifier:](self, "setHomeIdentifier:");
    v4 = v6;
  }
  if ((v4[9] & 2) != 0)
  {
    self->_eventStartDate = v4[2];
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_threadIdentifier hash];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v4 = 2654435761 * self->_state;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_reason;
      goto LABEL_6;
    }
  }
  uint64_t v5 = 0;
LABEL_6:
  NSUInteger v6 = [(NSString *)self->_notificationUUID hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_dateOfOccurrence;
  }
  else {
    uint64_t v7 = 0;
  }
  NSUInteger v8 = [(NSString *)self->_accessoryIdentifier hash];
  NSUInteger v9 = [(NSString *)self->_homeIdentifier hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v10 = 2654435761 * self->_eventStartDate;
  }
  else {
    uint64_t v10 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  threadIdentifier = self->_threadIdentifier;
  if ((unint64_t)threadIdentifier | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](threadIdentifier, "isEqual:")) {
      goto LABEL_30;
    }
  }
  char has = (char)self->_has;
  char v7 = *((unsigned char *)v4 + 72);
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 8) == 0 || self->_state != *((void *)v4 + 4)) {
      goto LABEL_30;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 8) != 0)
  {
    goto LABEL_30;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 4) == 0 || self->_reason != *((void *)v4 + 3)) {
      goto LABEL_30;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 4) != 0)
  {
    goto LABEL_30;
  }
  notificationUUID = self->_notificationUUID;
  if ((unint64_t)notificationUUID | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](notificationUUID, "isEqual:"))
    {
LABEL_30:
      BOOL v11 = 0;
      goto LABEL_31;
    }
    char has = (char)self->_has;
    char v7 = *((unsigned char *)v4 + 72);
  }
  if (has)
  {
    if ((v7 & 1) == 0 || self->_dateOfOccurrence != *((void *)v4 + 1)) {
      goto LABEL_30;
    }
  }
  else if (v7)
  {
    goto LABEL_30;
  }
  accessoryIdentifier = self->_accessoryIdentifier;
  if ((unint64_t)accessoryIdentifier | *((void *)v4 + 5)
    && !-[NSString isEqual:](accessoryIdentifier, "isEqual:"))
  {
    goto LABEL_30;
  }
  homeIdentifier = self->_homeIdentifier;
  if ((unint64_t)homeIdentifier | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](homeIdentifier, "isEqual:")) {
      goto LABEL_30;
    }
  }
  BOOL v11 = (*((unsigned char *)v4 + 72) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 2) == 0 || self->_eventStartDate != *((void *)v4 + 2)) {
      goto LABEL_30;
    }
    BOOL v11 = 1;
  }
LABEL_31:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_threadIdentifier copyWithZone:a3];
  char v7 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v6;

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(void *)(v5 + 32) = self->_state;
    *(unsigned char *)(v5 + 72) |= 8u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_reason;
    *(unsigned char *)(v5 + 72) |= 4u;
  }
  uint64_t v9 = [(NSString *)self->_notificationUUID copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v9;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_dateOfOccurrence;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  uint64_t v11 = [(NSString *)self->_accessoryIdentifier copyWithZone:a3];
  v12 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v11;

  uint64_t v13 = [(NSString *)self->_homeIdentifier copyWithZone:a3];
  v14 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v13;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_eventStartDate;
    *(unsigned char *)(v5 + 72) |= 2u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_threadIdentifier)
  {
    objc_msgSend(v4, "setThreadIdentifier:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((void *)v4 + 4) = self->_state;
    *((unsigned char *)v4 + 72) |= 8u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((void *)v4 + 3) = self->_reason;
    *((unsigned char *)v4 + 72) |= 4u;
  }
  if (self->_notificationUUID)
  {
    objc_msgSend(v6, "setNotificationUUID:");
    id v4 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_dateOfOccurrence;
    *((unsigned char *)v4 + 72) |= 1u;
  }
  if (self->_accessoryIdentifier)
  {
    objc_msgSend(v6, "setAccessoryIdentifier:");
    id v4 = v6;
  }
  if (self->_homeIdentifier)
  {
    objc_msgSend(v6, "setHomeIdentifier:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_eventStartDate;
    *((unsigned char *)v4 + 72) |= 2u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_threadIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
  if (self->_notificationUUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
  if (self->_accessoryIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_homeIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMAudioAnalysisEventBulletinEventProtoAudioAnalysisEventBulletinEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  threadIdentifier = self->_threadIdentifier;
  if (threadIdentifier) {
    [v3 setObject:threadIdentifier forKey:@"threadIdentifier"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    char v7 = [NSNumber numberWithLongLong:self->_state];
    [v4 setObject:v7 forKey:@"state"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    NSUInteger v8 = [NSNumber numberWithLongLong:self->_reason];
    [v4 setObject:v8 forKey:@"reason"];
  }
  notificationUUID = self->_notificationUUID;
  if (notificationUUID) {
    [v4 setObject:notificationUUID forKey:@"notificationUUID"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v10 = [NSNumber numberWithLongLong:self->_dateOfOccurrence];
    [v4 setObject:v10 forKey:@"dateOfOccurrence"];
  }
  accessoryIdentifier = self->_accessoryIdentifier;
  if (accessoryIdentifier) {
    [v4 setObject:accessoryIdentifier forKey:@"accessoryIdentifier"];
  }
  homeIdentifier = self->_homeIdentifier;
  if (homeIdentifier) {
    [v4 setObject:homeIdentifier forKey:@"homeIdentifier"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v13 = [NSNumber numberWithLongLong:self->_eventStartDate];
    [v4 setObject:v13 forKey:@"eventStartDate"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMAudioAnalysisEventBulletinEventProtoAudioAnalysisEventBulletinEvent;
  id v4 = [(HMAudioAnalysisEventBulletinEventProtoAudioAnalysisEventBulletinEvent *)&v8 description];
  uint64_t v5 = [(HMAudioAnalysisEventBulletinEventProtoAudioAnalysisEventBulletinEvent *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasEventStartDate
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasEventStartDate:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setEventStartDate:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_eventStartDate = a3;
}

- (BOOL)hasHomeIdentifier
{
  return self->_homeIdentifier != 0;
}

- (BOOL)hasAccessoryIdentifier
{
  return self->_accessoryIdentifier != 0;
}

- (BOOL)hasDateOfOccurrence
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasDateOfOccurrence:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setDateOfOccurrence:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_dateOfOccurrence = a3;
}

- (BOOL)hasNotificationUUID
{
  return self->_notificationUUID != 0;
}

- (BOOL)hasReason
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasReason:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setReason:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_reason = a3;
}

- (BOOL)hasState
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasState:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setState:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_state = a3;
}

- (BOOL)hasThreadIdentifier
{
  return self->_threadIdentifier != 0;
}

@end