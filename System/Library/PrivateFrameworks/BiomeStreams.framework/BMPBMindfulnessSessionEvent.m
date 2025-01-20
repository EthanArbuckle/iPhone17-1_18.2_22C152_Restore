@interface BMPBMindfulnessSessionEvent
- (BOOL)hasSessionType;
- (BOOL)hasStateType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sessionTypeAsString:(int)a3;
- (id)stateTypeAsString:(int)a3;
- (int)StringAsSessionType:(id)a3;
- (int)StringAsStateType:(id)a3;
- (int)sessionType;
- (int)stateType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSessionType:(BOOL)a3;
- (void)setHasStateType:(BOOL)a3;
- (void)setSessionType:(int)a3;
- (void)setStateType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBMindfulnessSessionEvent

- (int)sessionType
{
  if (*(unsigned char *)&self->_has) {
    return self->_sessionType;
  }
  else {
    return 0;
  }
}

- (void)setSessionType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_sessionType = a3;
}

- (void)setHasSessionType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSessionType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)sessionTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E55D7B88[a3];
  }

  return v3;
}

- (int)StringAsSessionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Breathe"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Reflect"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Meditation"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)stateType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_stateType;
  }
  else {
    return 0;
  }
}

- (void)setStateType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_stateType = a3;
}

- (void)setHasStateType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStateType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)stateTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E55D7BA0[a3];
  }

  return v3;
}

- (int)StringAsStateType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Start"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Stop"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Pause"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Resume"])
  {
    int v4 = 4;
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
  v8.super_class = (Class)BMPBMindfulnessSessionEvent;
  int v4 = [(BMPBMindfulnessSessionEvent *)&v8 description];
  v5 = [(BMPBMindfulnessSessionEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    uint64_t sessionType = self->_sessionType;
    if (sessionType >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_sessionType);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E55D7B88[sessionType];
    }
    [v3 setObject:v6 forKey:@"sessionType"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t stateType = self->_stateType;
    if (stateType >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_stateType);
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = off_1E55D7BA0[stateType];
    }
    [v3 setObject:v8 forKey:@"stateType"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBMindfulnessSessionEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[2] = self->_sessionType;
    *((unsigned char *)v4 + 16) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[3] = self->_stateType;
    *((unsigned char *)v4 + 16) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 2) = self->_sessionType;
    *((unsigned char *)result + 16) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_stateType;
    *((unsigned char *)result + 16) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_sessionType != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 16))
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) == 0 || self->_stateType != *((_DWORD *)v4 + 3)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_sessionType;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_stateType;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 16);
  if (v5)
  {
    self->_uint64_t sessionType = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 16);
  }
  if ((v5 & 2) != 0)
  {
    self->_uint64_t stateType = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
  }
}

@end