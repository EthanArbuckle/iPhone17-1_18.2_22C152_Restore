@interface BMPBDoNotDisturbWhileDrivingEvent
- (BOOL)hasIsStart;
- (BOOL)hasReason;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStart;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)reasonAsString:(int)a3;
- (int)StringAsReason:(id)a3;
- (int)reason;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsStart:(BOOL)a3;
- (void)setHasReason:(BOOL)a3;
- (void)setIsStart:(BOOL)a3;
- (void)setReason:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBDoNotDisturbWhileDrivingEvent

- (void)setIsStart:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isStart = a3;
}

- (void)setHasIsStart:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsStart
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)reason
{
  if (*(unsigned char *)&self->_has) {
    return self->_reason;
  }
  else {
    return 0;
  }
}

- (void)setReason:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_reason = a3;
}

- (void)setHasReason:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReason
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)reasonAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E55D6E80[a3];
  }

  return v3;
}

- (int)StringAsReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ManualControlCenter"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Vehicular"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CarPlay"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ManualExitFriction"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ManualBulletin"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"ManualVanillaControlCenter"])
  {
    int v4 = 6;
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
  v8.super_class = (Class)BMPBDoNotDisturbWhileDrivingEvent;
  int v4 = [(BMPBDoNotDisturbWhileDrivingEvent *)&v8 description];
  v5 = [(BMPBDoNotDisturbWhileDrivingEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = [NSNumber numberWithBool:self->_isStart];
    [v3 setObject:v5 forKey:@"isStart"];

    char has = (char)self->_has;
  }
  if (has)
  {
    uint64_t reason = self->_reason;
    if (reason >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_reason);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E55D6E80[reason];
    }
    [v3 setObject:v7 forKey:@"reason"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBDoNotDisturbWhileDrivingEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[12] = self->_isStart;
    v4[16] |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v4 + 2) = self->_reason;
    v4[16] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((unsigned char *)result + 12) = self->_isStart;
    *((unsigned char *)result + 16) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)result + 2) = self->_reason;
    *((unsigned char *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) != 0)
    {
      if (self->_isStart)
      {
        if (!*((unsigned char *)v4 + 12)) {
          goto LABEL_14;
        }
        goto LABEL_10;
      }
      if (!*((unsigned char *)v4 + 12)) {
        goto LABEL_10;
      }
    }
LABEL_14:
    BOOL v5 = 0;
    goto LABEL_15;
  }
  if ((*((unsigned char *)v4 + 16) & 2) != 0) {
    goto LABEL_14;
  }
LABEL_10:
  BOOL v5 = (*((unsigned char *)v4 + 16) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_reason != *((_DWORD *)v4 + 2)) {
      goto LABEL_14;
    }
    BOOL v5 = 1;
  }
LABEL_15:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_isStart;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_reason;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 16);
  if ((v5 & 2) != 0)
  {
    self->_isStart = *((unsigned char *)v4 + 12);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 16);
  }
  if (v5)
  {
    self->_uint64_t reason = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (BOOL)isStart
{
  return self->_isStart;
}

@end