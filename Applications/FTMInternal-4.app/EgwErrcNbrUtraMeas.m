@interface EgwErrcNbrUtraMeas
- (BOOL)hasEcno;
- (BOOL)hasPsc;
- (BOOL)hasRscp;
- (BOOL)hasUarfcn;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)rscp;
- (unint64_t)hash;
- (unsigned)ecno;
- (unsigned)psc;
- (unsigned)uarfcn;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEcno:(unsigned int)a3;
- (void)setHasEcno:(BOOL)a3;
- (void)setHasPsc:(BOOL)a3;
- (void)setHasRscp:(BOOL)a3;
- (void)setHasUarfcn:(BOOL)a3;
- (void)setPsc:(unsigned int)a3;
- (void)setRscp:(int)a3;
- (void)setUarfcn:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation EgwErrcNbrUtraMeas

- (void)setUarfcn:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_uarfcn = a3;
}

- (void)setHasUarfcn:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasUarfcn
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setPsc:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_psc = a3;
}

- (void)setHasPsc:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPsc
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRscp:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_rscp = a3;
}

- (void)setHasRscp:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRscp
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setEcno:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_ecno = a3;
}

- (void)setHasEcno:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEcno
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)EgwErrcNbrUtraMeas;
  char v3 = [(EgwErrcNbrUtraMeas *)&v7 description];
  v4 = [(EgwErrcNbrUtraMeas *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_uarfcn];
    [v3 setObject:v7 forKey:@"uarfcn"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v8 = +[NSNumber numberWithUnsignedInt:self->_psc];
  [v3 setObject:v8 forKey:@"psc"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v9 = +[NSNumber numberWithInt:self->_rscp];
  [v3 setObject:v9 forKey:@"rscp"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_5:
    v5 = +[NSNumber numberWithUnsignedInt:self->_ecno];
    [v3 setObject:v5 forKey:@"ecno"];
  }
LABEL_6:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000F1970((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteSint32Field();
  if (*(unsigned char *)&self->_has) {
LABEL_5:
  }
    PBDataWriterWriteUint32Field();
LABEL_6:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[5] = self->_uarfcn;
    *((unsigned char *)v4 + 24) |= 8u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[3] = self->_psc;
  *((unsigned char *)v4 + 24) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v4[4] = self->_rscp;
  *((unsigned char *)v4 + 24) |= 4u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_5:
    v4[2] = self->_ecno;
    *((unsigned char *)v4 + 24) |= 1u;
  }
LABEL_6:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)result + 5) = self->_uarfcn;
    *((unsigned char *)result + 24) |= 8u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 3) = self->_psc;
  *((unsigned char *)result + 24) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 4) = self->_rscp;
  *((unsigned char *)result + 24) |= 4u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_5:
  *((_DWORD *)result + 2) = self->_ecno;
  *((unsigned char *)result + 24) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 8) == 0 || self->_uarfcn != *((_DWORD *)v4 + 5)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 8) != 0)
  {
LABEL_21:
    BOOL v5 = 0;
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_psc != *((_DWORD *)v4 + 3)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 4) == 0 || self->_rscp != *((_DWORD *)v4 + 4)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 4) != 0)
  {
    goto LABEL_21;
  }
  BOOL v5 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_ecno != *((_DWORD *)v4 + 2)) {
      goto LABEL_21;
    }
    BOOL v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v2 = 2654435761 * self->_uarfcn;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_psc;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_rscp;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_ecno;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 24);
  if ((v5 & 8) != 0)
  {
    self->_uarfcn = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)v4 + 24);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_psc = *((_DWORD *)v4 + 3);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 24);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_rscp = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 4u;
  if (*((unsigned char *)v4 + 24))
  {
LABEL_5:
    self->_ecno = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_6:
}

- (unsigned)uarfcn
{
  return self->_uarfcn;
}

- (unsigned)psc
{
  return self->_psc;
}

- (int)rscp
{
  return self->_rscp;
}

- (unsigned)ecno
{
  return self->_ecno;
}

@end