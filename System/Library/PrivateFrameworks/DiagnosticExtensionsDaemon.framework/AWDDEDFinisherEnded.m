@interface AWDDEDFinisherEnded
- (BOOL)hasDuration;
- (BOOL)hasNumbytes;
- (BOOL)hasState;
- (BOOL)hasTimestamp;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)stateAsString:(int)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsState:(id)a3;
- (int)StringAsType:(id)a3;
- (int)state;
- (int)type;
- (unint64_t)duration;
- (unint64_t)hash;
- (unint64_t)numbytes;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDuration:(unint64_t)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasNumbytes:(BOOL)a3;
- (void)setHasState:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setNumbytes:(unint64_t)a3;
- (void)setState:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDDEDFinisherEnded

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setDuration:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setNumbytes:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_numbytes = a3;
}

- (void)setHasNumbytes:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumbytes
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)type
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_26453BBB8[a3];
  }
  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DEDFinisherTypeNone"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DEDFinisherTypeSeeding"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DEDFinisherTypeRadar"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DEDFinisherTypeCloudKit"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)state
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_state;
  }
  else {
    return 0;
  }
}

- (void)setState:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_state = a3;
}

- (void)setHasState:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasState
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)stateAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_26453BBD8[a3];
  }
  return v3;
}

- (int)StringAsState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DEDFinisherStateUnknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DEDFinisherStateDone"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DEDFinisherStateUploadFailed"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DEDFinisherStateUploadCancelled"])
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
  v8.super_class = (Class)AWDDEDFinisherEnded;
  int v4 = [(AWDDEDFinisherEnded *)&v8 description];
  v5 = [(AWDDEDFinisherEnded *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v5 forKey:@"timestamp"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v6 = [NSNumber numberWithUnsignedLongLong:self->_duration];
  [v3 setObject:v6 forKey:@"duration"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t type = self->_type;
    if (type >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_26453BBB8[type];
    }
    [v3 setObject:v9 forKey:@"type"];

    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_18;
    }
    goto LABEL_14;
  }
LABEL_9:
  v7 = [NSNumber numberWithUnsignedLongLong:self->_numbytes];
  [v3 setObject:v7 forKey:@"numbytes"];

  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_10;
  }
LABEL_5:
  if ((has & 8) != 0)
  {
LABEL_14:
    uint64_t state = self->_state;
    if (state >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_state);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_26453BBD8[state];
    }
    [v3 setObject:v11 forKey:@"state"];
  }
LABEL_18:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDDEDFinisherEndedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_6:
  }
    PBDataWriterWriteInt32Field();
LABEL_7:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[3] = self->_timestamp;
    *((unsigned char *)v4 + 40) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[1] = self->_duration;
  *((unsigned char *)v4 + 40) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v4[2] = self->_numbytes;
  *((unsigned char *)v4 + 40) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  *((_DWORD *)v4 + 9) = self->_type;
  *((unsigned char *)v4 + 40) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_6:
    *((_DWORD *)v4 + 8) = self->_state;
    *((unsigned char *)v4 + 40) |= 8u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)result + 3) = self->_timestamp;
    *((unsigned char *)result + 40) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 1) = self->_duration;
  *((unsigned char *)result + 40) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((void *)result + 2) = self->_numbytes;
  *((unsigned char *)result + 40) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      return result;
    }
    goto LABEL_6;
  }
LABEL_11:
  *((_DWORD *)result + 9) = self->_type;
  *((unsigned char *)result + 40) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    return result;
  }
LABEL_6:
  *((_DWORD *)result + 8) = self->_state;
  *((unsigned char *)result + 40) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_timestamp != *((void *)v4 + 3)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
LABEL_26:
    BOOL v5 = 0;
    goto LABEL_27;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_duration != *((void *)v4 + 1)) {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_numbytes != *((void *)v4 + 2)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 0x10) == 0 || self->_type != *((_DWORD *)v4 + 9)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 0x10) != 0)
  {
    goto LABEL_26;
  }
  BOOL v5 = (*((unsigned char *)v4 + 40) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 8) == 0 || self->_state != *((_DWORD *)v4 + 8)) {
      goto LABEL_26;
    }
    BOOL v5 = 1;
  }
LABEL_27:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    unint64_t v2 = 2654435761u * self->_timestamp;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      unint64_t v3 = 2654435761u * self->_duration;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  unint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    unint64_t v4 = 2654435761u * self->_numbytes;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  unint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_type;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_state;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 4) != 0)
  {
    self->_timestamp = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 40);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_duration = *((void *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_numbytes = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 0x10) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  self->_uint64_t type = *((_DWORD *)v4 + 9);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((*((unsigned char *)v4 + 40) & 8) != 0)
  {
LABEL_6:
    self->_uint64_t state = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_7:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (unint64_t)numbytes
{
  return self->_numbytes;
}

@end