@interface NwUeCapMimoStat
- (BOOL)hasMaxRxAnt;
- (BOOL)hasMaxSchdMimoLyr;
- (BOOL)hasMaxUeRank;
- (BOOL)hasNwMimoCap;
- (BOOL)hasUeMimoCap;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)maxRxAnt;
- (unsigned)maxSchdMimoLyr;
- (unsigned)maxUeRank;
- (unsigned)nwMimoCap;
- (unsigned)ueMimoCap;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasMaxRxAnt:(BOOL)a3;
- (void)setHasMaxSchdMimoLyr:(BOOL)a3;
- (void)setHasMaxUeRank:(BOOL)a3;
- (void)setHasNwMimoCap:(BOOL)a3;
- (void)setHasUeMimoCap:(BOOL)a3;
- (void)setMaxRxAnt:(unsigned int)a3;
- (void)setMaxSchdMimoLyr:(unsigned int)a3;
- (void)setMaxUeRank:(unsigned int)a3;
- (void)setNwMimoCap:(unsigned int)a3;
- (void)setUeMimoCap:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NwUeCapMimoStat

- (void)setNwMimoCap:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_nwMimoCap = a3;
}

- (void)setHasNwMimoCap:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNwMimoCap
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setUeMimoCap:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_ueMimoCap = a3;
}

- (void)setHasUeMimoCap:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasUeMimoCap
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setMaxUeRank:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_maxUeRank = a3;
}

- (void)setHasMaxUeRank:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMaxUeRank
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setMaxRxAnt:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_maxRxAnt = a3;
}

- (void)setHasMaxRxAnt:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMaxRxAnt
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setMaxSchdMimoLyr:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_maxSchdMimoLyr = a3;
}

- (void)setHasMaxSchdMimoLyr:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMaxSchdMimoLyr
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NwUeCapMimoStat;
  char v3 = [(NwUeCapMimoStat *)&v7 description];
  v4 = [(NwUeCapMimoStat *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_nwMimoCap];
    [v3 setObject:v7 forKey:@"nw_mimo_cap"];

    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v8 = +[NSNumber numberWithUnsignedInt:self->_ueMimoCap];
  [v3 setObject:v8 forKey:@"ue_mimo_cap"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v9 = +[NSNumber numberWithUnsignedInt:self->_maxUeRank];
  [v3 setObject:v9 forKey:@"max_ue_rank"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  v10 = +[NSNumber numberWithUnsignedInt:self->_maxRxAnt];
  [v3 setObject:v10 forKey:@"max_rx_ant"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    v5 = +[NSNumber numberWithUnsignedInt:self->_maxSchdMimoLyr];
    [v3 setObject:v5 forKey:@"max_schd_mimo_lyr"];
  }
LABEL_7:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1001205C8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_6:
  }
    PBDataWriterWriteUint32Field();
LABEL_7:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[5] = self->_nwMimoCap;
    *((unsigned char *)v4 + 28) |= 8u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v4[6] = self->_ueMimoCap;
  *((unsigned char *)v4 + 28) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v4[4] = self->_maxUeRank;
  *((unsigned char *)v4 + 28) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  v4[2] = self->_maxRxAnt;
  *((unsigned char *)v4 + 28) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    v4[3] = self->_maxSchdMimoLyr;
    *((unsigned char *)v4 + 28) |= 2u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)result + 5) = self->_nwMimoCap;
    *((unsigned char *)result + 28) |= 8u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 6) = self->_ueMimoCap;
  *((unsigned char *)result + 28) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((_DWORD *)result + 4) = self->_maxUeRank;
  *((unsigned char *)result + 28) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      return result;
    }
    goto LABEL_6;
  }
LABEL_11:
  *((_DWORD *)result + 2) = self->_maxRxAnt;
  *((unsigned char *)result + 28) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_6:
  *((_DWORD *)result + 3) = self->_maxSchdMimoLyr;
  *((unsigned char *)result + 28) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 8) == 0 || self->_nwMimoCap != *((_DWORD *)v4 + 5)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 8) != 0)
  {
LABEL_26:
    BOOL v5 = 0;
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 0x10) == 0 || self->_ueMimoCap != *((_DWORD *)v4 + 6)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 0x10) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0 || self->_maxUeRank != *((_DWORD *)v4 + 4)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
    goto LABEL_26;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_maxRxAnt != *((_DWORD *)v4 + 2)) {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_26;
  }
  BOOL v5 = (*((unsigned char *)v4 + 28) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_maxSchdMimoLyr != *((_DWORD *)v4 + 3)) {
      goto LABEL_26;
    }
    BOOL v5 = 1;
  }
LABEL_27:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v2 = 2654435761 * self->_nwMimoCap;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_ueMimoCap;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_maxUeRank;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_maxRxAnt;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_maxSchdMimoLyr;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 28);
  if ((v5 & 8) != 0)
  {
    self->_nwMimoCap = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)v4 + 28);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_ueMimoCap = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 28);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_maxUeRank = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 28);
  if ((v5 & 1) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  self->_maxRxAnt = *((_DWORD *)v4 + 2);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
LABEL_6:
    self->_maxSchdMimoLyr = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_7:
}

- (unsigned)nwMimoCap
{
  return self->_nwMimoCap;
}

- (unsigned)ueMimoCap
{
  return self->_ueMimoCap;
}

- (unsigned)maxUeRank
{
  return self->_maxUeRank;
}

- (unsigned)maxRxAnt
{
  return self->_maxRxAnt;
}

- (unsigned)maxSchdMimoLyr
{
  return self->_maxSchdMimoLyr;
}

@end