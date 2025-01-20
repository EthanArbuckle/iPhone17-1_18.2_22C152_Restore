@interface UtraCellMeasResult
- (BOOL)hasBand;
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
- (unsigned)band;
- (unsigned)ecno;
- (unsigned)psc;
- (unsigned)uarfcn;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBand:(unsigned int)a3;
- (void)setEcno:(unsigned int)a3;
- (void)setHasBand:(BOOL)a3;
- (void)setHasEcno:(BOOL)a3;
- (void)setHasPsc:(BOOL)a3;
- (void)setHasRscp:(BOOL)a3;
- (void)setHasUarfcn:(BOOL)a3;
- (void)setPsc:(unsigned int)a3;
- (void)setRscp:(int)a3;
- (void)setUarfcn:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation UtraCellMeasResult

- (void)setUarfcn:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_uarfcn = a3;
}

- (void)setHasUarfcn:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasUarfcn
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setBand:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_band = a3;
}

- (void)setHasBand:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBand
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPsc:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_psc = a3;
}

- (void)setHasPsc:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPsc
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setEcno:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_ecno = a3;
}

- (void)setHasEcno:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEcno
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRscp:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_rscp = a3;
}

- (void)setHasRscp:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasRscp
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)UtraCellMeasResult;
  char v3 = [(UtraCellMeasResult *)&v7 description];
  v4 = [(UtraCellMeasResult *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_uarfcn];
    [v3 setObject:v7 forKey:@"uarfcn"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v8 = +[NSNumber numberWithUnsignedInt:self->_band];
  [v3 setObject:v8 forKey:@"band"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v9 = +[NSNumber numberWithUnsignedInt:self->_psc];
  [v3 setObject:v9 forKey:@"psc"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  v10 = +[NSNumber numberWithUnsignedInt:self->_ecno];
  [v3 setObject:v10 forKey:@"ecno"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_6:
    v5 = +[NSNumber numberWithInt:self->_rscp];
    [v3 setObject:v5 forKey:@"rscp"];
  }
LABEL_7:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000B6494((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_6:
  }
    PBDataWriterWriteSint32Field();
LABEL_7:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v4[6] = self->_uarfcn;
    *((unsigned char *)v4 + 28) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[2] = self->_band;
  *((unsigned char *)v4 + 28) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v4[4] = self->_psc;
  *((unsigned char *)v4 + 28) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  v4[3] = self->_ecno;
  *((unsigned char *)v4 + 28) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_6:
    v4[5] = self->_rscp;
    *((unsigned char *)v4 + 28) |= 8u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)result + 6) = self->_uarfcn;
    *((unsigned char *)result + 28) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 2) = self->_band;
  *((unsigned char *)result + 28) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((_DWORD *)result + 4) = self->_psc;
  *((unsigned char *)result + 28) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      return result;
    }
    goto LABEL_6;
  }
LABEL_11:
  *((_DWORD *)result + 3) = self->_ecno;
  *((unsigned char *)result + 28) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    return result;
  }
LABEL_6:
  *((_DWORD *)result + 5) = self->_rscp;
  *((unsigned char *)result + 28) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 0x10) == 0 || self->_uarfcn != *((_DWORD *)v4 + 6)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 0x10) != 0)
  {
LABEL_26:
    BOOL v5 = 0;
    goto LABEL_27;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_band != *((_DWORD *)v4 + 2)) {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0 || self->_psc != *((_DWORD *)v4 + 4)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_ecno != *((_DWORD *)v4 + 3)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_26;
  }
  BOOL v5 = (*((unsigned char *)v4 + 28) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 8) == 0 || self->_rscp != *((_DWORD *)v4 + 5)) {
      goto LABEL_26;
    }
    BOOL v5 = 1;
  }
LABEL_27:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t v2 = 2654435761 * self->_uarfcn;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_band;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_psc;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
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
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_ecno;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_rscp;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 28);
  if ((v5 & 0x10) != 0)
  {
    self->_uarfcn = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 0x10u;
    char v5 = *((unsigned char *)v4 + 28);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_band = *((_DWORD *)v4 + 2);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)v4 + 28);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_psc = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 28);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  self->_ecno = *((_DWORD *)v4 + 3);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 28) & 8) != 0)
  {
LABEL_6:
    self->_rscp = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_7:
}

- (unsigned)uarfcn
{
  return self->_uarfcn;
}

- (unsigned)band
{
  return self->_band;
}

- (unsigned)psc
{
  return self->_psc;
}

- (unsigned)ecno
{
  return self->_ecno;
}

- (int)rscp
{
  return self->_rscp;
}

@end