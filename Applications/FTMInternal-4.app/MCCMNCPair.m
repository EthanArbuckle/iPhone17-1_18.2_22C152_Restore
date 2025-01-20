@interface MCCMNCPair
- (BOOL)hasMCC;
- (BOOL)hasMNC;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)mCC;
- (unsigned)mNC;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasMCC:(BOOL)a3;
- (void)setHasMNC:(BOOL)a3;
- (void)setMCC:(unsigned int)a3;
- (void)setMNC:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MCCMNCPair

- (void)setMCC:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_mCC = a3;
}

- (void)setHasMCC:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMCC
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setMNC:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_mNC = a3;
}

- (void)setHasMNC:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMNC
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)MCCMNCPair;
  char v3 = [(MCCMNCPair *)&v7 description];
  v4 = [(MCCMNCPair *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = +[NSNumber numberWithUnsignedInt:self->_mCC];
    [v3 setObject:v5 forKey:@"MCC"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = +[NSNumber numberWithUnsignedInt:self->_mNC];
    [v3 setObject:v6 forKey:@"MNC"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000F6204((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteUint32Field();
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
    v4[2] = self->_mCC;
    *((unsigned char *)v4 + 16) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[3] = self->_mNC;
    *((unsigned char *)v4 + 16) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 2) = self->_mCC;
    *((unsigned char *)result + 16) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_mNC;
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
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_mCC != *((_DWORD *)v4 + 2)) {
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
    if ((*((unsigned char *)v4 + 16) & 2) == 0 || self->_mNC != *((_DWORD *)v4 + 3)) {
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
    uint64_t v2 = 2654435761 * self->_mCC;
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
  uint64_t v3 = 2654435761 * self->_mNC;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 16);
  if (v5)
  {
    self->_mCC = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 16);
  }
  if ((v5 & 2) != 0)
  {
    self->_mNC = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unsigned)mCC
{
  return self->_mCC;
}

- (unsigned)mNC
{
  return self->_mNC;
}

@end