@interface EDPETQuotaReachedEvent
- (BOOL)hasDroppedEventsCount;
- (BOOL)hasSequenceNumber;
- (BOOL)hasTimestamp;
- (BOOL)hasTimezoneOffset;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)messageFrameType;
- (int)timezoneOffset;
- (unint64_t)droppedEventsCount;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)sequenceNumber;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDroppedEventsCount:(unint64_t)a3;
- (void)setHasDroppedEventsCount:(BOOL)a3;
- (void)setHasSequenceNumber:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTimezoneOffset:(BOOL)a3;
- (void)setSequenceNumber:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTimezoneOffset:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation EDPETQuotaReachedEvent

- (int)messageFrameType
{
  return 2;
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSequenceNumber:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_sequenceNumber = a3;
}

- (void)setHasSequenceNumber:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSequenceNumber
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setTimezoneOffset:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_timezoneOffset = a3;
}

- (void)setHasTimezoneOffset:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTimezoneOffset
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setDroppedEventsCount:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_droppedEventsCount = a3;
}

- (void)setHasDroppedEventsCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDroppedEventsCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)EDPETQuotaReachedEvent;
  v4 = [(EDPETQuotaReachedEvent *)&v8 description];
  v5 = [(EDPETQuotaReachedEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v5 forKey:@"timestamp"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v6 = [NSNumber numberWithUnsignedInt:self->_sequenceNumber];
    [v3 setObject:v6 forKey:@"sequence_number"];

    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v7 = [NSNumber numberWithInt:self->_timezoneOffset];
    [v3 setObject:v7 forKey:@"timezone_offset"];

    char has = (char)self->_has;
  }
  if (has)
  {
    objc_super v8 = [NSNumber numberWithUnsignedLongLong:self->_droppedEventsCount];
    [v3 setObject:v8 forKey:@"dropped_events_count"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return EDPETQuotaReachedEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    PBDataWriterWriteSint32Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteUint64Field();
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = self->_timestamp;
    *((unsigned char *)v4 + 32) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 6) = self->_sequenceNumber;
  *((unsigned char *)v4 + 32) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  *((_DWORD *)v4 + 7) = self->_timezoneOffset;
  *((unsigned char *)v4 + 32) |= 8u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_5:
    v4[1] = self->_droppedEventsCount;
    *((unsigned char *)v4 + 32) |= 1u;
  }
LABEL_6:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)result + 2) = self->_timestamp;
    *((unsigned char *)result + 32) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 6) = self->_sequenceNumber;
  *((unsigned char *)result + 32) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 7) = self->_timezoneOffset;
  *((unsigned char *)result + 32) |= 8u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_5:
  *((void *)result + 1) = self->_droppedEventsCount;
  *((unsigned char *)result + 32) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_timestamp != *((void *)v4 + 2)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
LABEL_21:
    BOOL v5 = 0;
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_sequenceNumber != *((_DWORD *)v4 + 6)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 8) == 0 || self->_timezoneOffset != *((_DWORD *)v4 + 7)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 8) != 0)
  {
    goto LABEL_21;
  }
  BOOL v5 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_droppedEventsCount != *((void *)v4 + 1)) {
      goto LABEL_21;
    }
    BOOL v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unint64_t v2 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_sequenceNumber;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_5;
      }
LABEL_9:
      unint64_t v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_timezoneOffset;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  unint64_t v5 = 2654435761u * self->_droppedEventsCount;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 2) != 0)
  {
    self->_timestamp = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 32);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_sequenceNumber = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_timezoneOffset = *((_DWORD *)v4 + 7);
  *(unsigned char *)&self->_has |= 8u;
  if (*((unsigned char *)v4 + 32))
  {
LABEL_5:
    self->_droppedEventsCount = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_6:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)sequenceNumber
{
  return self->_sequenceNumber;
}

- (int)timezoneOffset
{
  return self->_timezoneOffset;
}

- (unint64_t)droppedEventsCount
{
  return self->_droppedEventsCount;
}

@end