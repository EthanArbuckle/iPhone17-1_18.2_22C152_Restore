@interface SYLogEngineState
- (BOOL)buffersSessions;
- (BOOL)hasBuffersSessions;
- (BOOL)hasInSession;
- (BOOL)hasSuspended;
- (BOOL)inSession;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)suspended;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBuffersSessions:(BOOL)a3;
- (void)setHasBuffersSessions:(BOOL)a3;
- (void)setHasInSession:(BOOL)a3;
- (void)setHasSuspended:(BOOL)a3;
- (void)setInSession:(BOOL)a3;
- (void)setSuspended:(BOOL)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SYLogEngineState

- (id)typeAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_264422E68[a3 - 1];
  }
  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Messaging"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FileTransfer"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DirectConnection"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (void)setSuspended:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_suspended = a3;
}

- (void)setHasSuspended:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSuspended
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setInSession:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_inSession = a3;
}

- (void)setHasInSession:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasInSession
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setBuffersSessions:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_buffersSessions = a3;
}

- (void)setHasBuffersSessions:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBuffersSessions
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SYLogEngineState;
  int v4 = [(SYLogEngineState *)&v8 description];
  v5 = [(SYLogEngineState *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  unsigned int v4 = self->_type - 1;
  if (v4 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_264422E68[v4];
  }
  [v3 setObject:v5 forKey:@"type"];

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v9 = [NSNumber numberWithBool:self->_suspended];
    [v3 setObject:v9 forKey:@"suspended"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_6:
      if ((has & 1) == 0) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_6;
  }
  v10 = [NSNumber numberWithBool:self->_inSession];
  [v3 setObject:v10 forKey:@"inSession"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_7:
    v7 = [NSNumber numberWithBool:self->_buffersSessions];
    [v3 setObject:v7 forKey:@"buffersSessions"];
  }
LABEL_8:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SYLogEngineStateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
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
  PBDataWriterWriteBOOLField();
  if (*(unsigned char *)&self->_has) {
LABEL_4:
  }
    PBDataWriterWriteBOOLField();
LABEL_5:
}

- (void)copyTo:(id)a3
{
  unsigned int v4 = a3;
  v4[2] = self->_type;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((unsigned char *)v4 + 14) = self->_suspended;
    *((unsigned char *)v4 + 16) |= 4u;
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
  *((unsigned char *)v4 + 13) = self->_inSession;
  *((unsigned char *)v4 + 16) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    *((unsigned char *)v4 + 12) = self->_buffersSessions;
    *((unsigned char *)v4 + 16) |= 1u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = self->_type;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((unsigned char *)result + 14) = self->_suspended;
    *((unsigned char *)result + 16) |= 4u;
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
  *((unsigned char *)result + 13) = self->_inSession;
  *((unsigned char *)result + 16) |= 2u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_4:
  *((unsigned char *)result + 12) = self->_buffersSessions;
  *((unsigned char *)result + 16) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()] || self->_type != *((_DWORD *)v4 + 2)) {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 4) == 0) {
      goto LABEL_21;
    }
    if (self->_suspended)
    {
      if (!*((unsigned char *)v4 + 14)) {
        goto LABEL_21;
      }
    }
    else if (*((unsigned char *)v4 + 14))
    {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 16) & 4) != 0)
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) == 0) {
      goto LABEL_21;
    }
    if (self->_inSession)
    {
      if (!*((unsigned char *)v4 + 13)) {
        goto LABEL_21;
      }
    }
    else if (*((unsigned char *)v4 + 13))
    {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 16) & 2) != 0)
  {
    goto LABEL_21;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 16))
    {
      if (self->_buffersSessions)
      {
        if (!*((unsigned char *)v4 + 12)) {
          goto LABEL_21;
        }
      }
      else if (*((unsigned char *)v4 + 12))
      {
        goto LABEL_21;
      }
      BOOL v5 = 1;
      goto LABEL_22;
    }
LABEL_21:
    BOOL v5 = 0;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v2 = 2654435761 * self->_suspended;
  }
  else {
    uint64_t v2 = 0;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_inSession;
  }
  else {
    uint64_t v3 = 0;
  }
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_buffersSessions;
  }
  else {
    uint64_t v4 = 0;
  }
  return v2 ^ v3 ^ v4 ^ (2654435761 * self->_type);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  self->_type = *((_DWORD *)v4 + 2);
  char v5 = *((unsigned char *)v4 + 16);
  if ((v5 & 4) != 0)
  {
    self->_suspended = *((unsigned char *)v4 + 14);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 16);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 16) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_inSession = *((unsigned char *)v4 + 13);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)v4 + 16))
  {
LABEL_4:
    self->_buffersSessions = *((unsigned char *)v4 + 12);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_5:
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (BOOL)suspended
{
  return self->_suspended;
}

- (BOOL)inSession
{
  return self->_inSession;
}

- (BOOL)buffersSessions
{
  return self->_buffersSessions;
}

@end