@interface CapEvent
- (BOOL)hasCapState;
- (BOOL)hasMsBeforeCallEnd;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)capStateAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsCapState:(id)a3;
- (int)capState;
- (unint64_t)hash;
- (unsigned)msBeforeCallEnd;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCapState:(int)a3;
- (void)setHasCapState:(BOOL)a3;
- (void)setHasMsBeforeCallEnd:(BOOL)a3;
- (void)setMsBeforeCallEnd:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CapEvent

- (int)capState
{
  if (*(unsigned char *)&self->_has) {
    return self->_capState;
  }
  else {
    return 0;
  }
}

- (void)setCapState:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_capState = a3;
}

- (void)setHasCapState:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCapState
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)capStateAsString:(int)a3
{
  if (a3 >= 3)
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    v3 = *(&off_100287B58 + a3);
  }

  return v3;
}

- (int)StringAsCapState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CFG_NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CFG_HEAD"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CFG_BODY"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setMsBeforeCallEnd:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_msBeforeCallEnd = a3;
}

- (void)setHasMsBeforeCallEnd:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMsBeforeCallEnd
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CapEvent;
  char v3 = [(CapEvent *)&v7 description];
  int v4 = [(CapEvent *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    uint64_t capState = self->_capState;
    if (capState >= 3)
    {
      v6 = +[NSString stringWithFormat:@"(unknown: %i)", self->_capState];
    }
    else
    {
      v6 = *(&off_100287B58 + capState);
    }
    [v3 setObject:v6 forKey:@"cap_state"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_msBeforeCallEnd];
    [v3 setObject:v7 forKey:@"ms_before_call_end"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000DA05C((uint64_t)self, (uint64_t)a3);
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
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[2] = self->_capState;
    *((unsigned char *)v4 + 16) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[3] = self->_msBeforeCallEnd;
    *((unsigned char *)v4 + 16) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 2) = self->_capState;
    *((unsigned char *)result + 16) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_msBeforeCallEnd;
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
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_capState != *((_DWORD *)v4 + 2)) {
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
    if ((*((unsigned char *)v4 + 16) & 2) == 0 || self->_msBeforeCallEnd != *((_DWORD *)v4 + 3)) {
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
    uint64_t v2 = 2654435761 * self->_capState;
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
  uint64_t v3 = 2654435761 * self->_msBeforeCallEnd;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 16);
  if (v5)
  {
    self->_uint64_t capState = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 16);
  }
  if ((v5 & 2) != 0)
  {
    self->_msBeforeCallEnd = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unsigned)msBeforeCallEnd
{
  return self->_msBeforeCallEnd;
}

@end