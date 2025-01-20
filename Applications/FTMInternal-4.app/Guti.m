@interface Guti
- (BOOL)hasMTmsi;
- (BOOL)hasMmec;
- (BOOL)hasMmegi;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)mTmsi;
- (unsigned)mmec;
- (unsigned)mmegi;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasMTmsi:(BOOL)a3;
- (void)setHasMmec:(BOOL)a3;
- (void)setHasMmegi:(BOOL)a3;
- (void)setMTmsi:(unsigned int)a3;
- (void)setMmec:(unsigned int)a3;
- (void)setMmegi:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation Guti

- (void)setMmegi:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_mmegi = a3;
}

- (void)setHasMmegi:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMmegi
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setMmec:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_mmec = a3;
}

- (void)setHasMmec:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMmec
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMTmsi:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_mTmsi = a3;
}

- (void)setHasMTmsi:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMTmsi
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)Guti;
  char v3 = [(Guti *)&v7 description];
  v4 = [(Guti *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_mmegi];
    [v3 setObject:v7 forKey:@"mmegi"];

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
  v8 = +[NSNumber numberWithUnsignedInt:self->_mmec];
  [v3 setObject:v8 forKey:@"mmec"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    v5 = +[NSNumber numberWithUnsignedInt:self->_mTmsi];
    [v3 setObject:v5 forKey:@"m_tmsi"];
  }
LABEL_5:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10000F54C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
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
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_5:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[4] = self->_mmegi;
    *((unsigned char *)v4 + 20) |= 4u;
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
  v4[3] = self->_mmec;
  *((unsigned char *)v4 + 20) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    v4[2] = self->_mTmsi;
    *((unsigned char *)v4 + 20) |= 1u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)result + 4) = self->_mmegi;
    *((unsigned char *)result + 20) |= 4u;
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
  *((_DWORD *)result + 3) = self->_mmec;
  *((unsigned char *)result + 20) |= 2u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_4:
  *((_DWORD *)result + 2) = self->_mTmsi;
  *((unsigned char *)result + 20) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 4) == 0 || self->_mmegi != *((_DWORD *)v4 + 4)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 4) != 0)
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) == 0 || self->_mmec != *((_DWORD *)v4 + 3)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 2) != 0)
  {
    goto LABEL_16;
  }
  BOOL v5 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_mTmsi != *((_DWORD *)v4 + 2)) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_mmegi;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_mmec;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_mTmsi;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 20);
  if ((v5 & 4) != 0)
  {
    self->_mmegi = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 20);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_mmec = *((_DWORD *)v4 + 3);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)v4 + 20))
  {
LABEL_4:
    self->_mTmsi = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_5:
}

- (unsigned)mmegi
{
  return self->_mmegi;
}

- (unsigned)mmec
{
  return self->_mmec;
}

- (unsigned)mTmsi
{
  return self->_mTmsi;
}

@end