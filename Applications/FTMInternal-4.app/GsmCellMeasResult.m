@interface GsmCellMeasResult
- (BOOL)hasArfcn;
- (BOOL)hasBsic;
- (BOOL)hasRxlev;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)arfcn;
- (unsigned)bsic;
- (unsigned)rxlev;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setArfcn:(unsigned int)a3;
- (void)setBsic:(unsigned int)a3;
- (void)setHasArfcn:(BOOL)a3;
- (void)setHasBsic:(BOOL)a3;
- (void)setHasRxlev:(BOOL)a3;
- (void)setRxlev:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GsmCellMeasResult

- (void)setArfcn:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_arfcn = a3;
}

- (void)setHasArfcn:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasArfcn
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setBsic:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_bsic = a3;
}

- (void)setHasBsic:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBsic
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRxlev:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_rxlev = a3;
}

- (void)setHasRxlev:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRxlev
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)GsmCellMeasResult;
  char v3 = [(GsmCellMeasResult *)&v7 description];
  v4 = [(GsmCellMeasResult *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_arfcn];
    [v3 setObject:v7 forKey:@"arfcn"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v8 = +[NSNumber numberWithUnsignedInt:self->_bsic];
  [v3 setObject:v8 forKey:@"bsic"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v5 = +[NSNumber numberWithUnsignedInt:self->_rxlev];
    [v3 setObject:v5 forKey:@"rxlev"];
  }
LABEL_5:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000AF044((uint64_t)self, (uint64_t)a3);
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
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
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
  if ((*(unsigned char *)&self->_has & 4) != 0)
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
  if (has)
  {
    v4[2] = self->_arfcn;
    *((unsigned char *)v4 + 20) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[3] = self->_bsic;
  *((unsigned char *)v4 + 20) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4[4] = self->_rxlev;
    *((unsigned char *)v4 + 20) |= 4u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 2) = self->_arfcn;
    *((unsigned char *)result + 20) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 3) = self->_bsic;
  *((unsigned char *)result + 20) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_4:
  *((_DWORD *)result + 4) = self->_rxlev;
  *((unsigned char *)result + 20) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_arfcn != *((_DWORD *)v4 + 2)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) == 0 || self->_bsic != *((_DWORD *)v4 + 3)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 2) != 0)
  {
    goto LABEL_16;
  }
  BOOL v5 = (*((unsigned char *)v4 + 20) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 4) == 0 || self->_rxlev != *((_DWORD *)v4 + 4)) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_arfcn;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_bsic;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_rxlev;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 20);
  if (v5)
  {
    self->_arfcn = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 20);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_bsic = *((_DWORD *)v4 + 3);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 20) & 4) != 0)
  {
LABEL_4:
    self->_rxlev = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_5:
}

- (unsigned)arfcn
{
  return self->_arfcn;
}

- (unsigned)bsic
{
  return self->_bsic;
}

- (unsigned)rxlev
{
  return self->_rxlev;
}

@end