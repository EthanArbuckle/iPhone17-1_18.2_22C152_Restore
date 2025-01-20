@interface ASCodableCloudKitNotificationEvent
- (BOOL)hasDate;
- (BOOL)hasTriggerSnapshotIndex;
- (BOOL)hasTriggerUUID;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)triggerUUID;
- (double)date;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)triggerSnapshotIndex;
- (int64_t)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDate:(double)a3;
- (void)setHasDate:(BOOL)a3;
- (void)setHasTriggerSnapshotIndex:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setTriggerSnapshotIndex:(int64_t)a3;
- (void)setTriggerUUID:(id)a3;
- (void)setType:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASCodableCloudKitNotificationEvent

- (void)setDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_date = a3;
}

- (void)setHasDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasTriggerUUID
{
  return self->_triggerUUID != 0;
}

- (void)setTriggerSnapshotIndex:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_triggerSnapshotIndex = a3;
}

- (void)setHasTriggerSnapshotIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTriggerSnapshotIndex
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ASCodableCloudKitNotificationEvent;
  v4 = [(ASCodableCloudKitNotificationEvent *)&v8 description];
  v5 = [(ASCodableCloudKitNotificationEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = [NSNumber numberWithDouble:self->_date];
    [v3 setObject:v5 forKey:@"date"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v6 = [NSNumber numberWithLongLong:self->_type];
    [v3 setObject:v6 forKey:@"type"];
  }
  triggerUUID = self->_triggerUUID;
  if (triggerUUID) {
    [v3 setObject:triggerUUID forKey:@"triggerUUID"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithLongLong:self->_triggerSnapshotIndex];
    [v3 setObject:v8 forKey:@"triggerSnapshotIndex"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ASCodableCloudKitNotificationEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_triggerUUID) {
    PBDataWriterWriteDataField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt64Field();
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = *(void *)&self->_date;
    *((unsigned char *)v4 + 40) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v4[3] = self->_type;
    *((unsigned char *)v4 + 40) |= 4u;
  }
  if (self->_triggerUUID)
  {
    v6 = v4;
    objc_msgSend(v4, "setTriggerUUID:");
    v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[2] = self->_triggerSnapshotIndex;
    *((unsigned char *)v4 + 40) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v5 + 8) = self->_date;
    *(unsigned char *)(v5 + 40) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_type;
    *(unsigned char *)(v5 + 40) |= 4u;
  }
  uint64_t v8 = [(NSData *)self->_triggerUUID copyWithZone:a3];
  v9 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v8;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v6 + 16) = self->_triggerSnapshotIndex;
    *(unsigned char *)(v6 + 40) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_date != *((double *)v4 + 1)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_type != *((void *)v4 + 3)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
    goto LABEL_19;
  }
  triggerUUID = self->_triggerUUID;
  if ((unint64_t)triggerUUID | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](triggerUUID, "isEqual:"))
    {
LABEL_19:
      BOOL v7 = 0;
      goto LABEL_20;
    }
    char has = (char)self->_has;
  }
  BOOL v7 = (*((unsigned char *)v4 + 40) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_triggerSnapshotIndex != *((void *)v4 + 2)) {
      goto LABEL_19;
    }
    BOOL v7 = 1;
  }
LABEL_20:

  return v7;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    double date = self->_date;
    double v6 = -date;
    if (date >= 0.0) {
      double v6 = self->_date;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((has & 4) != 0) {
    uint64_t v9 = 2654435761 * self->_type;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = [(NSData *)self->_triggerUUID hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v11 = 2654435761 * self->_triggerSnapshotIndex;
  }
  else {
    uint64_t v11 = 0;
  }
  return v9 ^ v4 ^ v11 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 40);
  if (v5)
  {
    self->_double date = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 40);
  }
  if ((v5 & 4) != 0)
  {
    self->_type = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 4))
  {
    id v6 = v4;
    -[ASCodableCloudKitNotificationEvent setTriggerUUID:](self, "setTriggerUUID:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    self->_triggerSnapshotIndex = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (double)date
{
  return self->_date;
}

- (int64_t)type
{
  return self->_type;
}

- (NSData)triggerUUID
{
  return self->_triggerUUID;
}

- (void)setTriggerUUID:(id)a3
{
}

- (int64_t)triggerSnapshotIndex
{
  return self->_triggerSnapshotIndex;
}

- (void).cxx_destruct
{
}

@end