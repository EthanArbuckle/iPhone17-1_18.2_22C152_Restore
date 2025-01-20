@interface GeraNeighborCell
- (BOOL)hasArfcn;
- (BOOL)hasNccPermitted;
- (BOOL)hasPMax;
- (BOOL)hasPriority;
- (BOOL)hasQRxlevMin;
- (BOOL)hasThreshXHighP;
- (BOOL)hasThreshXLowP;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)pMax;
- (int)qRxlevMin;
- (unint64_t)hash;
- (unsigned)arfcn;
- (unsigned)nccPermitted;
- (unsigned)priority;
- (unsigned)threshXHighP;
- (unsigned)threshXLowP;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setArfcn:(unsigned int)a3;
- (void)setHasArfcn:(BOOL)a3;
- (void)setHasNccPermitted:(BOOL)a3;
- (void)setHasPMax:(BOOL)a3;
- (void)setHasPriority:(BOOL)a3;
- (void)setHasQRxlevMin:(BOOL)a3;
- (void)setHasThreshXHighP:(BOOL)a3;
- (void)setHasThreshXLowP:(BOOL)a3;
- (void)setNccPermitted:(unsigned int)a3;
- (void)setPMax:(int)a3;
- (void)setPriority:(unsigned int)a3;
- (void)setQRxlevMin:(int)a3;
- (void)setThreshXHighP:(unsigned int)a3;
- (void)setThreshXLowP:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GeraNeighborCell

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

- (void)setPMax:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_pMax = a3;
}

- (void)setHasPMax:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPMax
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setQRxlevMin:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_qRxlevMin = a3;
}

- (void)setHasQRxlevMin:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasQRxlevMin
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setThreshXHighP:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_threshXHighP = a3;
}

- (void)setHasThreshXHighP:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasThreshXHighP
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setThreshXLowP:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_threshXLowP = a3;
}

- (void)setHasThreshXLowP:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasThreshXLowP
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setPriority:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_priority = a3;
}

- (void)setHasPriority:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPriority
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setNccPermitted:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_nccPermitted = a3;
}

- (void)setHasNccPermitted:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNccPermitted
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)GeraNeighborCell;
  char v3 = [(GeraNeighborCell *)&v7 description];
  v4 = [(GeraNeighborCell *)self dictionaryRepresentation];
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
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v8 = +[NSNumber numberWithInt:self->_pMax];
  [v3 setObject:v8 forKey:@"p_max"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  v9 = +[NSNumber numberWithInt:self->_qRxlevMin];
  [v3 setObject:v9 forKey:@"q_rxlev_min"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  v10 = +[NSNumber numberWithUnsignedInt:self->_threshXHighP];
  [v3 setObject:v10 forKey:@"thresh_x_high_p"];

  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  v11 = +[NSNumber numberWithUnsignedInt:self->_threshXLowP];
  [v3 setObject:v11 forKey:@"thresh_x_low_p"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  v12 = +[NSNumber numberWithUnsignedInt:self->_priority];
  [v3 setObject:v12 forKey:@"priority"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_8:
    v5 = +[NSNumber numberWithUnsignedInt:self->_nccPermitted];
    [v3 setObject:v5 forKey:@"ncc_permitted"];
  }
LABEL_9:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000A260C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteSint32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteSint32Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_8:
  }
    PBDataWriterWriteUint32Field();
LABEL_9:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[2] = self->_arfcn;
    *((unsigned char *)v4 + 36) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[4] = self->_pMax;
  *((unsigned char *)v4 + 36) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  v4[6] = self->_qRxlevMin;
  *((unsigned char *)v4 + 36) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  v4[7] = self->_threshXHighP;
  *((unsigned char *)v4 + 36) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  v4[8] = self->_threshXLowP;
  *((unsigned char *)v4 + 36) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  v4[5] = self->_priority;
  *((unsigned char *)v4 + 36) |= 8u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_8:
    v4[3] = self->_nccPermitted;
    *((unsigned char *)v4 + 36) |= 2u;
  }
LABEL_9:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 2) = self->_arfcn;
    *((unsigned char *)result + 36) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_pMax;
  *((unsigned char *)result + 36) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 6) = self->_qRxlevMin;
  *((unsigned char *)result + 36) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)result + 7) = self->_threshXHighP;
  *((unsigned char *)result + 36) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 8) = self->_threshXLowP;
  *((unsigned char *)result + 36) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      return result;
    }
    goto LABEL_8;
  }
LABEL_15:
  *((_DWORD *)result + 5) = self->_priority;
  *((unsigned char *)result + 36) |= 8u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_8:
  *((_DWORD *)result + 3) = self->_nccPermitted;
  *((unsigned char *)result + 36) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_36;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_arfcn != *((_DWORD *)v4 + 2)) {
      goto LABEL_36;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
LABEL_36:
    BOOL v5 = 0;
    goto LABEL_37;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_pMax != *((_DWORD *)v4 + 4)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 0x10) == 0 || self->_qRxlevMin != *((_DWORD *)v4 + 6)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 0x10) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 0x20) == 0 || self->_threshXHighP != *((_DWORD *)v4 + 7)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 0x20) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 0x40) == 0 || self->_threshXLowP != *((_DWORD *)v4 + 8)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 0x40) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 8) == 0 || self->_priority != *((_DWORD *)v4 + 5)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 8) != 0)
  {
    goto LABEL_36;
  }
  BOOL v5 = (*((unsigned char *)v4 + 36) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_nccPermitted != *((_DWORD *)v4 + 3)) {
      goto LABEL_36;
    }
    BOOL v5 = 1;
  }
LABEL_37:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_arfcn;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_pMax;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_qRxlevMin;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_threshXHighP;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_6:
    uint64_t v6 = 2654435761 * self->_threshXLowP;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_8;
    }
LABEL_15:
    uint64_t v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_13:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_priority;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_15;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_nccPermitted;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 36);
  if (v5)
  {
    self->_arfcn = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 36);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_pMax = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_qRxlevMin = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 0x20) == 0)
  {
LABEL_5:
    if ((v5 & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_threshXHighP = *((_DWORD *)v4 + 7);
  *(unsigned char *)&self->_has |= 0x20u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 0x40) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_threshXLowP = *((_DWORD *)v4 + 8);
  *(unsigned char *)&self->_has |= 0x40u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 8) == 0)
  {
LABEL_7:
    if ((v5 & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  self->_priority = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
LABEL_8:
    self->_nccPermitted = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_9:
}

- (unsigned)arfcn
{
  return self->_arfcn;
}

- (int)pMax
{
  return self->_pMax;
}

- (int)qRxlevMin
{
  return self->_qRxlevMin;
}

- (unsigned)threshXHighP
{
  return self->_threshXHighP;
}

- (unsigned)threshXLowP
{
  return self->_threshXLowP;
}

- (unsigned)priority
{
  return self->_priority;
}

- (unsigned)nccPermitted
{
  return self->_nccPermitted;
}

@end